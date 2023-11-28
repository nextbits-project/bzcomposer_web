package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaAccountable;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaAccountableRepository extends JpaRepository<BcaAccountable, Integer> {

void deleteByInvoice(BcaInvoice invoice);
}
