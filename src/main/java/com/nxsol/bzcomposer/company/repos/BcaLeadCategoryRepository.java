package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLeadCategory;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadCategoryRepository extends JpaRepository<BcaLeadCategory, Integer> {

	List<BcaLeadCategory> findByCompany_CompanyIdAndActive(Long companyId, boolean active);

	@Query("FROM BcaLeadCategory Where CompanyID =:cid")
	List<BcaLeadCategory> getLeadCategory(String cid);

	@Query("FROM BcaLeadCategory Where leadCategoryId =:id")
	Optional<BcaLeadCategory> getLeadCategoryById(int id);

}
