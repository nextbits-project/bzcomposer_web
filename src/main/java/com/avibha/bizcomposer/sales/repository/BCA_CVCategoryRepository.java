/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.avibha.bizcomposer.sales.dao.BCA_CVCategory;

/**
 * @author Maimur
 *
 */

public interface BCA_CVCategoryRepository extends JpaRepository<BCA_CVCategory, Integer> {
	
	@Query(value ="Select CVCategoryID,CompanyID,Name,Active from bca_cvcategory where companyid=?1 and active=?2 order by Name", nativeQuery=true)
	public ArrayList<BCA_CVCategory> findAllByCompanyIdAndActiveOrderByCvCategoryNameAsc(int companyId, int active);
}
