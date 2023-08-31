package com.nxsol.bizcomposer.modal.repositories;

import com.nxsol.bizcomposer.modal.entities.BcaUser;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaUserRepository extends JpaRepository<BcaUser, Integer> {
}
