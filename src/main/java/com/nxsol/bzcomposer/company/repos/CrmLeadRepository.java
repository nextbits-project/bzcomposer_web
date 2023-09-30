package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.CrmLead;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CrmLeadRepository extends JpaRepository<CrmLead, Integer> {
}
