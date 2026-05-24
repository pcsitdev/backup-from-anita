package com.trainerpro.trainerpro.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor      // ✅ REQUIRED
@AllArgsConstructor     // ✅ Good to have
public class AuthResponse {

    private String token;
    private UserResponse user;
}