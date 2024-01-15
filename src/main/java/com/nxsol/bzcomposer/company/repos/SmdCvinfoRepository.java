package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.SmdCvinfo;

@Repository
public interface SmdCvinfoRepository extends JpaRepository<SmdCvinfo, Integer> {

	
	@Query("select sm from SmdCvinfo sm where sm.clientVendor.clientVendorId =:clientVendorId")
	List<SmdCvinfo> findByClientVendor_ClientVendorId(@Param("clientVendorId")int clientVendorId);
}
