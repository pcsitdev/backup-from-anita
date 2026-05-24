package com.trainerpro.trainerpro.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trainerpro.trainerpro.entity.AdminAccount;

public interface AdminAccountRepository extends JpaRepository<AdminAccount, Long> {

    Optional<AdminAccount> findByEmail(String email);

    boolean existsByEmail(String email);
}
