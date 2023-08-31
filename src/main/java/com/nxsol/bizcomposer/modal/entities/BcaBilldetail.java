package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaBilldetail {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer billDetailId;

    @Column
    private Integer billNum;

    @Column
    private Integer expenseAcctId;

    @Column
    private Double expenseAmount;

    @Column(length = 50)
    private String expenseMemo;

    @Column
    private Integer expenseClientVendorId;

    @Column
    private Boolean billable;

    @Column
    private Integer inventoryCustId;

    @Column
    private Double inventoryCost;

    @Column
    private Integer inventoryQty;

    @Column
    private Integer detailType;

    @Column
    private Boolean status;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_id")
    private BcaInvoice invoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    public Integer getBillDetailId() {
        return billDetailId;
    }

    public void setBillDetailId(final Integer billDetailId) {
        this.billDetailId = billDetailId;
    }

    public Integer getBillNum() {
        return billNum;
    }

    public void setBillNum(final Integer billNum) {
        this.billNum = billNum;
    }

    public Integer getExpenseAcctId() {
        return expenseAcctId;
    }

    public void setExpenseAcctId(final Integer expenseAcctId) {
        this.expenseAcctId = expenseAcctId;
    }

    public Double getExpenseAmount() {
        return expenseAmount;
    }

    public void setExpenseAmount(final Double expenseAmount) {
        this.expenseAmount = expenseAmount;
    }

    public String getExpenseMemo() {
        return expenseMemo;
    }

    public void setExpenseMemo(final String expenseMemo) {
        this.expenseMemo = expenseMemo;
    }

    public Integer getExpenseClientVendorId() {
        return expenseClientVendorId;
    }

    public void setExpenseClientVendorId(final Integer expenseClientVendorId) {
        this.expenseClientVendorId = expenseClientVendorId;
    }

    public Boolean getBillable() {
        return billable;
    }

    public void setBillable(final Boolean billable) {
        this.billable = billable;
    }

    public Integer getInventoryCustId() {
        return inventoryCustId;
    }

    public void setInventoryCustId(final Integer inventoryCustId) {
        this.inventoryCustId = inventoryCustId;
    }

    public Double getInventoryCost() {
        return inventoryCost;
    }

    public void setInventoryCost(final Double inventoryCost) {
        this.inventoryCost = inventoryCost;
    }

    public Integer getInventoryQty() {
        return inventoryQty;
    }

    public void setInventoryQty(final Integer inventoryQty) {
        this.inventoryQty = inventoryQty;
    }

    public Integer getDetailType() {
        return detailType;
    }

    public void setDetailType(final Integer detailType) {
        this.detailType = detailType;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(final Boolean status) {
        this.status = status;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

}
