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
public class BcpJobtitle {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer jobTitleId;

    @Column(length = 50)
    private String jobTitle;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "jobTitle")
    private Set<BcpEmployee> jobTitleBcpEmployees;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getJobTitleId() {
        return jobTitleId;
    }

    public void setJobTitleId(final Integer jobTitleId) {
        this.jobTitleId = jobTitleId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(final String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcpEmployee> getJobTitleBcpEmployees() {
        return jobTitleBcpEmployees;
    }

    public void setJobTitleBcpEmployees(final Set<BcpEmployee> jobTitleBcpEmployees) {
        this.jobTitleBcpEmployees = jobTitleBcpEmployees;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
