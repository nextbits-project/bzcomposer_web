package com.nxsol.bzcomposer.company.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaPreference;

@Repository
public interface BcaPreferenceRepository extends JpaRepository<BcaPreference, Integer> {
	BcaPreference findByCompany_CompanyId(Long companyId);
	
	
	@Query("select bp.invoiceStyle.invoiceStyleId from BcaPreference bp where bp.company.companyId = :companyId")
	Integer findInvoiceStyleIDByCompanyId(@Param("companyId")Long companyID);
	
	@Query("select bp  from BcaPreference as bp where bp.company.companyId = :companyId and bp.active = :active")
	BcaPreference findByCompanyIdAndActive(@Param("companyId")Long companyId,@Param("active")Integer active);
}
