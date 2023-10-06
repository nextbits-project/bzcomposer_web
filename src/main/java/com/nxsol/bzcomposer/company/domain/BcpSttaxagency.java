package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_sttaxagency")
public class BcpSttaxagency {

    @Id
    @Column(name= "StateName", nullable = false, updatable = false, length = 50)
    private String stateName;

    @Column(name= "Address", columnDefinition = "longtext")
    private String address;

    @Column(name= "WebSite")
    private String webSite;

    public String getStateName() {
        return stateName;
    }

    public void setStateName(final String stateName) {
        this.stateName = stateName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(final String address) {
        this.address = address;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(final String webSite) {
        this.webSite = webSite;
    }

}
