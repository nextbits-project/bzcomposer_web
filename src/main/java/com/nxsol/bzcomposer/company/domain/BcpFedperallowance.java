package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_fedperallowance")
public class BcpFedperallowance {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "NumTerm")
    private Integer numTerm;

    @Column(name= "OneAllow")
    private Double oneAllow;

    @Column(name= "EYear")
    private Integer eyear;

    @Column(name= "PayrollPeriod", length = 50)
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
