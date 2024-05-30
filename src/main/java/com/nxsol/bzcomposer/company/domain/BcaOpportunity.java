package com.nxsol.bzcomposer.company.domain;

import java.time.OffsetDateTime;

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
@Table(name= "bca_opportunity")
public class BcaOpportunity 
{
	 @Id
	    @Column(name= "OpportunityID", nullable = false, updatable = false)
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer opportunityId;
	 
	 

	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "ClientVendorID")
	    private BcaClientvendor clientVendor;
	    
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "CompanyID")
	    private BcaCompany company;
	    
	    @Column(name= "Name")
	    private String name;
	
	    @Column(name= "Stage")
	    private String stage;
	    
	    @Column(name= "Amount")
	    private double  amount;
	   
	    
	    public double getAmount() {
			return amount;
		}

		public void setAmount(double amount) {
			this.amount = amount;
		}

		@Column(name= "CloseDate")
	    private OffsetDateTime closeDate;
	    
	    
	    @Column(name="Active")
	    private Boolean active;
	    
	    public Integer getOpportunityId() {
			return opportunityId;
		}

		public void setOpportunityId(Integer opportunityId) {
			this.opportunityId = opportunityId;
		}

		public BcaClientvendor getClientVendor() {
			return clientVendor;
		}

		public void setClientVendor(BcaClientvendor clientVendor) {
			this.clientVendor = clientVendor;
		}

		public BcaCompany getCompany() {
			return company;
		}

		public void setCompany(BcaCompany company) {
			this.company = company;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getStage() {
			return stage;
		}

		public void setStage(String stage) {
			this.stage = stage;
		}

		public OffsetDateTime getCloseDate() {
			return closeDate;
		}

		public void setCloseDate(OffsetDateTime closeDate) {
			this.closeDate = closeDate;
		}

		public Boolean getActive() {
			return active;
		}

		public void setActive(Boolean active) {
			this.active = active;
		}

}
