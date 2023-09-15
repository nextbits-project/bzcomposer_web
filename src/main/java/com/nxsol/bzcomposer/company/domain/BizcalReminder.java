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
public class BizcalReminder {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 100)
    private String billingType;

    @Column
    private Integer paymentDueDay;

    @Column
    private Boolean isNotify;

    @Column
    private Integer notifyDays;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getBillingType() {
        return billingType;
    }

    public void setBillingType(final String billingType) {
        this.billingType = billingType;
    }

    public Integer getPaymentDueDay() {
        return paymentDueDay;
    }

    public void setPaymentDueDay(final Integer paymentDueDay) {
        this.paymentDueDay = paymentDueDay;
    }

    public Boolean getIsNotify() {
        return isNotify;
    }

    public void setIsNotify(final Boolean isNotify) {
        this.isNotify = isNotify;
    }

    public Integer getNotifyDays() {
        return notifyDays;
    }

    public void setNotifyDays(final Integer notifyDays) {
        this.notifyDays = notifyDays;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
