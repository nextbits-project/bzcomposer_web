package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLeadCategory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadCategoryRepository extends JpaRepository<BcaLeadCategory, Integer> {

	List<BcaLeadCategory> findByCompany_CompanyIdAndActive(Long companyId, boolean active);

}
