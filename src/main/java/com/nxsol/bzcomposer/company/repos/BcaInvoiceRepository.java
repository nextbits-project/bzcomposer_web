package com.nxsol.bzcomposer.company.repos;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.avibha.bizcomposer.accounting.forms.InvoiceDetailDto;
import com.nxsol.bzcomposer.company.domain.BcaCategory;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.BcaInvoicetype;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.nonmanaged.BcaInvoiceTermClientVendorResult;

@Repository
public interface BcaInvoiceRepository extends JpaRepository<BcaInvoice, Integer> {

	@Query(value = "Select a.InvoiceID,a.OrderNum,a.DateAdded,a.TermID,a.Total,a.Balance,b.Firstname,b.LastName,a.clientvendorId from bca_invoice as a, bca_clientvendor as b"
			+ " where a.ClientVendorId=b.ClientVendorId and b.Status in ('U','N') and b.Active=1 and a.invoicestatus in (0,2) and a.invoicetypeID in (1,7) and b.deleted=0 and a.CompanyID=?", nativeQuery = true)
	ArrayList<InvoiceDetailDto> findByCompanyIdFromInvoiceClientvendor(String compId);

	@Query(value = "SELECT a.ordernum,b.termId,b.Name,c.clientvendorId,c.Name,c.dateAdded,c.Address1,c.Address2,c.city,c.state,c.zipcode "
			+ "FROM Bca_invoice as a,bca_term as b,BCA_ClientVendor as c  WHERE c.CompanyID = 1 AND c.Status IN ('U', 'N' ) "
			+ " AND c.CVTypeID IN (1,2)  AND (c.Deleted = 0 OR c.Active = 1)  AND a.clientvendorId=c.clientvendorId  AND b.termId=c.termId AND a.clientvendorId=?", nativeQuery = true)
	List<BcaInvoiceTermClientVendorResult> findByCompaniIdStatusCvTypeIdDeletedClienetVendorIdTermId(
			String clientvendorId);

	@Query(value = "SELECT a.ordernum,a.balance,b.termId,b.Name,c.clientvendorId,c.Name,c.dateAdded,c.Address1,c.Address2,c.city,c.state,c.zipcode FROM Bca_invoice as a,bca_term as b,BCA_ClientVendor as c  WHERE c.CompanyID = 1 AND c.Status IN ('U', 'N' )  AND c.CVTypeID IN (1,2)  AND (c.Deleted = 0 OR c.Active = 1)  AND a.ClientVendorID = c.clientvendorId and b.termId = c.termId", nativeQuery = true)
	List<BcaInvoiceTermClientVendorResult> findByCompanyIdCvTypeIdDeletedActive();

	@Query(value = "Select a.InvoiceID,a.DateAdded,a.TermID,a.Total,a.Balance,b.Firstname,b.LastName,a.clientvendorId from bca_invoice as a, bca_clientvendor as b where a.ClientVendorId=b.ClientVendorId and b.Status in ('U','N') and b.Active=1 and a.invoicestatus in (0,2) and a.invoicetypeID in (1,7) and b.deleted=0 and a.OrderNum=?", nativeQuery = true)
	ArrayList<InvoiceDetailDto> findFromInvoiceClientVendor(String orderno);

	@Query(value = "Select a.InvoiceID,a.OrderNum,a.DateAdded,a.TermID,a.Total,a.Balance,b.Firstname,b.LastName,a.clientvendorId from bca_invoice as a, bca_clientvendor as b where a.ClientVendorId=b.ClientVendorId and b.Status in ('U','N') and b.Active=1 and a.invoicestatus in (0,2) and a.invoicetypeID in (1,7) and b.deleted=0 and a.CompanyID=?", nativeQuery = true)
	ArrayList findByCompanyIdFromInvoiceClientvendor2(String compId);

	List<BcaInvoice> findByInvoiceIdAndCompany(Integer invoiceId, BcaCompany company);

	@Modifying
	@Transactional
	@Query("update BcaInvoice bi set bi.invoiceStatus = :invoiceStatus , bi.memo = :memo where bi.company =:company and bi.invoiceId = :invoiceId ")
	int updateInvoiceByCompanyAndInvoice(@Param("company") BcaCompany company, @Param("invoiceId") int invoiceId,
			@Param("invoiceStatus") int invoiceStatus, @Param("memo") String memo);

