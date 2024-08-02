package com.avibha.bizcomposer.configuration.forms;

import java.io.Serializable;

/**
 * @author sarfrazmalik
 */
public class DesignFeatureDto implements Serializable {

	private static final long serialVersionUID = 0;
	private Long preferencePosId;
	private String productIcons;
	private String gridsSalesSlip;
	private String calculatorDisplay;
	private String customerTypeId;
	private String productListId;
	private String salesTaxRate;
	private String spPolice;
	private String spRetailer;
	private String spWholesaler;
	private String status;
	private String active;
	
	public Long getPreferencePosId() {
		return preferencePosId;
	}
	public void setPreferencePosId(Long preferencePosId) {
		this.preferencePosId = preferencePosId;
	}
	public String getProductIcons() {
		return productIcons;
	}
	public void setProductIcons(String productIcons) {
		this.productIcons = productIcons;
	}
	public String getGridsSalesSlip() {
		return gridsSalesSlip;
	}
	public void setGridsSalesSlip(String gridsSalesSlip) {
		this.gridsSalesSlip = gridsSalesSlip;
	}
	public String getCalculatorDisplay() {
		return calculatorDisplay;
	}
	public void setCalculatorDisplay(String calculatorDisplay) {
		this.calculatorDisplay = calculatorDisplay;
	}
	public String getCustomerTypeId() {
		return customerTypeId;
	}
	public void setCustomerTypeId(String customerTypeId) {
		this.customerTypeId = customerTypeId;
	}
	public String getProductListId() {
		return productListId;
	}
	public void setProductListId(String productListId) {
		this.productListId = productListId;
	}
	public String getSalesTaxRate() {
		return salesTaxRate;
	}
	public void setSalesTaxRate(String salesTaxRate) {
		this.salesTaxRate = salesTaxRate;
	}
	public String getSpPolice() {
		return spPolice;
	}
	public void setSpPolice(String spPolice) {
		this.spPolice = spPolice;
	}
	public String getSpRetailer() {
		return spRetailer;
	}
	public void setSpRetailer(String spRetailer) {
		this.spRetailer = spRetailer;
	}
	public String getSpWholesaler() {
		return spWholesaler;
	}
	public void setSpWholesaler(String spWholesaler) {
		this.spWholesaler = spWholesaler;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
