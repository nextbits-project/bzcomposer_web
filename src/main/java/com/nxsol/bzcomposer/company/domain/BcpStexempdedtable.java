package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_stexempdedtable")
public class BcpStexempdedtable {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "NumTerm")
    private Integer numTerm;

    @Column(name= "NumAllow")
    private Double numAllow;

    @Column(name= "Amt")
    private Double amt;

    @Column(name= "StateName")
    private String stateName;

    @Column(name= "EYear")
    private Double eyear;

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

    public Double getNumAllow() {
        return numAllow;
    }

    public void setNumAllow(final Double numAllow) {
        this.numAllow = numAllow;
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
