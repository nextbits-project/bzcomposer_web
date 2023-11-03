package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaAccount;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaAccountRepository extends JpaRepository<BcaAccount, Integer> {
	@Query(" SELECT a FROM BcaAccount a where a.acctType = 2 AND a.active = 1 AND a.company = :companyId "
			+ "ORDER BY acctCategory,name ASC")
	List<BcaAccount> findBcaAccountByAcctTypeAndActiveAndCompanyID(@Param("companyId") BcaCompany companyId);

	@Query(" SELECT a FROM BcaAccount a where a.acctType IN (2,-1) AND a.active = 1 AND a.company = :companyId "
			+ "ORDER BY acctCategory,name ASC")
	List<BcaAccount> getBcaAccountByAcctTypeAndActiveAndCompanyID(@Param("companyId") BcaCompany companyId);
}
