package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaLead;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadRepository extends JpaRepository<BcaLead, Integer> {
	@Query("From BcaLead Where leadId=:leadId")
	Optional<BcaLead> findByLeadId(int leadId);

	@Query("From BcaLead Where clientVendor=:clientVendorId")
	BcaLead findByClientvendorId(BcaClientvendor clientVendorId);
}
