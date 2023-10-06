package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bca_invoicestyle")
public class BcaInvoicestyle {

    @Id
    @Column(name = "InvoiceStyleID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invoiceStyleId;

    @Column(name = "Name", length = 50)
    private String name;

    @Column(name= "Active")
    private Integer active;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<BcaInvoice> invoiceStyleBcaInvoices;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<BcaInvoicememorized> invoiceStyleBcaInvoicememorizeds;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<BcaInvoiceshipped> invoiceStyleBcaInvoiceshippeds;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<BcaPreference> invoiceStyleBcaPreferences;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<BcaServicetype> invoiceStyleBcaServicetypes;

//    @OneToMany(mappedBy = "invoiceStyle") duplicate field
//    private Set<StorageInvoice> invoiceStyleStorageInvoices;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<StorageInvoice> invoiceStyleStorageInvoices;

    public Integer getInvoiceStyleId() {
        return invoiceStyleId;
    }

    public void setInvoiceStyleId(final Integer invoiceStyleId) {
        this.invoiceStyleId = invoiceStyleId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcaInvoice> getInvoiceStyleBcaInvoices() {
        return invoiceStyleBcaInvoices;
    }

    public void setInvoiceStyleBcaInvoices(final Set<BcaInvoice> invoiceStyleBcaInvoices) {
        this.invoiceStyleBcaInvoices = invoiceStyleBcaInvoices;
    }

    public Set<BcaInvoicememorized> getInvoiceStyleBcaInvoicememorizeds() {
        return invoiceStyleBcaInvoicememorizeds;
    }

    public void setInvoiceStyleBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> invoiceStyleBcaInvoicememorizeds) {
        this.invoiceStyleBcaInvoicememorizeds = invoiceStyleBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getInvoiceStyleBcaInvoiceshippeds() {
        return invoiceStyleBcaInvoiceshippeds;
    }

    public void setInvoiceStyleBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> invoiceStyleBcaInvoiceshippeds) {
        this.invoiceStyleBcaInvoiceshippeds = invoiceStyleBcaInvoiceshippeds;
    }

    public Set<BcaPreference> getInvoiceStyleBcaPreferences() {
        return invoiceStyleBcaPreferences;
    }

    public void setInvoiceStyleBcaPreferences(final Set<BcaPreference> invoiceStyleBcaPreferences) {
        this.invoiceStyleBcaPreferences = invoiceStyleBcaPreferences;
    }

    public Set<BcaServicetype> getInvoiceStyleBcaServicetypes() {
        return invoiceStyleBcaServicetypes;
    }

    public void setInvoiceStyleBcaServicetypes(
            final Set<BcaServicetype> invoiceStyleBcaServicetypes) {
        this.invoiceStyleBcaServicetypes = invoiceStyleBcaServicetypes;
    }

//    public Set<StorageInvoice> getInvoiceStyleStorageInvoices() {
//        return invoiceStyleStorageInvoices;
//    }

//    public void setInvoiceStyleStorageInvoices(
//            final Set<StorageInvoice> invoiceStyleStorageInvoices) {
//        this.invoiceStyleStorageInvoices = invoiceStyleStorageInvoices;
//    }

    public Set<StorageInvoice> getInvoiceStyleStorageInvoices() {
        return invoiceStyleStorageInvoices;
    }

    public void setInvoiceStyleStorageInvoices(
            final Set<StorageInvoice> invoiceStyleStorageInvoices) {
        this.invoiceStyleStorageInvoices = invoiceStyleStorageInvoices;
    }

}
