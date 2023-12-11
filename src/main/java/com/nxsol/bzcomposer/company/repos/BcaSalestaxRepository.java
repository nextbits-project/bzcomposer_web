package com.nxsol.bzcomposer.company.repos;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaSalestax;

@Repository
public interface BcaSalestaxRepository extends JpaRepository<BcaSalestax, Integer> {

	List<BcaSalestax> findByCompany_CompanyIdAndActive(Long companyId, Integer active);
    List<BcaSalestax> findByCompanyAndActive(BcaCompany company, Integer active);

}
