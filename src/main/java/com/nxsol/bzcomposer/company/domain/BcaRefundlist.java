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
@Table(name="bca_refundlist")
public class BcaRefundlist {

    @Id
    @Column(name = "RefundID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer refundId;

    @Column(name="OrderNum")
    private Integer orderNum;

    @Column(name="Amount")
    private Double amount;

    @Column(name="DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name="Status")
    private Integer status;

    @Column(name="RefundReasonID")
    private Integer refundReasonId;

    @Column(name="InvoiceStatus")
    private Integer invoiceStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceTypeID")
    private BcaInvoicetype invoiceType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentID")
    private BcaPayment payment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentTypeID")
    private BcaPaymenttype paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OrderPaymentTypeID")
    private BcaPaymenttype orderPaymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SalesRepID")
    private BcaSalesrep salesRep;

    public Integer getRefundId() {
        return refundId;
    }

    public void setRefundId(final Integer refundId) {
        this.refundId = refundId;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(final Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(final Double amount) {
        this.amount = amount;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(final Integer status) {
        this.status = status;
    }

    public Integer getRefundReasonId() {
        return refundReasonId;
    }

    public void setRefundReasonId(final Integer refundReasonId) {
        this.refundReasonId = refundReasonId;
    }

    public Integer getInvoiceStatus() {
        return invoiceStatus;
    }

    public void setInvoiceStatus(final Integer invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaInvoicetype getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(final BcaInvoicetype invoiceType) {
        this.invoiceType = invoiceType;
    }

    public BcaPayment getPayment() {
        return payment;
    }

    public void setPayment(final BcaPayment payment) {
        this.payment = payment;
    }

    public BcaPaymenttype getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(final BcaPaymenttype paymentType) {
        this.paymentType = paymentType;
    }

    public BcaPaymenttype getOrderPaymentType() {
        return orderPaymentType;
    }

    public void setOrderPaymentType(final BcaPaymenttype orderPaymentType) {
        this.orderPaymentType = orderPaymentType;
    }

    public BcaSalesrep getSalesRep() {
        return salesRep;
    }

    public void setSalesRep(final BcaSalesrep salesRep) {
        this.salesRep = salesRep;
    }

}
