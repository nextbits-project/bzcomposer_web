package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "bca_inventorysupplierdetail")
public class BcaInventorysupplierdetail {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "SupplierID", length = 50)
    private String supplierId;

    @Column(name= "SupplierPurchasePrice")
    private Double supplierPurchasePrice;

    @Column(name= "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name= "SupplierOrderUnit")
    private Integer supplierOrderUnit;

    @Column(name= "SupplierBarCode", length = 50)
    private String supplierBarCode;

    @Column(name= "SupplierSKU", length = 50)
    private String supplierSku;

    @Column(name= "OrderQty")
    private Integer orderQty;

    @Column(name= "SupplierNumber")
    private Integer supplierNumber;

    @Column(name= "Deleted")
    private Integer deleted;

    @Column(name= "SupplierCommission")
    private Double supplierCommission;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID")
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

}
