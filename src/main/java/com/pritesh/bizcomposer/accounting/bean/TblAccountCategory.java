package com.pritesh.bizcomposer.accounting.bean;

import java.util.List;

public class TblAccountCategory {

	private int accountCategoryID = -1;

	private String name = "";
	
	private List<TblAccount> accounts;

	/** Creates a new instance of tblAccountCategory */
	public TblAccountCategory() {
	}

	public int getAccountCategoryID() {
		return accountCategoryID;
	}

	public void setAccountCategoryID(int accountCategoryID) {
		this.accountCategoryID = accountCategoryID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String toString() {
		return getName();
	}

	public boolean equals(Object obj) {
		// check for self-comparison
		if (this == obj)
			return true;
		if (!(obj instanceof TblAccountCategory))
			return false;

		TblAccountCategory other = (TblAccountCategory) obj;
		if (this.accountCategoryID != other.accountCategoryID)
			return false;

		return true;

	}

	public List<TblAccount> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<TblAccount> accounts) {
		this.accounts = accounts;
	}
	
	
}
