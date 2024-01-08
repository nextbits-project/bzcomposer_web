package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaSalesrepRepository extends JpaRepository<BcaSalesrep, Integer> {

	BcaSalesrep findBySalesRepId(Integer salesRepId);

	List<BcaSalesrep> findByCompany_CompanyIdAndActive(Long companyId, Integer active);

	List<BcaSalesrep> findByCompanyAndActive(BcaCompany company, Integer active);

	Optional<BcaSalesrep> findBySalesRepIdAndCompany_CompanyId(int id, Long companyId);
	
	Optional<BcaSalesrep> findBySalesRepIdAndCompany_CompanyIdAndActive(int id, Long companyId,int active);
	
	


}
