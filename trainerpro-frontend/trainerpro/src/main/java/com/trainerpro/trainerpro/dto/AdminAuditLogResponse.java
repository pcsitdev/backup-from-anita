package com.trainerpro.trainerpro.dto;

import java.time.LocalDateTime;

public class AdminAuditLogResponse {

    private Long id;
    private Long adminId;
    private String adminEmail;
    private String actorRole;
    private String actionType;
    private String entityType;
    private Long entityId;
    private String entityLabel;
    private String description;
    private String metadata;
    private LocalDateTime createdAt;

    public AdminAuditLogResponse() {}

    public AdminAuditLogResponse(
            Long id,
            Long adminId,
            String adminEmail,
            String actorRole,
            String actionType,
            String entityType,
            Long entityId,
            String entityLabel,
            String description,
            String metadata,
            LocalDateTime createdAt) {
        this.id = id;
        this.adminId = adminId;
        this.adminEmail = adminEmail;
        this.actorRole = actorRole;
        this.actionType = actionType;
        this.entityType = entityType;
        this.entityId = entityId;
        this.entityLabel = entityLabel;
        this.description = description;
        this.metadata = metadata;
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public Long getAdminId() {
        return adminId;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public String getActionType() {
        return actionType;
    }

    public String getActorRole() {
        return actorRole;
    }

    public String getEntityType() {
        return entityType;
    }

    public Long getEntityId() {
        return entityId;
    }

    public String getEntityLabel() {
        return entityLabel;
    }

    public String getDescription() {
        return description;
    }

    public String getMetadata() {
        return metadata;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
}
