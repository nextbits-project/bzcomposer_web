package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaInvoiceshipdetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaInvoiceshipdetailRepository extends JpaRepository<BcaInvoiceshipdetail, Integer> {
}
