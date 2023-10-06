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
@Table(name= "storage_useractivity")
public class StorageUseractivity {

    @Id
    @Column(name= "UserActivityID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name= "dateAdded")
    private OffsetDateTime dateAdded;

    @Column(name= "InTime", length = 50)
    private String inTime;

    @Column(name= "OutTime", length = 50)
    private String outTime;

    @Column(name= "Module", length = 100)
    private String modulee;

    @Column(name= "Activity")
    private String activity;

    @Column(name= "DataID")
    private Integer dataId;

    @Column(name= "DataDescription", length = 100)
    private String dataDescription;

    @Column(name= "DataAmount")
    private Double dataAmount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID")
    private BcaUser user;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "UserActivityID", nullable = false)
//    private BcaUseractivity userActivity;

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
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

    public BcaUser getUser() {
        return user;
    }

    public void setUser(final BcaUser user) {
        this.user = user;
    }

//    public BcaUseractivity getUserActivity() {
//        return userActivity;
//    }
//
//    public void setUserActivity(final BcaUseractivity userActivity) {
//        this.userActivity = userActivity;
//    }

}
