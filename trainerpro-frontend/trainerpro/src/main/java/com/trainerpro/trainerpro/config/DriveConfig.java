package com.trainerpro.trainerpro.config;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.services.drive.Drive;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.InputStream;
import java.util.Collections;

@Configuration
public class DriveConfig {

    private static final String CREDENTIALS_FILE = "journeytocareerdrive-4cbfec02f265.json";

    @Bean
    public Drive googleDrive() throws Exception {

        InputStream in = getClass()
                .getClassLoader()
                .getResourceAsStream(CREDENTIALS_FILE);

        if (in == null) {
            throw new RuntimeException("❌ Credentials file not found!");
        }

        GoogleCredentials credentials = GoogleCredentials.fromStream(in)
                .createScoped(Collections.singleton("https://www.googleapis.com/auth/drive"));

        return new Drive.Builder(
                GoogleNetHttpTransport.newTrustedTransport(),
                JacksonFactory.getDefaultInstance(),
                new HttpCredentialsAdapter(credentials))
                .setApplicationName("TrainerPro")
                .build();
    }
}