package com.nxsol.bzcomposer.company.domain;

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
public class BcaScheduletimes {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer scheduleTime;

    @Column(nullable = false)
    private OffsetDateTime scheduleDate;

    @Column
    private Integer categeoryType;

    @Column
    private Integer scheduleMinute;

    @Column
    private Integer isCompleted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private BcaStore store;

    public Integer getScheduleTime() {
        return scheduleTime;
    }

    public void setScheduleTime(final Integer scheduleTime) {
        this.scheduleTime = scheduleTime;
    }

    public OffsetDateTime getScheduleDate() {
        return scheduleDate;
    }

    public void setScheduleDate(final OffsetDateTime scheduleDate) {
        this.scheduleDate = scheduleDate;
    }

    public Integer getCategeoryType() {
        return categeoryType;
    }

    public void setCategeoryType(final Integer categeoryType) {
        this.categeoryType = categeoryType;
    }

    public Integer getScheduleMinute() {
        return scheduleMinute;
    }

    public void setScheduleMinute(final Integer scheduleMinute) {
        this.scheduleMinute = scheduleMinute;
    }

    public Integer getIsCompleted() {
        return isCompleted;
    }

    public void setIsCompleted(final Integer isCompleted) {
        this.isCompleted = isCompleted;
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

}
