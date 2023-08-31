package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class SmdAdmin {

    @Id
    @Column(nullable = false, updatable = false, length = 40)
    private String adminId;

    @Column
    private Integer companyId;

    @Column(length = 20)
    private String password;

    @Column(length = 50)
    private String name;

    @Column(length = 50)
    private String email;

    @Column(length = 7)
    private String authority;

    @Column
    private OffsetDateTime inputDate;

    @Column(length = 10)
    private String webSite;

    @Column
    private Integer siteType;

    @Column
    private Integer mshopMerchantId;

    @Column
    private Integer siteinventory;

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(final String adminId) {
        this.adminId = adminId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

}
