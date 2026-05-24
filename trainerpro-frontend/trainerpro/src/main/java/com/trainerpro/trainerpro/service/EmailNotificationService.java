package com.trainerpro.trainerpro.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.trainerpro.trainerpro.entity.User;

@Service
public class EmailNotificationService {

    private static final Logger logger = LoggerFactory.getLogger(EmailNotificationService.class);

    private final ObjectProvider<JavaMailSender> mailSenderProvider;

    @Value("${app.mail.enabled:false}")
    private boolean mailEnabled;

    @Value("${app.mail.from:no-reply@trainerpro.local}")
    private String fromAddress;

    public EmailNotificationService(ObjectProvider<JavaMailSender> mailSenderProvider) {
        this.mailSenderProvider = mailSenderProvider;
    }

    public void sendRegistrationPendingEmail(User user) {
        String subject = "TrainerPro registration received";
        String body = String.format(
                "Hello %s,%n%nYour registration has been received and is now waiting for admin approval.%n"
                        + "You will be able to log in after your profile is approved.%n%n"
                        + "Thanks,%nTrainerPro Team",
                safeName(user));

        sendEmail(user.getEmail(), subject, body);
    }

    public void sendApprovalEmail(User user) {
        String subject = "Your TrainerPro profile has been approved";
        String body = String.format(
                "Hello %s,%n%nYour profile has been approved by the admin team.%n"
                        + "You can now log in to TrainerPro using your registered email and password.%n%n"
                        + "Thanks,%nTrainerPro Team",
                safeName(user));

        sendEmail(user.getEmail(), subject, body);
    }

    public void sendRejectionEmail(User user) {
        String reason = user.getRejectionReason() == null || user.getRejectionReason().trim().isEmpty()
                ? "No specific reason was provided."
                : user.getRejectionReason().trim();

        String subject = "Your TrainerPro registration was reviewed";
        String body = String.format(
                "Hello %s,%n%nYour registration was reviewed by the admin team, but it was not approved at this time.%n"
                        + "Reason: %s%n%n"
                        + "If needed, please contact support or register again with updated details.%n%n"
                        + "Thanks,%nTrainerPro Team",
                safeName(user),
                reason);

        sendEmail(user.getEmail(), subject, body);
    }

    private void sendEmail(String to, String subject, String body) {
        JavaMailSender mailSender = mailSenderProvider.getIfAvailable();

        if (!mailEnabled) {
            logger.info("Mail sending skipped because app.mail.enabled=false. Intended recipient: {}", to);
            return;
        }

        if (mailSender == null) {
            logger.warn("Mail sending skipped because JavaMailSender is not configured. Intended recipient: {}", to);
            return;
        }

        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromAddress);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(body);
            mailSender.send(message);
        } catch (Exception ex) {
            logger.error("Unable to send email to {}", to, ex);
        }
    }

    private String safeName(User user) {
        return user.getName() == null || user.getName().trim().isEmpty() ? "there" : user.getName().trim();
    }
}
