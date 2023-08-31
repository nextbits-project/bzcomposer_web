package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcpFedrate {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Double rateSs;

    @Column
    private Double rateMed;

    @Column
    private Double limitSs;

    @Column
    private Double rateFuta;

    @Column
    private Double limitFuta;

    @Column
    private Double maxCrRate;

    @Column
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
