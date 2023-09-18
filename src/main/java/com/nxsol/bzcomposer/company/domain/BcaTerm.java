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


@Entity
public class BcaTerm {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer termId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @Column
    private Integer days;

    @OneToMany(mappedBy = "term")
    private Set<BcaClientvendor> termBcaClientvendors;

    @OneToMany(mappedBy = "term")
    private Set<BcaInvoice> termBcaInvoices;

    @OneToMany(mappedBy = "term")
    private Set<BcaInvoicememorized> termBcaInvoicememorizeds;

    @OneToMany(mappedBy = "term")
    private Set<BcaInvoiceshipped> termBcaInvoiceshippeds;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "term")
    private Set<StorageClientvendor> termStorageClientvendors;

    @OneToMany(mappedBy = "term")
    private Set<StorageInvoice> termStorageInvoices;

    public Integer getTermId() {
        return termId;
    }

    public void setTermId(final Integer termId) {
        this.termId = termId;
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

    public Integer getDays() {
        return days;
    }

    public void setDays(final Integer days) {
        this.days = days;
    }

    public Set<BcaClientvendor> getTermBcaClientvendors() {
        return termBcaClientvendors;
    }

    public void setTermBcaClientvendors(final Set<BcaClientvendor> termBcaClientvendors) {
        this.termBcaClientvendors = termBcaClientvendors;
    }

    public Set<BcaInvoice> getTermBcaInvoices() {
        return termBcaInvoices;
    }

    public void setTermBcaInvoices(final Set<BcaInvoice> termBcaInvoices) {
        this.termBcaInvoices = termBcaInvoices;
    }

    public Set<BcaInvoicememorized> getTermBcaInvoicememorizeds() {
        return termBcaInvoicememorizeds;
    }

    public void setTermBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> termBcaInvoicememorizeds) {
        this.termBcaInvoicememorizeds = termBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getTermBcaInvoiceshippeds() {
        return termBcaInvoiceshippeds;
    }

    public void setTermBcaInvoiceshippeds(final Set<BcaInvoiceshipped> termBcaInvoiceshippeds) {
        this.termBcaInvoiceshippeds = termBcaInvoiceshippeds;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<StorageClientvendor> getTermStorageClientvendors() {
        return termStorageClientvendors;
    }

    public void setTermStorageClientvendors(
            final Set<StorageClientvendor> termStorageClientvendors) {
        this.termStorageClientvendors = termStorageClientvendors;
    }

    public Set<StorageInvoice> getTermStorageInvoices() {
        return termStorageInvoices;
    }

    public void setTermStorageInvoices(final Set<StorageInvoice> termStorageInvoices) {
        this.termStorageInvoices = termStorageInvoices;
    }

}
