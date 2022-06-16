/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_PaymentType;

/**
 * @author Maimur
 *
 */
public interface BCA_PaymentTypeRepository  extends JpaRepository<BCA_PaymentType, Integer>{
	
	List<BCA_PaymentType> findAllByCompanyIdAndActiveAndTypeCategoryOrderByPaymentTypeNameAsc(int companyId, int active, int typeCategory);
}
