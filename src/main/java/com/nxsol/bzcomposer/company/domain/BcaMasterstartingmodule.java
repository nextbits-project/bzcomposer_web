package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcaMasterstartingmodule {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer startModuleId;

    @Column
    private Integer businessTypeId;

    @Column(length = 50)
    private String moduleName;

    public Integer getStartModuleId() {
        return startModuleId;
    }

    public void setStartModuleId(final Integer startModuleId) {
        this.startModuleId = startModuleId;
    }

    public Integer getBusinessTypeId() {
        return businessTypeId;
    }

    public void setBusinessTypeId(final Integer businessTypeId) {
        this.businessTypeId = businessTypeId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(final String moduleName) {
        this.moduleName = moduleName;
    }

}
