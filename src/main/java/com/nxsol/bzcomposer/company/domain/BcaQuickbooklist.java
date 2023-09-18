package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BcaQuickbooklist {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 50)
    private String customerListId;

    @Column
    private Integer cvId;

    @Column(length = 50)
    private String inventoryListId;

    @Column
    private Integer invId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getCustomerListId() {
        return customerListId;
    }

    public void setCustomerListId(final String customerListId) {
        this.customerListId = customerListId;
    }

    public Integer getCvId() {
        return cvId;
    }

    public void setCvId(final Integer cvId) {
        this.cvId = cvId;
    }

    public String getInventoryListId() {
        return inventoryListId;
    }

    public void setInventoryListId(final String inventoryListId) {
        this.inventoryListId = inventoryListId;
    }

    public Integer getInvId() {
        return invId;
    }

    public void setInvId(final Integer invId) {
        this.invId = invId;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
