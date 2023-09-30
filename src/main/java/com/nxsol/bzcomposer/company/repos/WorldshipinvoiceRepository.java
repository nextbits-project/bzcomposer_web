package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.Worldshipinvoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorldshipinvoiceRepository extends JpaRepository<Worldshipinvoice, String> {
}
