package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaRmareason {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String rmaReason;

    @Column
    private Integer active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_reason_id")
    private BcaMasterrmareason parentReason;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reason_id", nullable = false)
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
