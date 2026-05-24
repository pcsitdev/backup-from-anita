package com.trainerpro.trainerpro.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.trainerpro.trainerpro.dto.TrainingRequest;
import com.trainerpro.trainerpro.dto.TrainingResponse;
import com.trainerpro.trainerpro.entity.Training;
import com.trainerpro.trainerpro.entity.User;
import com.trainerpro.trainerpro.repository.TrainingRepository;
import com.trainerpro.trainerpro.repository.UserRepository;
import com.trainerpro.trainerpro.service.AdminAuditLogService;
import com.trainerpro.trainerpro.service.AuthTokenService;

@RestController
@RequestMapping("/api/trainings")
public class TrainingController {

    private final TrainingRepository trainingRepository;
    private final UserRepository userRepository;
    private final AuthTokenService authTokenService;
    private final AdminAuditLogService adminAuditLogService;

    public TrainingController(
            TrainingRepository trainingRepository,
            UserRepository userRepository,
            AuthTokenService authTokenService,
            AdminAuditLogService adminAuditLogService) {
        this.trainingRepository = trainingRepository;
        this.userRepository = userRepository;
        this.authTokenService = authTokenService;
        this.adminAuditLogService = adminAuditLogService;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public TrainingResponse createTraining(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @RequestBody TrainingRequest request) {
        User vendor = getUserFromAuth(authHeader);

        if (request.getTitle() == null || request.getTitle().trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Title is required");
        }
        if (request.getDescription() == null || request.getDescription().trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Description is required");
        }
        if (request.getLocation() == null || request.getLocation().trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Location is required");
        }
        if (request.getBudget() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Budget is required");
        }
        if (request.getDuration() == null || request.getDuration().trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Duration is required");
        }

        Training training = Training.builder()
                .title(request.getTitle())
                .description(request.getDescription())
                .location(request.getLocation())
                .budget(request.getBudget())
                .duration(request.getDuration())
                .skills(request.getSkills())
                .vendor(vendor)
                .build();

        Training saved = trainingRepository.save(training);
        adminAuditLogService.logAction(
                vendor,
                "TRAINING_CREATED",
                "TRAINING",
                saved.getId(),
                saved.getTitle(),
                "Created training requirement",
                "location=" + saved.getLocation()
                        + " | budget=" + saved.getBudget()
                        + " | status=" + saved.getStatus());
        return mapToResponse(saved);
    }

    @GetMapping
    public List<TrainingResponse> getAllTrainings() {
        return trainingRepository.findAll().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @GetMapping("/my")
    public List<TrainingResponse> getMyTrainings(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        User vendor = getUserFromAuth(authHeader);
        return trainingRepository.findByVendor(vendor).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @GetMapping("/vendor")
    public List<TrainingResponse> getVendorTrainings(
            @RequestHeader(value = "Authorization", required = false) String authHeader) {
        User vendor = getUserFromAuth(authHeader);
        return trainingRepository.findByVendor(vendor).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @DeleteMapping("/{id}")
    public void deleteTraining(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @PathVariable Long id) {
        User vendor = getUserFromAuth(authHeader);
        Training training = trainingRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Training not found"));

        if (!training.getVendor().getId().equals(vendor.getId())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "You are not authorized to delete this training");
        }

        adminAuditLogService.logAction(
                vendor,
                "TRAINING_DELETED",
                "TRAINING",
                training.getId(),
                training.getTitle(),
                "Deleted training requirement",
                "location=" + training.getLocation() + " | status=" + training.getStatus());
        trainingRepository.delete(training);
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

    private TrainingResponse mapToResponse(Training training) {
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
}
