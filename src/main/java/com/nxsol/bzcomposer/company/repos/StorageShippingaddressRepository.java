package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.StorageShippingaddress;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StorageShippingaddressRepository extends JpaRepository<StorageShippingaddress, Integer> {
	@Modifying
	@Transactional
	@Query("UPDATE StorageShippingaddress ba  SET ba.status =:status WHERE ba.clientVendor.clientVendorId =:clientVendorId ")
	int updateStatusByClientVendorId(@Param("status") String status, @Param("clientVendorId") Integer clientVendorId);

}
