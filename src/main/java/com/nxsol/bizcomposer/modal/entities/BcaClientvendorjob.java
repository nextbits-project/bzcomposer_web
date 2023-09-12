package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class BcaClientvendorjob {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer clientVendorId;

    @Column
    private Integer jobCategoryId;

    @Column
    private Integer active;

    @Column
    private Integer companyId;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private OffsetDateTime startDate;

    @Column
    private OffsetDateTime terminateDate;

    @Column
    private Integer isRecurringServiceJob;

    public Integer getClientVendorId() {
        return clientVendorId;
    }

    public void setClientVendorId(final Integer clientVendorId) {
        this.clientVendorId = clientVendorId;
    }

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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

}
