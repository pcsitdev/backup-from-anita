package com.trainerpro.trainerpro.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.trainerpro.trainerpro.dto.InvitationRequest;
import com.trainerpro.trainerpro.dto.InvitationResponse;
import com.trainerpro.trainerpro.dto.InvitationVendorStatusRequest;
import com.trainerpro.trainerpro.entity.Invitation;
import com.trainerpro.trainerpro.entity.Role;
import com.trainerpro.trainerpro.entity.Training;
import com.trainerpro.trainerpro.entity.User;
import com.trainerpro.trainerpro.repository.InvitationRepository;
import com.trainerpro.trainerpro.repository.TrainingRepository;
import com.trainerpro.trainerpro.repository.UserRepository;
import com.trainerpro.trainerpro.service.AdminAuditLogService;
import com.trainerpro.trainerpro.service.AuthTokenService;

@RestController
@RequestMapping("/api/invitations")
public class InvitationController {

    private final InvitationRepository invitationRepository;
    private final UserRepository userRepository;
    private final TrainingRepository trainingRepository;
    private final AuthTokenService authTokenService;
    private final AdminAuditLogService adminAuditLogService;

    public InvitationController(
            InvitationRepository invitationRepository,
            UserRepository userRepository,
            TrainingRepository trainingRepository,
            AuthTokenService authTokenService,
            AdminAuditLogService adminAuditLogService) {
        this.invitationRepository = invitationRepository;
        this.userRepository = userRepository;
        this.trainingRepository = trainingRepository;
        this.authTokenService = authTokenService;
        this.adminAuditLogService = adminAuditLogService;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public InvitationResponse sendInvitation(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @RequestBody InvitationRequest request) {
        User vendor = getUserFromAuth(authHeader);

        if (request.getTrainerId() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trainer ID is required");
        }
        if (request.getTrainingId() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Training ID is required");
        }
        if (request.getMessage() == null || request.getMessage().trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Message is required");
        }

        User trainer = userRepository.findById(request.getTrainerId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Trainer not found"));
        if (trainer.getRole() != Role.TRAINER || !trainer.isActive()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Trainer not found");
        }

        Training training = trainingRepository.findById(request.getTrainingId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Training not found"));
        if (!training.getVendor().getId().equals(vendor.getId())) {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "You are not authorized to invite a trainer to this training");
        }
        if (invitationRepository.existsByTrainerAndTraining(trainer, training)) {
            throw new ResponseStatusException(
                    HttpStatus.CONFLICT,
                    "An invitation already exists for this trainer and training");
        }

        Invitation invitation = new Invitation();
        invitation.setTrainer(trainer);
        invitation.setTraining(training);
        invitation.setMessage(request.getMessage());
        invitation.setStatus("PENDING");

        Invitation saved = invitationRepository.save(invitation);
        adminAuditLogService.logAction(
                vendor,
                "INVITATION_SENT",
                "INVITATION",
                saved.getId(),
                training.getTitle(),
                "Sent trainer invitation",
                "trainer=" + trainer.getEmail() + " | status=" + saved.getStatus());
        return mapToResponse(saved);
    }

    @GetMapping("/vendor")
    public List<InvitationResponse> getVendorInvitations(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        User vendor = getUserFromAuth(authHeader);
        return invitationRepository.findByTrainingVendorOrderByCreatedAtDesc(vendor).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @GetMapping("/trainer")
    public List<InvitationResponse> getTrainerInvitations(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        User trainer = getUserFromAuth(authHeader);
        return invitationRepository.findByTrainerOrderByCreatedAtDesc(trainer).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @PutMapping("/{invitationId}/interested")
    public InvitationResponse markInterested(
            @PathVariable Long invitationId,
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        return updateTrainerInvitationStatus(invitationId, authHeader, "INTERESTED");
    }

    @PutMapping("/{invitationId}/not-interested")
    public InvitationResponse markNotInterested(
            @PathVariable Long invitationId,
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        return updateTrainerInvitationStatus(invitationId, authHeader, "NOT_INTERESTED");
    }

    @PutMapping("/{invitationId}/vendor-status")
    public InvitationResponse updateVendorInvitationStatus(
            @PathVariable Long invitationId,
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @RequestBody InvitationVendorStatusRequest request) {
        return updateVendorInvitationStatusInternal(invitationId, authHeader, request);
    }

    private User getUserFromAuth(String authHeader) {
        if (authHeader == null || authHeader.trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Authorization header is missing");
        }

        String token = authHeader.replace("Bearer ", "").trim();
        Long userId = authTokenService.extractRequiredUserId(token);

        return userRepository.findById(userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid user token"));
    }

    private InvitationResponse updateTrainerInvitationStatus(Long invitationId, String authHeader, String status) {
        User trainer = getUserFromAuth(authHeader);

        Invitation invitation = invitationRepository.findById(invitationId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Invitation not found"));

        if (!invitation.getTrainer().getId().equals(trainer.getId())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "You are not authorized to update this invitation");
        }

        if (!"PENDING".equalsIgnoreCase(invitation.getStatus())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "This invitation has already been updated");
        }

        invitation.setStatus(status);
        Invitation saved = invitationRepository.save(invitation);
        adminAuditLogService.logAction(
                trainer,
                "INVITATION_" + status,
                "INVITATION",
                saved.getId(),
                saved.getTraining().getTitle(),
                "Updated invitation response",
                "vendor=" + saved.getTraining().getVendor().getEmail() + " | status=" + saved.getStatus());
        return mapToResponse(saved);
    }

    private InvitationResponse updateVendorInvitationStatusInternal(
            Long invitationId,
            String authHeader,
            InvitationVendorStatusRequest request) {
        User vendor = getUserFromAuth(authHeader);

        Invitation invitation = invitationRepository.findById(invitationId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Invitation not found"));

        if (!invitation.getTraining().getVendor().getId().equals(vendor.getId())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "You are not authorized to update this invitation");
        }

        String nextStatus = request == null ? null : request.getStatus();
        if (nextStatus == null || nextStatus.trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Status is required");
        }

        String normalizedStatus = nextStatus.trim().toUpperCase();
        if (!isValidVendorStatus(normalizedStatus)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid vendor status");
        }

        if (!isValidVendorTransition(invitation.getStatus(), normalizedStatus)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Invalid status transition for this invitation");
        }

        invitation.setStatus(normalizedStatus);
        Invitation saved = invitationRepository.save(invitation);
        adminAuditLogService.logAction(
                vendor,
                "INVITATION_STATUS_UPDATED",
                "INVITATION",
                saved.getId(),
                saved.getTraining().getTitle(),
                "Updated vendor invitation status",
                "trainer=" + saved.getTrainer().getEmail()
                        + " | status=" + saved.getStatus());
        return mapToResponse(saved);
    }

    private boolean isValidVendorStatus(String status) {
        return "SHORTLISTED".equals(status)
                || "INTERVIEW_SCHEDULED".equals(status)
                || "SELECTED".equals(status)
                || "ONBOARDED".equals(status)
                || "REJECTED_BY_VENDOR".equals(status);
    }

    private boolean isValidVendorTransition(String currentStatus, String nextStatus) {
        if (currentStatus == null) {
            return false;
        }

        String normalizedCurrent = currentStatus.toUpperCase();

        if ("INTERESTED".equals(normalizedCurrent)) {
            return "SHORTLISTED".equals(nextStatus)
                    || "SELECTED".equals(nextStatus)
                    || "REJECTED_BY_VENDOR".equals(nextStatus);
        }

        if ("SHORTLISTED".equals(normalizedCurrent)) {
            return "INTERVIEW_SCHEDULED".equals(nextStatus)
                    || "SELECTED".equals(nextStatus)
                    || "REJECTED_BY_VENDOR".equals(nextStatus);
        }

        if ("INTERVIEW_SCHEDULED".equals(normalizedCurrent)) {
            return "SELECTED".equals(nextStatus)
                    || "REJECTED_BY_VENDOR".equals(nextStatus);
        }

        if ("SELECTED".equals(normalizedCurrent)) {
            return "ONBOARDED".equals(nextStatus);
        }

        return false;
    }

    private InvitationResponse mapToResponse(Invitation invitation) {
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
