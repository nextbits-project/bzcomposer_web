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
@Table(name= "bizcal_reminder")
public class BizcalReminder {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "BillingType", length = 100)
    private String billingType;

    @Column(name= "PaymentDueDay")
    private Integer paymentDueDay;

    @Column(name= "IsNotify")
    private Boolean isNotify;

    @Column(name= "NotifyDays")
    private Integer notifyDays;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
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
