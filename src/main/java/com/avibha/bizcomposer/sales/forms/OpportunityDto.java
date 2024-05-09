package com.avibha.bizcomposer.sales.forms;

public class OpportunityDto
{
	private int opportunityID;
	private String name;
    private String stageName;
    private double amount;
    private String  closeDate;
	public int getOpportunityID() {
		return opportunityID;
	}
	public void setOpportunityID(int opportunityID) {
		this.opportunityID = opportunityID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStageName() {
		return stageName;
	}
	public void setStageName(String stageName) {
		this.stageName = stageName;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	} 
}