	@Modifying
	@Transactional
	@Query("update BcaInvoice bi set bi.invoiceType = :invoiceType where bi.company = :company and bi.invoiceId = :invoiceId ")
	int updateInvoiceStatusForLayaway(@Param("invoiceType") BcaInvoicetype inoviceType,
			@Param("company") BcaCompany company, @Param("invoiceId") int invoiceId);

	@Modifying
	@Transactional
	@Query("update BcaInvoice bi set bi.isPaymentCompleted = :isPaymentCompleted , bi.paidAmount = :paidAmount,"
			+ " bi.balance = :balance , bi.adjustedTotal = :adjustedTotal , bi.category = :category , bi.clientVendor = :clientVendor , "
			+ " bi.billingAddrId = :billingAddrId, bi.shippingAddrId = :shippingAddrId , bi.invoiceStatus = :invoiceStatus "
			+ " where bi.invoiceId = :invoiceId and  bi.company = :company")
	int updateBcaInvoiceByInvoiceIdAndCompany(@Param("isPaymentCompleted") boolean isPaymentCompleted,
			@Param("paidAmount") double paidAmount, @Param("balance") double balance,
			@Param("adjustedTotal") double adjustedTotal, @Param("category") BcaCategory category,
			@Param("clientVendor") BcaClientvendor clientVendor, @Param("billingAddrId") int billingAddrId,
			@Param("shippingAddrId") int shippingAddrId, @Param("invoiceStatus") int invoiceStatus,
			@Param("invoiceId") int invoiceId, @Param("company") BcaCompany company);

	@Modifying
	@Transactional
	@Query("update BcaInvoice bi set bi.paymentType = :paymentType ,bi.bankAccountId = :bankAccountId ,bi.category= :category,"
			+ "bi.paidAmount = :paidAmount , bi.balance = :balance ,bi.clientVendor = :clientVendor ,bi.memo = :memo "
			+ " where bi.orderNum = :orderNum  and bi.company = :company ")
	int updateInvoiceByOrderNum(@Param("paymentType") BcaPaymenttype paymentType,
			@Param("bankAccountId") int bankAccountId, @Param("category") BcaCategory category,
			@Param("paidAmount") double paidAmount, @Param("balance") Double balance,
			@Param("clientVendor") BcaClientvendor clientVendor, @Param("memo") String memo,
			@Param("orderNum") int orderNum, @Param("company") BcaCompany company);

	@Modifying
	@Transactional
	@Query("update BcaInvoice bi set bi.paymentType = :paymentType ,bi.bankAccountId = :bankAccountId ,bi.category= :category,"
			+ "bi.paidAmount = :paidAmount , bi.balance = :balance ,bi.clientVendor = :clientVendor ,bi.memo = :memo "
			+ " where bi.invoiceId= :invoiceId  and bi.company = :company ")
	int updateInvoiceByInvoiceId(@Param("paymentType") BcaPaymenttype paymentType,
			@Param("bankAccountId") int bankAccountId, @Param("category") BcaCategory category,
			@Param("paidAmount") double paidAmount, @Param("balance") Double balance,
			@Param("clientVendor") BcaClientvendor clientVendor, @Param("memo") String memo,
			@Param("invoiceId") int invoiceId, @Param("company") BcaCompany company);

	@Modifying
	@Transactional
	@Query("update BcaInvoice bi set bi.paymentType = :paymentType ,bi.bankAccountId = :bankAccountId ,bi.category= :category,"
			+ "bi.paidAmount = :paidAmount , bi.balance = :balance ,bi.clientVendor = :clientVendor ,bi.memo = :memo "
			+ " where bi.ponum= :ponum  and bi.company = :company ")
	int updateInvoiceByPonum(@Param("paymentType") BcaPaymenttype paymentType,
			@Param("bankAccountId") int bankAccountId, @Param("category") BcaCategory category,
			@Param("paidAmount") double paidAmount, @Param("balance") Double balance,
			@Param("clientVendor") BcaClientvendor clientVendor, @Param("memo") String memo, @Param("ponum") int ponum,
			@Param("company") BcaCompany company);

