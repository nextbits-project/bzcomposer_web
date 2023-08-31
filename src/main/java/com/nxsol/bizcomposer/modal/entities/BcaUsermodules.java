package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaUsermodules {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer moduleId;

    @Column(length = 50)
    private String moduleName;

    @Column
    private Integer parentId;

    @OneToMany(mappedBy = "modulee")
    private Set<BcaBusinessmodules> moduleBcaBusinessmoduless;

    @OneToMany(mappedBy = "modulee")
    private Set<BcaBusinessmodules> moduleBcaBusinessmoduless;

    @OneToMany(mappedBy = "modulee")
    private Set<BcaFeatures> moduleBcaFeaturess;

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(final Integer moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(final String moduleName) {
        this.moduleName = moduleName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(final Integer parentId) {
        this.parentId = parentId;
    }

    public Set<BcaBusinessmodules> getModuleBcaBusinessmoduless() {
        return moduleBcaBusinessmoduless;
    }

    public void setModuleBcaBusinessmoduless(
            final Set<BcaBusinessmodules> moduleBcaBusinessmoduless) {
        this.moduleBcaBusinessmoduless = moduleBcaBusinessmoduless;
    }

    public Set<BcaBusinessmodules> getModuleBcaBusinessmoduless() {
        return moduleBcaBusinessmoduless;
    }

    public void setModuleBcaBusinessmoduless(
            final Set<BcaBusinessmodules> moduleBcaBusinessmoduless) {
        this.moduleBcaBusinessmoduless = moduleBcaBusinessmoduless;
    }

    public Set<BcaFeatures> getModuleBcaFeaturess() {
        return moduleBcaFeaturess;
    }

    public void setModuleBcaFeaturess(final Set<BcaFeatures> moduleBcaFeaturess) {
        this.moduleBcaFeaturess = moduleBcaFeaturess;
    }

}
