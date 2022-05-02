/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_Message;

/**
 * @author Maimur
 *
 */
public interface BCA_MessageRepository extends JpaRepository<BCA_Message, Integer> {

	public ArrayList<BCA_Message> findAllByCompanyIdAndActive(int companyId, int active);
}
