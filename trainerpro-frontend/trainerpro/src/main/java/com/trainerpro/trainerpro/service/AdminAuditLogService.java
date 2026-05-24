package com.trainerpro.trainerpro.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.trainerpro.trainerpro.dto.AdminAuditLogResponse;
import com.trainerpro.trainerpro.entity.AdminAccount;
import com.trainerpro.trainerpro.entity.AdminAuditLog;
import com.trainerpro.trainerpro.entity.User;
import com.trainerpro.trainerpro.repository.AdminAuditLogRepository;

@Service
public class AdminAuditLogService {

    private final AdminAuditLogRepository adminAuditLogRepository;

    public AdminAuditLogService(AdminAuditLogRepository adminAuditLogRepository) {
        this.adminAuditLogRepository = adminAuditLogRepository;
    }

    public void logAction(
            AdminAccount adminAccount,
            String actionType,
            String entityType,
            Long entityId,
            String entityLabel,
            String description,
            String metadata) {
        AdminAuditLog log = new AdminAuditLog();
        log.setAdminId(adminAccount.getId());
        log.setAdminEmail(adminAccount.getEmail());
        log.setActorRole("ADMIN");
        log.setActionType(actionType);
        log.setEntityType(entityType);
        log.setEntityId(entityId);
        log.setEntityLabel(entityLabel);
        log.setDescription(description);
        log.setMetadata(metadata);
        adminAuditLogRepository.save(log);
    }

    public void logAction(
            User actor,
            String actionType,
            String entityType,
            Long entityId,
            String entityLabel,
            String description,
            String metadata) {
        AdminAuditLog log = new AdminAuditLog();
        log.setAdminId(actor.getId());
        log.setAdminEmail(actor.getEmail());
        log.setActorRole(actor.getRole() == null ? "USER" : actor.getRole().name());
        log.setActionType(actionType);
        log.setEntityType(entityType);
        log.setEntityId(entityId);
        log.setEntityLabel(entityLabel);
        log.setDescription(description);
        log.setMetadata(metadata);
        adminAuditLogRepository.save(log);
    }

    public List<AdminAuditLogResponse> getRecentLogs() {
        return adminAuditLogRepository.findTop100ByOrderByCreatedAtDesc().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    private AdminAuditLogResponse mapToResponse(AdminAuditLog log) {
        return new AdminAuditLogResponse(
                log.getId(),
                log.getAdminId(),
                log.getAdminEmail(),
                log.getActorRole(),
                log.getActionType(),
                log.getEntityType(),
                log.getEntityId(),
                log.getEntityLabel(),
                log.getDescription(),
                log.getMetadata(),
                log.getCreatedAt());
    }
}
