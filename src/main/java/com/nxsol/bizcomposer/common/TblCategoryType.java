package com.nxsol.bizcomposer.common;

import org.apache.struts.action.ActionForm;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class TblCategoryType extends ActionForm {

	 private static final long serialVersionUID = 1L;

	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long categoryTypeID = -1; // in db int s
	    
	    private String categoryTypeName = "";    
	    
	    private int accountID = -1;// in table companyId s
	    
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
}
