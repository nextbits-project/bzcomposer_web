package com.pritesh.bizcomposer.accounting.bean;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BcaIteminventoryDto {

	
	Integer inventoryId;
	Integer parentId;
	Boolean isCategory;
	String inventoryCode;
	String inventoryName;
	Double salePrice;
	Double purchasePrice;
	BigDecimal dealerPrice;
	Integer qty;
	Double weight;
	Integer taxable;
	String serialNum;
	Integer itemTypeId;
	String dateAdded;
	String location;
	String dateRecieved;
	String memo;
	Integer expectedQty;
	String category;
	Integer reorderPoint;

}

