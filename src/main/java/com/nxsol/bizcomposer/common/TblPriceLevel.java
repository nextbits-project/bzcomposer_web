package com.nxsol.bizcomposer.common;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name = "bca_pricelevel")
public class TblPriceLevel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int priceLevelID;

	private int companyID;// typo changed compoid to company

	private String priceLevelName;// = null;

	private boolean isActive;// = false;

	private String dateAdded;// = null;

	private String PriceLevelType;// = null;

	private double fixedPercentage;// = 0.0;

	private ArrayList<TblPerItemPriceLevel> perItemPriceLevelList = null;

	public TblPriceLevel() {
	}

	public int getCompanyID() {

		return ConstValue.companyId;
	}

	public ArrayList<TblPerItemPriceLevel> getPerItemPriceLevel() {
		return perItemPriceLevelList;
	}

	public void setPerItemPriceLevel(ArrayList<TblPerItemPriceLevel> level) {
		perItemPriceLevelList = level;
	}

	public String getPriceLevelName() {
		return priceLevelName;
	}

	public void setPriceLevelName(String priceLevelName) {
		this.priceLevelName = priceLevelName;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public String getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(String dateAdded) {
		this.dateAdded = dateAdded;
	}

	public String getPriceLevelType() {
		return PriceLevelType;
	}

	public void setPriceLevelType(String PriceLevelType) {
		this.PriceLevelType = PriceLevelType;
	}

	public double getFixedPercentage() {
		return fixedPercentage;
	}

	public void setFixedPercentage(double fixedPercentage) {
		this.fixedPercentage = fixedPercentage;
	}

	public void setPriceLevelID(int id) {
		priceLevelID = id;
	}

	public int getPriceLevelID() {
		return priceLevelID;
	}
}
