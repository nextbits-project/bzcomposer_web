package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaHistory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer importId;

    @Column
    private OffsetDateTime orderDate;

    @Column
    private Integer totalOrders;

    @Column
    private Integer importedHistoryId;

    @Column
    private Integer schedulehours;

    @Column
    private Integer schedulemin;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_id")
    private BcaStore store;

    public Integer getImportId() {
        return importId;
    }

    public void setImportId(final Integer importId) {
        this.importId = importId;
    }

    public OffsetDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(final OffsetDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(final Integer totalOrders) {
        this.totalOrders = totalOrders;
    }

    public Integer getImportedHistoryId() {
        return importedHistoryId;
    }

    public void setImportedHistoryId(final Integer importedHistoryId) {
        this.importedHistoryId = importedHistoryId;
    }

    public Integer getSchedulehours() {
        return schedulehours;
    }

    public void setSchedulehours(final Integer schedulehours) {
        this.schedulehours = schedulehours;
    }

    public Integer getSchedulemin() {
        return schedulemin;
    }

    public void setSchedulemin(final Integer schedulemin) {
        this.schedulemin = schedulemin;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaStore getStore() {
        return store;
    }

    public void setStore(final BcaStore store) {
        this.store = store;
    }

}
