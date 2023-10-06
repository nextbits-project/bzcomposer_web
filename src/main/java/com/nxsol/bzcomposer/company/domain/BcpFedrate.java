package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_fedrate")
public class BcpFedrate {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "RateSS")
    private Double rateSs;

    @Column(name= "RateMed")
    private Double rateMed;

    @Column(name= "LimitSS")
    private Double limitSs;

    @Column(name= "RateFuta")
    private Double rateFuta;

    @Column(name= "LimitFuta")
    private Double limitFuta;

    @Column(name= "MaxCrRate")
    private Double maxCrRate;

    @Column(name= "EYear")
    private Integer eyear;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Double getRateSs() {
        return rateSs;
    }

    public void setRateSs(final Double rateSs) {
        this.rateSs = rateSs;
    }

    public Double getRateMed() {
        return rateMed;
    }

    public void setRateMed(final Double rateMed) {
        this.rateMed = rateMed;
    }

    public Double getLimitSs() {
        return limitSs;
    }

    public void setLimitSs(final Double limitSs) {
        this.limitSs = limitSs;
    }

    public Double getRateFuta() {
        return rateFuta;
    }

    public void setRateFuta(final Double rateFuta) {
        this.rateFuta = rateFuta;
    }

    public Double getLimitFuta() {
        return limitFuta;
    }

    public void setLimitFuta(final Double limitFuta) {
        this.limitFuta = limitFuta;
    }

    public Double getMaxCrRate() {
        return maxCrRate;
    }

    public void setMaxCrRate(final Double maxCrRate) {
        this.maxCrRate = maxCrRate;
    }

    public Integer getEyear() {
        return eyear;
    }

    public void setEyear(final Integer eyear) {
        this.eyear = eyear;
    }

}
