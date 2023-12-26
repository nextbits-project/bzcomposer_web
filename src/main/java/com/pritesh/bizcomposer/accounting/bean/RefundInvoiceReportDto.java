package com.pritesh.bizcomposer.accounting.bean;

import java.time.OffsetDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class RefundInvoiceReportDto {
	private Integer orderNum;
	private OffsetDateTime dateAdded;

	private Integer clientVendorId;
	private String name;
	private String firstName;
	private String lastName;
	private String srName;
	private Integer refundReasonId;
	private Integer paymentTypeId;
	private Double amount;

}
