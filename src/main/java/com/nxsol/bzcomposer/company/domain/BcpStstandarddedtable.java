package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_ststandarddedtable")
public class BcpStstandarddedtable {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "NumTerm")
    private Double numTerm;

    @Column(name= "IsMarried")
    private Double isMarried;

    @Column(name= "Amt")
    private Double amt;

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

    public Integer getEyear() {
        return eyear;
    }

    public void setEyear(final Integer eyear) {
        this.eyear = eyear;
    }

}
