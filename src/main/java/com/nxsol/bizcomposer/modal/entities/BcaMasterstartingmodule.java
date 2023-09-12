package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaMasterstartingmodule {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer startModuleId;

    @Column(length = 50)
    private String moduleName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "business_type_id")
    private BcaBusinesstype businessType;

    public Integer getStartModuleId() {
        return startModuleId;
    }

    public void setStartModuleId(final Integer startModuleId) {
        this.startModuleId = startModuleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(final String moduleName) {
        this.moduleName = moduleName;
    }

    public BcaBusinesstype getBusinessType() {
        return businessType;
    }

    public void setBusinessType(final BcaBusinesstype businessType) {
        this.businessType = businessType;
    }

}
