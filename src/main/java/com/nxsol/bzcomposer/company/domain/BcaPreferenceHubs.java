package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="bca_preference_hubs")
public class BcaPreferenceHubs  
{
    @Id
    @Column(name="PreferenceID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer preferenceId;
   
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;
    
    @Column(name="Leads")
    private Integer isLeadsEnable;
    
    @Column(name="Invoice")
    private Integer isInvoiceEnable;
    
    @Column(name="Estimation")
    private Integer isEstimationEnable;
    
    @Column(name="SalesOrder")
    private Integer isSalesOrderEnable;
    
    @Column(name="RMA")
    private Integer isRmaEnable;
    
    @Column(name="DataManager")
    private Integer isDataManagarEnable;
    
    @Column(name="Contact")
    private Integer isContactEnable;
    
    @Column(name="Calendar")
    private Integer isCalendarEnable;
    
    @Column(name="Events")
    private Integer isEventsEnable;
    
    @Column(name="Opportunity")
    private Integer isOpportunitiesEnable;
    
    @Column(name="Active")
    private Integer active;
    
    public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public Integer getPreferenceId() {
		return preferenceId;
	}

	public void setPreferenceId(Integer preferenceId) {
		this.preferenceId = preferenceId;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public Integer getIsLeadsEnable() {
		return isLeadsEnable;
	}

	public void setIsLeadsEnable(Integer isLeadsEnable) {
		this.isLeadsEnable = isLeadsEnable;
	}

	public Integer getIsInvoiceEnable() {
		return isInvoiceEnable;
	}

	public void setIsInvoiceEnable(Integer isInvoiceEnable) {
		this.isInvoiceEnable = isInvoiceEnable;
	}

	public Integer getIsEstimationEnable() {
		return isEstimationEnable;
	}

	public void setIsEstimationEnable(Integer isEstimationEnable) {
		this.isEstimationEnable = isEstimationEnable;
	}

	public Integer getIsSalesOrderEnable() {
		return isSalesOrderEnable;
	}

	public void setIsSalesOrderEnable(Integer isSalesOrderEnable) {
		this.isSalesOrderEnable = isSalesOrderEnable;
	}

	public Integer getIsRmaEnable() {
		return isRmaEnable;
	}

	public void setIsRmaEnable(Integer isRmaEnable) {
		this.isRmaEnable = isRmaEnable;
	}

	public Integer getIsDataManagarEnable() {
		return isDataManagarEnable;
	}

	public void setIsDataManagarEnable(Integer isDataManagarEnable) {
		this.isDataManagarEnable = isDataManagarEnable;
	}

	public Integer getIsContactEnable() {
		return isContactEnable;
	}

	public void setIsContactEnable(Integer isContactEnable) {
		this.isContactEnable = isContactEnable;
	}

	public Integer getIsCalendarEnable() {
		return isCalendarEnable;
	}

	public void setIsCalendarEnable(Integer isCalendarEnable) {
		this.isCalendarEnable = isCalendarEnable;
	}

	public Integer getIsEventsEnable() {
		return isEventsEnable;
	}

	public void setIsEventsEnable(Integer isEventsEnable) {
		this.isEventsEnable = isEventsEnable;
	}

	public Integer getIsOpportunitiesEnable() {
		return isOpportunitiesEnable;
	}

	public void setIsOpportunitiesEnable(Integer isOpportunitiesEnable) {
		this.isOpportunitiesEnable = isOpportunitiesEnable;
	}

	

}
