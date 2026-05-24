package com.trainerpro.trainerpro.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.trainerpro.trainerpro.dto.AdminApplicationResponse;
import com.trainerpro.trainerpro.dto.AdminAuditLogResponse;
import com.trainerpro.trainerpro.dto.AdminDashboardResponse;
import com.trainerpro.trainerpro.dto.AdminUserUpdateRequest;
import com.trainerpro.trainerpro.dto.InvitationResponse;
import com.trainerpro.trainerpro.dto.TrainingResponse;
import com.trainerpro.trainerpro.dto.UserResponse;
import com.trainerpro.trainerpro.entity.AdminAccount;
import com.trainerpro.trainerpro.entity.Application;
import com.trainerpro.trainerpro.entity.Invitation;
import com.trainerpro.trainerpro.entity.Role;
import com.trainerpro.trainerpro.entity.Training;
import com.trainerpro.trainerpro.entity.User;
import com.trainerpro.trainerpro.repository.AdminAccountRepository;
import com.trainerpro.trainerpro.repository.ApplicationRepository;
import com.trainerpro.trainerpro.repository.InvitationRepository;
import com.trainerpro.trainerpro.repository.TrainingRepository;
import com.trainerpro.trainerpro.repository.UserRepository;
import com.trainerpro.trainerpro.service.AdminAuditLogService;
import com.trainerpro.trainerpro.service.AuthTokenService;
import com.trainerpro.trainerpro.service.EmailNotificationService;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    private final UserRepository userRepository;
    private final AdminAccountRepository adminAccountRepository;
    private final TrainingRepository trainingRepository;
    private final InvitationRepository invitationRepository;
    private final ApplicationRepository applicationRepository;
    private final EmailNotificationService emailNotificationService;
    private final AuthTokenService authTokenService;
    private final AdminAuditLogService adminAuditLogService;

    public AdminController(
            UserRepository userRepository,
            AdminAccountRepository adminAccountRepository,
            TrainingRepository trainingRepository,
            InvitationRepository invitationRepository,
            ApplicationRepository applicationRepository,
            EmailNotificationService emailNotificationService,
            AuthTokenService authTokenService,
            AdminAuditLogService adminAuditLogService) {
        this.userRepository = userRepository;
        this.adminAccountRepository = adminAccountRepository;
        this.trainingRepository = trainingRepository;
        this.invitationRepository = invitationRepository;
        this.applicationRepository = applicationRepository;
        this.emailNotificationService = emailNotificationService;
        this.authTokenService = authTokenService;
        this.adminAuditLogService = adminAuditLogService;
    }

    @GetMapping("/dashboard")
    public AdminDashboardResponse getDashboard(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        requireAdmin(authHeader);

        List<User> users = userRepository.findAll();
        List<Training> trainings = trainingRepository.findAll();
        List<Application> applications = applicationRepository.findAll();
        List<Invitation> invitations = invitationRepository.findAll();

        Map<String, Long> counts = new LinkedHashMap<>();
        counts.put("users", (long) users.size());
        counts.put("trainers", users.stream().filter((user) -> user.getRole() == Role.TRAINER).count());
        counts.put("vendors", users.stream().filter((user) -> user.getRole() == Role.VENDOR).count());
        counts.put("admins", adminAccountRepository.count());
        counts.put("activeUsers", users.stream().filter(User::isActive).count());
        counts.put("pendingUsers", users.stream().filter((user) -> !user.isApproved()).count());
        counts.put("trainings", (long) trainings.size());
        counts.put("openTrainings", trainings.stream().filter((training) -> "OPEN".equalsIgnoreCase(training.getStatus())).count());
        counts.put("applications", (long) applications.size());
        counts.put("invitations", (long) invitations.size());

        Map<String, Long> userBreakdown = new LinkedHashMap<>();
        userBreakdown.put("pending", users.stream().filter((user) -> !user.isApproved()).count());
        userBreakdown.put("active", users.stream().filter(User::isActive).count());
        userBreakdown.put("inactive", users.stream().filter((user) -> !user.isActive()).count());

        Map<String, Long> trainingBreakdown = trainings.stream()
                .collect(Collectors.groupingBy(
                        (training) -> normalizeKey(training.getStatus(), "OPEN"),
                        LinkedHashMap::new,
                        Collectors.counting()));

        Map<String, Long> applicationBreakdown = applications.stream()
                .collect(Collectors.groupingBy(
                        (application) -> normalizeKey(application.getStatus(), "PENDING"),
                        LinkedHashMap::new,
                        Collectors.counting()));

        Map<String, Long> invitationBreakdown = invitations.stream()
                .collect(Collectors.groupingBy(
                        (invitation) -> normalizeKey(invitation.getStatus(), "PENDING"),
                        LinkedHashMap::new,
                        Collectors.counting()));

        List<UserResponse> recentUsers = users.stream()
                .sorted(Comparator.comparing(User::getCreatedAt, Comparator.nullsLast(Comparator.reverseOrder())))
                .limit(6)
                .map(this::mapUser)
                .collect(Collectors.toList());

        List<TrainingResponse> recentTrainings = trainings.stream()
                .sorted(Comparator.comparing(Training::getId, Comparator.reverseOrder()))
                .limit(6)
                .map(this::mapTraining)
                .collect(Collectors.toList());

        return new AdminDashboardResponse(
                counts,
                userBreakdown,
                trainingBreakdown,
                applicationBreakdown,
                invitationBreakdown,
                recentUsers,
                recentTrainings);
    }

    @GetMapping("/users")
    public List<UserResponse> getUsers(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @RequestParam(value = "role", required = false) String role,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "search", required = false) String search) {
        requireAdmin(authHeader);

        String normalizedRole = role != null ? role.trim().toUpperCase(Locale.ROOT) : "";
        String normalizedStatus = status != null ? status.trim().toUpperCase(Locale.ROOT) : "";
        String normalizedSearch = search != null ? search.trim().toLowerCase(Locale.ROOT) : "";

        return userRepository.findAll().stream()
                .filter((user) -> normalizedRole.isEmpty()
                        || "ALL".equals(normalizedRole)
                        || user.getRole().name().equals(normalizedRole))
                .filter((user) -> {
                    if (normalizedStatus.isEmpty() || "ALL".equals(normalizedStatus)) return true;
                    if ("PENDING".equals(normalizedStatus)) return !user.isApproved();
                    if ("REJECTED".equals(normalizedStatus)) return user.isRejected();
                    if ("ACTIVE".equals(normalizedStatus)) return user.isApproved() && user.isActive();
                    if ("INACTIVE".equals(normalizedStatus)) return user.isApproved() && !user.isActive();
                    return true;
                })
                .filter((user) -> {
                    if (normalizedSearch.isEmpty()) return true;
                    return user.getName().toLowerCase(Locale.ROOT).contains(normalizedSearch)
                            || user.getEmail().toLowerCase(Locale.ROOT).contains(normalizedSearch);
                })
                .sorted(Comparator.comparing(User::getCreatedAt, Comparator.nullsLast(Comparator.reverseOrder())))
                .map(this::mapUser)
                .collect(Collectors.toList());
    }

    @PatchMapping("/users/{id}")
    public UserResponse updateUser(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @PathVariable Long id,
            @RequestBody AdminUserUpdateRequest request) {
        AdminAccount admin = requireAdmin(authHeader);

        User targetUser = userRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));
        boolean wasApproved = targetUser.isApproved();
        boolean wasRejected = targetUser.isRejected();
        boolean wasActive = targetUser.isActive();
        Role previousRole = targetUser.getRole();

        List<String> auditNotes = new ArrayList<>();

        if (request.getRole() != null && request.getRole() != Role.ADMIN && request.getRole() != targetUser.getRole()) {
            targetUser.setRole(request.getRole());
            auditNotes.add("role " + previousRole + " -> " + request.getRole());
        }

        if (request.getApproved() != null && request.getApproved() != targetUser.isApproved()) {
            targetUser.setApproved(request.getApproved());
            auditNotes.add("approved " + wasApproved + " -> " + request.getApproved());
            if (request.getApproved()) {
                targetUser.setActive(true);
                targetUser.setRejected(false);
                targetUser.setRejectionReason(null);
                auditNotes.add("status moved to active approved state");
            }
        }

        if (request.getRejected() != null && request.getRejected()) {
            targetUser.setRejected(true);
            targetUser.setApproved(false);
            targetUser.setActive(false);
            targetUser.setRejectionReason(request.getRejectionReason());
            auditNotes.add("registration rejected");
            if (request.getRejectionReason() != null && !request.getRejectionReason().trim().isEmpty()) {
                auditNotes.add("reason: " + request.getRejectionReason().trim());
            }
        }

        if (request.getActive() != null && request.getActive() != targetUser.isActive()) {
            boolean previousActive = targetUser.isActive();
            targetUser.setActive(request.getActive());
            auditNotes.add("active " + previousActive + " -> " + request.getActive());
        }

        User savedUser = userRepository.save(targetUser);

        if (!wasApproved && savedUser.isApproved()) {
            emailNotificationService.sendApprovalEmail(savedUser);
        }

        if (!wasRejected && savedUser.isRejected()) {
            emailNotificationService.sendRejectionEmail(savedUser);
        }

        if (!auditNotes.isEmpty()) {
            adminAuditLogService.logAction(
                    admin,
                    resolveAuditActionType(request, previousRole, wasApproved, wasActive),
                    "USER",
                    savedUser.getId(),
                    savedUser.getName() + " <" + savedUser.getEmail() + ">",
                    "Updated user account for " + savedUser.getEmail(),
                    String.join(" | ", auditNotes));
        }

        return mapUser(savedUser);
    }

    @GetMapping("/trainings")
    public List<TrainingResponse> getTrainings(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        requireAdmin(authHeader);

        return trainingRepository.findAll().stream()
                .sorted(Comparator.comparing(Training::getId, Comparator.reverseOrder()))
                .map(this::mapTraining)
                .collect(Collectors.toList());
    }

    @GetMapping("/applications")
    public List<AdminApplicationResponse> getApplications(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        requireAdmin(authHeader);

        return applicationRepository.findAll().stream()
                .sorted(Comparator.comparing(Application::getId, Comparator.reverseOrder()))
                .map(this::mapApplication)
                .collect(Collectors.toList());
    }

    @GetMapping("/invitations")
    public List<InvitationResponse> getInvitations(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        requireAdmin(authHeader);

        return invitationRepository.findAll().stream()
                .sorted(Comparator.comparing(Invitation::getCreatedAt, Comparator.nullsLast(Comparator.reverseOrder())))
                .map(this::mapInvitation)
                .collect(Collectors.toList());
    }

    @GetMapping("/audit-logs")
    public List<AdminAuditLogResponse> getAuditLogs(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        requireAdmin(authHeader);
        return adminAuditLogService.getRecentLogs();
    }

    private AdminAccount requireAdmin(String authHeader) {
        if (authHeader == null || authHeader.trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Authorization header is missing");
        }

        String token = authHeader.replace("Bearer ", "").trim();
        Long adminId = authTokenService.extractRequiredAdminId(token);

        AdminAccount adminAccount = adminAccountRepository.findById(adminId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid admin token"));

        if (!adminAccount.isActive()) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Admin access is required");
        }

        return adminAccount;
    }

    private String resolveAuditActionType(
            AdminUserUpdateRequest request,
            Role previousRole,
            boolean wasApproved,
            boolean wasActive) {
        if (Boolean.TRUE.equals(request.getRejected())) return "USER_REJECTED";
        if (Boolean.TRUE.equals(request.getApproved()) && !wasApproved) return "USER_APPROVED";
        if (request.getRole() != null && request.getRole() != previousRole) return "USER_ROLE_UPDATED";
        if (request.getActive() != null && request.getActive() != wasActive) {
            return request.getActive() ? "USER_ACTIVATED" : "USER_DEACTIVATED";
        }
        return "USER_UPDATED";
    }

    private String normalizeKey(String rawValue, String fallback) {
        String source = rawValue == null || rawValue.trim().isEmpty() ? fallback : rawValue;
        return source.trim().toUpperCase(Locale.ROOT);
    }

    private UserResponse mapUser(User user) {
        return new UserResponse(
                user.getId(),
                user.getName(),
                user.getEmail(),
                user.getRole(),
                user.isActive(),
                user.isApproved(),
                user.isRejected(),
                user.getRejectionReason(),
                user.getCreatedAt(),
                user.getUpdatedAt(),
                user.getProfileImage(),
                user.getResume(),
                user.getProfession(),
                user.getMobile(),
                user.getEducation(),
                user.getExperience(),
                user.getSkills(),
                user.getCertifications(),
                user.getTrainingDomains(),
                user.getTrainingModes(),
                user.getLanguages(),
                user.getLocation(),
                user.getBio());
    }

    private TrainingResponse mapTraining(Training training) {
        return new TrainingResponse(
                training.getId(),
                training.getTitle(),
                training.getDescription(),
                training.getLocation(),
                training.getBudget(),
                training.getDuration(),
                training.getSkills(),
                training.getStatus(),
                training.getVendor().getId(),
                training.getVendor().getName(),
                training.getVendor().getEmail());
    }

    private AdminApplicationResponse mapApplication(Application application) {
        User trainer = application.getTrainer();
        Training training = application.getTraining();
        User vendor = training.getVendor();

        List<String> trainerSkills = trainer.getSkills() != null
                ? Arrays.stream(trainer.getSkills().split(","))
                        .map(String::trim)
                        .filter((skill) -> !skill.isEmpty())
                        .collect(Collectors.toList())
                : new ArrayList<>();

        return new AdminApplicationResponse(
                application.getId(),
                trainer.getId(),
                trainer.getName(),
                trainer.getEmail(),
                trainer.getExperience(),
                trainerSkills,
                training.getId(),
                training.getTitle(),
                training.getLocation(),
                vendor.getId(),
                vendor.getName(),
                vendor.getEmail(),
                application.getStatus());
    }

    private InvitationResponse mapInvitation(Invitation invitation) {
        return new InvitationResponse(
                invitation.getId(),
                invitation.getTrainer().getId(),
                invitation.getTrainer().getName(),
                invitation.getTrainer().getEmail(),
                invitation.getTraining().getId(),
                invitation.getTraining().getTitle(),
                invitation.getTraining().getDescription(),
                invitation.getTraining().getLocation(),
                invitation.getTraining().getBudget(),
                invitation.getTraining().getDuration(),
                invitation.getTraining().getSkills(),
                invitation.getTraining().getStatus(),
                invitation.getTraining().getVendor().getId(),
                invitation.getTraining().getVendor().getName(),
                invitation.getMessage(),
                invitation.getStatus(),
                invitation.getCreatedAt());
    }
}
