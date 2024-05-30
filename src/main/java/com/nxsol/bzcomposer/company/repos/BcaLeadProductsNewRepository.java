package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLeadNew;
import com.nxsol.bzcomposer.company.domain.BcaLeadNewProducts;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadProductsNewRepository extends JpaRepository<BcaLeadNewProducts, Integer> {
	@Query("From BcaLeadNewProducts where LeadID=:lead")
	List<BcaLeadNewProducts> findByLeadId(BcaLeadNew lead);

	@Transactional
	@Modifying
	@Query("DELETE FROM BcaLeadNewProducts WHERE LeadID = :lead")
	void removeByLead(BcaLeadNew lead);
}
