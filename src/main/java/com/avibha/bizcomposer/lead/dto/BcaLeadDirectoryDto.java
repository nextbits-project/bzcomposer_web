package com.avibha.bizcomposer.lead.dto;


import com.nxsol.bzcomposer.company.domain.BcaCompany;

public class BcaLeadDirectoryDto {

	private Integer leadDirectoryID;
    private BcaCompany company;
    private String fileName;
    private String status;
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
