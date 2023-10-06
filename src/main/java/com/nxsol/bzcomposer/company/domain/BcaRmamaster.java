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
@Table(name="bca_rmamaster")
public class BcaRmamaster {

    @Id
    @Column(name="RmaID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rmaId;

    @Column(name="RmaNo")
    private Integer rmaNo;

    @Column(name="OrderNo")
    private Integer orderNo;

    @Column(name="RmaQty")
    private Integer rmaQty;

    @Column(name="DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name="Status", length = 50)
    private String status;

    @Column(name="Memo", length = 150)
    private String memo;

    @Column(name="RefRMANo")
    private Integer refRmano;

    @Column(name="Active")
    private Integer active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceTypeID")
    private BcaInvoicetype invoiceType;

    public Integer getRmaId() {
        return rmaId;
    }

    public void setRmaId(final Integer rmaId) {
        this.rmaId = rmaId;
    }

    public Integer getRmaNo() {
        return rmaNo;
    }

    public void setRmaNo(final Integer rmaNo) {
        this.rmaNo = rmaNo;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(final Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getRmaQty() {
        return rmaQty;
    }

    public void setRmaQty(final Integer rmaQty) {
        this.rmaQty = rmaQty;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public Integer getRefRmano() {
        return refRmano;
    }

    public void setRefRmano(final Integer refRmano) {
        this.refRmano = refRmano;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
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

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
    }

    public BcaInvoicetype getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(final BcaInvoicetype invoiceType) {
        this.invoiceType = invoiceType;
    }

}
