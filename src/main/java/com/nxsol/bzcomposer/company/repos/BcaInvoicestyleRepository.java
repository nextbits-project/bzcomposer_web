package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaInvoicestyle;

@Repository
public interface BcaInvoicestyleRepository extends JpaRepository<BcaInvoicestyle, Integer> {

List<BcaInvoicestyle>findByActive(Integer active);
//String invStyleQuery = "select Name from bca_invoicestyle where InvoiceStyleID=? and Active=1";
BcaInvoicestyle findByActiveAndInvoiceStyleId(int active,int invoiceStyleId );
}
