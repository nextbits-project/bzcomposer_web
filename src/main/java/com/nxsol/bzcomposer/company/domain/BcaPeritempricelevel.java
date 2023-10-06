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
@Table(name="bca_peritempricelevel")
public class BcaPeritempricelevel {

    @Id
    @Column(name="ItemPriceID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer itemPriceId;

    @Column(name="InventoryCode", length = 50)
    private String inventoryCode;

    @Column(name="CustomPricePercent")
    private Double customPricePercent;

    @Column(name="ParentID")
    private Integer parentId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID")
    private BcaIteminventory inventory;

    public Integer getItemPriceId() {
        return itemPriceId;
    }

    public void setItemPriceId(final Integer itemPriceId) {
        this.itemPriceId = itemPriceId;
    }

    public String getInventoryCode() {
        return inventoryCode;
    }

    public void setInventoryCode(final String inventoryCode) {
        this.inventoryCode = inventoryCode;
    }

    public Double getCustomPricePercent() {
        return customPricePercent;
    }

    public void setCustomPricePercent(final Double customPricePercent) {
        this.customPricePercent = customPricePercent;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(final Integer parentId) {
        this.parentId = parentId;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

}
