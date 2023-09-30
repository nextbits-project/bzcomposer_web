package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmdGatewaydetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmdGatewaydetailsRepository extends JpaRepository<SmdGatewaydetails, Integer> {
}
