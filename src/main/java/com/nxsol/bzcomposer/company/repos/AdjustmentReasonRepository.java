package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import com.nxsol.bzcomposer.company.domain.AdjustmentReason;


public interface AdjustmentReasonRepository extends BaseRepository<AdjustmentReason, Integer> {
	
	//List<AdjustmentReason> findByCompanyIdAndReasonAnd(String companyId,String reason); 
}
