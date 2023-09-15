package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcpStwithholding {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Double isMarried;

    @Column
    private Double numTerm;

    @Column
    private Double amtCov1;

    @Column
    private Double amtCov2;

    @Column
    private Double rateTax;

    @Column
    private Double plusTax;

    @Column
    private String stateName;

    @Column
    private Double eyear;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Double getIsMarried() {
        return isMarried;
    }

    public void setIsMarried(final Double isMarried) {
        this.isMarried = isMarried;
    }

    public Double getNumTerm() {
        return numTerm;
    }

    public void setNumTerm(final Double numTerm) {
        this.numTerm = numTerm;
    }

    public Double getAmtCov1() {
        return amtCov1;
    }

    public void setAmtCov1(final Double amtCov1) {
        this.amtCov1 = amtCov1;
    }

    public Double getAmtCov2() {
        return amtCov2;
    }

    public void setAmtCov2(final Double amtCov2) {
        this.amtCov2 = amtCov2;
    }

    public Double getRateTax() {
        return rateTax;
    }

    public void setRateTax(final Double rateTax) {
        this.rateTax = rateTax;
    }

    public Double getPlusTax() {
        return plusTax;
    }

    public void setPlusTax(final Double plusTax) {
        this.plusTax = plusTax;
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
