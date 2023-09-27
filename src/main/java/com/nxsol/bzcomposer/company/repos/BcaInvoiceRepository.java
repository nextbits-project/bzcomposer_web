package com.nxsol.bzcomposer.company.repos;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.avibha.bizcomposer.accounting.forms.InvoiceDetailDto;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.nonmanaged.BcaInvoiceTermClientVendorResult;
import com.nxsol.bzcomposer.company.domain.nonmanaged.InvoiceClientVendorResult;


public interface BcaInvoiceRepository extends JpaRepository<BcaInvoice, Integer> {

	
	@Query( value = "Select a.InvoiceID,a.OrderNum,a.DateAdded,a.TermID,a.Total,a.Balance,b.Firstname,b.LastName,a.clientvendorId from bca_invoice as a, bca_clientvendor as b"
			+ " where a.ClientVendorId=b.ClientVendorId and b.Status in ('U','N') and b.Active=1 and a.invoicestatus in (0,2) and a.invoicetypeID in (1,7) and b.deleted=0 and a.CompanyID=?", nativeQuery  = true)
	ArrayList<InvoiceDetailDto> findByCompanyIdFromInvoiceClientvendor(String compId);

	@Query( value = "SELECT a.ordernum,b.termId,b.Name,c.clientvendorId,c.Name,c.dateAdded,c.Address1,c.Address2,c.city,c.state,c.zipcode " +
    "FROM Bca_invoice as a,bca_term as b,BCA_ClientVendor as c  WHERE c.CompanyID = 1 AND c.Status IN ('U', 'N' ) " +
    " AND c.CVTypeID IN (1,2)  AND (c.Deleted = 0 OR c.Active = 1)  AND a.clientvendorId=c.clientvendorId  AND b.termId=c.termId AND a.clientvendorId=?" , nativeQuery  = true)
	List<BcaInvoiceTermClientVendorResult> findByCompaniIdStatusCvTypeIdDeletedClienetVendorIdTermId(String clientvendorId);
	@Query( value = "SELECT a.ordernum,a.balance,b.termId,b.Name,c.clientvendorId,c.Name,c.dateAdded,c.Address1,c.Address2,c.city,c.state,c.zipcode FROM Bca_invoice as a,bca_term as b,BCA_ClientVendor as c  WHERE c.CompanyID = 1 AND c.Status IN ('U', 'N' )  AND c.CVTypeID IN (1,2)  AND (c.Deleted = 0 OR c.Active = 1)  AND a.ClientVendorID = c.clientvendorId and b.termId = c.termId"
			, nativeQuery = true )
	List<BcaInvoiceTermClientVendorResult> findByCompanyIdCvTypeIdDeletedActive();

	@Query( value =  "Select a.InvoiceID,a.DateAdded,a.TermID,a.Total,a.Balance,b.Firstname,b.LastName,a.clientvendorId from bca_invoice as a, bca_clientvendor as b where a.ClientVendorId=b.ClientVendorId and b.Status in ('U','N') and b.Active=1 and a.invoicestatus in (0,2) and a.invoicetypeID in (1,7) and b.deleted=0 and a.OrderNum=?", nativeQuery = true )
	ArrayList<InvoiceDetailDto> findFromInvoiceClientVendor(String orderno);
	
	@Query( value =  "Select a.InvoiceID,a.OrderNum,a.DateAdded,a.TermID,a.Total,a.Balance,b.Firstname,b.LastName,a.clientvendorId from bca_invoice as a, bca_clientvendor as b where a.ClientVendorId=b.ClientVendorId and b.Status in ('U','N') and b.Active=1 and a.invoicestatus in (0,2) and a.invoicetypeID in (1,7) and b.deleted=0 and a.CompanyID=?", nativeQuery = true)
	ArrayList findByCompanyIdFromInvoiceClientvendor2(String compId);
}
