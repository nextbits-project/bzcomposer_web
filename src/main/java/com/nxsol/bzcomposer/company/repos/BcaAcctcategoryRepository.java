package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaAcctcategory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaAcctcategoryRepository extends JpaRepository<BcaAcctcategory, Integer> {
	// Custom query method to find BcaAcctcategory entities by company ID
    List<BcaAcctcategory> findByCompanyCompanyId(Long companyId);

    // Custom query method to find BcaAcctcategory entities by company ID and active status
    List<BcaAcctcategory> findByCompanyCompanyIdAndActive(Long companyId, Boolean active);
}
