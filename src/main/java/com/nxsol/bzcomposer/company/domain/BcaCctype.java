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
@Table(name="bca_cctype")
public class BcaCctype {

    @Id
    @Column(name = "CCTypeID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cCTypeID;

    @Column(name = "Name", length = 50)
    private String name;

    @Column(name="Active")
    private Integer active;
    
    @Column(name="IsDefault")
    private Boolean isDefault;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

	public Integer getcCTypeID() {
		return cCTypeID;
	}

	public void setcCTypeID(Integer cCTypeID) {
		this.cCTypeID = cCTypeID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public Boolean getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}


    
}
