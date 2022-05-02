/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_CCType;

/**
 * @author Maimur
 *
 */
public interface BCA_CCTypeRepository extends JpaRepository<BCA_CCType, Integer> {
	ArrayList<BCA_CCType> findAllByCompanyIdAndActive(int companyId, int active);
}
