package com.nxsol.bzcomposer.company.repos;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.nxsol.bzcomposer.company.domain.BcaOpportunity;
import com.nxsol.bzcomposer.company.domain.BcaOpportunityEvent;
@Repository
public interface  BcaOpportunityEventRepository extends JpaRepository<BcaOpportunityEvent,Integer>

{
	
	 List<BcaOpportunityEvent> findByOpportunity(BcaOpportunity opportunity);
	 
	 List<BcaOpportunityEvent> findByOpportunityAndActive(BcaOpportunity opportunity, Boolean active);
	 
	 
}