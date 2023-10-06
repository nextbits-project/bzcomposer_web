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
@Table(name= "bcp_jobtitle")
public class BcpJobtitle {

    @Id
    @Column(name= "JobTitleID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer jobTitleId;

    @Column(name= "JobTitle", length = 50)
    private String jobTitle;

    @Column(name= "Active")
    private Integer active;

    @OneToMany(mappedBy = "jobTitle")
    private Set<BcpEmployee> jobTitleBcpEmployees;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
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
