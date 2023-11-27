package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaInvoicestyle;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaInvoicestyleRepository extends JpaRepository<BcaInvoicestyle, Integer> {
	
	List<BcaInvoicestyle> findByActive(Integer active);
	
	BcaInvoicestyle findByInvoiceStyleIdAndActive(Integer invoiceStyleId, Integer active);
}
