package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpEmployee;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpEmployeeRepository extends JpaRepository<BcpEmployee, Integer> {
	List<BcpEmployee> findByCompany_CompanyIdAndStatusInAndActive(Long companyId, List<String> statuses,
			Integer active);

}
