package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BtSales;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BtSalesRepository extends JpaRepository<BtSales, Integer> {
}
