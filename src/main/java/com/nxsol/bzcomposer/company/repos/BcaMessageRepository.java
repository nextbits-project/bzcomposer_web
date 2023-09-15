package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMessage;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaMessageRepository extends JpaRepository<BcaMessage, Integer> {
}
