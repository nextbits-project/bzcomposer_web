package com.nxsol.bizcomposer.modal.repositories;

import com.nxsol.bizcomposer.modal.entities.BcaMessage;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaMessageRepository extends JpaRepository<BcaMessage, Integer> {
}
