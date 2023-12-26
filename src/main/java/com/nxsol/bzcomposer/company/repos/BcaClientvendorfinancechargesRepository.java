package com.nxsol.bzcomposer.company.repos;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaClientvendorfinancecharges;

@Repository
public interface BcaClientvendorfinancechargesRepository extends JpaRepository<BcaClientvendorfinancecharges, Long> {

	@Modifying
	@Transactional
	@Query("delete from BcaClientvendorfinancecharges bcvf where bcvf.clientVendor.clientVendorId =:clientVendorId")
	void deleteByClientVendorId(@Param("clientVendorId") Integer clientVendorId);
}
