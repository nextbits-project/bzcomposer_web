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
public class BcaReceicedtype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentTypeId;

    @Column(length = 50)
    private String name;

    @Column(length = 50)
    private String type;

    @Column
    private Integer cctypeId;

    @Column
    private Integer active;

    @Column
    private Integer bankAcctId;

    @Column
    private Integer typeCategory;

    @Column
    private Boolean isDefault;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(final Integer paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(final String type) {
        this.type = type;
    }

    public Integer getCctypeId() {
        return cctypeId;
    }

    public void setCctypeId(final Integer cctypeId) {
        this.cctypeId = cctypeId;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getBankAcctId() {
        return bankAcctId;
    }

    public void setBankAcctId(final Integer bankAcctId) {
        this.bankAcctId = bankAcctId;
    }

    public Integer getTypeCategory() {
        return typeCategory;
    }

    public void setTypeCategory(final Integer typeCategory) {
        this.typeCategory = typeCategory;
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(final Boolean isDefault) {
        this.isDefault = isDefault;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
