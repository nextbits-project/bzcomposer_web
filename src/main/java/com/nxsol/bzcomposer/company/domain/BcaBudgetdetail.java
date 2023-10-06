package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "bca_budgetdetail")
public class BcaBudgetdetail {

    @Id
    @Column(name= "BudgetdetailID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer budgetdetailId;

    @Column(name= "CategoryID", nullable = false)
    private Integer categoryId;

    @Column(name= "cvId")
    private Integer cvId;

    @Column(name= "cvServiceId")
    private Integer cvServiceId;

    @Column(name= "EYear")
    private Integer eyear;

    @Column(name= "oct_amt")
    private Double octAmt;

    @Column(name= "nov_amt")
    private Double novAmt;

    @Column(name= "dec_amt")
    private Double decAmt;

    @Column(name= "jan_amt")
    private Double janAmt;

    @Column(name= "feb_amt")
    private Double febAmt;

    @Column(name= "mar_amt")
    private Double marAmt;

    @Column(name= "apr_amt")
    private Double aprAmt;

    @Column(name= "may_amt")
    private Double mayAmt;

    @Column(name= "jun_amt")
    private Double junAmt;

    @Column(name= "jul_amt")
    private Double julAmt;

    @Column(name= "aug_amt")
    private Double augAmt;

    @Column(name= "sep_amt")
    private Double sepAmt;

    @Column(name= "annual_amt")
    private Double annualAmt;

    @Column(name= "actual_amt")
    private Double actualAmt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "BudgetID")
    private BcaBudget budget;

    public Integer getBudgetdetailId() {
        return budgetdetailId;
    }

    public void setBudgetdetailId(final Integer budgetdetailId) {
        this.budgetdetailId = budgetdetailId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(final Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getCvId() {
        return cvId;
    }

    public void setCvId(final Integer cvId) {
        this.cvId = cvId;
    }

    public Integer getCvServiceId() {
        return cvServiceId;
    }

    public void setCvServiceId(final Integer cvServiceId) {
        this.cvServiceId = cvServiceId;
    }

    public Integer getEyear() {
        return eyear;
    }

    public void setEyear(final Integer eyear) {
        this.eyear = eyear;
    }

    public Double getOctAmt() {
        return octAmt;
    }

    public void setOctAmt(final Double octAmt) {
        this.octAmt = octAmt;
    }

    public Double getNovAmt() {
        return novAmt;
    }

    public void setNovAmt(final Double novAmt) {
        this.novAmt = novAmt;
    }

    public Double getDecAmt() {
        return decAmt;
    }

    public void setDecAmt(final Double decAmt) {
        this.decAmt = decAmt;
    }

    public Double getJanAmt() {
        return janAmt;
    }

    public void setJanAmt(final Double janAmt) {
        this.janAmt = janAmt;
    }

    public Double getFebAmt() {
        return febAmt;
    }

    public void setFebAmt(final Double febAmt) {
        this.febAmt = febAmt;
    }

    public Double getMarAmt() {
        return marAmt;
    }

    public void setMarAmt(final Double marAmt) {
        this.marAmt = marAmt;
    }

    public Double getAprAmt() {
        return aprAmt;
    }

    public void setAprAmt(final Double aprAmt) {
        this.aprAmt = aprAmt;
    }

    public Double getMayAmt() {
        return mayAmt;
    }

    public void setMayAmt(final Double mayAmt) {
        this.mayAmt = mayAmt;
    }

    public Double getJunAmt() {
        return junAmt;
    }

    public void setJunAmt(final Double junAmt) {
        this.junAmt = junAmt;
    }

    public Double getJulAmt() {
        return julAmt;
    }

    public void setJulAmt(final Double julAmt) {
        this.julAmt = julAmt;
    }

    public Double getAugAmt() {
        return augAmt;
    }

    public void setAugAmt(final Double augAmt) {
        this.augAmt = augAmt;
    }

    public Double getSepAmt() {
        return sepAmt;
    }

    public void setSepAmt(final Double sepAmt) {
        this.sepAmt = sepAmt;
    }

    public Double getAnnualAmt() {
        return annualAmt;
    }

    public void setAnnualAmt(final Double annualAmt) {
        this.annualAmt = annualAmt;
    }

    public Double getActualAmt() {
        return actualAmt;
    }

    public void setActualAmt(final Double actualAmt) {
        this.actualAmt = actualAmt;
    }

    public BcaBudget getBudget() {
        return budget;
    }

    public void setBudget(final BcaBudget budget) {
        this.budget = budget;
    }

}
