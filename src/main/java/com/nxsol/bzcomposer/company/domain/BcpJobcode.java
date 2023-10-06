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
import java.math.BigDecimal;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_jobcode")
public class BcpJobcode {

    @Id
    @Column(name= "JobID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer jobId;

    @Column(name= "Name", length = 50)
    private String name;

    @Column(name= "Cost", precision = 23, scale = 4)
    private BigDecimal cost;

    @Column(name = "Description", length = 60)
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @OneToMany(mappedBy = "job")
    private Set<BcpTimesheetTime> jobBcpTimesheetTimes;

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(final Integer jobId) {
        this.jobId = jobId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(final BigDecimal cost) {
        this.cost = cost;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcpTimesheetTime> getJobBcpTimesheetTimes() {
        return jobBcpTimesheetTimes;
    }

    public void setJobBcpTimesheetTimes(final Set<BcpTimesheetTime> jobBcpTimesheetTimes) {
        this.jobBcpTimesheetTimes = jobBcpTimesheetTimes;
    }

}
