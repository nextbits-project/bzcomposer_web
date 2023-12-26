package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaScheduletimes;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaScheduletimesRepository extends JpaRepository<BcaScheduletimes, Integer> {
	List<BcaScheduletimes> findByCompany_CompanyIdOrderByScheduleIdAsc(Long companyId);

}
