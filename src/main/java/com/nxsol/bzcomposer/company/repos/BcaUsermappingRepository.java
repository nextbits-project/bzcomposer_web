package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaUsermapping;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaUsermappingRepository extends JpaRepository<BcaUsermapping, Integer> {
	Optional<BcaUsermapping> findByUserIdAndCompany_CompanyId(int userId, Long companyId);
	
    Optional<BcaUsermapping> findByUserIdAndUserGroup_groupIdAndCompany_CompanyId(int userId, int userGroupId, Long companyId);

}
