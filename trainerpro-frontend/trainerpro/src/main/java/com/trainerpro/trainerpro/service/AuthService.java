package com.trainerpro.trainerpro.service;

import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.trainerpro.trainerpro.dto.AuthResponse;
import com.trainerpro.trainerpro.dto.LoginRequest;
import com.trainerpro.trainerpro.dto.ProfileUpdateRequest;
import com.trainerpro.trainerpro.dto.RegisterRequest;
import com.trainerpro.trainerpro.dto.UserResponse;
import com.trainerpro.trainerpro.entity.AdminAccount;
import com.trainerpro.trainerpro.entity.Role;
import com.trainerpro.trainerpro.entity.User;
import com.trainerpro.trainerpro.repository.AdminAccountRepository;
import com.trainerpro.trainerpro.repository.UserRepository;

@Service
public class AuthService {

    private final UserRepository userRepository;
    private final AdminAccountRepository adminAccountRepository;
    private final PasswordEncoder passwordEncoder;
    private final GoogleDriveService googleDriveService;
    private final EmailNotificationService emailNotificationService;
    private final AuthTokenService authTokenService;

    public AuthService(
            UserRepository userRepository,
            AdminAccountRepository adminAccountRepository,
            PasswordEncoder passwordEncoder,
            GoogleDriveService googleDriveService,
            EmailNotificationService emailNotificationService,
            AuthTokenService authTokenService) {
        this.userRepository = userRepository;
        this.adminAccountRepository = adminAccountRepository;
        this.passwordEncoder = passwordEncoder;
        this.googleDriveService = googleDriveService;
        this.emailNotificationService = emailNotificationService;
        this.authTokenService = authTokenService;
    }

    public AuthResponse register(RegisterRequest request) {
        String normalizedEmail = normalizeEmail(request.getEmail());

        userRepository.findByEmail(normalizedEmail).ifPresent((user) -> {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Email already registered");
        });

        if (adminAccountRepository.existsByEmail(normalizedEmail)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Email already registered");
        }

        if (request.getRole() == Role.ADMIN) {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "Admin accounts cannot be created from public registration");
        }

        User user = new User();
        user.setName(request.getName() == null ? null : request.getName().trim());
        user.setEmail(normalizedEmail);
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRole(request.getRole());
        user.setActive(false);
        user.setApproved(false);
        user.setRejected(false);
        user.setRejectionReason(null);

        User savedUser = userRepository.save(user);
        emailNotificationService.sendRegistrationPendingEmail(savedUser);
        return buildUserAuthResponse(savedUser);
    }

    public AuthResponse login(LoginRequest request) {
        String normalizedEmail = normalizeEmail(request.getEmail());

        AdminAccount adminAccount = adminAccountRepository.findByEmail(normalizedEmail).orElse(null);
        if (adminAccount != null) {
            if (!passwordEncoder.matches(request.getPassword(), adminAccount.getPassword())) {
                throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid email or password");
            }

            if (!adminAccount.isActive()) {
                throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Admin account is deactivated");
            }

            return buildAdminAuthResponse(adminAccount);
        }

        User user = userRepository.findByEmail(normalizedEmail)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid email or password"));

        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid email or password");
        }

        if (user.isRejected()) {
            String rejectionReason = user.getRejectionReason();
            String suffix = rejectionReason != null && !rejectionReason.trim().isEmpty()
                    ? " Reason: " + rejectionReason.trim()
                    : "";
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "Your registration was not approved by the admin team." + suffix);
        }

        if (!user.isApproved()) {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "Your account is pending admin approval. You can log in after your profile is approved.");
        }

        if (!user.isActive()) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Account is deactivated");
        }

        return buildUserAuthResponse(user);
    }

    public UserResponse updateProfile(
            Long userId,
            ProfileUpdateRequest request,
            MultipartFile profileImage,
            MultipartFile resume) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));

        if (request.getName() != null) user.setName(request.getName());
        if (request.getProfession() != null) user.setProfession(request.getProfession());
        if (request.getMobile() != null) user.setMobile(request.getMobile());
        if (request.getEducation() != null) user.setEducation(request.getEducation());
        if (request.getExperience() != null) user.setExperience(request.getExperience());
        if (request.getSkills() != null) user.setSkills(request.getSkills());
        if (request.getCertifications() != null) user.setCertifications(request.getCertifications());
        if (request.getTrainingDomains() != null) user.setTrainingDomains(request.getTrainingDomains());
        if (request.getTrainingModes() != null) user.setTrainingModes(request.getTrainingModes());
        if (request.getLanguages() != null) user.setLanguages(request.getLanguages());
        if (request.getLocation() != null) user.setLocation(request.getLocation());
        if (request.getBio() != null) user.setBio(request.getBio());

        try {
            if (profileImage != null && !profileImage.isEmpty()) {
                user.setProfileImage(googleDriveService.uploadFile(profileImage));
            }

            if (resume != null && !resume.isEmpty()) {
                user.setResume(googleDriveService.uploadFile(resume));
            }
        } catch (Exception e) {
            throw new RuntimeException("File upload failed: " + e.getMessage());
        }

        User updatedUser = userRepository.save(user);
        return buildUserResponse(updatedUser);
    }

    private AuthResponse buildUserAuthResponse(User user) {
        AuthResponse response = new AuthResponse();
        response.setToken(authTokenService.generateUserToken(user));
        response.setUser(buildUserResponse(user));
        return response;
    }

    private AuthResponse buildAdminAuthResponse(AdminAccount adminAccount) {
        UserResponse userResponse = new UserResponse();
        userResponse.setId(adminAccount.getId());
        userResponse.setName(adminAccount.getName());
        userResponse.setEmail(adminAccount.getEmail());
        userResponse.setRole(Role.ADMIN);
        userResponse.setActive(adminAccount.isActive());
        userResponse.setApproved(true);
        userResponse.setRejected(false);
        userResponse.setCreatedAt(adminAccount.getCreatedAt());
        userResponse.setUpdatedAt(adminAccount.getUpdatedAt());

        AuthResponse response = new AuthResponse();
        response.setToken(authTokenService.generateAdminToken(adminAccount));
        response.setUser(userResponse);
        return response;
    }

    private UserResponse buildUserResponse(User user) {
        UserResponse userResponse = new UserResponse();
        userResponse.setId(user.getId());
        userResponse.setName(user.getName());
        userResponse.setEmail(user.getEmail());
        userResponse.setRole(user.getRole());
        userResponse.setActive(user.isActive());
        userResponse.setApproved(user.isApproved());
        userResponse.setRejected(user.isRejected());
        userResponse.setRejectionReason(user.getRejectionReason());
        userResponse.setCreatedAt(user.getCreatedAt());
        userResponse.setUpdatedAt(user.getUpdatedAt());
        userResponse.setProfileImage(user.getProfileImage());
        userResponse.setResume(user.getResume());
        userResponse.setProfession(user.getProfession());
        userResponse.setMobile(user.getMobile());
        userResponse.setEducation(user.getEducation());
        userResponse.setExperience(user.getExperience());
        userResponse.setSkills(user.getSkills());
        userResponse.setCertifications(user.getCertifications());
        userResponse.setTrainingDomains(user.getTrainingDomains());
        userResponse.setTrainingModes(user.getTrainingModes());
        userResponse.setLanguages(user.getLanguages());
        userResponse.setLocation(user.getLocation());
        userResponse.setBio(user.getBio());
        return userResponse;
    }

    private String normalizeEmail(String email) {
        return email == null ? "" : email.trim().toLowerCase();
    }
}
