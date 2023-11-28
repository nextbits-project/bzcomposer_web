package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcpJobcode;

@Repository
public interface BcpJobcodeRepository extends JpaRepository<BcpJobcode, Integer> {
	String jobCodeQuery = "select JobID,Name,Cost,Description from bcp_jobcode where CompanyID=?"
			+ "order by Name";
	
	List<BcpJobcode> findByCompanyOrderByName(BcaCompany company);
}
