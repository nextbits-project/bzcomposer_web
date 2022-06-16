/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_SalesRep;

/**
 * @author Maimur
 *
 */

public interface BCA_SalesRepRepository extends JpaRepository<BCA_SalesRep, Integer>{

	List<BCA_SalesRep> findAllByCompanyIdAndActive(Integer companyid,Integer active);
}
