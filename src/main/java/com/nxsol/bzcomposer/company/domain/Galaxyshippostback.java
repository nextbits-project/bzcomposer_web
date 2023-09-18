package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class Galaxyshippostback {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer orderNumber;

    @Column(length = 50)
    private String mailClass;

    @Column
    private Integer postageAmount;

    @Column
    private Integer trackingNumber;

    @Column(length = 50)
    private String postMarkDate;

    @Column
    private OffsetDateTime transactionDate;

    @Column(length = 50)
    private String transactionId;

    @Column(length = 50)
    private String groupCode;

    @Column(length = 50)
    private String insuredValue;

    @Column(length = 50)
    private String insuranceFee;

    @Column(length = 50)
    private String status;

    @Column(length = 50)
    private String fillXmlsource;

    @Column(length = 50)
    private String lenght;

    @Column(length = 50)
    private String width;

    @Column(length = 50)
    private String height;

    @Column(length = 50)
    private String weight;

    @Column(length = 50)
    private String address1;

    @Column(length = 50)
    private String address2;

    @Column(length = 50)
    private String city;

    @Column(length = 50)
    private String state;

    @Column(length = 50)
    private String zipCode;

    @Column(length = 50)
    private String country;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(final Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getMailClass() {
        return mailClass;
    }

    public void setMailClass(final String mailClass) {
        this.mailClass = mailClass;
    }

    public Integer getPostageAmount() {
        return postageAmount;
    }

    public void setPostageAmount(final Integer postageAmount) {
        this.postageAmount = postageAmount;
    }

    public Integer getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(final Integer trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

    public String getPostMarkDate() {
        return postMarkDate;
    }

    public void setPostMarkDate(final String postMarkDate) {
        this.postMarkDate = postMarkDate;
    }

    public OffsetDateTime getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(final OffsetDateTime transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(final String transactionId) {
        this.transactionId = transactionId;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(final String groupCode) {
        this.groupCode = groupCode;
    }

    public String getInsuredValue() {
        return insuredValue;
    }

    public void setInsuredValue(final String insuredValue) {
        this.insuredValue = insuredValue;
    }

    public String getInsuranceFee() {
        return insuranceFee;
    }

    public void setInsuranceFee(final String insuranceFee) {
        this.insuranceFee = insuranceFee;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public String getFillXmlsource() {
        return fillXmlsource;
    }

    public void setFillXmlsource(final String fillXmlsource) {
        this.fillXmlsource = fillXmlsource;
    }

    public String getLenght() {
        return lenght;
    }

    public void setLenght(final String lenght) {
        this.lenght = lenght;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(final String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(final String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(final String weight) {
        this.weight = weight;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(final String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(final String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(final String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(final String state) {
        this.state = state;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(final String country) {
        this.country = country;
    }

}
