package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import com.nxsol.bzcomposer.company.domain.BcaOpportunity;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaOpportunityRepository extends JpaRepository<BcaOpportunity, Integer>
{
	 List<BcaOpportunity> findByCompany(BcaCompany company);
	 
	 @Query("SELECT MAX(id)+ 1 FROM BcaOpportunity")
		String getMaxId();
		
	 List<BcaOpportunity> findByCompanyAndActive(BcaCompany company, Boolean active);
	 
	
}
