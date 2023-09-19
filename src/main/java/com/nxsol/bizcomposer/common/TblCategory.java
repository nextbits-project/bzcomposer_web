package com.nxsol.bizcomposer.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

//@Entity // bca_category also bca_businesscategories
//@Table(name = "bca_category")
public class TblCategory implements Cloneable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CategoryID")
	private long id = -1;

	private long categoryTypeID = -1;

	private String name = "";

	@Column(name = "cateNumber")
	private String categoryNumber = "";

	private String parent = "";

	private String description = "";

	private int budgetCategoryID = -1; // foreign key bca_budgetcategory(budgetCategoryID)
	@Transient
	private int subLevel;// =0;

	@Transient
	private String categoryTypeName = "";
	@Transient
	private String budgetCategoryName = "";
	@Transient
	private boolean subAccountOf;// = false;
	@Transient
	private String accountNumber = "";
	@Transient
	private int accountID = -1;

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public boolean isSubAccountOf() {
		return subAccountOf;
	}

	public void setSubAccountOf(boolean subAccountOf) {
		this.subAccountOf = subAccountOf;
	}

	public String getBudgetCategoryName() {
		return budgetCategoryName;
	}

	public void setBudgetCategoryName(String budgetCategoryName) {
		this.budgetCategoryName = budgetCategoryName;
	}

	public String getCategoryTypeName() {
		return categoryTypeName;
	}

	public void setCategoryTypeName(String categoryTypeName) {
		this.categoryTypeName = categoryTypeName;
	}

	/** Creates a new instance of tblCategory */
	public TblCategory() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getCategoryTypeID() {
		return categoryTypeID;
	}

	public void setCategoryTypeID(long categoryTypeID) {
		this.categoryTypeID = categoryTypeID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategoryNumber() {
		return categoryNumber;
	}

	public void setCategoryNumber(String categoryNumber) {
		this.categoryNumber = categoryNumber;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getBudgetCategoryID() {
		return budgetCategoryID;
	}

	public void setBudgetCategoryID(int budgetCategoryID) {
		this.budgetCategoryID = budgetCategoryID;
	}

	public int getSubLevel() {
		return subLevel;
	}

	public void setSubLevel(int subLevel) {
		this.subLevel = subLevel;
	}

	public String toString() {
		return getCategoryNumber().trim() + " " + getName().trim();
	}

	public synchronized Object clone() {
		try {
			return super.clone();
		} catch (CloneNotSupportedException ex) {
			ex.printStackTrace();
		}
		return null;
	}
}
