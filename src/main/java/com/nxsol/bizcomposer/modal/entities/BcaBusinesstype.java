package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaBusinesstype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer businessTypeId;

    @Column(length = 50)
    private String businessName;

    @Column
    private Integer defaultInvoiceStyleId;

    @Column
    private Integer defaultEstimationStyleId;

    @Column
    private Integer defaultPostyleId;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "businessType")
    private Set<BcaBusinesscategories> businessTypeBcaBusinesscategoriess;

    @OneToMany(mappedBy = "businessType")
    private Set<BcaBusinesscategories> businessTypeBcaBusinesscategoriess;

    @OneToMany(mappedBy = "businessType")
    private Set<BcaMasterstartingmodule> businessTypeBcaMasterstartingmodules;

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

    public Set<BcaBusinesscategories> getBusinessTypeBcaBusinesscategoriess() {
        return businessTypeBcaBusinesscategoriess;
    }

    public void setBusinessTypeBcaBusinesscategoriess(
            final Set<BcaBusinesscategories> businessTypeBcaBusinesscategoriess) {
        this.businessTypeBcaBusinesscategoriess = businessTypeBcaBusinesscategoriess;
    }

    public Set<BcaBusinesscategories> getBusinessTypeBcaBusinesscategoriess() {
        return businessTypeBcaBusinesscategoriess;
    }

    public void setBusinessTypeBcaBusinesscategoriess(
            final Set<BcaBusinesscategories> businessTypeBcaBusinesscategoriess) {
        this.businessTypeBcaBusinesscategoriess = businessTypeBcaBusinesscategoriess;
    }

    public Set<BcaMasterstartingmodule> getBusinessTypeBcaMasterstartingmodules() {
        return businessTypeBcaMasterstartingmodules;
    }

    public void setBusinessTypeBcaMasterstartingmodules(
            final Set<BcaMasterstartingmodule> businessTypeBcaMasterstartingmodules) {
        this.businessTypeBcaMasterstartingmodules = businessTypeBcaMasterstartingmodules;
    }

}
