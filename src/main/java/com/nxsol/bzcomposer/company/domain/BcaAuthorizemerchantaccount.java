package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_authorizemerchantaccount")
public class BcaAuthorizemerchantaccount {

    @Id
    @Column(name = "CompanyID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer companyId;

    @Column(name = "x_login", length = 20)
    private String xLogin;

    @Column(name = "x_tran_key", length = 16)
    private String xTranKey;

    @Column(name = "x_test_request")
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
