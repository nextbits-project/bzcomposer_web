package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaPayment;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BcaPaymentRepository extends JpaRepository<BcaPayment, Integer> {
}
