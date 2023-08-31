package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaPeritempricelevel {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String inventoryCode;

    @Column
    private Double customPricePercent;

    @Column
    private Integer parentId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_price_id", nullable = false)
    private BcaPeritempricelevel itemPrice;

    @OneToMany(mappedBy = "itemPrice")
    private Set<BcaPeritempricelevel> itemPriceBcaPeritempricelevels;

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

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaPeritempricelevel getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(final BcaPeritempricelevel itemPrice) {
        this.itemPrice = itemPrice;
    }

    public Set<BcaPeritempricelevel> getItemPriceBcaPeritempricelevels() {
        return itemPriceBcaPeritempricelevels;
    }

    public void setItemPriceBcaPeritempricelevels(
            final Set<BcaPeritempricelevel> itemPriceBcaPeritempricelevels) {
        this.itemPriceBcaPeritempricelevels = itemPriceBcaPeritempricelevels;
    }

}
