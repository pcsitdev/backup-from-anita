package com.trainerpro.trainerpro.dto;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminDashboardResponse {
    private Map<String, Long> counts;
    private Map<String, Long> userBreakdown;
    private Map<String, Long> trainingBreakdown;
    private Map<String, Long> applicationBreakdown;
    private Map<String, Long> invitationBreakdown;
    private List<UserResponse> recentUsers;
    private List<TrainingResponse> recentTrainings;
}
