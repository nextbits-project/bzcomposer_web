package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Table;


@Entity
@Table(name= "bcp_sttaxrate")
public class BcpSttaxrate {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "RateSdi")
    private Double rateSdi;

    @Column(name= "LimitSdi")
    private Double limitSdi;

    @Column(name= "OtherName", length = 50)
    private String otherName;

    @Column(name= "OtherRate")
    private Double otherRate;

    @Column(name= "RateSui")
    private Double rateSui;

    @Column(name= "OverRate")
    private Double overRate;

    @Column(name= "StateName", length = 50)
    private String stateName;

    @Column(name= "EYear")
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
