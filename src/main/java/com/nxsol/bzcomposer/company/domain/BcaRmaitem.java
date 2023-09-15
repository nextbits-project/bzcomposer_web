package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaRmaitem {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rmaUniqueId;

    @Column
    private Integer rmaNo;

    @Column(length = 50)
    private String invName;

    @Column
    private Double unitPrice;

    @Column
    private Integer rmaItemQty;

    @Column
    private Double total;

    @Column(length = 50)
    private String reason;

    @Column(length = 50)
    private String action;

    @Column
    private Integer substituteInvoiceOrderNumber;

    @Column
    private Boolean isPaymentCompleted;

    @Column
    private Double paidAmount;

    @Column
    private Double balance;

    @Column
    private Integer rmaItemId;

    @Column
    private Boolean isAdjusted;

    @Column
    private Integer totalAdjustedQty;

    @Column
    private Integer isDeleted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cart_id")
    private BcaCart cart;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_reason_id")
    private BcaMasterrmareason parentReason;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id", nullable = false)
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
