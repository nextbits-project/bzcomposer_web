package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaRecurrentpayment;

@Repository
public interface BcaRecurrentpaymentRepository extends JpaRepository<BcaRecurrentpayment, Long> {
//	Sql.append("SELECT payment.ServiceID," + " payment.PayeeID," + " payment.PaymentDate," + " payment.PayerID,"
//			+ " payment.Memo," + " payment.CheckNumber," + " payment.Amount," + " payment.IsToBePrinted,"
//			+ " payment.PaymentTypeID," + " payment.PaymentID," + " ClientV.Name AS CompanyName,"
//			+ " ClientV.FirstName," + " ClientV.LastName," + " Account.Name AS AccountName"
//			+ " FROM bca_recurrentpayment AS Payment"
//			+ " INNER JOIN bca_clientvendor AS ClientV ON payment.PayeeID = ClientV.ClientVendorID"
//			+ " LEFT JOIN bca_account AS Account ON payment.PayerID = Account.AccountID"
//			+ " WHERE payment.IsPaymentCompleted = 1 " + " AND ClientV.Status = 'N'" + " AND payment.CompanyID = "
//			+ ConstValue.companyId);
//
//	Sql.append(" ORDER BY payment.PaymentDate  DESC");
	
	@Query("SELECT p.service , p.payee, p.paymentDate, p.payer,"
			+ " p.memo, p.checkNumber, p.amount, p.isToBePrinted,"
			+ " p.paymentType, p.paymentId, cv.name AS CompanyName,"
			+ " cv.firstName, cv.lastName, a.name AS AccountName FROM BcaRecurrentpayment AS p"
			+ " INNER JOIN BcaClientvendor AS cv ON p.payee = cv.clientVendorId "
			+ " LEFT JOIN BcaAccount AS a ON p.payer = a.accountId "
			+ " WHERE p.isPaymentCompleted = 1 AND cv.status = 'N' AND p.company = :companyId "
			+ " ORDER BY p.paymentDate DESC")
List<Object[]> findRecurrentBillPayment(@Param("companyId")BcaCompany company);
}
