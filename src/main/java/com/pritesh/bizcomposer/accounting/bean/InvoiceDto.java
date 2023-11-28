package com.pritesh.bizcomposer.accounting.bean;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class InvoiceDto {
	private Integer invoiceID;
	private Integer orderNum;
	private Integer PONum;
	private Double subTotal;
	private Double tax;
	private Integer employeeID;
	private String refNum;
	private String memo;
	private Integer shipCarrierID;
	private String shippingMethod;
	private Double SH;
	private Integer clientVendorID;
	private Integer invoiceTypeID;
	private Double total;
	private Double adjustedTotal;
	private Double paidAmount;
	private Double paidAmount12;
	private Double balance;
	private Boolean isReceived;
	private Integer termID;
	private Boolean isPaymentCompleted;
	private Timestamp dateConfirmed;
	private Timestamp dateAdded;
	private Integer invoiceStatus;
	private Integer paymentTypeID;
	private Integer categoryID;
	private Integer serviceID;
	private Integer salesTaxID;
	private Integer salesRepID;
	private Integer taxable;
	private Integer shipped;
	private	Integer jobCategoryID;
	private Integer termDays;
	private Integer billingAddrID;
	private Integer shippingAddrID;
	private Double totalCommission;
	private Integer bankAccountID;

}
