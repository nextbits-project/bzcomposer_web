/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_SalesTax;

/**
 * @author Maimur
 *
 */
public interface BCA_SalesTaxRepository extends JpaRepository<BCA_SalesTax, Integer> {
	
	public ArrayList<BCA_SalesTax> findAllByCompanyIdAndActive(int companyId, int active);

}
