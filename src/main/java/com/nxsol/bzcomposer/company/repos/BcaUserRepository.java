package com.nxsol.bzcomposer.company.repos;

import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaUser;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaUserRepository extends JpaRepository<BcaUser, Integer> {

	@Query("SELECT u.password FROM BcaUser u JOIN u.userBcaUsermappings um JOIN u.company c WHERE um.role = 'Admin' AND c.id = :companyId AND u.active = true")
	String findAdminPasswordByCompanyId(@Param("companyId") Long companyId);

	@Query("SELECT COUNT(u) FROM BcaUser u JOIN u.userBcaUsermappings um WHERE um.role = 'User' AND u.company.id = :companyId AND u.active = true")
	int countActiveUsersByCompany(@Param("companyId") Long companyId);

//	@Query("SELECT new com.avibha.bizcomposer.configuration.forms.ConfigurationDto(u.id, u.loginId, u.password, u.emailAddress, um.userGroup.id, um.userGroup.name, u.active) "
//			+ "FROM BcaUser u JOIN u.userBcaUsermappings um WHERE um.role = 'User' AND u.company.id = :companyId AND u.active = true")
	@Query("SELECT new com.avibha.bizcomposer.configuration.forms.ConfigurationDto(u.id, u.loginId, u.password, u.emailAddress, um.userGroup.id, um.userGroup.userGroupName, u.active) " +
	           "FROM BcaUser u JOIN u.userBcaUsermappings um WHERE um.role = 'User' AND u.company.id = :companyId AND u.active = true")
	List<ConfigurationDto> findUserDetailsByCompanyId(@Param("companyId") Long companyId);
	
	@Query("SELECT u.membershipLevel FROM BcaUser u WHERE (u.emailAddress = :emailAddress OR u.loginId = :loginId) AND u.company.id = :companyId AND u.active = true")
    Optional<String> findMembershipLevelByEmailOrLoginIdAndCompanyId(@Param("emailAddress") String emailAddress, @Param("loginId") String loginId, @Param("companyId") Long companyId);

    Optional<BcaUser> findByCompanyAndEmailAddress(BcaCompany company, String emailAddress);

}
