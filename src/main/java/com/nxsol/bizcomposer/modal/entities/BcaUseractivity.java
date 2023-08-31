package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaUseractivity {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userActivityId;

    @Column
    private OffsetDateTime dateAdded;

    @Column(length = 50)
    private String inTime;

    @Column(length = 50)
    private String outTime;

    @Column(length = 100)
    private String modulee;

    @Column
    private String activity;

    @Column
    private Integer dataId;

    @Column(columnDefinition = "longtext")
    private String dataDescription;

    @Column
    private Double dataAmount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private BcaStore store;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private BcaUser user;

    public Integer getUserActivityId() {
        return userActivityId;
    }

    public void setUserActivityId(final Integer userActivityId) {
        this.userActivityId = userActivityId;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getInTime() {
        return inTime;
    }

    public void setInTime(final String inTime) {
        this.inTime = inTime;
    }

    public String getOutTime() {
        return outTime;
    }

    public void setOutTime(final String outTime) {
        this.outTime = outTime;
    }

    public String getModulee() {
        return modulee;
    }

    public void setModulee(final String modulee) {
        this.modulee = modulee;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(final String activity) {
        this.activity = activity;
    }

    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(final Integer dataId) {
        this.dataId = dataId;
    }

    public String getDataDescription() {
        return dataDescription;
    }

    public void setDataDescription(final String dataDescription) {
        this.dataDescription = dataDescription;
    }

    public Double getDataAmount() {
        return dataAmount;
    }

    public void setDataAmount(final Double dataAmount) {
        this.dataAmount = dataAmount;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaStore getStore() {
        return store;
    }

    public void setStore(final BcaStore store) {
        this.store = store;
    }

    public BcaUser getUser() {
        return user;
    }

    public void setUser(final BcaUser user) {
        this.user = user;
    }

}
