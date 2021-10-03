/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.sales.dao;

public class Item {

	private double amount;

	private int invID;
	private int parentID;
	private String serialNo;

	private String invCode;

	private String invDesc;

	private int qty;

	private double weight;

	private double salePrice;
	
	private double purchasePrice;
	
	private String location;
	
	private String taxable;

	private int isCategory;

	private int itemTypeID;

	private String tax;

	private double uprice;

	private String inventoryID;
	
	private String inventoryName;

	/**
	 * @return the amount
	 */
	public double getAmount() {
		return amount;
	}

	/**
	 * @param amount
	 *            the amount to set
	 */
	public void setAmount(double amount) {
		this.amount = amount;
	}

	/**
	 * @return the invCode
	 */
	public String getInvCode() {
		return invCode;
	}

	/**
	 * @param invCode
	 *            the invCode to set
	 */
	public void setInvCode(String invCode) {
		this.invCode = invCode;
	}

	/**
	 * @return the invDesc
	 */
	public String getInvDesc() {
		return invDesc;
	}

	/**
	 * @param invDesc
	 *            the invDesc to set
	 */
	public void setInvDesc(String invDesc) {
		this.invDesc = invDesc;
	}

	public String getInventoryID() {
		return inventoryID;
	}

	public void setInventoryID(String inventoryID) {
		this.inventoryID = inventoryID;
	}

	public int getInvID() {
		return invID;
	}

	public void setInvID(int invID) { this.invID = invID; }

	public int getParentID() { return parentID; }

	public void setParentID(int parentID) { this.parentID = parentID; }

	public int getIsCategory() { return isCategory; }

	public void setIsCategory(int isCategory) { this.isCategory = isCategory; }

	/**
	 * @return the itemTypeID
	 */
	public int getItemTypeID() {
		return itemTypeID;
	}

	/**
	 * @param itemTypeID
	 *            the itemTypeID to set
	 */
	public void setItemTypeID(int itemTypeID) {
		this.itemTypeID = itemTypeID;
	}

	/**
	 * @return the qty
	 */
	public int getQty() {
		return qty;
	}

	/**
	 * @param qty
	 *            the qty to set
	 */
	public void setQty(int qty) {
		this.qty = qty;
	}

	/**
	 * @return the salePrice
	 */
	public double getSalePrice() {
		return salePrice;
	}

	/**
	 * @param salePrice
	 *            the salePrice to set
	 */
	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}

	/**
	 * @return the serialNo
	 */
	public String getSerialNo() {
		return serialNo;
	}

	/**
	 * @param serialNo
	 *            the serialNo to set
	 */
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	/**
	 * @return the tax
	 */
	public String getTax() {
		return tax;
	}

	/**
	 * @param tax
	 *            the tax to set
	 */
	public void setTax(String tax) {
		this.tax = tax;
	}

	/**
	 * @return the uprice
	 */
	public double getUprice() {
		return uprice;
	}

	/**
	 * @param uprice
	 *            the uprice to set
	 */
	public void setUprice(double uprice) {
		this.uprice = uprice;
	}

	/**
	 * @return the weight
	 */
	public double getWeight() {
		return weight;
	}

	/**
	 * @param weight
	 *            the weight to set
	 */
	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTaxable() {
		return taxable;
	}

	public void setTaxable(String taxable) {
		this.taxable = taxable;
	}

	public String getInventoryName() {
		return inventoryName;
	}

	public void setInventoryName(String inventoryName) {
		this.inventoryName = inventoryName;
	}

}
