package com.pritesh.bizcomposer.accounting.bean;

import java.sql.Timestamp;
import java.time.OffsetDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Data
@EqualsAndHashCode(callSuper=false)
@NoArgsConstructor

public class BcaBillingstatementsDto {

	private Double balance;
	private OffsetDateTime dateAdded;
	private  Double paidAmount ;
	private Integer statementNo;
	private OffsetDateTime statementDate;
	private Integer clientVendorId;
	private Integer invoiceId;
	private Integer isCombined;
	private Integer type;
	private Double amount;
	private Double overdueAmount;
	private Double overDueServiceCharge;
	private String companyName;
	private String firstName;
	private String lastName;
	private Integer orderNum;
	public BcaBillingstatementsDto(Double balance, OffsetDateTime dateAdded, Double paidAmount, Integer statementNo,
			OffsetDateTime statementDate, Integer clientVendorId, Integer invoiceId, Integer isCombined, Integer type,
			Double amount, Double overdueAmount, Double overDueServiceCharge, String companyName, String firstName,
			String lastName, Integer orderNum) {
		super();
		this.balance = balance;
		this.dateAdded = dateAdded;
		this.paidAmount = paidAmount;
		this.statementNo = statementNo;
		this.statementDate = statementDate;
		this.clientVendorId = clientVendorId;
		this.invoiceId = invoiceId;
		this.isCombined = isCombined;
		this.type = type;
		this.amount = amount;
		this.overdueAmount = overdueAmount;
		this.overDueServiceCharge = overDueServiceCharge;
		this.companyName = companyName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.orderNum = orderNum;
	}
	
}
