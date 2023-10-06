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
import javax.persistence.Table;

@Entity
@Table(name= "bca_clientvendorjob")
public class BcaClientvendorjob {

    @Id
    @Column(name = "JobCategoryID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer jobCategoryId;

    @Column(name= "Active")
    private Integer active;

    @Column(name= "dateAdded")
    private OffsetDateTime dateAdded;

    @Column(name= "startDate")
    private OffsetDateTime startDate;

    @Column(name= "terminateDate")
    private OffsetDateTime terminateDate;

    @Column(name= "isRecurringServiceJob")
    private Integer isRecurringServiceJob;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    public Integer getJobCategoryId() {
        return jobCategoryId;
    }

    public void setJobCategoryId(final Integer jobCategoryId) {
        this.jobCategoryId = jobCategoryId;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public OffsetDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(final OffsetDateTime startDate) {
        this.startDate = startDate;
    }

    public OffsetDateTime getTerminateDate() {
        return terminateDate;
    }

    public void setTerminateDate(final OffsetDateTime terminateDate) {
        this.terminateDate = terminateDate;
    }

    public Integer getIsRecurringServiceJob() {
        return isRecurringServiceJob;
    }

    public void setIsRecurringServiceJob(final Integer isRecurringServiceJob) {
        this.isRecurringServiceJob = isRecurringServiceJob;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

}
