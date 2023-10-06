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
@Table(name= "bca_usermapping")
public class BcaUsermodules {

    @Id
    @Column(name= "ModuleID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer moduleId;

    @Column(name= "ModuleName", length = 50)
    private String moduleName;

    @Column(name= "ParentID")
    private Integer parentId;

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

    public Set<BcaFeatures> getModuleBcaFeaturess() {
        return moduleBcaFeaturess;
    }

    public void setModuleBcaFeaturess(final Set<BcaFeatures> moduleBcaFeaturess) {
        this.moduleBcaFeaturess = moduleBcaFeaturess;
    }

}
