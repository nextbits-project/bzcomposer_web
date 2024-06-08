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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RmaItemID")
    private int rmaItemId;

    @ManyToOne
    @JoinColumn(name = "Rma_No")
    private BcaRma rmaNo;

    @ManyToOne
    @JoinColumn(name = "CartID")
    private BcaCart cart;

    @ManyToOne
    @JoinColumn(name = "InventoryID")
    private BcaIteminventory inventory;

    @Column(name = "InvName")
    private String invName;

    @Column(name = "UnitPrice")
    private Double unitPrice;

    @Column(name = "RmaItemQty")
    private int rmaItemQty;

    @Column(name = "Total")
    private Double total;

    @ManyToOne
    @JoinColumn(name = "ReasonID")
    private BcaRmareason reason;

    @Column(name = "Reason")
    private String reasonText;

    @Column(name = "Action")
    private String action;

    @Column(name = "SubstituteInvoiceOrderNumber")
    private String substituteInvoiceOrderNumber;

    @Column(name = "IsPaymentCompleted")
    private boolean isPaymentCompleted;

    @Column(name = "PaidAmount")
    private Double paidAmount;

    @Column(name = "Balance")
    private Double balance;

    @Column(name = "isAdjusted")
    private boolean isAdjusted;

    @Column(name = "TotalAdjustedQty")
    private int totalAdjustedQty;

    @Column(name = "isDeleted")
    private boolean isDeleted;

	public int getRmaItemId() {
		return rmaItemId;
	}

	public void setRmaItemId(int rmaItemId) {
		this.rmaItemId = rmaItemId;
	}

	public BcaRma getRma() {
		return rmaNo;
	}

	public void setRma(BcaRma rmaNo) {
		this.rmaNo = rmaNo;
	}

	public BcaCart getCart() {
		return cart;
	}

	public void setCart(BcaCart cart) {
		this.cart = cart;
	}

	public BcaIteminventory getInventory() {
		return inventory;
	}

	public void setInventory(BcaIteminventory inventory) {
		this.inventory = inventory;
	}

	public String getInvName() {
		return invName;
	}

	public void setInvName(String invName) {
		this.invName = invName;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getRmaItemQty() {
		return rmaItemQty;
	}

	public void setRmaItemQty(int rmaItemQty) {
		this.rmaItemQty = rmaItemQty;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public BcaRmareason getReason() {
		return reason;
	}

	public void setReason(BcaRmareason reason) {
		this.reason = reason;
	}

	public String getReasonText() {
		return reasonText;
	}

	public void setReasonText(String reasonText) {
		this.reasonText = reasonText;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getSubstituteInvoiceOrderNumber() {
		return substituteInvoiceOrderNumber;
	}

	public void setSubstituteInvoiceOrderNumber(String substituteInvoiceOrderNumber) {
		this.substituteInvoiceOrderNumber = substituteInvoiceOrderNumber;
	}

	public boolean isPaymentCompleted() {
		return isPaymentCompleted;
	}

	public void setPaymentCompleted(boolean isPaymentCompleted) {
		this.isPaymentCompleted = isPaymentCompleted;
	}

	public Double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public boolean isAdjusted() {
		return isAdjusted;
	}

	public void setAdjusted(boolean isAdjusted) {
		this.isAdjusted = isAdjusted;
	}

	public int getTotalAdjustedQty() {
		return totalAdjustedQty;
	}

	public void setTotalAdjustedQty(int totalAdjustedQty) {
		this.totalAdjustedQty = totalAdjustedQty;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}


}
