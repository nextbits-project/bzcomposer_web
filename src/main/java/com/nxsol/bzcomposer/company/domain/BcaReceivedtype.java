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
@Table(name="bca_receicedtype")
public class BcaReceivedtype {

    @Id
    @Column(name="PaymentTypeID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentTypeId;

    @Column(name="Name", length = 50)
    private String name;

    @Column(name="Type", length = 50)
    private String type;

    @Column(name="CCTypeID")
    private Integer cctypeId;

    @Column(name="Active")
    private Integer active;

    @Column(name="BankAcctID")
    private Integer bankAcctId;

    @Column(name="TypeCategory")
    private Integer typeCategory;

    @Column(name="IsDefault")
    private Boolean isDefault;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
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
