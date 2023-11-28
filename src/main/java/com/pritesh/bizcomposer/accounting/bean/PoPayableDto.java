package com.pritesh.bizcomposer.accounting.bean;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PoPayableDto {
	private Integer invoiceID;
    private Integer PONum;
    private Integer clientVendorID;
    private Integer companyID;
    private Integer invoiceTypeID;
    private Integer bankAccountId;
    private Double adjustedTotal;
    private Double paidAmount;
    private Double paidAmount12;
    private Double balance;
    private Integer termID;
    private Integer paymentTypeID;
    private boolean isPaymentCompleted;
    private Timestamp dateAdded;
    private Integer categoryId;
    private String memo;
    private String paymentTypeName;
    private String accountName;
    private String categoryName;
    private String cateNumber;
    private String companyName;
    private String firstName;
    private String lastName;
}
