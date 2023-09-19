package com.nxsol.bizcomposer.common;
// jpa change old entity
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name = "smd_item_group_price")
public class SmdItemGroupPrice {
//	@Id
	private Integer id;
	private Integer companyId;// foreign key
	private String inventoryId;// foreign key
	private Integer customerGroupId;
	private String defaultPrice="0";
	private  Double price;
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getInventoryId() {
		return inventoryId;
	}
	public void setInventoryId(String inventoryId) {
		this.inventoryId = inventoryId;
	}
	public Integer getCustomerGroupId() {
		return customerGroupId;
	}
	public void setCustomerGroupId(Integer customerGroupId) {
		this.customerGroupId = customerGroupId;
	}
	public String getDefaultPrice() {
		return defaultPrice;
	}
	public void setDefaultPrice(String defaultPrice) {
		this.defaultPrice = defaultPrice;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	
	
}
