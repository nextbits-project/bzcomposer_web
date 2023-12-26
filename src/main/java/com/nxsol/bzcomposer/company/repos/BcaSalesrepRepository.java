package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaSalesrep;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaSalesrepRepository extends JpaRepository<BcaSalesrep, Integer> {
	
	 List<BcaSalesrep> findByCompany_CompanyIdAndActive(Long companyId, Integer active);
	 BcaSalesrep findBySalesRepId(Integer salesRepId);
}
