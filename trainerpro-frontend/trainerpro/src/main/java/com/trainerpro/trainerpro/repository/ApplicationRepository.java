package com.trainerpro.trainerpro.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trainerpro.trainerpro.entity.Application;
import com.trainerpro.trainerpro.entity.Training;
import com.trainerpro.trainerpro.entity.User;

public interface ApplicationRepository extends JpaRepository<Application, Long> {
    List<Application> findByTraining(Training training);
    List<Application> findByTrainer(User trainer);
    boolean existsByTrainerAndTraining(User trainer, Training training);
}