package com.nxsol.bzcomposer.company.repos;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.transform.ResultTransformer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaBillingstatements;
import com.pritesh.bizcomposer.accounting.bean.BillingStatementsDto;

@Repository
public interface BcaBillingstatementsRepository extends JpaRepository<BcaBillingstatements, Integer> {

	@Query(nativeQuery = true, value = "SELECT bill.statementno ,bill.statementdate,bill.clientvendorid ,bill.invoiceid,"
			+ "bill.iscombined, bill.type,bill.amount,bill.overdueamount,bill.overdueservicecharge,c.Name AS CompanyName,"
			+ "c.FirstName,c.LastName,c.Address1 AS ClientAddress,c.City AS ClientCity,c.State AS ClientState,"
			+ "c.Zipcode As ClientZipCode,c.Country As ClientCoutry,inv.ordernum,inv.Total,t.Name AS TermName,"
			+ "Comp.Name As cName,Comp.Address1 AS CompanyAddress,Comp.City AS CompanyCity,Comp.State AS CompanyState,"
			+ "Comp.Zipcode As CompanyZipCode, Comp.Country AS CompanyCountry,Comp.Phone1 AS CompanyPhoneNumber,"
			+ "Comp.Email AS CompanyEmail, cart.InventoryCode, cart.DateAdded FROM   bca_billingstatements AS bill"
			+ " LEFT JOIN bca_clientvendor AS c on bill.ClientVendorID = c.ClientVendorID"
			+ " LEFT JOIN bca_invoice AS inv ON bill.InvoiceID = inv.InvoiceID"
			+ " LEFT JOIN bca_company AS Comp ON c.CompanyID = Comp.CompanyID"
			+ " LEFT JOIN bca_term AS t ON inv.TermID = t.TermID"
			+ " LEFT JOIN bca_cart AS cart ON inv.InvoiceID = cart.InvoiceID WHERE   c.Status IN ('U','N')"
			+ " AND c.CompanyID = :companyId  AND bill.InvoiceID = :invoiceId")
	List<Object[]> findBillingStatements(@Param("companyId") Long companyId, @Param("invoiceId") int invoiceId);
	@Query(nativeQuery = true, value = "SELECT inv.ordernum,total,inv.termid,inv.memo,inv.note,inv.invoiceid,inv.serviceid,inv.invoicetypeid,"
			+ "    inv.jobcategoryid,inv.dateadded,inv.adjustedtotal,inv.paymenttypeid,inv.isemailed,inv.shipped, "
			+ "    inv.balance,inv.paidamount,inv.salesrepid,inv.billdate,inv.shippingmethod,inv.clientvendorid, "
			+ "    cv.firstname,cv.lastname,cv.NAME AS ClientName,cv.state AS ClientState,cv.address1 AS ClientAddess, "
			+ "    cv.country AS ClientCountry,cv.city AS ClientCity,cv.province,cv.zipcode AS ClientZipCode,cv.Email AS ClientEmail, "
			+ "    term.Name AS termName,cart.InventoryCode,cart.Qty,cart.UnitPrice,sRep.Name AS sName,comp.Name AS CompanyName, "
			+ "    comp.Address1 AS CompanyAddress,comp.Email AS CompanyEmail,comp.Phone1 AS CompanyPhone,comp.City AS CompanyCity, "
			+ "    comp.State As CompanyState,comp.Zipcode As CompanyZipCode,comp.Country As CompanyCountry FROM  "
			+ "    (bca_invoice AS inv LEFT JOIN bca_term AS term ON ( inv.termid = term.termid )) INNER JOIN "
			+ "    bca_clientvendor AS cv ON cv.clientvendorid = inv.clientvendorid LEFT JOIN bca_cart AS cart ON "
			+ "    inv.InvoiceID = cart.InvoiceID LEFT JOIN bca_salesrep AS sRep ON inv.SalesRepID = sRep.SalesRepID "
			+ "    LEFT JOIN bca_company AS comp ON inv.CompanyID = comp.CompanyID WHERE  inv.companyid = :companyId AND inv.InvoiceID = :invoiceId "
			+ "    AND NOT ( invoicestatus = 1 ) AND inv.ispaymentcompleted = 0 AND status = 'N' AND sRep.CompanyID= :companyId "
			+ "    AND invoicetypeid IN ( 1, 13, 17 ) ORDER  BY inv. ordernum DESC ")
	List<Object[]> findBillToPrint(@Param("companyId") Long companyId, @Param("invoiceId") int invoiceId);
	
}
 