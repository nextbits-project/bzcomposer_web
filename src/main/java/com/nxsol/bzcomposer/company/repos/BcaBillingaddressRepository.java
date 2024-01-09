package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;

@Repository
public interface BcaBillingaddressRepository extends JpaRepository<BcaBillingaddress, Integer> {

	@Query("select bi from BcaBillingaddress bi where bi.clientVendor.clientVendorId = :clientVendorId and bi.addressId = :addressId")
	BcaBillingaddress findByClientVendorIdAndAddressId(@Param("clientVendorId") Integer clientVendorId,
			@Param("addressId") Integer addressId);

	List<BcaBillingaddress> findByClientVendor(BcaClientvendor bcaClientvendor);

	@Query("select bi from BcaBillingaddress bi where bi.clientVendor.clientVendorId = :clientVendorId and bi.status = :status")
	BcaBillingaddress findByClientVendorIdAndStatus(@Param("clientVendorId") Integer clientVendorId,
			@Param("status") String status);

	@Modifying
	@Transactional
	@Query("UPDATE BcaBillingaddress ba  SET ba.status =:status WHERE ba.clientVendor.clientVendorId =:clientVendorId and ba.status IN :statusList")
	int updateStatusByClientVendorIdAndStatusIn(@Param("status") String status,
			@Param("clientVendorId") Integer clientVendorId, @Param("statusList") List<String> statusList);

	@Modifying
	@Transactional
	@Query("UPDATE BcaBillingaddress ba  SET ba.status =:status WHERE ba.clientVendor.clientVendorId =:clientVendorId")
	int updateStatusByClientVendorId(@Param("status") String status, @Param("clientVendorId") Integer clientVendorId);

	BcaBillingaddress findFirstByOrderByAddressIdDesc();

}
