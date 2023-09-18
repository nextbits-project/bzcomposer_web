package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BcaInventoryunitmeasure {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

}
