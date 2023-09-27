package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class SmdEbaycategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer eBayCategoryId;

    @Column
    private String smdcategoryName;

    @Column
    private Integer smdCategoryId;

    @Column
    private Integer level;

    @Column
    private Integer isleaf;

    public Integer getEBayCategoryId() {
        return eBayCategoryId;
    }

    public void setEBayCategoryId(final Integer eBayCategoryId) {
        this.eBayCategoryId = eBayCategoryId;
    }

    public String getSmdcategoryName() {
        return smdcategoryName;
    }

    public void setSmdcategoryName(final String smdcategoryName) {
        this.smdcategoryName = smdcategoryName;
    }

    public Integer getSmdCategoryId() {
        return smdCategoryId;
    }

    public void setSmdCategoryId(final Integer smdCategoryId) {
        this.smdCategoryId = smdCategoryId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(final Integer level) {
        this.level = level;
    }

    public Integer getIsleaf() {
        return isleaf;
    }

    public void setIsleaf(final Integer isleaf) {
        this.isleaf = isleaf;
    }

}