/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bzcomposer.configuration.module.form.shipping.BCA_ShipCarrier;

/**
 * @author Maimur
 *
 */
public interface BCA_ShipCarrierRepository extends JpaRepository<BCA_ShipCarrier, Integer> {

	ArrayList<BCA_ShipCarrier> findAllByCompanyIdAndActive(int companyId, int active);
}
