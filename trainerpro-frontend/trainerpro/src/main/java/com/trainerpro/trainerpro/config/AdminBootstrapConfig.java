package com.trainerpro.trainerpro.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.trainerpro.trainerpro.entity.AdminAccount;
import com.trainerpro.trainerpro.repository.AdminAccountRepository;

@Configuration
public class AdminBootstrapConfig {

    @Bean
    public CommandLineRunner adminAccountSeeder(
            AdminAccountRepository adminAccountRepository,
            PasswordEncoder passwordEncoder,
            @Value("${app.admin.name:Platform Admin}") String adminName,
            @Value("${app.admin.email:alokhalder@gmail.com}") String adminEmail,
            @Value("${app.admin.password:Aloke@123#}") String adminPassword) {
        return (args) -> {
            String normalizedEmail = adminEmail == null ? "" : adminEmail.trim().toLowerCase();
            if (normalizedEmail.isEmpty()) {
                return;
            }

            AdminAccount adminAccount = adminAccountRepository.findByEmail(normalizedEmail)
                    .orElseGet(AdminAccount::new);
            adminAccount.setName(adminName == null || adminName.trim().isEmpty() ? "Platform Admin" : adminName.trim());
            adminAccount.setEmail(normalizedEmail);
            adminAccount.setPassword(passwordEncoder.encode(adminPassword == null ? "" : adminPassword));
            adminAccount.setActive(true);
            adminAccountRepository.save(adminAccount);
        };
    }
}
