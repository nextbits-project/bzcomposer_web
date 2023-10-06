package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "bca_inventoryunitmeasure")
public class BcaInventoryunitmeasure {

    @Id
    @Column(name = "UnitCategoryID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer unitCategoryId;

    @Column(name= "WeightID")
    private Integer weightId;

    @Column(name= "subUnitCategoryID")
    private Integer subUnitCategoryId;

    @Column(name= "SizeH")
    private Integer sizeH;

    @Column(name= "SizeW")
    private Integer sizeW;

    @Column(name= "SizeL")
    private Integer sizeL;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID")
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
