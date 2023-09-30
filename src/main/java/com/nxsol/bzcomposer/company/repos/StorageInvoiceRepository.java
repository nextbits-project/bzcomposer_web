package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.StorageInvoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StorageInvoiceRepository extends JpaRepository<StorageInvoice, Integer> {
}
