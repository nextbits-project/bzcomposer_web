package com.avibha.bizcomposer.opportunity.form;

import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

public class OpportunityDto
{
	private static final long serialVersionUID = 0;
	private String clientVendorID;
	private String opportunityID;

	
	public String getOpprtunityName() {
		return opportunityName;
	}

	public void setOpprtunityName(String opprtunityName) {
		this.opportunityName = opprtunityName;
	}

	private String stage;
	private   BcaClientvendor clientVendor;
	public   BcaClientvendor getClientVendor() {
		return clientVendor;
	}

	public void setClientVendor(  BcaClientvendor clientVendor) {
		this.clientVendor = clientVendor;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	private BcaCompany   company;
	private double amount;
	private String closedDate;
	private String fullName;
	private String companyName;
	private String companyID;
	public String getCompanyID() {
		return companyID;
	}

	public void setCompanyID(String companyID) {
		this.companyID = companyID;
	}

	private String  opportunityName;
	
	public String getOpportunityID() {
		return opportunityID;
	}

	public void setOpportunityID(String opportunityID) {
		this.opportunityID = opportunityID;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getClosedDate() {
		return closedDate;
	}

	public void setClosedDate(String closedDate) {
		this.closedDate = closedDate;
	}

	

	public String getClientVendorID() {
		return clientVendorID;
	}

	public void setClientVendorID(String clientVendorID) {
		this.clientVendorID = clientVendorID;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getOpportunityName() {
		return opportunityName;
	}

	public void setOpportunityName(String opportunityName) {
		this.opportunityName = opportunityName;
	}
	
	
	

}
