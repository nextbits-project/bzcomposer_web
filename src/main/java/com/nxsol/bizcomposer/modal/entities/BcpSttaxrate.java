package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcpSttaxrate {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Double rateSdi;

    @Column
    private Double limitSdi;

    @Column(length = 50)
    private String otherName;

    @Column
    private Double otherRate;

    @Column
    private Double rateSui;

    @Column
    private Double overRate;

    @Column(length = 50)
    private String stateName;

    @Column
    private Integer eyear;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Double getRateSdi() {
        return rateSdi;
    }

    public void setRateSdi(final Double rateSdi) {
        this.rateSdi = rateSdi;
    }

    public Double getLimitSdi() {
        return limitSdi;
    }

    public void setLimitSdi(final Double limitSdi) {
        this.limitSdi = limitSdi;
    }

    public String getOtherName() {
        return otherName;
    }

    public void setOtherName(final String otherName) {
        this.otherName = otherName;
    }

    public Double getOtherRate() {
        return otherRate;
    }

    public void setOtherRate(final Double otherRate) {
        this.otherRate = otherRate;
    }

    public Double getRateSui() {
        return rateSui;
    }

    public void setRateSui(final Double rateSui) {
        this.rateSui = rateSui;
    }

    public Double getOverRate() {
        return overRate;
    }

    public void setOverRate(final Double overRate) {
        this.overRate = overRate;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(final String stateName) {
        this.stateName = stateName;
    }

    public Integer getEyear() {
        return eyear;
    }

    public void setEyear(final Integer eyear) {
        this.eyear = eyear;
    }

}
