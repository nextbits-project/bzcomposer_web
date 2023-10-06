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
@Table(name= "bca_lead_source")
public class BcaLeadSource {

    @Id
    @Column(name= "LeadSourceID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadSourceId;

    @Column(name= "Name")
    private String name;

    @Column(name = "Description")
    private String description;

    @OneToMany(mappedBy = "leadSource")
    private Set<BcaLead> leadSourceBcaLeads;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
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
