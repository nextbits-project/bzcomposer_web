package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class SmdCvinfo {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer clientVendorId;

    @Column(length = 100)
    private String company;

    @Column(length = 20)
    private String password;

    @Column(length = 16)
    private String passwordHint;

    @Column(length = 16)
    private String passwordAnswer;

    @Column
    private Boolean newsletter;

    @Column(length = 10)
    private String subscribe;

    @Column
    private Boolean isChecked;

    @Column(length = 15)
    private String status;

    @Column(length = 50)
    private String homePage;

    @Column(length = 30)
    private String resellerTaxId;

    @Column(length = 5)
    private String taxable;

    @Column(length = 20)
    private String fid;

    @Column
    private Integer customerGroupId;

    @Column
    private Integer billingAddressId;

    @Column
    private Integer shippingAddressId;

    @Column
    private Boolean allowMultipleAddress;

    @Column(length = 50)
    private String www;

    @Column
    private Integer sourceInfo;

    @Column(length = 50)
    private String businessType;

    @Column(length = 50)
    private String userPhoto;

    @Column
    private Integer isPhotoPrivate;

    public Integer getClientVendorId() {
        return clientVendorId;
    }

    public void setClientVendorId(final Integer clientVendorId) {
        this.clientVendorId = clientVendorId;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(final String company) {
        this.company = company;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(final String password) {
        this.password = password;
    }

    public String getPasswordHint() {
        return passwordHint;
    }

    public void setPasswordHint(final String passwordHint) {
        this.passwordHint = passwordHint;
    }

    public String getPasswordAnswer() {
        return passwordAnswer;
    }

    public void setPasswordAnswer(final String passwordAnswer) {
        this.passwordAnswer = passwordAnswer;
    }

    public Boolean getNewsletter() {
        return newsletter;
    }

    public void setNewsletter(final Boolean newsletter) {
        this.newsletter = newsletter;
    }

    public String getSubscribe() {
        return subscribe;
    }

    public void setSubscribe(final String subscribe) {
        this.subscribe = subscribe;
    }

    public Boolean getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(final Boolean isChecked) {
        this.isChecked = isChecked;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public String getHomePage() {
        return homePage;
    }

    public void setHomePage(final String homePage) {
        this.homePage = homePage;
    }

    public String getResellerTaxId() {
        return resellerTaxId;
    }

    public void setResellerTaxId(final String resellerTaxId) {
        this.resellerTaxId = resellerTaxId;
    }

    public String getTaxable() {
        return taxable;
    }

    public void setTaxable(final String taxable) {
        this.taxable = taxable;
    }

    public String getFid() {
        return fid;
    }

    public void setFid(final String fid) {
        this.fid = fid;
    }

    public Integer getCustomerGroupId() {
        return customerGroupId;
    }

    public void setCustomerGroupId(final Integer customerGroupId) {
        this.customerGroupId = customerGroupId;
    }

    public Integer getBillingAddressId() {
        return billingAddressId;
    }

    public void setBillingAddressId(final Integer billingAddressId) {
        this.billingAddressId = billingAddressId;
    }

    public Integer getShippingAddressId() {
        return shippingAddressId;
    }

    public void setShippingAddressId(final Integer shippingAddressId) {
        this.shippingAddressId = shippingAddressId;
    }

    public Boolean getAllowMultipleAddress() {
        return allowMultipleAddress;
    }

    public void setAllowMultipleAddress(final Boolean allowMultipleAddress) {
        this.allowMultipleAddress = allowMultipleAddress;
    }

    public String getWww() {
        return www;
    }

    public void setWww(final String www) {
        this.www = www;
    }

    public Integer getSourceInfo() {
        return sourceInfo;
    }

    public void setSourceInfo(final Integer sourceInfo) {
        this.sourceInfo = sourceInfo;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(final String businessType) {
        this.businessType = businessType;
    }

    public String getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(final String userPhoto) {
        this.userPhoto = userPhoto;
    }

    public Integer getIsPhotoPrivate() {
        return isPhotoPrivate;
    }

    public void setIsPhotoPrivate(final Integer isPhotoPrivate) {
        this.isPhotoPrivate = isPhotoPrivate;
    }

}
