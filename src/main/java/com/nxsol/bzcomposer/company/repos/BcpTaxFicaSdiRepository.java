package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpTaxFicaSdi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpTaxFicaSdiRepository extends JpaRepository<BcpTaxFicaSdi, Integer> {
}
