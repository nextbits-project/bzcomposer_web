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
public class BcaLeadCategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadCategoryId;

    @Column
    private String name;

    @Column(name = "\"description\"")
    private String description;

    @OneToMany(mappedBy = "leadCategory")
    private Set<BcaLead> leadCategoryBcaLeads;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getLeadCategoryId() {
        return leadCategoryId;
    }

    public void setLeadCategoryId(final Integer leadCategoryId) {
        this.leadCategoryId = leadCategoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public Set<BcaLead> getLeadCategoryBcaLeads() {
        return leadCategoryBcaLeads;
    }

    public void setLeadCategoryBcaLeads(final Set<BcaLead> leadCategoryBcaLeads) {
        this.leadCategoryBcaLeads = leadCategoryBcaLeads;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}