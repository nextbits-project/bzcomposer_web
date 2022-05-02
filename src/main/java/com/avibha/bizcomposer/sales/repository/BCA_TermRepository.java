/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_Term;

/**
 * @author Maimur
 *
 */
public interface BCA_TermRepository extends JpaRepository<BCA_Term, Integer> {

	/**
	 * @param companyId
	 * @param i
	 * @return
	 */
	ArrayList<BCA_Term> findAllByCompanyIdAndActive(int companyId, int active);

}
