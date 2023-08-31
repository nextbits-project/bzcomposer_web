package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaSalestax {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer salesTaxId;

    @Column(length = 50)
    private String state;

    @Column
    private Double rate;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "salesRep")
    private Set<BcaInvoicememorized> salesRepBcaInvoicememorizeds;

    @OneToMany(mappedBy = "salesTax")
    private Set<BcaInvoicememorized> salesTaxBcaInvoicememorizeds;

    @OneToMany(mappedBy = "salesTax")
    private Set<BcaInvoiceshipped> salesTaxBcaInvoiceshippeds;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id", nullable = false)
    private BcaCompany company;

    public Integer getSalesTaxId() {
        return salesTaxId;
    }

    public void setSalesTaxId(final Integer salesTaxId) {
        this.salesTaxId = salesTaxId;
    }

    public String getState() {
        return state;
    }

    public void setState(final String state) {
        this.state = state;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(final Double rate) {
        this.rate = rate;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcaInvoicememorized> getSalesRepBcaInvoicememorizeds() {
        return salesRepBcaInvoicememorizeds;
    }

    public void setSalesRepBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> salesRepBcaInvoicememorizeds) {
        this.salesRepBcaInvoicememorizeds = salesRepBcaInvoicememorizeds;
    }

    public Set<BcaInvoicememorized> getSalesTaxBcaInvoicememorizeds() {
        return salesTaxBcaInvoicememorizeds;
    }

    public void setSalesTaxBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> salesTaxBcaInvoicememorizeds) {
        this.salesTaxBcaInvoicememorizeds = salesTaxBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getSalesTaxBcaInvoiceshippeds() {
        return salesTaxBcaInvoiceshippeds;
    }

    public void setSalesTaxBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> salesTaxBcaInvoiceshippeds) {
        this.salesTaxBcaInvoiceshippeds = salesTaxBcaInvoiceshippeds;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
