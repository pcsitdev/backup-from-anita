package com.trainerpro.trainerpro.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.trainerpro.trainerpro.dto.AuthResponse;
import com.trainerpro.trainerpro.dto.LoginRequest;
import com.trainerpro.trainerpro.dto.ProfileUpdateRequest;
import com.trainerpro.trainerpro.dto.RegisterRequest;
import com.trainerpro.trainerpro.dto.UserResponse;
import com.trainerpro.trainerpro.service.AuthService;
import com.trainerpro.trainerpro.service.AuthTokenService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;
    private final AuthTokenService authTokenService;

    public AuthController(AuthService authService, AuthTokenService authTokenService) {
        this.authService = authService;
        this.authTokenService = authTokenService;
    }

    @PostMapping("/register")
    @ResponseStatus(HttpStatus.CREATED)
    public AuthResponse register(@Valid @RequestBody RegisterRequest request) {
        return authService.register(request);
    }

    @PostMapping("/login")
    public AuthResponse login(@Valid @RequestBody LoginRequest request) {
        return authService.login(request);
    }

    @PutMapping(value = "/profile", consumes = { "multipart/form-data" })
    public UserResponse updateProfile(
            @RequestHeader(value = "Authorization", required = false) String authHeader,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "profession", required = false) String profession,
            @RequestParam(value = "mobile", required = false) String mobile,
            @RequestParam(value = "education", required = false) String education,
            @RequestParam(value = "experience", required = false) String experience,
            @RequestParam(value = "skills", required = false) String skills,
            @RequestParam(value = "certifications", required = false) String certifications,
            @RequestParam(value = "trainingDomains", required = false) String trainingDomains,
            @RequestParam(value = "trainingModes", required = false) String trainingModes,
            @RequestParam(value = "languages", required = false) String languages,
            @RequestParam(value = "location", required = false) String location,
            @RequestParam(value = "bio", required = false) String bio,
            @RequestParam(value = "profileImage", required = false) MultipartFile profileImage,
            @RequestParam(value = "resume", required = false) MultipartFile resume) {

        if (authHeader == null || authHeader.trim().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Authorization header is missing");
        }

        String token = authHeader.replace("Bearer ", "").trim();
        Long userId = authTokenService.extractRequiredUserId(token);

        ProfileUpdateRequest request = new ProfileUpdateRequest();
        request.setName(name);
        request.setProfession(profession);
        request.setMobile(mobile);
        request.setEducation(education);
        request.setExperience(experience);
        request.setSkills(skills);
        request.setCertifications(certifications);
        request.setTrainingDomains(trainingDomains);
        request.setTrainingModes(trainingModes);
        request.setLanguages(languages);
        request.setLocation(location);
        request.setBio(bio);

        try {
            return authService.updateProfile(userId, request, profileImage, resume);
        } catch (ResponseStatusException ex) {
            throw ex;
        } catch (Exception ex) {
            throw new ResponseStatusException(
                    HttpStatus.INTERNAL_SERVER_ERROR,
                    "Error updating profile: " + ex.getMessage());
        }
    }
}
