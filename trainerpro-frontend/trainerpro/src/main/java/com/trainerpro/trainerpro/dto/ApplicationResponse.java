package com.trainerpro.trainerpro.dto;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApplicationResponse {
    private Long id;
    private String trainerName;
    private String email;
    private String experience;
    private List<String> skills;
    private String status;
}