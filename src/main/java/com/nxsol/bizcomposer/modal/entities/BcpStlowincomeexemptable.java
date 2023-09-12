package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcpStlowincomeexemptable {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Double numTerm;

    @Column
    private Double isMarried;

    @Column
    private Double amt;

    @Column(length = 50)
    private String stateName;

    @Column
    private Double eyear;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Double getNumTerm() {
        return numTerm;
    }

    public void setNumTerm(final Double numTerm) {
        this.numTerm = numTerm;
    }

    public Double getIsMarried() {
        return isMarried;
    }

    public void setIsMarried(final Double isMarried) {
        this.isMarried = isMarried;
    }

    public Double getAmt() {
        return amt;
    }

    public void setAmt(final Double amt) {
        this.amt = amt;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(final String stateName) {
        this.stateName = stateName;
    }

    public Double getEyear() {
        return eyear;
    }

    public void setEyear(final Double eyear) {
        this.eyear = eyear;
    }

}
