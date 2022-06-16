/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_UnitOfMeasure;

/**
 * @author Maimur
 *
 */
public interface BCA_UnitOfMeasureRepository extends JpaRepository<BCA_UnitOfMeasure, Integer>  {

	ArrayList<BCA_UnitOfMeasure> findAllByCompanyIdAndActive(Integer companyid,Integer active);
}
