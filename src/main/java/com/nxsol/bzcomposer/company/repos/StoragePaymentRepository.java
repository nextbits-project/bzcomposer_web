package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.StoragePayment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StoragePaymentRepository extends JpaRepository<StoragePayment, Integer> {
}
