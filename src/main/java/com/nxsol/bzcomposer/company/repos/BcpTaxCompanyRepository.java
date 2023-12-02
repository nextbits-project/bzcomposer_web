package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpTaxCompany;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpTaxCompanyRepository extends JpaRepository<BcpTaxCompany, Integer> {
    List<BcpTaxCompany> findByCompany_CompanyIdAndActive(Long companyId, Integer activeStatus);

}
