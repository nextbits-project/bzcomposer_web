package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaFeatures {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String featureName;

    @Column
    private Integer businessId;

    @Column(length = 50)
    private String businessName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "modulee_id")
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
