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
@Table(name= "bca_consignmentsale")
public class BcaConsignmentsale {

    @Id
    @Column(name = "ConsignID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer consignId;

    @Column(name= "SupplierID")
    private Integer supplierId;

    @Column(name= "UnitPrice")
    private Double unitPrice;

    @Column(name= "OrderNum")
    private Integer orderNum;

    @Column(name= "PaidAmount")
    private Double paidAmount;

    @Column(name= "RemainingBalance")
    private Double remainingBalance;

    @Column(name= "IsPaymentCompleted")
    private Boolean isPaymentCompleted;

    @Column(name= "IsConsignedPaymentCompleted")
    private Boolean isConsignedPaymentCompleted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

    public Integer getConsignId() {
        return consignId;
    }

    public void setConsignId(final Integer consignId) {
        this.consignId = consignId;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(final Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(final Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(final Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Double getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(final Double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public Double getRemainingBalance() {
        return remainingBalance;
    }

    public void setRemainingBalance(final Double remainingBalance) {
        this.remainingBalance = remainingBalance;
    }

    public Boolean getIsPaymentCompleted() {
        return isPaymentCompleted;
    }

    public void setIsPaymentCompleted(final Boolean isPaymentCompleted) {
        this.isPaymentCompleted = isPaymentCompleted;
    }

    public Boolean getIsConsignedPaymentCompleted() {
        return isConsignedPaymentCompleted;
    }

    public void setIsConsignedPaymentCompleted(final Boolean isConsignedPaymentCompleted) {
        this.isConsignedPaymentCompleted = isConsignedPaymentCompleted;
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

}
