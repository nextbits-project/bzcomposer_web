package com.nxsol.bizcomposer.common;

import org.apache.struts.action.ActionForm;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name = "bca_categorytype")
public class TblCategoryType extends ActionForm {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long categoryTypeID = -1; // in db int s

	private String categoryTypeName = "";

	private int accountID = -1;// in table companyId s

	private boolean isActive;

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	/** Creates a new instance of tblCategoryType */
	public TblCategoryType() {
	}

	public long getCategoryTypeID() {
		return categoryTypeID;
	}

	public void setCategoryTypeID(long categoryTypeID) {
		this.categoryTypeID = categoryTypeID;
	}

	public String getCategoryTypeName() {
		return categoryTypeName;
	}

	public void setCategoryTypeName(String categoryTypeName) {
		this.categoryTypeName = categoryTypeName;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}
