package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "bca_lead_products")
public class BcaLeadProducts {

    @Id
    @Column(name = "LeadProductsID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadProductsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LeadID")
    private BcaLead lead;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    public Integer getLeadProductsId() {
        return leadProductsId;
    }

    public void setLeadProductsId(final Integer leadProductsId) {
        this.leadProductsId = leadProductsId;
    }

    public BcaLead getLead() {
        return lead;
    }

    public void setLead(final BcaLead lead) {
        this.lead = lead;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
