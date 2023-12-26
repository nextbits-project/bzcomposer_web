package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCustomerType;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaCustomerTypeRepository extends JpaRepository<BcaCustomerType, Integer> {

	List<BcaCustomerType> findByCompany_CompanyIdAndDeleted(Long companyId, Integer active);

}
