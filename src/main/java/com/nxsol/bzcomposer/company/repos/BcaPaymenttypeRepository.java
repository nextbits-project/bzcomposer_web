package com.nxsol.bzcomposer.company.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;

@Repository
public interface BcaPaymenttypeRepository extends JpaRepository<BcaPaymenttype, Integer> {

	List<BcaPaymenttype> findByCompany_CompanyIdAndActiveAndTypeCategory(Long companyId, Integer active,
			Integer typeCategory);

	List<BcaPaymenttype> findByCompany_CompanyIdAndActiveAndTypeCategoryOrderByName(Long companyId, Integer active,
			Integer typeCategory);

	List<BcaPaymenttype> findByCompany_CompanyIdAndActiveAndTypeCategoryOrderByType(Long companyId, Integer active,
			Integer typeCategory);
	@Cacheable(value = "allPaymentList",key="#companyId")
	List<BcaPaymenttype> findByCompany_CompanyId(long companyId);
	
	Optional<BcaPaymenttype> findByCompany_CompanyIdAndPaymentTypeId(long companyId,int paymentTypeId);
	
	List<BcaPaymenttype> findByCompanyAndActiveAndTypeCategoryOrderByName(BcaCompany company, Integer active,
			Integer typeCategory);
	
	@Cacheable(value="onlySimplePaymentTypes",key="#companyID")
	@Query(nativeQuery = true, value = "select PaymentTypeID,Name,Type,BankAcctID,TypeCategory from bca_paymenttype "
			+ " where CCTypeID = -1  and Active = 1 and TypeCategory = 0 and CompanyID = :companyID")
	List<Object[]> findOnlySimplePaymentTypes(@Param("companyID") Long companyID);

	@Modifying
	@Transactional
	@Query("update BcaPaymenttype bpt set bpt.bankAcctId =0 , bpt.active = 0 where bpt.bankAcctId = :bankAcctId and bpt.company = :company ")
	int updateBankPaymenttype(@Param("bankAcctId") int bankAcctId, @Param("company") BcaCompany company);

	List<BcaPaymenttype> findByPaymentTypeIdAndCompanyAndActiveAndTypeCategory(Integer paymentTypeId,
			BcaCompany company, Integer active, Integer typeCategory);

	List<BcaPaymenttype> findByCompany_CompanyIdAndActive(Long companyId, Integer active);

	// List<BcaPaymenttype> findByActiveTrueAndTypeCategoryAndCompany_Id(int
	// typeCategory, Long companyId);

}
