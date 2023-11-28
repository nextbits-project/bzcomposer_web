package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaPaymenttypeRepository extends JpaRepository<BcaPaymenttype, Integer> {
	List<BcaPaymenttype> findByCompany_CompanyIdAndActiveAndTypeCategory(Long companyId, Integer active,
			Integer typeCategory);

}
