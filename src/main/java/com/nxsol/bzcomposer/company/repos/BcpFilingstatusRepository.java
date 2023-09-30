package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpFilingstatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpFilingstatusRepository extends JpaRepository<BcpFilingstatus, Integer> {
}
