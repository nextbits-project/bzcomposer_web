package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
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
}
