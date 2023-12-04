package com.pritesh.bizcomposer.accounting.bean;

import java.time.OffsetDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class BcaBillDto {

	private Integer billNum;
	private OffsetDateTime duedate ;
	private Double amountDue;
	private String status;
	private Integer billType;
	private Double amountPaid;
	private Double creditUsed;
	private Double balance;
	private String memo;
	private Boolean isMemorized;
	private Integer vendorId;
	private Integer categoryId;
	private Integer payerId;
	private Integer serviceId;
	private OffsetDateTime dateAdded;
	private Integer checkNo;
	private String name;
	private String catName;
	
	
	
}
