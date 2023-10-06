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
@Table(name= "bca_invoiceshipdetail")
public class BcaInvoiceshipdetail {

    @Id
    @Column(name= "ShipDetailID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shipDetailId;

    @Column(name= "ShippingServiceID")
    private Integer shippingServiceId;

    @Column(name= "BillToAddressID")
    private Integer billToAddressId;

    @Column(name= "COD")
    private Integer cod;

    @Column(name= "AddShipping")
    private Boolean addShipping;

    @Column(name= "HandlingCharge")
    private Double handlingCharge;

    @Column(name= "StealthPostage")
    private Boolean stealthPostage;

    @Column(name= "BallonRate")
    private Boolean ballonRate;

    @Column(name= "Email", length = 50)
    private String email;

    @Column(name= "Phone")
    private Integer phone;

    @Column(name = "Description", length = 50)
    private String description;

    @Column(name= "vValue", length = 50)
    private String vValue;

    @Column(name= "ReturnAddress", length = 50)
    private String returnAddress;

    @Column(name= "IsRealTimeShipping")
    private Integer isRealTimeShipping;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

    public Integer getShipDetailId() {
        return shipDetailId;
    }

    public void setShipDetailId(final Integer shipDetailId) {
        this.shipDetailId = shipDetailId;
    }

    public Integer getShippingServiceId() {
        return shippingServiceId;
    }

    public void setShippingServiceId(final Integer shippingServiceId) {
        this.shippingServiceId = shippingServiceId;
    }

    public Integer getBillToAddressId() {
        return billToAddressId;
    }

    public void setBillToAddressId(final Integer billToAddressId) {
        this.billToAddressId = billToAddressId;
    }

    public Integer getCod() {
        return cod;
    }

    public void setCod(final Integer cod) {
        this.cod = cod;
    }

    public Boolean getAddShipping() {
        return addShipping;
    }

    public void setAddShipping(final Boolean addShipping) {
        this.addShipping = addShipping;
    }

    public Double getHandlingCharge() {
        return handlingCharge;
    }

    public void setHandlingCharge(final Double handlingCharge) {
        this.handlingCharge = handlingCharge;
    }

    public Boolean getStealthPostage() {
        return stealthPostage;
    }

    public void setStealthPostage(final Boolean stealthPostage) {
        this.stealthPostage = stealthPostage;
    }

    public Boolean getBallonRate() {
        return ballonRate;
    }

    public void setBallonRate(final Boolean ballonRate) {
        this.ballonRate = ballonRate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(final Integer phone) {
        this.phone = phone;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public String getVValue() {
        return vValue;
    }

    public void setVValue(final String vValue) {
        this.vValue = vValue;
    }

    public String getReturnAddress() {
        return returnAddress;
    }

    public void setReturnAddress(final String returnAddress) {
        this.returnAddress = returnAddress;
    }

    public Integer getIsRealTimeShipping() {
        return isRealTimeShipping;
    }

    public void setIsRealTimeShipping(final Integer isRealTimeShipping) {
        this.isRealTimeShipping = isRealTimeShipping;
    }

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
    }

}
