package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpStwithholding;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpStwithholdingRepository extends JpaRepository<BcpStwithholding, Integer> {
}
