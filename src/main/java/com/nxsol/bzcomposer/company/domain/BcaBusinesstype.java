package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bca_businesstype")
public class BcaBusinesstype {

    @Id
    @Column(name= "BusinessTypeID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer businessTypeId;

    @Column(name= "BusinessName", length = 50)
    private String businessName;

    @Column(name= "DefaultInvoiceStyleID")
    private Integer defaultInvoiceStyleId;

    @Column(name= "DefaultEstimationStyleID")
    private Integer defaultEstimationStyleId;

    @Column(name= "DefaultPOStyleID")
    private Integer defaultPostyleId;

    @Column(name= "Active")
    private Integer active;

    @OneToMany(mappedBy = "businessType")
    private Set<BcaCompany> businessTypeBcaCompanys;

    public Integer getBusinessTypeId() {
        return businessTypeId;
    }

    public void setBusinessTypeId(final Integer businessTypeId) {
        this.businessTypeId = businessTypeId;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(final String businessName) {
        this.businessName = businessName;
    }

    public Integer getDefaultInvoiceStyleId() {
        return defaultInvoiceStyleId;
    }

    public void setDefaultInvoiceStyleId(final Integer defaultInvoiceStyleId) {
        this.defaultInvoiceStyleId = defaultInvoiceStyleId;
    }

    public Integer getDefaultEstimationStyleId() {
        return defaultEstimationStyleId;
    }

    public void setDefaultEstimationStyleId(final Integer defaultEstimationStyleId) {
        this.defaultEstimationStyleId = defaultEstimationStyleId;
    }

    public Integer getDefaultPostyleId() {
        return defaultPostyleId;
    }

    public void setDefaultPostyleId(final Integer defaultPostyleId) {
        this.defaultPostyleId = defaultPostyleId;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcaCompany> getBusinessTypeBcaCompanys() {
        return businessTypeBcaCompanys;
    }

    public void setBusinessTypeBcaCompanys(final Set<BcaCompany> businessTypeBcaCompanys) {
        this.businessTypeBcaCompanys = businessTypeBcaCompanys;
    }

}
