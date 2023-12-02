package com.pritesh.bizcomposer.accounting.bean;

import java.time.OffsetDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor
public class BcaRecurrentPaymentDto {
//	Sql.append("SELECT payment.ServiceID," + " payment.PayeeID," + " payment.PaymentDate," + " payment.PayerID,"
//			+ " payment.Memo," + " payment.CheckNumber," + " payment.Amount," + " payment.IsToBePrinted,"
//			+ " payment.PaymentTypeID," + " payment.PaymentID," + " ClientV.Name AS CompanyName,"
//			+ " ClientV.FirstName," + " ClientV.LastName," + " Account.Name AS AccountName"
//			+ " FROM bca_recurrentpayment AS Payment"
//			+ " INNER JOIN bca_clientvendor AS ClientV ON payment.PayeeID = ClientV.ClientVendorID"
//			+ " LEFT JOIN bca_account AS Account ON payment.PayerID = Account.AccountID"
//			+ " WHERE payment.IsPaymentCompleted = 1 " + " AND ClientV.Status = 'N'" + " AND payment.CompanyID = "
//			+ ConstValue.companyId);
	private Integer serviceId;
	private Integer payeeId;
	private OffsetDateTime paymentDate;
	private Integer payerId;
	private String memo;
	private String checkNumber;
	private Double amount;
	private Boolean isToBePrinted;
	private Integer paymentTypeId;
	private Integer paymentId;
	private String companyName;
	private String firstName;
	private String lastName;
	private String accountName;
	
	
}
