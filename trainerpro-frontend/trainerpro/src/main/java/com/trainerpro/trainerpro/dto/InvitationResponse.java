package com.trainerpro.trainerpro.dto;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InvitationResponse {
    private Long id;
    private Long trainerId;
    private String trainerName;
    private String trainerEmail;
    private Long trainingId;
    private String trainingTitle;
    private String trainingDescription;
    private String trainingLocation;
    private Double trainingBudget;
    private String trainingDuration;
    private List<String> trainingSkills;
    private String trainingStatus;
    private Long vendorId;
    private String vendorName;
    private String message;
    private String status;
    private LocalDateTime createdAt;
}
