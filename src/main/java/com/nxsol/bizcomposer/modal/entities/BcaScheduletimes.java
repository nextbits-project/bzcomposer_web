package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
    private Integer companyId;

    @Column
    private Integer storeId;

    @Column
    private Integer scheduleMinute;

    @Column
    private Integer isCompleted;

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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(final Integer storeId) {
        this.storeId = storeId;
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

}
