package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "smd_cvinfo")
public class SmdCvinfo {

    @Id
    @Column(name= "Company", nullable = false, updatable = false, length = 100)
    private String company;

    @Column(name= "Password", length = 20)
    private String password;

    @Column(name= "PasswordHint", length = 16)
    private String passwordHint;

    @Column(name= "PasswordAnswer", length = 16)
    private String passwordAnswer;

    @Column(name= "Newsletter")
    private Boolean newsletter;

    @Column(name= "Subscribe", length = 10)
    private String subscribe;

    @Column(name= "IsChecked")
    private Boolean isChecked;

    @Column(name= "Status", length = 15)
    private String status;

    @Column(name= "HomePage", length = 50)
    private String homePage;

    @Column(name= "ResellerTaxID", length = 30)
    private String resellerTaxId;

    @Column(name= "Taxable", length = 5)
    private String taxable;

    @Column(name= "FID", length = 20)
    private String fid;

    @Column(name= "CustomerGroupID")
    private Integer customerGroupId;

    @Column(name= "BillingAddressID")
    private Integer billingAddressId;

    @Column(name= "ShippingAddressID")
    private Integer shippingAddressId;

    @Column(name= "AllowMultipleAddress")
    private Boolean allowMultipleAddress;

    @Column(name= "WWW", length = 50)
    private String www;

    @Column(name= "SourceInfo")
    private Integer sourceInfo;

    @Column(name= "BusinessType", length = 50)
    private String businessType;

    @Column(name= "userPhoto", length = 50)
    private String userPhoto;

    @Column(name= "isPhotoPrivate")
    private Integer isPhotoPrivate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

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

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

}
