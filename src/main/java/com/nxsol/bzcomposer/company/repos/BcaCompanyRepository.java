package com.nxsol.bzcomposer.company.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaCompanyRepository extends JpaRepository<BcaCompany, Long> {
	BcaCompany findByCompanyId(Long companyId);


//	@Query("SELECT com.name, com.nickName, com.firstName, com.lastName, com.address1, com.address2, com.city, com.state, com.zipcode, com.province, com.phone1, com.phone2, com.fax1, com.email, com.country, com.businessTypeId, com.membershipLevel, com.password, com.sameAsPhoneNumber, com.taxId, com.jobPosition, btype.businessName "
//			+ "FROM BcaCompany com LEFT JOIN BcaBusinesstype btype ON com.businessTypeId = btype.businessTypeId "
//			+ "WHERE com.CompanyID = :companyId")
//	Optional<Object[]> findCompanyDetailsById(Long companyId);
}
