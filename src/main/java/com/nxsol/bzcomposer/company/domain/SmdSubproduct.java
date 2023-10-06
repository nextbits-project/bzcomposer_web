package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "smd_subproduct")
public class SmdSubproduct {

    @Id
    @Column(name= "SubProductID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer subProductId;

    @Column(name= "MasterProductID")
    private Integer masterProductId;

    @Column(name= "SubProductCount")
    private Integer subProductCount;

    public Integer getSubProductId() {
        return subProductId;
    }

    public void setSubProductId(final Integer subProductId) {
        this.subProductId = subProductId;
    }

    public Integer getMasterProductId() {
        return masterProductId;
    }

    public void setMasterProductId(final Integer masterProductId) {
        this.masterProductId = masterProductId;
    }

    public Integer getSubProductCount() {
        return subProductCount;
    }

    public void setSubProductCount(final Integer subProductCount) {
        this.subProductCount = subProductCount;
    }

}
