package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaBsaddress;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaBsaddressRepository extends JpaRepository<BcaBsaddress, Integer> {

	
	
	
	Optional<BcaBsaddress> findByClientVendorIdLikeAndAddressTypeLikeAndStatusIn(Integer clientVendorId, String addressType , List<String> status);
	@Query("SELECT MAX(bs.bsaddressId) FROM BcaBsaddress bs")
    int findLastBsAddressId();

	List<BcaBsaddress> findByClientVendorId(Integer clientVendorId);
	
	
	@Modifying
	@Transactional
	@Query("update BcaBsaddress bs set bs.status = '0' where bs.clientVendorId = :clientVendorId ")
	int updateStatusByClientVendorId(@Param("clientVendorId")Integer clientVendorId);
}
