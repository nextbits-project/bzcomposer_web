package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLead;
import com.nxsol.bzcomposer.company.domain.BcaLeadProducts;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadProductsRepository extends JpaRepository<BcaLeadProducts, Integer> {
	@Query("From BcaLeadProducts where lead=:lead")
	List<BcaLeadProducts> findByLeadId(BcaLead lead);

	@Transactional
	@Modifying
	@Query("DELETE FROM BcaLeadProducts WHERE lead = :lead")
	void removeByLead(BcaLead lead);
}
