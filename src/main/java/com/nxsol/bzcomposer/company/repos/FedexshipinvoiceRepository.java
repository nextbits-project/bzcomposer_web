package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.Fedexshipinvoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FedexshipinvoiceRepository extends JpaRepository<Fedexshipinvoice, Integer> {
}
