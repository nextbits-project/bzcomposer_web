package com.nxsol.bzcomposer.company.repos;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;

@Repository
public interface BcaShippingaddressRepository extends JpaRepository<BcaShippingaddress, Integer> {

	List<BcaShippingaddress> findDistinctByStatusLikeOrStatusLikeAndActiveAndIsDefault(String status1, String status2,
			Integer active, Integer isDefault);

	@Query("select bi from BcaShippingaddress  bi where bi.clientVendor.clientVendorId = :clientVendorId and bi.addressId = :addressId")
	BcaShippingaddress findByClientVendorIdAndAddressId(@Param("clientVendorId") Integer clientVendorId,
			@Param("addressId") Integer addressId);

	List<BcaShippingaddress> findByClientVendor(BcaClientvendor bcaClientvendor);

	Optional <BcaShippingaddress> findByClientVendorAndIsDefaultAndActive(BcaClientvendor bcaClientvendor, int isDefault, int active);
	
	// BcaShippingaddress
	// findByClientVendorIdAndAddressId(@Param("clientVendorId")Integer
	// clientVendorId ,@Param("addressId") Integer addressId);

	@Query("select bi from BcaShippingaddress  bi where bi.clientVendor.clientVendorId = :clientVendorId and bi.status = :status")
	BcaShippingaddress findByClientVendorIdAndStatus(@Param("clientVendorId") int cvId, @Param("status") String string);
	
	@Query("select bi from BcaShippingaddress  bi where bi.clientVendor.clientVendorId = :clientVendorId and bi.status in :statusIn")
	BcaShippingaddress findByClientVendorIdAndStatusIn(@Param("clientVendorId") int cvId, @Param("statusIn") List<String> statusIn);

	@Modifying
	@Transactional
	@Query("UPDATE BcaShippingaddress ba  SET ba.status =:status WHERE ba.clientVendor.clientVendorId =:clientVendorId and ba.status IN :statusList")
	int updateStatusByClientVendorIdAndStatusIn(@Param("status") String status,
			@Param("clientVendorId") Integer clientVendorId, @Param("statusList") List<String> statusList);

	@Modifying
	@Transactional
	@Query("UPDATE BcaShippingaddress ba  SET ba.status =:status WHERE ba.clientVendor.clientVendorId =:clientVendorId ")
	int updateStatusByClientVendorId(@Param("status") String status, @Param("clientVendorId") Integer clientVendorId);

	BcaShippingaddress findFirstByOrderByAddressIdDesc();

	@Query("From BcaShippingaddress Where clientVendor=:clientVendor")
	BcaShippingaddress findByClintvendorId(BcaClientvendor clientVendor);
}
