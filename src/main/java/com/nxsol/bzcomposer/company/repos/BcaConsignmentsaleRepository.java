package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaConsignmentsale;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaConsignmentsaleRepository extends JpaRepository<BcaConsignmentsale, Integer> {
}
