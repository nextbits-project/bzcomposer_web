package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLeadSource;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadSourceRepository extends JpaRepository<BcaLeadSource, Integer> {

	List<BcaLeadSource> findByCompany_CompanyIdAndActive(Long companyId, boolean active);

	@Query("FROM BcaLeadSource Where CompanyID =:cid")
	List<BcaLeadSource> getLeadSource(String cid);

	@Query("FROM BcaLeadSource Where leadSourceId =:id")
	Optional<BcaLeadSource> getLeadById(int id);
}
