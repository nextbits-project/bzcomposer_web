package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class BcpSttaxagency {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String stateName;

    @Column(columnDefinition = "longtext")
    private String address;

    @Column
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
