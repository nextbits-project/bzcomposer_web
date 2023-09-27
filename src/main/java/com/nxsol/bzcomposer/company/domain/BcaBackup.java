package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class BcaBackup {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer companyId;

    @Column
    private OffsetDateTime startDate;

    @Column
    private Integer day;

    @Column
    private Integer hours;

    @Column
    private Integer minutes;

    @Column(name = "\"description\"")
    private String description;

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public OffsetDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(final OffsetDateTime startDate) {
        this.startDate = startDate;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(final Integer day) {
        this.day = day;
    }

    public Integer getHours() {
        return hours;
    }

    public void setHours(final Integer hours) {
        this.hours = hours;
    }

    public Integer getMinutes() {
        return minutes;
    }

    public void setMinutes(final Integer minutes) {
        this.minutes = minutes;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

}