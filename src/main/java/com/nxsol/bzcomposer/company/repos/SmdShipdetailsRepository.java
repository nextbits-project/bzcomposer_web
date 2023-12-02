package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmdShipdetails;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmdShipdetailsRepository extends JpaRepository<SmdShipdetails, String> {
    List<SmdShipdetails> findByCompany_CompanyIdAndShippType(Long companyId, String shippType);


}
