/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_Location;

/**
 * @author Maimur
 *
 */
public interface BCA_LocationRepository extends JpaRepository<BCA_Location, Integer>{

	ArrayList<BCA_Location> findAllByCompanyIdAndActive(int companyId, int active);
}
