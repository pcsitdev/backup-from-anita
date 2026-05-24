package com.trainerpro.trainerpro.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.trainerpro.trainerpro.dto.ApplicationResponse;
import com.trainerpro.trainerpro.dto.TrainerApplicationResponse;
import com.trainerpro.trainerpro.entity.Application;
import com.trainerpro.trainerpro.entity.Training;
import com.trainerpro.trainerpro.entity.User;
import com.trainerpro.trainerpro.repository.ApplicationRepository;
import com.trainerpro.trainerpro.repository.TrainingRepository;
import com.trainerpro.trainerpro.repository.UserRepository;
import com.trainerpro.trainerpro.service.AdminAuditLogService;
import com.trainerpro.trainerpro.service.AuthTokenService;

@RestController
@RequestMapping("/api/applications")
public class ApplicationController {

    private final ApplicationRepository applicationRepository;
    private final TrainingRepository trainingRepository;
    private final UserRepository userRepository;
    private final AuthTokenService authTokenService;
    private final AdminAuditLogService adminAuditLogService;

    public ApplicationController(
            ApplicationRepository applicationRepository,
            TrainingRepository trainingRepository,
            UserRepository userRepository,
            AuthTokenService authTokenService,
            AdminAuditLogService adminAuditLogService) {
        this.applicationRepository = applicationRepository;
        this.trainingRepository = trainingRepository;
        this.userRepository = userRepository;
        this.authTokenService = authTokenService;
        this.adminAuditLogService = adminAuditLogService;
    }

    @PostMapping("/apply/{trainingId}")
    @ResponseStatus(HttpStatus.CREATED)
    public void applyForTraining(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @PathVariable Long trainingId) {
        User trainer = getUserFromAuth(authHeader);

        Training training = trainingRepository.findById(trainingId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Training not found"));

        if (applicationRepository.existsByTrainerAndTraining(trainer, training)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You have already applied for this training");
        }

        Application application = Application.builder()
                .trainer(trainer)
                .training(training)
                .build();

        Application saved = applicationRepository.save(application);
        adminAuditLogService.logAction(
                trainer,
                "APPLICATION_SUBMITTED",
                "APPLICATION",
                saved.getId(),
                training.getTitle(),
                "Submitted application to training",
                "trainingId=" + training.getId()
                        + " | vendor=" + training.getVendor().getEmail()
                        + " | status=" + saved.getStatus());
    }

    @GetMapping("/training/{trainingId}")
    public List<ApplicationResponse> getApplicationsForTraining(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @PathVariable Long trainingId) {
        User vendor = getUserFromAuth(authHeader);

        Training training = trainingRepository.findById(trainingId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Training not found"));

        if (!training.getVendor().getId().equals(vendor.getId())) {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "You are not authorized to view applications for this training");
        }

        return applicationRepository.findByTraining(training).stream()
                .map(this::mapToApplicationResponse)
                .collect(Collectors.toList());
    }

    @GetMapping("/my")
    public List<TrainerApplicationResponse> getMyApplications(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        User trainer = getUserFromAuth(authHeader);

        return applicationRepository.findByTrainer(trainer).stream()
                .map(this::mapToTrainerApplicationResponse)
                .collect(Collectors.toList());
    }

    @PutMapping("/{id}/accept")
    public void acceptApplication(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @PathVariable Long id) {
        User vendor = getUserFromAuth(authHeader);

        Application application = applicationRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Application not found"));

        if (!application.getTraining().getVendor().getId().equals(vendor.getId())) {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "You are not authorized to manage this application");
        }

        application.setStatus("ACCEPTED");
        Application saved = applicationRepository.save(application);
        adminAuditLogService.logAction(
                vendor,
                "APPLICATION_ACCEPTED",
                "APPLICATION",
                saved.getId(),
                saved.getTraining().getTitle(),
                "Accepted trainer application",
                "trainer=" + saved.getTrainer().getEmail() + " | status=" + saved.getStatus());
    }

    @PutMapping("/{id}/reject")
    public void rejectApplication(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @PathVariable Long id) {
        User vendor = getUserFromAuth(authHeader);

        Application application = applicationRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Application not found"));

        if (!application.getTraining().getVendor().getId().equals(vendor.getId())) {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "You are not authorized to manage this application");
        }

        application.setStatus("REJECTED");
        Application saved = applicationRepository.save(application);
        adminAuditLogService.logAction(
                vendor,
                "APPLICATION_REJECTED",
                "APPLICATION",
                saved.getId(),
                saved.getTraining().getTitle(),
                "Rejected trainer application",
                "trainer=" + saved.getTrainer().getEmail() + " | status=" + saved.getStatus());
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

    private ApplicationResponse mapToApplicationResponse(Application application) {
        User trainer = application.getTrainer();
        List<String> skillsList = trainer.getSkills() != null
                ? Arrays.asList(trainer.getSkills().split(","))
                : new ArrayList<>();

        return new ApplicationResponse(
                application.getId(),
                trainer.getName(),
                trainer.getEmail(),
                trainer.getExperience(),
                skillsList,
                application.getStatus());
    }

    private TrainerApplicationResponse mapToTrainerApplicationResponse(Application application) {
        Training training = application.getTraining();
        User vendor = training.getVendor();

        String appliedAt = "Recently";

        return new TrainerApplicationResponse(
                application.getId(),
                training.getTitle(),
                training.getDescription(),
                vendor.getName(),
                training.getLocation(),
                appliedAt,
                application.getStatus());
    }
}
