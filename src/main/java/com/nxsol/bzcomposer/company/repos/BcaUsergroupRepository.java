package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaUsergroup;

@Repository
public interface BcaUsergroupRepository extends JpaRepository<BcaUsergroup, Integer> {

	List<BcaUsergroup> findByCompany_CompanyIdAndActive(Long companyId, boolean active);

	List<BcaUsergroup> findByDeletedFalseAndUserGroupNameNotAndCompany_CompanyId(String userGroupName, Long companyId);

}
