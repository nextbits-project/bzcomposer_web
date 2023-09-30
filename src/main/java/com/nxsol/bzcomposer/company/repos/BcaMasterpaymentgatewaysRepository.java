package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMasterpaymentgateways;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMasterpaymentgatewaysRepository extends JpaRepository<BcaMasterpaymentgateways, Integer> {
}
