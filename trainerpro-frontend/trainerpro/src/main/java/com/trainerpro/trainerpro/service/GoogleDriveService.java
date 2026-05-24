package com.trainerpro.trainerpro.service;

import com.google.api.client.http.InputStreamContent;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collections;

@Service
public class GoogleDriveService {

    private final Drive drive;

    private static final String ROOT_FOLDER_ID = "0ANzPAEFa93_SUk9PVA";

    public GoogleDriveService(Drive drive) {
        this.drive = drive;
    }

    public String uploadFile(MultipartFile file) throws Exception {

        File metadata = new File();
        metadata.setName(System.currentTimeMillis() + "_" + file.getOriginalFilename());
        metadata.setParents(Collections.singletonList(ROOT_FOLDER_ID));

        String contentType = file.getContentType() != null ? file.getContentType() : "application/octet-stream";

        InputStreamContent mediaContent = new InputStreamContent(
                contentType,
                file.getInputStream()
        );

        File uploaded = drive.files()
                .create(metadata, mediaContent)
                .setFields("id")
                .execute();

        // Make public
        Permission permission = new Permission()
                .setType("anyone")
                .setRole("reader");

        drive.permissions().create(uploaded.getId(), permission).execute();

        // Direct usable link
        return "https://drive.google.com/uc?id=" + uploaded.getId();
    }
}