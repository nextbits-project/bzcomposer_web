package com.nxsol.bzcomposer.company.domain;

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
public class BcaSalesrep {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer salesRepId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "salesRep")
    private Set<BcaLead> salesRepBcaLeads;

    @OneToMany(mappedBy = "salesRep")
    private Set<BcaRefundlist> salesRepBcaRefundlists;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "salesRep")
    private Set<StorageClientvendor> salesRepStorageClientvendors;

    @OneToMany(mappedBy = "salesRep")
    private Set<StorageInvoice> salesRepStorageInvoices;

//    @OneToMany(mappedBy = "salesRep")
//    private Set<StorageInvoice> salesRepStorageInvoices;

    public Integer getSalesRepId() {
        return salesRepId;
    }

    public void setSalesRepId(final Integer salesRepId) {
        this.salesRepId = salesRepId;
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

    public Set<BcaLead> getSalesRepBcaLeads() {
        return salesRepBcaLeads;
    }

    public void setSalesRepBcaLeads(final Set<BcaLead> salesRepBcaLeads) {
        this.salesRepBcaLeads = salesRepBcaLeads;
    }

    public Set<BcaRefundlist> getSalesRepBcaRefundlists() {
        return salesRepBcaRefundlists;
    }

    public void setSalesRepBcaRefundlists(final Set<BcaRefundlist> salesRepBcaRefundlists) {
        this.salesRepBcaRefundlists = salesRepBcaRefundlists;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<StorageClientvendor> getSalesRepStorageClientvendors() {
        return salesRepStorageClientvendors;
    }

    public void setSalesRepStorageClientvendors(
            final Set<StorageClientvendor> salesRepStorageClientvendors) {
        this.salesRepStorageClientvendors = salesRepStorageClientvendors;
    }

//    public Set<StorageInvoice> getSalesRepStorageInvoices() {
//        return salesRepStorageInvoices;
//    }

//    public void setSalesRepStorageInvoices(final Set<StorageInvoice> salesRepStorageInvoices) {
//        this.salesRepStorageInvoices = salesRepStorageInvoices;
//    }

    public Set<StorageInvoice> getSalesRepStorageInvoices() {
        return salesRepStorageInvoices;
    }

    public void setSalesRepStorageInvoices(final Set<StorageInvoice> salesRepStorageInvoices) {
        this.salesRepStorageInvoices = salesRepStorageInvoices;
    }

}
