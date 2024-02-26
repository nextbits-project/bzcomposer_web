package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaRefundlist;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaRefundlistRepository extends JpaRepository<BcaRefundlist, Integer> {
	
	List<BcaRefundlist> findByPayment_PaymentIdAndStatus(int paymentId , int status);
}
