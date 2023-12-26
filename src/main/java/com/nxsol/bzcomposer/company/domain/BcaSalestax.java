package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name="bca_salestax")
public class BcaSalestax {

    @Id
    @Column(name="SalesTaxID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer salesTaxId;

    @Column(name="State", length = 50)
    private String state;

    @Column(name="Rate")
    private Double rate;

    @Column(name="Active")
    private Integer active;

    @OneToMany(mappedBy = "salesTax")
    private Set<BcaCompany> salesTaxBcaCompanys;

    @OneToMany(mappedBy = "salesTax")
    private Set<BcaInvoice> salesTaxBcaInvoices;

    @OneToMany(mappedBy = "salesTax")
    private Set<BcaInvoicememorized> salesTaxBcaInvoicememorizeds;

    @OneToMany(mappedBy = "salesTax")
    private Set<BcaInvoiceshipped> salesTaxBcaInvoiceshippeds;

    @OneToMany(mappedBy = "salesTax")
    private Set<BcaPreference> salesTaxBcaPreferences;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID", nullable = false)
    private BcaCompany company;

    @OneToMany(mappedBy = "salesTax")
    private Set<StorageInvoice> salesTaxStorageInvoices;

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

    public Set<BcaCompany> getSalesTaxBcaCompanys() {
        return salesTaxBcaCompanys;
    }

    public void setSalesTaxBcaCompanys(final Set<BcaCompany> salesTaxBcaCompanys) {
        this.salesTaxBcaCompanys = salesTaxBcaCompanys;
    }

    public Set<BcaInvoice> getSalesTaxBcaInvoices() {
        return salesTaxBcaInvoices;
    }

    public void setSalesTaxBcaInvoices(final Set<BcaInvoice> salesTaxBcaInvoices) {
        this.salesTaxBcaInvoices = salesTaxBcaInvoices;
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

    public Set<BcaPreference> getSalesTaxBcaPreferences() {
        return salesTaxBcaPreferences;
    }

    public void setSalesTaxBcaPreferences(final Set<BcaPreference> salesTaxBcaPreferences) {
        this.salesTaxBcaPreferences = salesTaxBcaPreferences;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<StorageInvoice> getSalesTaxStorageInvoices() {
        return salesTaxStorageInvoices;
    }

    public void setSalesTaxStorageInvoices(final Set<StorageInvoice> salesTaxStorageInvoices) {
        this.salesTaxStorageInvoices = salesTaxStorageInvoices;
    }

}
