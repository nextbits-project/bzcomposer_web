package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.domain.BcaAccount;
import com.nxsol.bzcomposer.company.domain.BcaAcctcategory;
import com.nxsol.bzcomposer.company.domain.BcaAccttype;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaAccountRepository extends JpaRepository<BcaAccount, Integer> {
	@Query(" SELECT a FROM BcaAccount a where a.acctType = 2 AND a.active = 1 AND a.company = :companyId "
			+ "ORDER BY acctCategory,name ASC")
	List<BcaAccount> findBcaAccountByAcctTypeAndActiveAndCompanyID(@Param("companyId") BcaCompany companyId);

	@Query(" SELECT a FROM BcaAccount a where a.acctType IN (2,-1) AND a.active = 1 AND a.company = :companyId "
			+ "ORDER BY acctCategory,name ASC")
	List<BcaAccount> getBcaAccountByAcctTypeAndActiveAndCompanyID(@Param("companyId") BcaCompany companyId);

	List<BcaAccount> findByCompanyAndAcctTypeAndActiveAndAccountIdOrderByAcctCategoryAscNameAsc(BcaCompany company,
			BcaAccttype acctType, Integer active, Integer accountId);

	List<BcaAccount> findByCompanyAndAcctTypeAndActiveOrderByAcctCategoryAscNameAsc(BcaCompany company,
			BcaAccttype acctType, Integer active);

	List<BcaAccount> findByClientVendorAndActiveAndCompany(BcaClientvendor clientVendor, int active,
			BcaCompany company);

	List<BcaAccount> findByAccountIdAndCompany(Integer accountId, BcaCompany company);

	List<BcaAccount> findByCompanyAndActiveAndAccountIdOrderByAcctCategoryAscNameAsc(BcaCompany company, int active,
			int accountId);

	@Query("select max(accountId) from BcaAccount ba where ba.company = :company")
	Integer findMaxAccountIdByCompany(@Param("company") BcaCompany company);

	@Modifying
	@Transactional
	@Query("update BcaAccount ba set ba.active = 0 where ba.accountId = :accountId and ba.company = :company")
	int updateBankAccount(@Param("accountId") int accountId, @Param("company") BcaCompany company);

	List<BcaAccount> findByParentIdNotOrderByNameAsc(int parentId);
}
