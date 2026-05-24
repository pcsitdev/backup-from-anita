package com.trainerpro.trainerpro.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminApplicationResponse {
    private Long id;
    private Long trainerId;
    private String trainerName;
    private String trainerEmail;
    private String trainerExperience;
    private List<String> trainerSkills;
    private Long trainingId;
    private String trainingTitle;
    private String trainingLocation;
    private Long vendorId;
    private String vendorName;
    private String vendorEmail;
    private String status;
}
