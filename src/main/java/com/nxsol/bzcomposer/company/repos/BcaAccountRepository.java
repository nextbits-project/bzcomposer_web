package com.nxsol.bzcomposer.company.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nxsol.bzcomposer.company.domain.BcaAccount;
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

	@Query("SELECT a FROM BcaAccount a WHERE a.clientVendor.clientVendorId =:clientVendorId AND "
			+ "a.company.companyId=:companyId AND a.active=:active ")
	List<BcaAccount> findByClientVendorAndActiveAndCompany(@Param("clientVendorId")int clientVendorId,@Param("active") int active,
			@Param("companyId")long companyId);
	
	@Query("SELECT a FROM BcaAccount a WHERE a.accountId =:accountId AND "
			+ "a.company.companyId=:companyId AND a.active=:active ")
	List<BcaAccount> findByAccountIdAndActiveAndCompany(@Param("accountId")int accountId,@Param("active") int active,
			@Param("companyId")long companyId);

	Optional<BcaAccount> findByAccountIdAndCompany_CompanyId(Integer accountId, long companyId);

	List<BcaAccount> findByCompanyAndActiveAndAccountIdOrderByAcctCategoryAscNameAsc(BcaCompany company, int active,
			int accountId);

	@Query("select max(accountId) from BcaAccount ba where ba.company = :company")
	Integer findMaxAccountIdByCompany(@Param("company") BcaCompany company);

	@Modifying
	@Transactional
	@Query("update BcaAccount ba set ba.active = 0 where ba.accountId = :accountId and ba.company = :company")
	int updateBankAccount(@Param("accountId") int accountId, @Param("company") BcaCompany company);

	@Modifying
	@Transactional
	@Query("update BcaAccount ba set ba.active = 0 where ba.clientVendor.clientVendorId =:clientVendorId")
	int updateActiveByClientVendorId(@Param("clientVendorId") int clientVendorId);

	List<BcaAccount> findByParentIdNotOrderByNameAsc(int parentId);

	@Query(value = "select ba from BcaAccount ba where ba.company.companyId = :companyId and ba.acctCategory.acctCategoryId in (1,2)")
	List<BcaAccount> findAccountByIdAndAcctCategoryId(@Param("companyId") Long companyId);

	@Query("select i.adjustedTotal from BcaInvoice i , BcaTerm b where i.company.companyId = :companyId "
			+ " and i.term.termId = b.termId and i.adjustedTotal > 0 and i.isPaymentCompleted = 0 "
			+ " and i.invoiceType.invoiceTypeId in (1, 12 , 13, 17 , 19 ) and i.invoiceStatus in (0 ,5 ,3 )")
	List<Double> findAdjustedTotal(@Param("companyId") Long cId);

	@Query("select sum(bi.salePrice* bi.qty) as total from BcaIteminventory as bi,BcaCompany c where bi.company.companyId = :companyId ")
	List<Double> findSum(@Param("companyId") Long cId);

	@Query("select distinct a.accountId, a.name, a.isCategory from BcaAccount a left join a.acctCategory ac where ac.acctCategoryId = :acctCategoryId "
			+ " and a.parentId = 0 and a.active =1 order by a.name asc")
	List<BcaAccount> findAccountByAcctCategoryId(@Param("acctCategoryId") int acctCategoryId);

	@Query(value = "select a.accountId, a.name from BcaAccount a where a.parentId= :parentId and a.active=1 order by a.name asc")
	List<BcaAccount> findAccountByParentId(@Param("parentId") int parentId);

	List<BcaAccount> findByCompanyAndAcctTypeAndActiveOrderByAcctTypeAscNameAsc(BcaCompany company,
			BcaAccttype acctType, Integer active);

	List<BcaAccount> findByAcctType_acctTypeIdAndActiveAndCompany_CompanyIdAndAcctCategory_AcctCategoryId(
			Integer acctTypeId, Integer active, Long companyId, Integer acctCategoryId);

}
