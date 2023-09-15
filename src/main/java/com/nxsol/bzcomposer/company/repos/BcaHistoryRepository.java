package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaHistory;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaHistoryRepository extends JpaRepository<BcaHistory, Integer> {
}
