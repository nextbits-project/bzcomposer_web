package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaInvoicetype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invoiceTypeId;

    @Column(length = 50)
    private String name;

    @Column
    private Double qtyReduction;

    @Column
    private Boolean payable;

    @Column
    private Boolean receivable;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "invoiceType")
    private Set<BcaInvoice> invoiceTypeBcaInvoices;

    @OneToMany(mappedBy = "invoiceType")
    private Set<BcaInvoicecredit> invoiceTypeBcaInvoicecredits;

    @OneToMany(mappedBy = "invoiceType")
    private Set<BcaInvoicememorized> invoiceTypeBcaInvoicememorizeds;

    @OneToMany(mappedBy = "invoiceType")
    private Set<BcaInvoiceshipped> invoiceTypeBcaInvoiceshippeds;

    @OneToMany(mappedBy = "invoiceType")
    private Set<BcaRefundlist> invoiceTypeBcaRefundlists;

    @OneToMany(mappedBy = "invoiceType")
    private Set<BcaRmamaster> invoiceTypeBcaRmamasters;

//    @OneToMany(mappedBy = "invoiceType")
//    private Set<StorageInvoice> invoiceTypeStorageInvoices;

    @OneToMany(mappedBy = "invoiceType")
    private Set<StorageInvoice> invoiceTypeStorageInvoices;

    public Integer getInvoiceTypeId() {
        return invoiceTypeId;
    }

    public void setInvoiceTypeId(final Integer invoiceTypeId) {
        this.invoiceTypeId = invoiceTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Double getQtyReduction() {
        return qtyReduction;
    }

    public void setQtyReduction(final Double qtyReduction) {
        this.qtyReduction = qtyReduction;
    }

    public Boolean getPayable() {
        return payable;
    }

    public void setPayable(final Boolean payable) {
        this.payable = payable;
    }

    public Boolean getReceivable() {
        return receivable;
    }

    public void setReceivable(final Boolean receivable) {
        this.receivable = receivable;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcaInvoice> getInvoiceTypeBcaInvoices() {
        return invoiceTypeBcaInvoices;
    }

    public void setInvoiceTypeBcaInvoices(final Set<BcaInvoice> invoiceTypeBcaInvoices) {
        this.invoiceTypeBcaInvoices = invoiceTypeBcaInvoices;
    }

    public Set<BcaInvoicecredit> getInvoiceTypeBcaInvoicecredits() {
        return invoiceTypeBcaInvoicecredits;
    }

    public void setInvoiceTypeBcaInvoicecredits(
            final Set<BcaInvoicecredit> invoiceTypeBcaInvoicecredits) {
        this.invoiceTypeBcaInvoicecredits = invoiceTypeBcaInvoicecredits;
    }

    public Set<BcaInvoicememorized> getInvoiceTypeBcaInvoicememorizeds() {
        return invoiceTypeBcaInvoicememorizeds;
    }

    public void setInvoiceTypeBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> invoiceTypeBcaInvoicememorizeds) {
        this.invoiceTypeBcaInvoicememorizeds = invoiceTypeBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getInvoiceTypeBcaInvoiceshippeds() {
        return invoiceTypeBcaInvoiceshippeds;
    }

    public void setInvoiceTypeBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> invoiceTypeBcaInvoiceshippeds) {
        this.invoiceTypeBcaInvoiceshippeds = invoiceTypeBcaInvoiceshippeds;
    }

    public Set<BcaRefundlist> getInvoiceTypeBcaRefundlists() {
        return invoiceTypeBcaRefundlists;
    }

    public void setInvoiceTypeBcaRefundlists(final Set<BcaRefundlist> invoiceTypeBcaRefundlists) {
        this.invoiceTypeBcaRefundlists = invoiceTypeBcaRefundlists;
    }

    public Set<BcaRmamaster> getInvoiceTypeBcaRmamasters() {
        return invoiceTypeBcaRmamasters;
    }

    public void setInvoiceTypeBcaRmamasters(final Set<BcaRmamaster> invoiceTypeBcaRmamasters) {
        this.invoiceTypeBcaRmamasters = invoiceTypeBcaRmamasters;
    }

//    public Set<StorageInvoice> getInvoiceTypeStorageInvoices() {
//        return invoiceTypeStorageInvoices;
//    }

//    public void setInvoiceTypeStorageInvoices(
//            final Set<StorageInvoice> invoiceTypeStorageInvoices) {
//        this.invoiceTypeStorageInvoices = invoiceTypeStorageInvoices;
//    }

    public Set<StorageInvoice> getInvoiceTypeStorageInvoices() {
        return invoiceTypeStorageInvoices;
    }

    public void setInvoiceTypeStorageInvoices(
            final Set<StorageInvoice> invoiceTypeStorageInvoices) {
        this.invoiceTypeStorageInvoices = invoiceTypeStorageInvoices;
    }

}
