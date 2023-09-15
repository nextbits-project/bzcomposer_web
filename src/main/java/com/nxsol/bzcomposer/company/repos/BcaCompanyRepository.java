package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaCompanyRepository extends JpaRepository<BcaCompany, Integer> {
}
