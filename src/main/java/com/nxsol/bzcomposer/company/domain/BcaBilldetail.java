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
@Table(name= "bca_billdetail")
public class BcaBilldetail {

    @Id
    @Column(name = "BillDetailID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer billDetailId;

    @Column(name = "BillNum")
    private Integer billNum;

    @Column(name = "ExpenseAcctID")
    private Integer expenseAcctId;

    @Column(name = "ExpenseAmount")
    private Double expenseAmount;

    @Column(name = "ExpenseMemo", length = 50)
    private String expenseMemo;

    @Column(name = "ExpenseClientVendorID")
    private Integer expenseClientVendorId;

    @Column(name = "Billable")
    private Boolean billable;

    @Column(name = "InventoryCustID")
    private Integer inventoryCustId;

    @Column(name = "InventoryCost")
    private Double inventoryCost;

    @Column(name = "InventoryQty")
    private Integer inventoryQty;

    @Column(name = "DetailType")
    private Integer detailType;

    @Column(name = "Status")
    private Boolean status;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

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

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
    }

}
