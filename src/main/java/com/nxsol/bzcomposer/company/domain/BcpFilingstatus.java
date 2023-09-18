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
public class BcpFilingstatus {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer filingStatusId;

    @Column(length = 50)
    private String filingStatus;

    @Column
    private Integer active;


    @OneToMany(mappedBy = "filingStatus")
    private Set<BcpEmployee> filingStatusBcpEmployees;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getFilingStatusId() {
        return filingStatusId;
    }

    public void setFilingStatusId(final Integer filingStatusId) {
        this.filingStatusId = filingStatusId;
    }

    public String getFilingStatus() {
        return filingStatus;
    }

    public void setFilingStatus(final String filingStatus) {
        this.filingStatus = filingStatus;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcpEmployee> getFilingStatusBcpEmployees() {
        return filingStatusBcpEmployees;
    }

    public void setFilingStatusBcpEmployees(final Set<BcpEmployee> filingStatusBcpEmployees) {
        this.filingStatusBcpEmployees = filingStatusBcpEmployees;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
