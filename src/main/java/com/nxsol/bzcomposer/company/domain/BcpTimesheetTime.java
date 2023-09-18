package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcpTimesheetTime {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer employeeId;

    @Column(nullable = false)
    private OffsetDateTime day;

    @Column
    private OffsetDateTime timeOut;

    @Column
    private OffsetDateTime timeIn;

    @Column(length = 50)
    private String jobLocation;

    @Column
    private Boolean payrolled;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id")
    private BcpJobcode job;

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(final Integer employeeId) {
        this.employeeId = employeeId;
    }

    public OffsetDateTime getDay() {
        return day;
    }

    public void setDay(final OffsetDateTime day) {
        this.day = day;
    }

    public OffsetDateTime getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(final OffsetDateTime timeOut) {
        this.timeOut = timeOut;
    }

    public OffsetDateTime getTimeIn() {
        return timeIn;
    }

    public void setTimeIn(final OffsetDateTime timeIn) {
        this.timeIn = timeIn;
    }

    public String getJobLocation() {
        return jobLocation;
    }

    public void setJobLocation(final String jobLocation) {
        this.jobLocation = jobLocation;
    }

    public Boolean getPayrolled() {
        return payrolled;
    }

    public void setPayrolled(final Boolean payrolled) {
        this.payrolled = payrolled;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcpJobcode getJob() {
        return job;
    }

    public void setJob(final BcpJobcode job) {
        this.job = job;
    }

}
