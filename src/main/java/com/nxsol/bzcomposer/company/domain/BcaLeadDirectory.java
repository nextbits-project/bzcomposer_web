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
@Table(name= "bca_lead_directory")
public class BcaLeadDirectory {

    @Id
    @Column(name= "LeadDirectoryID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadDirectoryID;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;
    
    @Column(name= "FileName")
    private String fileName;
    
    @Column(name= "Status")
    private String status;

    @Column(name="Active")
    private Integer active;

	public Integer getLeadDirectoryID() {
		return leadDirectoryID;
	}

	public void setLeadDirectoryID(Integer leadDirectoryID) {
		this.leadDirectoryID = leadDirectoryID;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}
	
}
