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
@Table(name="bca_quickbooklist")
public class BcaQuickbooklist {

    @Id
    @Column(name="id", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="customerListID", length = 50)
    private String customerListId;

    @Column(name="cvID")
    private Integer cvId;

    @Column(name="inventoryListID", length = 50)
    private String inventoryListId;

    @Column(name="invID")
    private Integer invId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
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
