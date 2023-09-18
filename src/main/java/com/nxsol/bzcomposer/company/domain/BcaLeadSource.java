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
public class BcaLeadSource {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadSourceId;

    @Column
    private String name;

    @Column(name = "\"description\"")
    private String description;

    @OneToMany(mappedBy = "leadSource")
    private Set<BcaLead> leadSourceBcaLeads;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getLeadSourceId() {
        return leadSourceId;
    }

    public void setLeadSourceId(final Integer leadSourceId) {
        this.leadSourceId = leadSourceId;
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

    public Set<BcaLead> getLeadSourceBcaLeads() {
        return leadSourceBcaLeads;
    }

    public void setLeadSourceBcaLeads(final Set<BcaLead> leadSourceBcaLeads) {
        this.leadSourceBcaLeads = leadSourceBcaLeads;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
