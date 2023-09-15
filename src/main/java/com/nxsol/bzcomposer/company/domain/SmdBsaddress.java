package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class SmdBsaddress {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bsaId;

    @Column
    private Integer invoiceId;

    @Column(length = 30)
    private String receiver;

    @Column(length = 15)
    private String shippingAddrType;

    @Column(length = 80)
    private String shippingCompanyName;

    @Column(length = 100)
    private String shippingAddr;

    @Column(length = 100)
    private String shippingAddr2;

    @Column(length = 50)
    private String shippingCity;

    @Column(length = 50)
    private String shippingState;

    @Column(length = 20)
    private String shippingZip;

    @Column(length = 40)
    private String shippingCountry;

    @Column(length = 20)
    private String shippingPhone;

    @Column(length = 30)
    private String shippingEmail;

    @Column(length = 15)
    private String billingAddressType;

    @Column(length = 80)
    private String billingCompanyName;

    @Column(length = 100)
    private String billingAddr;

    @Column(length = 100)
    private String billingAddr2;

    @Column(length = 50)
    private String billingCity;

    @Column(length = 50)
    private String billingState;

    @Column(length = 20)
    private String billingZip;

    @Column(length = 40)
    private String billingCountry;

    @Column(length = 20)
    private String billingPhone;

    @Column(length = 30)
    private String billingEmail;

    @Column
    private Boolean isSame;

    public Integer getBsaId() {
        return bsaId;
    }

    public void setBsaId(final Integer bsaId) {
        this.bsaId = bsaId;
    }

    public Integer getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(final Integer invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(final String receiver) {
        this.receiver = receiver;
    }

    public String getShippingAddrType() {
        return shippingAddrType;
    }

    public void setShippingAddrType(final String shippingAddrType) {
        this.shippingAddrType = shippingAddrType;
    }

    public String getShippingCompanyName() {
        return shippingCompanyName;
    }

    public void setShippingCompanyName(final String shippingCompanyName) {
        this.shippingCompanyName = shippingCompanyName;
    }

    public String getShippingAddr() {
        return shippingAddr;
    }

    public void setShippingAddr(final String shippingAddr) {
        this.shippingAddr = shippingAddr;
    }

    public String getShippingAddr2() {
        return shippingAddr2;
    }

    public void setShippingAddr2(final String shippingAddr2) {
        this.shippingAddr2 = shippingAddr2;
    }

    public String getShippingCity() {
        return shippingCity;
    }

    public void setShippingCity(final String shippingCity) {
        this.shippingCity = shippingCity;
    }

    public String getShippingState() {
        return shippingState;
    }

    public void setShippingState(final String shippingState) {
        this.shippingState = shippingState;
    }

    public String getShippingZip() {
        return shippingZip;
    }

    public void setShippingZip(final String shippingZip) {
        this.shippingZip = shippingZip;
    }

    public String getShippingCountry() {
        return shippingCountry;
    }

    public void setShippingCountry(final String shippingCountry) {
        this.shippingCountry = shippingCountry;
    }

    public String getShippingPhone() {
        return shippingPhone;
    }

    public void setShippingPhone(final String shippingPhone) {
        this.shippingPhone = shippingPhone;
    }

    public String getShippingEmail() {
        return shippingEmail;
    }

    public void setShippingEmail(final String shippingEmail) {
        this.shippingEmail = shippingEmail;
    }

    public String getBillingAddressType() {
        return billingAddressType;
    }

    public void setBillingAddressType(final String billingAddressType) {
        this.billingAddressType = billingAddressType;
    }

    public String getBillingCompanyName() {
        return billingCompanyName;
    }

    public void setBillingCompanyName(final String billingCompanyName) {
        this.billingCompanyName = billingCompanyName;
    }

    public String getBillingAddr() {
        return billingAddr;
    }

    public void setBillingAddr(final String billingAddr) {
        this.billingAddr = billingAddr;
    }

    public String getBillingAddr2() {
        return billingAddr2;
    }

    public void setBillingAddr2(final String billingAddr2) {
        this.billingAddr2 = billingAddr2;
    }

    public String getBillingCity() {
        return billingCity;
    }

    public void setBillingCity(final String billingCity) {
        this.billingCity = billingCity;
    }

    public String getBillingState() {
        return billingState;
    }

    public void setBillingState(final String billingState) {
        this.billingState = billingState;
    }

    public String getBillingZip() {
        return billingZip;
    }

    public void setBillingZip(final String billingZip) {
        this.billingZip = billingZip;
    }

    public String getBillingCountry() {
        return billingCountry;
    }

    public void setBillingCountry(final String billingCountry) {
        this.billingCountry = billingCountry;
    }

    public String getBillingPhone() {
        return billingPhone;
    }

    public void setBillingPhone(final String billingPhone) {
        this.billingPhone = billingPhone;
    }

    public String getBillingEmail() {
        return billingEmail;
    }

    public void setBillingEmail(final String billingEmail) {
        this.billingEmail = billingEmail;
    }

    public Boolean getIsSame() {
        return isSame;
    }

    public void setIsSame(final Boolean isSame) {
        this.isSame = isSame;
    }

}
