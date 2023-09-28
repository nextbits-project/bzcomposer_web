package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.AdjustmentReason;

@Repository
public interface AdjustmentReasonRepository extends BaseRepository<AdjustmentReason, Integer> {
	
	//List<AdjustmentReason> findByCompanyIdAndReasonAnd(String companyId,String reason); 
}
