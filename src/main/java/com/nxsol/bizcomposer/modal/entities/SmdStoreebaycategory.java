package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class SmdStoreebaycategory {

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

    @Column
    private Integer storeId;

    @Column
    private Integer isDefault;

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

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(final Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(final Integer isDefault) {
        this.isDefault = isDefault;
    }

}
