/**
 * 
 */
package com.avibha.bizcomposer.sales.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.avibha.bizcomposer.sales.dao.BCA_Title;

/**
 * @author Maimur
 *
 */
public interface BCA_TitleRepository extends JpaRepository<BCA_Title, Integer>  {

	List<BCA_Title> findAllByCompanyIdAndActive(Integer companyid,Integer active);
}
