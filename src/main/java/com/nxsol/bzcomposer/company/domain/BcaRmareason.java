package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="bca_rmareason")
public class BcaRmareason {

    @Id
    @Column(name="rmaReason", nullable = false, updatable = false, length = 50)
    private String rmaReason;

    @Column(name="Active")
    private Integer active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parentReasonID")
    private BcaMasterrmareason parentReason;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ReasonID", nullable = false)
    private BcaRefundreason reason;

    public String getRmaReason() {
        return rmaReason;
    }

    public void setRmaReason(final String rmaReason) {
        this.rmaReason = rmaReason;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaMasterrmareason getParentReason() {
        return parentReason;
    }

    public void setParentReason(final BcaMasterrmareason parentReason) {
        this.parentReason = parentReason;
    }

    public BcaRefundreason getReason() {
        return reason;
    }

    public void setReason(final BcaRefundreason reason) {
        this.reason = reason;
    }

}
