package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


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

    @Column
    private Integer companyId;

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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

}
