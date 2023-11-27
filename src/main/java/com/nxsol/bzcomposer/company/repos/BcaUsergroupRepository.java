package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaUsergroup;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaUsergroupRepository extends JpaRepository<BcaUsergroup, Integer> {
	
	 List<BcaUsergroup> findByCompany_CompanyIdAndActive(Long companyId, boolean active);
}
