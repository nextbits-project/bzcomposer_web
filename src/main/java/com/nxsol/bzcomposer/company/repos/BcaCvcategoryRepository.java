package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCvcategory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaCvcategoryRepository extends JpaRepository<BcaCvcategory, Integer> {
	
	 List<BcaCvcategory> findByCompany_CompanyIdAndActive(Long companyId, Integer active);
}
