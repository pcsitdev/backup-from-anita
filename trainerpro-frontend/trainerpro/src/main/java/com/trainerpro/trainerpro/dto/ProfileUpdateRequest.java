package com.trainerpro.trainerpro.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProfileUpdateRequest {

    private String name;
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