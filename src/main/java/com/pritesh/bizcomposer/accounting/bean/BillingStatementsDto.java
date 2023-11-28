package com.pritesh.bizcomposer.accounting.bean;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BillingStatementsDto {

	  private Integer statementNo;
	    private Timestamp statementDate;
	    private Integer clientVendorId;
	    private Integer invoiceId;
	    private Integer isCombined;
	    private Integer type;
	    private Double amount;
	    private Double overdueAmount;
	    private Float overdueServiceCharge;
	    private String companyName;
	    private String firstName;
	    private String lastName;
	    private String clientAddress;
	    private String clientCity;
	    private String clientState;
	    private String clientZipCode;
	    private String clientCountry;
	    private Integer orderNum;
	    private Double total;
	    private String termName;
	    private String cName;
	    private String companyAddress;
	    private String companyCity;
	    private String companyState;
	    private String companyZipCode;
	    private String companyCountry;
	    private String companyPhoneNumber;
	    private String companyEmail;
	    private String inventoryCode;
	    private Timestamp dateAdded;

}
