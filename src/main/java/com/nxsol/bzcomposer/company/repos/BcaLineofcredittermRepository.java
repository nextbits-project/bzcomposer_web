package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaLineofcreditterm;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLineofcredittermRepository extends JpaRepository<BcaLineofcreditterm, Integer> {
	List<BcaLineofcreditterm> findByCompanyAndActive(BcaCompany company, Integer active);

	Optional<BcaLineofcreditterm> findByCreditTermIdAndCompany_CompanyId(int id, Long companyId);

}
