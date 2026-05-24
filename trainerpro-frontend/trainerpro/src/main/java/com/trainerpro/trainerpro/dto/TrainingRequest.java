package com.trainerpro.trainerpro.dto;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainingRequest {
    private String title;
    private String description;
    private String location;
    private Double budget;
    private String duration;
    private List<String> skills;
}
