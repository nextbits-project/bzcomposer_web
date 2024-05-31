package com.nxsol.bzcomposer.company.repos;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaPreferenceHubs;

@Repository
public interface BcaPreferenceHubsRepository extends JpaRepository<BcaPreferenceHubs, Integer> {
	Optional<BcaPreferenceHubs> findByCompany_CompanyId(Long companyId);
	Optional<BcaPreferenceHubs> findByCompany(BcaCompany company);
	Optional<BcaPreferenceHubs> findByCompany_CompanyIdAndActive(Long companyId, Integer active);
}
