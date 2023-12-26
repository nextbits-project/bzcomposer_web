package com.pritesh.bizcomposer.accounting.bean;

import java.time.OffsetDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@Data
public class SalesInvoiceBoardDto {
	private String inventoryName;
	private OffsetDateTime dateAdded;
	private Integer inventoryId;
	private Integer orderNum;
	private String memo;
	private String name;
	private Integer clientVendorId;
	private Integer qty;
	private Double unitPrice;
	private Double amount;
	private Integer qtySum;
	private Double amountSum;
	
	public SalesInvoiceBoardDto(String inventoryName, OffsetDateTime dateAdded, Integer inventoryId, Integer orderNum,
			String memo, String name, Integer clientVendorId, Integer qty, Double unitPrice, Double amount) {
		super();
		this.inventoryName = inventoryName;
		this.dateAdded = dateAdded;
		this.inventoryId = inventoryId;
		this.orderNum = orderNum;
		this.memo = memo;
		this.name = name;
		this.clientVendorId = clientVendorId;
		this.qty = qty;
		this.unitPrice = unitPrice;
		this.amount = amount;
	}

	public SalesInvoiceBoardDto(Integer qtySum ,Double amountSum) {
		this.qtySum=qtySum;
		this.amountSum=amountSum;
	}
}
