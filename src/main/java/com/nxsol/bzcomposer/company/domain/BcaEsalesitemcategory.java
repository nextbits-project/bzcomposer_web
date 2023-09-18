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
public class BcaEsalesitemcategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer inventoryId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private BcaStore store;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_type_id")
    private BcaStoretype storeType;

    public Integer getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(final Integer inventoryId) {
        this.inventoryId = inventoryId;
    }

    public BcaCategory getCategory() {
        return category;
    }

    public void setCategory(final BcaCategory category) {
        this.category = category;
    }

    public BcaStore getStore() {
        return store;
    }

    public void setStore(final BcaStore store) {
        this.store = store;
    }

    public BcaStoretype getStoreType() {
        return storeType;
    }

    public void setStoreType(final BcaStoretype storeType) {
        this.storeType = storeType;
    }

}
