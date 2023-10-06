package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "smd_bsaddress")
public class SmdBsaddress {

    @Id
    @Column(name = "BsaID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bsaId;

    @Column(name= "InvoiceID")
    private Integer invoiceId;

    @Column(name = "Receiver", length = 30)
    private String receiver;

    @Column(name = "ShippingAddrType", length = 15)
    private String shippingAddrType;

    @Column(name = "ShippingCompanyName", length = 80)
    private String shippingCompanyName;

    @Column(name = "ShippingAddr", length = 100)
    private String shippingAddr;

    @Column(name = "ShippingAddr2", length = 100)
    private String shippingAddr2;

    @Column(name = "ShippingCity", length = 50)
    private String shippingCity;

    @Column(name = "ShippingState", length = 50)
    private String shippingState;

    @Column(name = "ShippingZip", length = 20)
    private String shippingZip;

    @Column(name = "ShippingCountry", length = 40)
    private String shippingCountry;

    @Column(name = "ShippingPhone", length = 20)
    private String shippingPhone;

    @Column(name = "ShippingEmail", length = 30)
    private String shippingEmail;

    @Column(name = "BillingAddressType", length = 15)
    private String billingAddressType;

    @Column(name = "BillingCompanyName", length = 80)
    private String billingCompanyName;

    @Column(name = "BillingAddr", length = 100)
    private String billingAddr;

    @Column(name = "BillingAddr2", length = 100)
    private String billingAddr2;

    @Column(name = "BillingCity", length = 50)
    private String billingCity;

    @Column(name = "BillingState", length = 50)
    private String billingState;

    @Column(name = "BillingZip", length = 20)
    private String billingZip;

    @Column(name = "BillingCountry", length = 40)
    private String billingCountry;

    @Column(name = "BillingPhone", length = 20)
    private String billingPhone;

    @Column(name = "BillingEmail", length = 30)
    private String billingEmail;

    @Column(name= "IsSame")
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
