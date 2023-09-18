package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class SmdSubproduct {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer subProductId;

    @Column
    private Integer masterProductId;

    @Column
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
