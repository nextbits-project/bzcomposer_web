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
public class BcaInventorysupplierdetail {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 50)
    private String supplierId;

    @Column
    private Double supplierPurchasePrice;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer supplierOrderUnit;

    @Column(length = 50)
    private String supplierBarCode;

    @Column(length = 50)
    private String supplierSku;

    @Column
    private Integer orderQty;

    @Column
    private Integer supplierNumber;

    @Column
    private Integer deleted;

    @Column
    private Double supplierCommission;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(final String supplierId) {
        this.supplierId = supplierId;
    }

    public Double getSupplierPurchasePrice() {
        return supplierPurchasePrice;
    }

    public void setSupplierPurchasePrice(final Double supplierPurchasePrice) {
        this.supplierPurchasePrice = supplierPurchasePrice;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getSupplierOrderUnit() {
        return supplierOrderUnit;
    }

    public void setSupplierOrderUnit(final Integer supplierOrderUnit) {
        this.supplierOrderUnit = supplierOrderUnit;
    }

    public String getSupplierBarCode() {
        return supplierBarCode;
    }

    public void setSupplierBarCode(final String supplierBarCode) {
        this.supplierBarCode = supplierBarCode;
    }

    public String getSupplierSku() {
        return supplierSku;
    }

    public void setSupplierSku(final String supplierSku) {
        this.supplierSku = supplierSku;
    }

    public Integer getOrderQty() {
        return orderQty;
    }

    public void setOrderQty(final Integer orderQty) {
        this.orderQty = orderQty;
    }

    public Integer getSupplierNumber() {
        return supplierNumber;
    }

    public void setSupplierNumber(final Integer supplierNumber) {
        this.supplierNumber = supplierNumber;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(final Integer deleted) {
        this.deleted = deleted;
    }

    public Double getSupplierCommission() {
        return supplierCommission;
    }

    public void setSupplierCommission(final Double supplierCommission) {
        this.supplierCommission = supplierCommission;
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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
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
