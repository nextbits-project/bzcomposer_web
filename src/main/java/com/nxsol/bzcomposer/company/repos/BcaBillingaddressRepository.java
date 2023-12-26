package com.nxsol.bzcomposer.company.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;

@Repository
public interface BcaBillingaddressRepository extends JpaRepository<BcaBillingaddress, Integer> {
	
	@Query("select bi from BcaBillingaddress bi where bi.clientVendor.clientVendorId = :clientVendorId and bi.addressId = :addressId")
BcaBillingaddress findByClientVendorIdAndAddressId(@Param("clientVendorId")Integer clientVendorId ,@Param("addressId") Integer addressId);
}

