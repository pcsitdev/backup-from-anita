package com.trainerpro.trainerpro.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public class LoginRequest {

    @Email
    @NotBlank
    private String email;

    @NotBlank
    private String password;

    // ✅ GETTERS
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    // ✅ SETTERS
    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}