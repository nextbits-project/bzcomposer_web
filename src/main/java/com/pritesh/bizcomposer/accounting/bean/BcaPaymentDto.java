package com.pritesh.bizcomposer.accounting.bean;

import java.time.OffsetDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BcaPaymentDto {
private Integer serviceId;
private Integer vendorId;
private OffsetDateTime dateAdded;
private Integer payerId;
private String memo;
private String checkNumber;
private Double amount;
private Boolean isToBePrinted;
private Integer billNum;
private Integer categoryId; 
private Double amountDue;
private Integer paymentTypeId;
private Integer paymentId;
private String compnayName;
private String firstName;
private String lastName;
private String accountName;


}
