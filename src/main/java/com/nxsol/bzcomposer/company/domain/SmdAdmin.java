package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "smd_admin")
public class SmdAdmin {

    @Id
    @Column(name= "AdminID", nullable = false, updatable = false, length = 40)
    private String adminId;

    @Column(name= "Password", length = 20)
    private String password;

    @Column(name= "Name", length = 50)
    private String name;

    @Column(name= "Email", length = 50)
    private String email;

    @Column(name= "Authority", length = 7)
    private String authority;

    @Column(name= "Input_Date")
    private OffsetDateTime inputDate;

    @Column(name= "webSite", length = 10)
    private String webSite;

    @Column(name= "SiteType")
    private Integer siteType;

    @Column(name= "MshopMerchantID")
    private Integer mshopMerchantId;

    @Column(name= "siteinventory")
    private Integer siteinventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(final String adminId) {
        this.adminId = adminId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(final String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(final String authority) {
        this.authority = authority;
    }

    public OffsetDateTime getInputDate() {
        return inputDate;
    }

    public void setInputDate(final OffsetDateTime inputDate) {
        this.inputDate = inputDate;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(final String webSite) {
        this.webSite = webSite;
    }

    public Integer getSiteType() {
        return siteType;
    }

    public void setSiteType(final Integer siteType) {
        this.siteType = siteType;
    }

    public Integer getMshopMerchantId() {
        return mshopMerchantId;
    }

    public void setMshopMerchantId(final Integer mshopMerchantId) {
        this.mshopMerchantId = mshopMerchantId;
    }

    public Integer getSiteinventory() {
        return siteinventory;
    }

    public void setSiteinventory(final Integer siteinventory) {
        this.siteinventory = siteinventory;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
