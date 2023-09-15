package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaBill {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer billNum;

    @Column
    private Integer vendorId;

    @Column
    private Integer payerId;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private OffsetDateTime dueDate;

    @Column
    private Double amountDue;

    @Column(length = 150)
    private String memo;

    @Column
    private Integer status;

    @Column
    private Boolean isSchedule;

    @Column
    private Integer checkNo;

    @Column
    private Integer billType;

    @Column(length = 50)
    private String transactionName;

    @Column
    private Integer remindOption;

    @Column(length = 50)
    private String recurringPeriod;

    @Column
    private Integer recurringNumber;

    @Column
    private Integer daysInAdvanceToEnter;

    @Column
    private Boolean isMemorized;

    @Column
    private Double creditUsed;

    @Column
    private Double amountPaid;

    @Column
    private Double balance;

    @Column
    private OffsetDateTime nextDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_id")
    private BcaPayment payment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "service_id")
    private BcaServicetype service;

    public Integer getBillNum() {
        return billNum;
    }

    public void setBillNum(final Integer billNum) {
        this.billNum = billNum;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(final Integer vendorId) {
        this.vendorId = vendorId;
    }

    public Integer getPayerId() {
        return payerId;
    }

    public void setPayerId(final Integer payerId) {
        this.payerId = payerId;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public OffsetDateTime getDueDate() {
        return dueDate;
    }

    public void setDueDate(final OffsetDateTime dueDate) {
        this.dueDate = dueDate;
    }

    public Double getAmountDue() {
        return amountDue;
    }

    public void setAmountDue(final Double amountDue) {
        this.amountDue = amountDue;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(final Integer status) {
        this.status = status;
    }

    public Boolean getIsSchedule() {
        return isSchedule;
    }

    public void setIsSchedule(final Boolean isSchedule) {
        this.isSchedule = isSchedule;
    }

    public Integer getCheckNo() {
        return checkNo;
    }

    public void setCheckNo(final Integer checkNo) {
        this.checkNo = checkNo;
    }

    public Integer getBillType() {
        return billType;
    }

    public void setBillType(final Integer billType) {
        this.billType = billType;
    }

    public String getTransactionName() {
        return transactionName;
    }

    public void setTransactionName(final String transactionName) {
        this.transactionName = transactionName;
    }

    public Integer getRemindOption() {
        return remindOption;
    }

    public void setRemindOption(final Integer remindOption) {
        this.remindOption = remindOption;
    }

    public String getRecurringPeriod() {
        return recurringPeriod;
    }

    public void setRecurringPeriod(final String recurringPeriod) {
        this.recurringPeriod = recurringPeriod;
    }

    public Integer getRecurringNumber() {
        return recurringNumber;
    }

    public void setRecurringNumber(final Integer recurringNumber) {
        this.recurringNumber = recurringNumber;
    }

    public Integer getDaysInAdvanceToEnter() {
        return daysInAdvanceToEnter;
    }

    public void setDaysInAdvanceToEnter(final Integer daysInAdvanceToEnter) {
        this.daysInAdvanceToEnter = daysInAdvanceToEnter;
    }

    public Boolean getIsMemorized() {
        return isMemorized;
    }

    public void setIsMemorized(final Boolean isMemorized) {
        this.isMemorized = isMemorized;
    }

    public Double getCreditUsed() {
        return creditUsed;
    }

    public void setCreditUsed(final Double creditUsed) {
        this.creditUsed = creditUsed;
    }

    public Double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(final Double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(final Double balance) {
        this.balance = balance;
    }

    public OffsetDateTime getNextDate() {
        return nextDate;
    }

    public void setNextDate(final OffsetDateTime nextDate) {
        this.nextDate = nextDate;
    }

    public BcaCategory getCategory() {
        return category;
    }

    public void setCategory(final BcaCategory category) {
        this.category = category;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaPayment getPayment() {
        return payment;
    }

    public void setPayment(final BcaPayment payment) {
        this.payment = payment;
    }

    public BcaServicetype getService() {
        return service;
    }

    public void setService(final BcaServicetype service) {
        this.service = service;
    }

}
