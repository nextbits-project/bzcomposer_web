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
@Table(name="bca_productchannelsetting")
public class BcaProductchannelsetting {

    @Id
    @Column(name="ChannelsettingID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer channelsettingId;

    @Column(name="StoreName")
    private String storeName;

    @Column(name="SalesPrice")
    private Double salesPrice;

    @Column(name="ProductSKU")
    private String productSku;

    @Column(name="Active")
    private Integer active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "StoreID")
    private BcaStore store;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    public Integer getChannelsettingId() {
        return channelsettingId;
    }

    public void setChannelsettingId(final Integer channelsettingId) {
        this.channelsettingId = channelsettingId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(final String storeName) {
        this.storeName = storeName;
    }

    public Double getSalesPrice() {
        return salesPrice;
    }

    public void setSalesPrice(final Double salesPrice) {
        this.salesPrice = salesPrice;
    }

    public String getProductSku() {
        return productSku;
    }

    public void setProductSku(final String productSku) {
        this.productSku = productSku;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaStore getStore() {
        return store;
    }

    public void setStore(final BcaStore store) {
        this.store = store;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
