/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_ReceivedType;

/**
 * @author Maimur
 *
 */
public interface BCA_ReceivedTypeRepository extends JpaRepository<BCA_ReceivedType, Integer> {
	ArrayList<BCA_ReceivedType> findAllByCompanyIdAndActiveAndTypeCategoryOrderByPaymentTypeNameAsc(int companyId,int active,int typeCategory);
}
