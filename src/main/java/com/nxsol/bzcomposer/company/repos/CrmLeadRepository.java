package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.CrmLead;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CrmLeadRepository extends JpaRepository<CrmLead, Integer> {
}
