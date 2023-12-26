package com.nxsol.bzcomposer.company.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaRmamaster;

@Repository
public interface BcaRmamasterRepository extends JpaRepository<BcaRmamaster, Integer> {

	@Query(value = "select sum(item.total) as refundTotal from BcaRmamaster as master inner join "
			+ " BcaRmaitem as item on item.rmaNo = master.rmaNo where master.company.companyId = :companyId "
			+ " and master.clientVendor.clientVendorId = :cvId  ")
	Double calculateRefundBalance(@Param("cvId") Integer clientVendorId, @Param("companyId") Long companyId);
}
