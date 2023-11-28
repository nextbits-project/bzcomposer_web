package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaShipcarrierRepository extends JpaRepository<BcaShipcarrier, Integer> {
	List<BcaShipcarrier> findByCompany_CompanyIdAndActive(Long companyId, Integer active);

}
