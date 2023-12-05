package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaShippingrate;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaShippingrateRepository extends JpaRepository<BcaShippingrate, Integer> {
	List<BcaShippingrate> findByShipCarrier_ShipCarrierId(int shipCarrierId);
}
