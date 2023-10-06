package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity   
@Table(name= "bca_features")
public class BcaFeatures {

    @Id
    @Column(name= "FeatureName", nullable = false, updatable = false, length = 50)
    private String featureName;

    @Column(name= "BusinessID")
    private Integer businessId;

    @Column(name= "BusinessName", length = 50)
    private String businessName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ModuleID")
    private BcaUsermodules modulee;

    public String getFeatureName() {
        return featureName;
    }

    public void setFeatureName(final String featureName) {
        this.featureName = featureName;
    }

    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(final Integer businessId) {
        this.businessId = businessId;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(final String businessName) {
        this.businessName = businessName;
    }

    public BcaUsermodules getModulee() {
        return modulee;
    }

    public void setModulee(final BcaUsermodules modulee) {
        this.modulee = modulee;
    }

}
