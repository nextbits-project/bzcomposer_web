package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaRecurrentpaymentplan {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer planId;

    @Column
    private Integer payeeId;

    @Column
    private Integer paymentAccountId;

    @Column
    private Integer paymentTypeId;

    @Column
    private Double amount;

    @Column
    private Boolean samePaymentAmount;

    @Column
    private Double lastPaymentAmount;

    @Column(length = 50)
    private String firstPaymentDate;

    @Column(length = 50)
    private String frequency;

    @Column
    private Integer days;

    @Column
    private Integer recurrentOption;

    @Column
    private Integer numberOfPayments;

    @Column(length = 50)
    private String status;

    @Column(length = 50)
    private String lastPaymentDate;

    @Column(length = 50)
    private String planSetupDate;

    @Column
    private Boolean active;

    @Column(length = 50)
    private String memo;

    @Column
    private Integer serviceId;

    @OneToMany(mappedBy = "plan")
    private Set<BcaRecurrentpayment> planBcaRecurrentpayments;

    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(final Integer planId) {
        this.planId = planId;
    }

    public Integer getPayeeId() {
        return payeeId;
    }

    public void setPayeeId(final Integer payeeId) {
        this.payeeId = payeeId;
    }

    public Integer getPaymentAccountId() {
        return paymentAccountId;
    }

    public void setPaymentAccountId(final Integer paymentAccountId) {
        this.paymentAccountId = paymentAccountId;
    }

    public Integer getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(final Integer paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(final Double amount) {
        this.amount = amount;
    }

    public Boolean getSamePaymentAmount() {
        return samePaymentAmount;
    }

    public void setSamePaymentAmount(final Boolean samePaymentAmount) {
        this.samePaymentAmount = samePaymentAmount;
    }

    public Double getLastPaymentAmount() {
        return lastPaymentAmount;
    }

    public void setLastPaymentAmount(final Double lastPaymentAmount) {
        this.lastPaymentAmount = lastPaymentAmount;
    }

    public String getFirstPaymentDate() {
        return firstPaymentDate;
    }

    public void setFirstPaymentDate(final String firstPaymentDate) {
        this.firstPaymentDate = firstPaymentDate;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(final String frequency) {
        this.frequency = frequency;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(final Integer days) {
        this.days = days;
    }

    public Integer getRecurrentOption() {
        return recurrentOption;
    }

    public void setRecurrentOption(final Integer recurrentOption) {
        this.recurrentOption = recurrentOption;
    }

    public Integer getNumberOfPayments() {
        return numberOfPayments;
    }

    public void setNumberOfPayments(final Integer numberOfPayments) {
        this.numberOfPayments = numberOfPayments;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public String getLastPaymentDate() {
        return lastPaymentDate;
    }

    public void setLastPaymentDate(final String lastPaymentDate) {
        this.lastPaymentDate = lastPaymentDate;
    }

    public String getPlanSetupDate() {
        return planSetupDate;
    }

    public void setPlanSetupDate(final String planSetupDate) {
        this.planSetupDate = planSetupDate;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(final Boolean active) {
        this.active = active;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(final Integer serviceId) {
        this.serviceId = serviceId;
    }

    public Set<BcaRecurrentpayment> getPlanBcaRecurrentpayments() {
        return planBcaRecurrentpayments;
    }

    public void setPlanBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> planBcaRecurrentpayments) {
        this.planBcaRecurrentpayments = planBcaRecurrentpayments;
    }

}
