package com.pritesh.bizcomposer.accounting.bean;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BillingBoardReportDto {
	private Integer orderNum;
    private Double total;
    private Integer termId;
    private String memo;
    private String note;
    private Integer invoiceId;
    private Integer serviceId;
    private Integer invoiceTypeId;
    private Integer jobCategoryId;
    private Timestamp dateAdded;
    private Double adjustedTotal;
    private Integer paymentTypeId;
    private Boolean isEmailed;
    private Integer shipped;
    private Double balance;
    private Double paidAmount;
    private Integer salesRepId;
    private String billDate;
    private String shippingMethod;
    private Integer clientVendorId;
    private String firstName;
    private String lastName;
    private String clientName;
    private String clientState;
    private String clientAddress;
    private String clientCountry;
    private String clientCity;
    private String province;
    private String clientZipCode;
    private String clientEmail;
    private String termName;
    private String inventoryCode;
    private Integer Qty;
    private Double unitPrice;
    private String sName;
    private String companyName;
    private String companyAddress;
    private String companyEmail;
    private String companyPhone;
    private String companyCity;
    private String companyState;
    private String companyZipCode;
    private String companyCountry;
}
