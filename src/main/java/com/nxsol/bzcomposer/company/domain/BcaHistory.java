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
import javax.persistence.Table;

@Entity
@Table(name= "bca_history")
public class BcaHistory {

    @Id
    @Column(name= "ImportId", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer importId;

    @Column(name= "OrderDate")
    private OffsetDateTime orderDate;

    @Column(name= "TotalOrders")
    private Integer totalOrders;

    @Column(name= "ImportedHistoryID")
    private Integer importedHistoryId;

    @Column(name= "Schedulehours")
    private Integer schedulehours;

    @Column(name= "Schedulemin")
    private Integer schedulemin;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "StoreID")
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
