package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaExporteditemedetail {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer exportedProductId;

    @Column(length = 50)
    private String productCode;

    @Column(length = 50)
    private String listingDuration;

    @Column(length = 50)
    private String paymentMethod;

    @Column
    private Integer shippingFee;

    @Column(length = 50)
    private String exportedInventoryId;

    @Column
    private OffsetDateTime exportedDate;

    @Column
    private Integer exportedType;

    @Column
    private Integer crossSellParentId;

    @Column
    private String productName;

    @Column
    private Integer companyId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private BcaStore store;

    public Integer getExportedProductId() {
        return exportedProductId;
    }

    public void setExportedProductId(final Integer exportedProductId) {
        this.exportedProductId = exportedProductId;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(final String productCode) {
        this.productCode = productCode;
    }

    public String getListingDuration() {
        return listingDuration;
    }

    public void setListingDuration(final String listingDuration) {
        this.listingDuration = listingDuration;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(final String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Integer getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(final Integer shippingFee) {
        this.shippingFee = shippingFee;
    }

    public String getExportedInventoryId() {
        return exportedInventoryId;
    }

    public void setExportedInventoryId(final String exportedInventoryId) {
        this.exportedInventoryId = exportedInventoryId;
    }

    public OffsetDateTime getExportedDate() {
        return exportedDate;
    }

    public void setExportedDate(final OffsetDateTime exportedDate) {
        this.exportedDate = exportedDate;
    }

    public Integer getExportedType() {
        return exportedType;
    }

    public void setExportedType(final Integer exportedType) {
        this.exportedType = exportedType;
    }

    public Integer getCrossSellParentId() {
        return crossSellParentId;
    }

    public void setCrossSellParentId(final Integer crossSellParentId) {
        this.crossSellParentId = crossSellParentId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(final String productName) {
        this.productName = productName;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

}
