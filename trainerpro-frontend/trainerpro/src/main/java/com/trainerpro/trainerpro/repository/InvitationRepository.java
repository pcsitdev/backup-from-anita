package com.trainerpro.trainerpro.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trainerpro.trainerpro.entity.Invitation;
import com.trainerpro.trainerpro.entity.Training;
import com.trainerpro.trainerpro.entity.User;

public interface InvitationRepository extends JpaRepository<Invitation, Long> {
    List<Invitation> findByTraining(Training training);
    List<Invitation> findByTrainerOrderByCreatedAtDesc(User trainer);
    List<Invitation> findByTrainingVendorOrderByCreatedAtDesc(User vendor);
    boolean existsByTrainerAndTraining(User trainer, Training training);
}
