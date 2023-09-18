package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


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
