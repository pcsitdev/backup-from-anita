package com.trainerpro.trainerpro.service;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.trainerpro.trainerpro.entity.AdminAccount;
import com.trainerpro.trainerpro.entity.Role;
import com.trainerpro.trainerpro.entity.User;

@Service
public class AuthTokenService {

    public String generateUserToken(User user) {
        return encode("USER:" + user.getId() + ":" + user.getEmail() + ":" + user.getRole().name());
    }

    public String generateAdminToken(AdminAccount adminAccount) {
        return encode("ADMIN:" + adminAccount.getId() + ":" + adminAccount.getEmail() + ":" + Role.ADMIN.name());
    }

    public TokenPayload parseToken(String token) {
        try {
            String decoded = new String(Base64.getDecoder().decode(token), StandardCharsets.UTF_8);
            String[] parts = decoded.split(":");

            if (parts.length == 4) {
                return new TokenPayload(parts[0], Long.parseLong(parts[1]), parts[2], parts[3]);
            }

            if (parts.length == 3) {
                return new TokenPayload("USER", Long.parseLong(parts[0]), parts[1], parts[2]);
            }

            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid token format");
        } catch (NumberFormatException ex) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid user ID in token");
        } catch (IllegalArgumentException ex) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid token encoding");
        }
    }

    public Long extractRequiredUserId(String token) {
        TokenPayload payload = parseToken(token);
        if (!"USER".equals(payload.principalType())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User token is required");
        }
        return payload.id();
    }

    public Long extractRequiredAdminId(String token) {
        TokenPayload payload = parseToken(token);
        if (!"ADMIN".equals(payload.principalType())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Admin token is required");
        }
        return payload.id();
    }

    private String encode(String rawToken) {
        return Base64.getEncoder().encodeToString(rawToken.getBytes(StandardCharsets.UTF_8));
    }

    public record TokenPayload(String principalType, Long id, String email, String role) {}
}
