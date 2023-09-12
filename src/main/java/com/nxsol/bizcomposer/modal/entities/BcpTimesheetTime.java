package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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

    @Column
    private Integer jobId;

    @Column(length = 50)
    private String jobLocation;

    @Column
    private Integer companyId;

    @Column
    private Boolean payrolled;

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

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(final Integer jobId) {
        this.jobId = jobId;
    }

    public String getJobLocation() {
        return jobLocation;
    }

    public void setJobLocation(final String jobLocation) {
        this.jobLocation = jobLocation;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public Boolean getPayrolled() {
        return payrolled;
    }

    public void setPayrolled(final Boolean payrolled) {
        this.payrolled = payrolled;
    }

}