	@Query(nativeQuery = true, value = "SELECT  INV.invoiceID, INV.PONum, INV.clientVendorID, INV.companyID, INV.invoiceTypeID, "
			+ "       INV.adjustedTotal, INV.paidAmount, INV.bankAccountId, "
			+ "       (SELECT SUM(bcaPayment.amount) FROM bca_payment bcaPayment "
			+ "        WHERE bcaPayment.invoiceID = INV.invoiceID AND bcaPayment.deleted <> 1) AS paidAmount12, "
			+ "       INV.balance, INV.termID, INV.paymentTypeID, INV.isPaymentCompleted, "
			+ "       INV.dateAdded AS dateAdded, INV.categoryId, INV.memo, "
			+ "       PAY.name AS paymentTypeName, Bank.name AS accountName, "
			+ "       Category.name AS categoryName, Category.cateNumber, "
			+ "       clientVendor.name AS companyName, clientVendor.firstName, clientVendor.lastName "
			+ "FROM bca_invoice INV "
			+ "INNER JOIN bca_clientvendor clientVendor ON INV.clientVendorID = clientVendor.clientVendorID "
			+ "LEFT JOIN bca_paymenttype PAY ON INV.paymentTypeID = PAY.paymentTypeID "
			+ "LEFT JOIN bca_account Bank ON INV.bankAccountID = Bank.accountID "
			+ "LEFT JOIN bca_category Category ON INV.categoryID = Category.categoryID "
			+ "WHERE INV.companyID = :companyId  " + "      AND INV.isPaymentCompleted = 0 "
			+ "      AND INV.invoiceStatus = 0 " + "      AND INV.invoiceTypeID = 2 "
			+ "      AND clientVendor.status = 'N' " + "      AND clientVendor.companyID = :companyId "
			+ "      AND (INV.adjustedTotal > (SELECT SUM(bcaPayment.amount) FROM bca_payment bcaPayment "
			+ "                                WHERE bcaPayment.invoiceID = INV.invoiceID AND bcaPayment.deleted <> 1) "
			+ "           OR (SELECT SUM(bcaPayment.amount) FROM bca_payment bcaPayment "
			+ "               WHERE bcaPayment.invoiceID = INV.invoiceID AND bcaPayment.deleted <> 1) IS NULL) "
			+ "ORDER BY INV.PONum DESC ")
	List<Object[]> findPoPayableList(@Param("companyId") int companyId);

	@Query(value = " select i.invoiceId, i.orderNum, i.ponum , i.subTotal , i.tax, i.employeeId ,i.refNum, "
			+ "i.memo ,i.shipCarrier.shipCarrierId, i.shippingMethod,i.sh , i.clientVendor.clientVendorId,"
			+ " i.invoiceType.invoiceTypeId, i.total, i.adjustedTotal ,i.paidAmount , "
			+ "(select sum(bp.amount) as ab from BcaPayment bp  where bp.invoice.invoiceId = i.invoiceId"
			+ " and bp.deleted !=1 ) as PaidAmount12,i.balance, i.isReceived, i.term.termId, i.isPaymentCompleted ,"
			+ " i.dateConfirmed , i.dateAdded , i.invoiceStatus, i.paymentType.paymentTypeId,i.category.categoryId ,"
			+ " i.serviceId, i.salesTax.salesTaxId, i.salesRepId , i.taxable, i.shipped , i.jobCategoryId,t.days ,"
			+ "i.billingAddrId , i.shippingAddrId,i.totalCommission , i.bankAccountId "
			+ "from BcaInvoice i left join BcaTerm t on i.term.termId =t.termId where "
			+ "((( i.invoiceType.invoiceTypeId) in (2 ) and i.term.termId<>3) or i.invoiceType.invoiceTypeId =11 ) "
			+ "and i.adjustedTotal > 0 and i.isPaymentCompleted =0 and i.invoiceStatus = 0 and i.company.companyId = :companyId "
			+ " and i.ponum= :ponum "
			+ "and (i.adjustedTotal>(select sum(bp.amount) from BcaPayment bp where  bp.invoice.invoiceId=i.invoiceId "
			+ "and bp.deleted !=1 ) or (select sum(bp.amount) from BcaPayment bp where bp.invoice.invoiceId = i.invoiceId "
			+ "and bp.deleted !=1 ) is null) order by orderNum desc")
	List<Object[]> findInvoiceByPONum(@Param("companyId") int companyId, @Param("ponum") int poNum);

