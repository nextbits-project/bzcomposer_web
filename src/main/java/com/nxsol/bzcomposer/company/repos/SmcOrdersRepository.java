package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.SmcOrders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SmcOrdersRepository extends JpaRepository<SmcOrders, String> {
}
