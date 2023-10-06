package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_masterstartingmodule")
public class BcaMasterstartingmodule {

    @Id
    @Column(name= "StartModuleID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer startModuleId;

    @Column(name= "BusinessTypeID")
    private Integer businessTypeId;

    @Column(name= "ModuleName", length = 50)
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
