package com.trainerpro.trainerpro.dto;

import com.trainerpro.trainerpro.entity.Role;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor      // ✅ REQUIRED
@AllArgsConstructor     // ✅ Optional but good
public class UserResponse {

    private Long id;
    private String name;
    private String email;
    private Role role;
    private boolean active;
    private boolean approved;
    private boolean rejected;
    private String rejectionReason;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String profileImage;
    private String resume;
    private String profession;
    private String mobile;
    private String education;
    private String experience;
    private String skills;
    private String certifications;
    private String trainingDomains;
    private String trainingModes;
    private String languages;
    private String location;
    private String bio;
}
