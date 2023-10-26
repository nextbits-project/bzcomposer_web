package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaCompanyRepository extends JpaRepository<BcaCompany, Long> {
	BcaCompany findByCompanyId(Long companyId);

}
