package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmcOrders;
import org.springframework.data.jpa.repository.JpaRepository;


public interface SmcOrdersRepository extends JpaRepository<SmcOrders, String> {
}
