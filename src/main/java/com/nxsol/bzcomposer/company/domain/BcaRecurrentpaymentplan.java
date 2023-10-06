package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name="bca_recurrentpaymentplan")
public class BcaRecurrentpaymentplan {

    @Id
    @Column(name="PlanID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer planId;

    @Column(name="Amount")
    private Double amount;

    @Column(name="SamePaymentAmount")
    private Boolean samePaymentAmount;

    @Column(name="LastPaymentAmount")
    private Double lastPaymentAmount;

    @Column(name="FirstPaymentDate", length = 50)
    private String firstPaymentDate;

    @Column(name="Frequency", length = 50)
    private String frequency;

    @Column(name="Days")
    private Integer days;

    @Column(name="RecurrentOption")
    private Integer recurrentOption;

    @Column(name="NumberOfPayments")
    private Integer numberOfPayments;

    @Column(name="Status", length = 50)
    private String status;

    @Column(name="LastPaymentDate", length = 50)
    private String lastPaymentDate;

    @Column(name="PlanSetupDate", length = 50)
    private String planSetupDate;

    @Column(name="Active")
    private Boolean active;

    @Column(name="Memo", length = 50)
    private String memo;

    @OneToMany(mappedBy = "plan")
    private Set<BcaRecurrentpayment> planBcaRecurrentpayments;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PayeeID")
    private BcaAccount payee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentAccountID")
    private BcaAccount paymentAccount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentTypeID")
    private BcaPaymenttype paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ServiceID")
    private BcaServicetype service;

    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(final Integer planId) {
        this.planId = planId;
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

    public Set<BcaRecurrentpayment> getPlanBcaRecurrentpayments() {
        return planBcaRecurrentpayments;
    }

    public void setPlanBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> planBcaRecurrentpayments) {
        this.planBcaRecurrentpayments = planBcaRecurrentpayments;
    }

    public BcaAccount getPayee() {
        return payee;
    }

    public void setPayee(final BcaAccount payee) {
        this.payee = payee;
    }

    public BcaAccount getPaymentAccount() {
        return paymentAccount;
    }

    public void setPaymentAccount(final BcaAccount paymentAccount) {
        this.paymentAccount = paymentAccount;
    }

    public BcaPaymenttype getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(final BcaPaymenttype paymentType) {
        this.paymentType = paymentType;
    }

    public BcaServicetype getService() {
        return service;
    }

    public void setService(final BcaServicetype service) {
        this.service = service;
    }

}
