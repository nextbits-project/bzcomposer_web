package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaRefundreason {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer reasonId;

    @Column(length = 50)
    private String refundReason;

    @Column
    private Integer active;

    @Column
    private Boolean isDefaultReason;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "reason")
    private Set<BcaRmareason> reasonBcaRmareasons;

    public Integer getReasonId() {
        return reasonId;
    }

    public void setReasonId(final Integer reasonId) {
        this.reasonId = reasonId;
    }

    public String getRefundReason() {
        return refundReason;
    }

    public void setRefundReason(final String refundReason) {
        this.refundReason = refundReason;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Boolean getIsDefaultReason() {
        return isDefaultReason;
    }

    public void setIsDefaultReason(final Boolean isDefaultReason) {
        this.isDefaultReason = isDefaultReason;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaRmareason> getReasonBcaRmareasons() {
        return reasonBcaRmareasons;
    }

    public void setReasonBcaRmareasons(final Set<BcaRmareason> reasonBcaRmareasons) {
        this.reasonBcaRmareasons = reasonBcaRmareasons;
    }

}
