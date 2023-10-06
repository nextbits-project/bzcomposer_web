package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="bca_userdefineshipcarrier")
public class BcaUserdefineshipcarrier {

    @Id
    @Column(name="Name", nullable = false, updatable = false, length = 50)
    private String name;

    @Column(name="Active")
    private Integer active;

    @Column(name="ParentID")
    private Integer parentId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ShipCarrierID", nullable = false)
    private BcaShipcarrier shipCarrier;

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(final Integer parentId) {
        this.parentId = parentId;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaShipcarrier getShipCarrier() {
        return shipCarrier;
    }

    public void setShipCarrier(final BcaShipcarrier shipCarrier) {
        this.shipCarrier = shipCarrier;
    }

}
