package com.trainerpro.trainerpro.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trainerpro.trainerpro.entity.Training;
import com.trainerpro.trainerpro.entity.User;

public interface TrainingRepository extends JpaRepository<Training, Long> {
    List<Training> findByVendor(User vendor);
}
