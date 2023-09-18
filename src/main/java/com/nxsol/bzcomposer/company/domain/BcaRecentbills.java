package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaRecentbills {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer recentBillId;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private OffsetDateTime lastBilldate;

    @Column
    private Integer type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_vendor_id")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "service_id")
    private BcaServicetype service;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Integer getRecentBillId() {
        return recentBillId;
    }

    public void setRecentBillId(final Integer recentBillId) {
        this.recentBillId = recentBillId;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public OffsetDateTime getLastBilldate() {
        return lastBilldate;
    }

    public void setLastBilldate(final OffsetDateTime lastBilldate) {
        this.lastBilldate = lastBilldate;
    }

    public Integer getType() {
        return type;
    }

    public void setType(final Integer type) {
        this.type = type;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

    public BcaServicetype getService() {
        return service;
    }

    public void setService(final BcaServicetype service) {
        this.service = service;
    }

}
