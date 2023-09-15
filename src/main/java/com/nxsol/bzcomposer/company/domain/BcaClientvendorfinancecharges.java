package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaClientvendorfinancecharges {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private Boolean useIndividual;

    @Column
    private Double annualInterestRate;

    @Column
    private Double minimumFinanceCharge;

    @Column
    private Integer gracePeriod;

    @Column
    private Boolean assessFinanceCharge;

    @Column
    private Boolean markFinanceCharge;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_vendor_id")
    private BcaClientvendor clientVendor;

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public Boolean getUseIndividual() {
        return useIndividual;
    }

    public void setUseIndividual(final Boolean useIndividual) {
        this.useIndividual = useIndividual;
    }

    public Double getAnnualInterestRate() {
        return annualInterestRate;
    }

    public void setAnnualInterestRate(final Double annualInterestRate) {
        this.annualInterestRate = annualInterestRate;
    }

    public Double getMinimumFinanceCharge() {
        return minimumFinanceCharge;
    }

    public void setMinimumFinanceCharge(final Double minimumFinanceCharge) {
        this.minimumFinanceCharge = minimumFinanceCharge;
    }

    public Integer getGracePeriod() {
        return gracePeriod;
    }

    public void setGracePeriod(final Integer gracePeriod) {
        this.gracePeriod = gracePeriod;
    }

    public Boolean getAssessFinanceCharge() {
        return assessFinanceCharge;
    }

    public void setAssessFinanceCharge(final Boolean assessFinanceCharge) {
        this.assessFinanceCharge = assessFinanceCharge;
    }

    public Boolean getMarkFinanceCharge() {
        return markFinanceCharge;
    }

    public void setMarkFinanceCharge(final Boolean markFinanceCharge) {
        this.markFinanceCharge = markFinanceCharge;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

}
