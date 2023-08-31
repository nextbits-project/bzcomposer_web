package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcaInventoryunitmeasure {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer inventoryId;

    @Column
    private Integer unitCategoryId;

    @Column
    private Integer weightId;

    @Column
    private Integer subUnitCategoryId;

    @Column
    private Integer sizeH;

    @Column
    private Integer sizeW;

    @Column
    private Integer sizeL;

    @Column
    private Integer companyId;

    public Integer getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(final Integer inventoryId) {
        this.inventoryId = inventoryId;
    }

    public Integer getUnitCategoryId() {
        return unitCategoryId;
    }

    public void setUnitCategoryId(final Integer unitCategoryId) {
        this.unitCategoryId = unitCategoryId;
    }

    public Integer getWeightId() {
        return weightId;
    }

    public void setWeightId(final Integer weightId) {
        this.weightId = weightId;
    }

    public Integer getSubUnitCategoryId() {
        return subUnitCategoryId;
    }

    public void setSubUnitCategoryId(final Integer subUnitCategoryId) {
        this.subUnitCategoryId = subUnitCategoryId;
    }

    public Integer getSizeH() {
        return sizeH;
    }

    public void setSizeH(final Integer sizeH) {
        this.sizeH = sizeH;
    }

    public Integer getSizeW() {
        return sizeW;
    }

    public void setSizeW(final Integer sizeW) {
        this.sizeW = sizeW;
    }

    public Integer getSizeL() {
        return sizeL;
    }

    public void setSizeL(final Integer sizeL) {
        this.sizeL = sizeL;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

}
