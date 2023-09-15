package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcpFedperallowance {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer numTerm;

    @Column
    private Double oneAllow;

    @Column
    private Integer eyear;

    @Column(length = 50)
    private String payrollPeriod;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Integer getNumTerm() {
        return numTerm;
    }

    public void setNumTerm(final Integer numTerm) {
        this.numTerm = numTerm;
    }

    public Double getOneAllow() {
        return oneAllow;
    }

    public void setOneAllow(final Double oneAllow) {
        this.oneAllow = oneAllow;
    }

    public Integer getEyear() {
        return eyear;
    }

    public void setEyear(final Integer eyear) {
        this.eyear = eyear;
    }

    public String getPayrollPeriod() {
        return payrollPeriod;
    }

    public void setPayrollPeriod(final String payrollPeriod) {
        this.payrollPeriod = payrollPeriod;
    }

}
