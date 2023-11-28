package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLeadSource;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadSourceRepository extends JpaRepository<BcaLeadSource, Integer> {

	List<BcaLeadSource> findByCompany_CompanyIdAndActive(Long companyId, boolean active);

}
