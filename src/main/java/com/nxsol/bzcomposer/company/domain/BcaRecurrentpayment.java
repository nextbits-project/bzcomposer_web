package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name="bca_recurrentpayment")
public class BcaRecurrentpayment {

	@Id
    @Column(name= "PaymentID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentId;

    @Column(name="Amount")
    private Double amount;

    @Column(name="IsToBePrinted")
    private Boolean isToBePrinted;

    @Column(name="CheckNumber", length = 50)
    private String checkNumber;

    @Column(name="Deleted")
    private Boolean deleted;

    @Column(name="TransactionID", length = 50)
    private String transactionId;

    @Column(name="PaymentDate")
    private OffsetDateTime paymentDate;

    @Column(name="IsPaymentCompleted")
    private Boolean isPaymentCompleted;

    @Column(name="Status", length = 50)
    private String status;

    @Column(name="Memo", length = 50)
    private String memo;

    @Column(name="RefPaymentID")
    private Integer refPaymentId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "PaymentID", nullable = false)
//    private BcaPayment payment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PayeeID")
    private BcaAccount payee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PayerID")
    private BcaAccount payer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentTypeID")
    private BcaPaymenttype paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PlanID")
    private BcaRecurrentpaymentplan plan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ServiceID")
    private BcaServicetype service;

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(final Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(final Double amount) {
        this.amount = amount;
    }

    public Boolean getIsToBePrinted() {
        return isToBePrinted;
    }

    public void setIsToBePrinted(final Boolean isToBePrinted) {
        this.isToBePrinted = isToBePrinted;
    }

    public String getCheckNumber() {
        return checkNumber;
    }

    public void setCheckNumber(final String checkNumber) {
        this.checkNumber = checkNumber;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(final Boolean deleted) {
        this.deleted = deleted;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(final String transactionId) {
        this.transactionId = transactionId;
    }

    public OffsetDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(final OffsetDateTime paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Boolean getIsPaymentCompleted() {
        return isPaymentCompleted;
    }

    public void setIsPaymentCompleted(final Boolean isPaymentCompleted) {
        this.isPaymentCompleted = isPaymentCompleted;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public Integer getRefPaymentId() {
        return refPaymentId;
    }

    public void setRefPaymentId(final Integer refPaymentId) {
        this.refPaymentId = refPaymentId;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

//    public BcaPayment getPayment() {
//        return payment;
//    }
//
//    public void setPayment(final BcaPayment payment) {
//        this.payment = payment;
//    }

    public BcaAccount getPayee() {
        return payee;
    }

    public void setPayee(final BcaAccount payee) {
        this.payee = payee;
    }

    public BcaAccount getPayer() {
        return payer;
    }

    public void setPayer(final BcaAccount payer) {
        this.payer = payer;
    }

    public BcaPaymenttype getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(final BcaPaymenttype paymentType) {
        this.paymentType = paymentType;
    }

    public BcaRecurrentpaymentplan getPlan() {
        return plan;
    }

    public void setPlan(final BcaRecurrentpaymentplan plan) {
        this.plan = plan;
    }

    public BcaServicetype getService() {
        return service;
    }

    public void setService(final BcaServicetype service) {
        this.service = service;
    }

}
