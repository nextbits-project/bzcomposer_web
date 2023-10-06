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
@Table(name="bca_rmaitem")
public class BcaRmaitem {

    @Id
    @Column(name="RmaUniqueID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rmaUniqueId;

    @Column(name="RmaNo")
    private Integer rmaNo;

    @Column(name="InvName", length = 50)
    private String invName;

    @Column(name="UnitPrice")
    private Double unitPrice;

    @Column(name="RmaItemQty")
    private Integer rmaItemQty;

    @Column(name="Total")
    private Double total;

    @Column(name="Reason", length = 50)
    private String reason;

    @Column(name="Action", length = 50)
    private String action;

    @Column(name="SubstituteInvoiceOrderNumber")
    private Integer substituteInvoiceOrderNumber;

    @Column(name="IsPaymentCompleted")
    private Boolean isPaymentCompleted;

    @Column(name="PaidAmount")
    private Double paidAmount;

    @Column(name="Balance")
    private Double balance;

    @Column(name="RmaItemID")
    private Integer rmaItemId;

    @Column(name="isAdjusted")
    private Boolean isAdjusted;

    @Column(name="TotalAdjustedQty")
    private Integer totalAdjustedQty;

    @Column(name="isDeleted")
    private Integer isDeleted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CartID")
    private BcaCart cart;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parentReasonID")
    private BcaMasterrmareason parentReason;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID", nullable = false)
    private BcaIteminventory inventory;

    public Integer getRmaUniqueId() {
        return rmaUniqueId;
    }

    public void setRmaUniqueId(final Integer rmaUniqueId) {
        this.rmaUniqueId = rmaUniqueId;
    }

    public Integer getRmaNo() {
        return rmaNo;
    }

    public void setRmaNo(final Integer rmaNo) {
        this.rmaNo = rmaNo;
    }

    public String getInvName() {
        return invName;
    }

    public void setInvName(final String invName) {
        this.invName = invName;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(final Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getRmaItemQty() {
        return rmaItemQty;
    }

    public void setRmaItemQty(final Integer rmaItemQty) {
        this.rmaItemQty = rmaItemQty;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(final Double total) {
        this.total = total;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(final String reason) {
        this.reason = reason;
    }

    public String getAction() {
        return action;
    }

    public void setAction(final String action) {
        this.action = action;
    }

    public Integer getSubstituteInvoiceOrderNumber() {
        return substituteInvoiceOrderNumber;
    }

    public void setSubstituteInvoiceOrderNumber(final Integer substituteInvoiceOrderNumber) {
        this.substituteInvoiceOrderNumber = substituteInvoiceOrderNumber;
    }

    public Boolean getIsPaymentCompleted() {
        return isPaymentCompleted;
    }

    public void setIsPaymentCompleted(final Boolean isPaymentCompleted) {
        this.isPaymentCompleted = isPaymentCompleted;
    }

    public Double getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(final Double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(final Double balance) {
        this.balance = balance;
    }

    public Integer getRmaItemId() {
        return rmaItemId;
    }

    public void setRmaItemId(final Integer rmaItemId) {
        this.rmaItemId = rmaItemId;
    }

    public Boolean getIsAdjusted() {
        return isAdjusted;
    }

    public void setIsAdjusted(final Boolean isAdjusted) {
        this.isAdjusted = isAdjusted;
    }

    public Integer getTotalAdjustedQty() {
        return totalAdjustedQty;
    }

    public void setTotalAdjustedQty(final Integer totalAdjustedQty) {
        this.totalAdjustedQty = totalAdjustedQty;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(final Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public BcaCart getCart() {
        return cart;
    }

    public void setCart(final BcaCart cart) {
        this.cart = cart;
    }

    public BcaMasterrmareason getParentReason() {
        return parentReason;
    }

    public void setParentReason(final BcaMasterrmareason parentReason) {
        this.parentReason = parentReason;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

}
