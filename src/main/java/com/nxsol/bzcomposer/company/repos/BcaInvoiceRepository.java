package com.nxsol.bzcomposer.company.repos;

import java.util.ArrayList;
import java.util.List;

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
import com.pritesh.bizcomposer.accounting.bean.PoPayableDto;

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

	@Query(value = "SELECT INV.InvoiceID,INV.OrderNum,INV.PONum,INV.SubTotal, INV.Tax, INV.EmployeeID,INV.RefNum,INV.Memo,INV.ShipCarrierID, "
			+ "    INV.ShippingMethod, INV.SH, INV.ClientVendorID, INV.InvoiceTypeID, INV.Total, INV.AdjustedTotal, INV.PaidAmount, "
			+ "    (SELECT Sum(bca_payment.Amount) AS AB FROM bca_payment WHERE bca_payment.InvoiceID = INV.InvoiceID AND bca_payment.Deleted != 1 "
			+ "    ) AS PaidAmount12, INV.Balance,INV.IsReceived,INV.TermID,INV.IsPaymentCompleted,INV.DateConfirmed,INV.DateAdded,INV.invoiceStatus, "
			+ "    INV.PaymentTypeID,INV.CategoryID,INV.ServiceID,INV.SalesTaxID,INV.SalesRepID,INV.Taxable,INV.Shipped,INV.JobCategoryID, "
			+ "    term.Days,INV.BillingAddrID,INV.ShippingAddrID,INV.TotalCommission,INV.BankAccountID FROM bca_invoice AS INV "
			+ "LEFT JOIN bca_term AS term ON INV.TermID = term.TermID WHERE (((InvoiceTypeID) IN (2)   AND INV.termid <> 3 ) "
			+ "        OR INV.InvoiceTypeID = 11 ) AND INV.AdjustedTotal > 0 AND INV.IsPaymentCompleted = 0 AND INV.invoiceStatus = 0 "
			+ "    AND INV.CompanyID = :companyId AND INV.PONum = :poNum AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount) FROM "
			+ "   bca_payment   WHERE  bca_payment.InvoiceID = INV.InvoiceID   AND bca_payment.Deleted != 1  ) "
			+ "        OR ( SELECT Sum(bca_payment.Amount)FROM bca_payment WHERE bca_payment.InvoiceID = INV.InvoiceID "
			+ "        AND bca_payment.Deleted != 1 ) IS NULL ) ORDER BY ordernum DESC", nativeQuery = true)
	List<Object[]> findInvoiceByPONum(@Param("companyId") int companyId, @Param("poNum") int poNum);

	@Query(value = "SELECT INV.InvoiceID,INV.OrderNum,INV.PONum,INV.SubTotal, INV.Tax, INV.EmployeeID,INV.RefNum,INV.Memo,INV.ShipCarrierID, "
			+ "    INV.ShippingMethod, INV.SH, INV.ClientVendorID, INV.InvoiceTypeID, INV.Total, INV.AdjustedTotal, INV.PaidAmount, "
			+ "    (SELECT Sum(bca_payment.Amount) AS AB FROM bca_payment WHERE bca_payment.InvoiceID = INV.InvoiceID AND bca_payment.Deleted != 1 "
			+ "    ) AS PaidAmount12, INV.Balance,INV.IsReceived,INV.TermID,INV.IsPaymentCompleted,INV.DateConfirmed,INV.DateAdded,INV.invoiceStatus, "
			+ "    INV.PaymentTypeID,INV.CategoryID,INV.ServiceID,INV.SalesTaxID,INV.SalesRepID,INV.Taxable,INV.Shipped,INV.JobCategoryID, "
			+ "    term.Days,INV.BillingAddrID,INV.ShippingAddrID,INV.TotalCommission,INV.BankAccountID FROM bca_invoice AS INV "
			+ "LEFT JOIN bca_term AS term ON INV.TermID = term.TermID WHERE (((InvoiceTypeID) IN (1,12)   AND INV.termid <> 3 ) "
			+ "        OR INV.InvoiceTypeID = 18 ) AND INV.AdjustedTotal > 0 AND INV.IsPaymentCompleted = 0 AND INV.invoiceStatus = 0 "
			+ "    AND INV.CompanyID = :companyId AND INV.ordernum= = :orderNum AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount) FROM "
			+ "   bca_payment   WHERE  bca_payment.InvoiceID = INV.InvoiceID   AND bca_payment.Deleted != 1  ) "
			+ "        OR ( SELECT Sum(bca_payment.Amount)FROM bca_payment WHERE bca_payment.InvoiceID = INV.InvoiceID "
			+ "        AND bca_payment.Deleted != 1 ) IS NULL ) ORDER BY ordernum DESC", nativeQuery = true)
	List<Object[]> findInvoiceByOrderNum(@Param("companyId") int companyId, @Param("orderNum") int orderNum);
}
