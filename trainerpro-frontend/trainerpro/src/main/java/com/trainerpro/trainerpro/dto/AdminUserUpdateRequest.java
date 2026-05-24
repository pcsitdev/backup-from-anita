package com.trainerpro.trainerpro.dto;

import com.trainerpro.trainerpro.entity.Role;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AdminUserUpdateRequest {
    private Role role;
    private Boolean active;
    private Boolean approved;
    private Boolean rejected;
    private String rejectionReason;
}
