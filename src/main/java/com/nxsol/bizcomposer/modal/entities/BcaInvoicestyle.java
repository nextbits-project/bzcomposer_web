package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaInvoicestyle {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invoiceStyleId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<BcaInvoicememorized> invoiceStyleBcaInvoicememorizeds;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<BcaInvoiceshipped> invoiceStyleBcaInvoiceshippeds;

    @OneToMany(mappedBy = "invoiceStyle")
    private Set<BcaServicetype> invoiceStyleBcaServicetypes;

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

    public Set<BcaServicetype> getInvoiceStyleBcaServicetypes() {
        return invoiceStyleBcaServicetypes;
    }

    public void setInvoiceStyleBcaServicetypes(
            final Set<BcaServicetype> invoiceStyleBcaServicetypes) {
        this.invoiceStyleBcaServicetypes = invoiceStyleBcaServicetypes;
    }

}
