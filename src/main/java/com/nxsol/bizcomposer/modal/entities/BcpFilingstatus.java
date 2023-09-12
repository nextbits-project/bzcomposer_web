package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
    private Integer companyId;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "filingStatus")
    private Set<BcpEmployee> filingStatusBcpEmployees;

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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

}
