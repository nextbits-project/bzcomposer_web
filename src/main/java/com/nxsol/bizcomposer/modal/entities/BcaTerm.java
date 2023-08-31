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
    private Set<BcaInvoicememorized> termBcaInvoicememorizeds;

    @OneToMany(mappedBy = "term")
    private Set<BcaInvoiceshipped> termBcaInvoiceshippeds;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

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

}
