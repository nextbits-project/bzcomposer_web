package com.nxsol.bzcomposer.company.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaClientvendorservice;

@Repository
public interface BcaClientvendorserviceRepository extends JpaRepository<BcaClientvendorservice, Long> {


	@Query("select bc from BcaClientvendorservice bc  where bc.company.companyId= :companyId and bc.clientVendor.clientVendorId = :clientVendorId ")
	List<BcaClientvendorservice> findByCompanyIdAndClientVendorId(@Param("companyId") Long companyId,
			@Param("clientVendorId") Integer clientVendorId);

	void deleteByClientVendor_ClientVendorId(int clientVendorId);

	List<BcaClientvendorservice> findByClientVendor_ClientVendorId(Integer clientVendorId);
	
//    List<BcaClientvendorservice> findByCompany_CompanyIdAndClientVendor_ClientVendorId(Long companyId, int clientVendorId);

    @Query(value = "SELECT * FROM bca_clientvendorservice WHERE CompanyID = ?1 AND ClientVendorID = ?2", nativeQuery = true)
    List<BcaClientvendorservice> findByCompanyAndClientVendor(Long companyId, int clientVendorId);

}