	@Query(value = " select i.invoiceId, i.orderNum, i.ponum , i.subTotal , i.tax, i.employeeId ,i.refNum, "
			+ "i.memo ,i.shipCarrier.shipCarrierId, i.shippingMethod,i.sh , i.clientVendor.clientVendorId,"
			+ " i.invoiceType.invoiceTypeId, i.total, i.adjustedTotal ,i.paidAmount , "
			+ "(select sum(bp.amount) as ab from BcaPayment bp  where bp.invoice.invoiceId = i.invoiceId"
			+ " and bp.deleted !=1 ) as PaidAmount12,i.balance, i.isReceived, i.term.termId, i.isPaymentCompleted ,"
			+ " i.dateConfirmed , i.dateAdded , i.invoiceStatus, i.paymentType.paymentTypeId,i.category.categoryId ,"
			+ " i.serviceId, i.salesTax.salesTaxId, i.salesRepId , i.taxable, i.shipped , i.jobCategoryId,t.days ,"
			+ "i.billingAddrId , i.shippingAddrId,i.totalCommission , i.bankAccountId "
			+ "from BcaInvoice i left join BcaTerm t on i.term.termId =t.termId where "
			+ "((( i.invoiceType.invoiceTypeId) in (1,12 ) and i.term.termId<>3) or i.invoiceType.invoiceTypeId =18 ) "
			+ "and i.adjustedTotal > 0 and i.isPaymentCompleted =0 and i.invoiceStatus = 0 and i.company.companyId = :companyId "
			+ " and i.orderNum= :orderNum "
			+ "and (i.adjustedTotal>(select sum(bp.amount) from BcaPayment bp where  bp.invoice.invoiceId=i.invoiceId "
			+ "and bp.deleted !=1 ) or (select sum(bp.amount) from BcaPayment bp where bp.invoice.invoiceId = i.invoiceId "
			+ "and bp.deleted !=1 ) is null) order by orderNum desc")
	List<Object[]> findInvoiceByOrderNum(@Param("companyId") int companyId, @Param("orderNum") int orderNum);

	@Query(value = " select i.invoiceId, i.orderNum, i.ponum , i.subTotal , i.tax, i.employeeId ,i.refNum, "
			+ "i.memo ,i.shipCarrier.shipCarrierId, i.shippingMethod,i.sh , i.clientVendor.clientVendorId,"
			+ " i.invoiceType.invoiceTypeId, i.total, i.adjustedTotal ,i.paidAmount , "
			+ "(select sum(bp.amount) as ab from BcaPayment bp  where bp.invoice.invoiceId = i.invoiceId"
			+ " and bp.deleted !=1 ) as PaidAmount12,i.balance, i.isReceived, i.term.termId, i.isPaymentCompleted ,"
			+ " i.dateConfirmed , i.dateAdded , i.invoiceStatus, i.paymentType.paymentTypeId,i.category.categoryId ,"
			+ " i.serviceId, i.salesTax.salesTaxId, i.salesRepId , i.taxable, i.shipped , i.jobCategoryId,t.days ,"
			+ "i.billingAddrId , i.shippingAddrId,i.totalCommission , i.bankAccountId "
			+ "from BcaInvoice i left join BcaTerm t on i.term.termId =t.termId where "
			+ "((( i.invoiceType.invoiceTypeId) in (1,12 ) and i.term.termId<>3) or i.invoiceType.invoiceTypeId =11 ) "
			+ "and i.adjustedTotal > 0 and i.isPaymentCompleted =0 and i.invoiceStatus = 0 and i.company.companyId = :companyId "
			+ "and (i.adjustedTotal>(select sum(bp.amount) from BcaPayment bp where  bp.invoice.invoiceId=i.invoiceId "
			+ "and bp.deleted !=1 ) or (select sum(bp.amount) from BcaPayment bp where bp.invoice.invoiceId = i.invoiceId "
			+ "and bp.deleted !=1 ) is null) order by orderNum desc")
	List<Object[]> findRecievableList(@Param("companyId") Long companyId);
	
	
//	String sqlString = "select i.InvoiceID, i.OrderNum, date_format(i.dateadded,'%m-%d-%Y') as DateAdded, i.Total, i.Balance, i.Shipped, i.IsEmailed, it.Name,i.ClientVendorID "
//			+" FROM bca_invoice as i INNER JOIN bca_invoicetype as it on i.InvoiceTypeID = it.InvoiceTypeID "
//			+" WHERE "+cvIdCase+" i.InvoiceTypeID IN(1,7,10) ";
	@Query(value="select i 	from BcaInvoice i inner join BcaInvoicetype it on i.invoiceType.invoiceTypeId = it.invoiceTypeId")
	List<BcaInvoice> findInvoiceBySearchHistory();
	
	
	
	@Query(value="select bi.orderNum from BcaInvoice bi left join bi.company c where c.companyId= :companyId and bi.invoiceStatus in :invoiceStatus order by orderNume desc   ")
	List<Integer> findOrderNumByCompanyIdAndInvoiceStatus(@Param("companyId") Long companyId , @Param("invoiceStatus") List<Integer> invoiceStatus);
    
}
