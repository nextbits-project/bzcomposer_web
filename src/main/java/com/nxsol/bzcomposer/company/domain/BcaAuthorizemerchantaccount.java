package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class BcaAuthorizemerchantaccount {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer companyId;

    @Column(length = 20)
    private String xLogin;

    @Column(length = 16)
    private String xTranKey;

    @Column
    private Boolean xTestRequest;

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getXLogin() {
        return xLogin;
    }

    public void setXLogin(final String xLogin) {
        this.xLogin = xLogin;
    }

    public String getXTranKey() {
        return xTranKey;
    }

    public void setXTranKey(final String xTranKey) {
        this.xTranKey = xTranKey;
    }

    public Boolean getXTestRequest() {
        return xTestRequest;
    }

    public void setXTestRequest(final Boolean xTestRequest) {
        this.xTestRequest = xTestRequest;
    }

}
