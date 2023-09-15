package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.math.BigDecimal;
import java.util.Set;


@Entity
public class BcpJobcode {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer jobId;

    @Column(length = 50)
    private String name;

    @Column(precision = 23, scale = 4)
    private BigDecimal cost;

    @Column(name = "\"description\"", length = 60)
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
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
