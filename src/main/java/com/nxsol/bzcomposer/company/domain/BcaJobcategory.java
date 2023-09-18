package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BcaJobcategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer jobCategoryId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @Column
    private Integer isDefault;

    @Column
    private Integer isRecurringServiceJob;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getJobCategoryId() {
        return jobCategoryId;
    }

    public void setJobCategoryId(final Integer jobCategoryId) {
        this.jobCategoryId = jobCategoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(final Integer isDefault) {
        this.isDefault = isDefault;
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

}
