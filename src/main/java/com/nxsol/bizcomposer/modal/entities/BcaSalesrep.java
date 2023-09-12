package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaSalesrep {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer salesRepId;

    @Column
    private Integer companyId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "salesRep")
    private Set<BcaRefundlist> salesRepBcaRefundlists;

    public Integer getSalesRepId() {
        return salesRepId;
    }

    public void setSalesRepId(final Integer salesRepId) {
        this.salesRepId = salesRepId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

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

    public Set<BcaRefundlist> getSalesRepBcaRefundlists() {
        return salesRepBcaRefundlists;
    }

    public void setSalesRepBcaRefundlists(final Set<BcaRefundlist> salesRepBcaRefundlists) {
        this.salesRepBcaRefundlists = salesRepBcaRefundlists;
    }

}
