package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaBudgetdetail {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer budgetdetailId;

    @Column
    private Integer categoryId;

    @Column
    private Integer cvId;

    @Column
    private Integer cvServiceId;

    @Column
    private Integer eyear;

    @Column
    private Double octAmt;

    @Column
    private Double novAmt;

    @Column
    private Double decAmt;

    @Column
    private Double janAmt;

    @Column
    private Double febAmt;

    @Column
    private Double marAmt;

    @Column
    private Double aprAmt;

    @Column
    private Double mayAmt;

    @Column
    private Double junAmt;

    @Column
    private Double julAmt;

    @Column
    private Double augAmt;

    @Column
    private Double sepAmt;

    @Column
    private Double annualAmt;

    @Column
    private Double actualAmt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "budget_id")
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
