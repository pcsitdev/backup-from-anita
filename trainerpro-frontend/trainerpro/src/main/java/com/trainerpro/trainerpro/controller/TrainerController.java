package com.trainerpro.trainerpro.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import com.trainerpro.trainerpro.dto.UserResponse;
import com.trainerpro.trainerpro.entity.Role;
import com.trainerpro.trainerpro.entity.User;
import com.trainerpro.trainerpro.repository.UserRepository;

@RestController
@RequestMapping("/api/trainers")
public class TrainerController {

    private final UserRepository userRepository;

    public TrainerController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public List<UserResponse> getAllTrainers() {
        return userRepository.findAll().stream()
                .filter(user -> user.getRole() == Role.TRAINER && user.isActive())
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public UserResponse getTrainerById(@PathVariable Long id) {
        User trainer = userRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Trainer not found"));

        if (trainer.getRole() != Role.TRAINER || !trainer.isActive()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Trainer not found");
        }

        return mapToResponse(trainer);
    }

    private UserResponse mapToResponse(User user) {
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
                user.getBio()
        );
    }
}
