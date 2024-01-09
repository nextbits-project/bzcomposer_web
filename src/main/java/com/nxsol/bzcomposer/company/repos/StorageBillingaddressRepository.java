package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.StorageBillingaddress;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface StorageBillingaddressRepository extends JpaRepository<StorageBillingaddress, Integer> {
	
	@Modifying
	@Transactional 
	@Query("UPDATE StorageBillingaddress ba  SET ba.status =:status WHERE ba.clientVendor.clientVendorId =:clientVendorId ")
	int updateStatusByClientVendorId(@Param("status")String status, @Param("clientVendorId")Integer clientVendorId);
	
}
