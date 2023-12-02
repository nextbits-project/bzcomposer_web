package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaBalancesheetitem;

@Repository
public interface BcaBalancesheetitemRepository extends JpaRepository<BcaBalancesheetitem, Integer> {

//	String sql4 = "select * from bca_balancesheetitem  where CompanyID = '" + cId + "'"
//			+ " AND categoryTypeID = 2147483647";

	
	List<BcaBalancesheetitem> findByCompany_CompanyIdAndCategoryTypeId(Long companyId,int categoryTypeId );
}
