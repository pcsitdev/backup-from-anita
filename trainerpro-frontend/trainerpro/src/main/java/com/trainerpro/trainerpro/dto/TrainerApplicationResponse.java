package com.trainerpro.trainerpro.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainerApplicationResponse {
    private Long id;
    private String trainingTitle;
    private String description;
    private String vendorName;
    private String location;
    private String appliedAt;
    private String status;
}