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
public class AdjustmentReason {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private String inventoryCode;

    @Column
    private Integer oldQty;

    @Column
    private Integer newQty;

    @Column
    private Integer gap;

    @Column
    private String reason;

    @Column
    private String memo;

    @Column
    private OffsetDateTime datePerformed;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventoryid_id")
    private BcaIteminventory inventoryid;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getInventoryCode() {
        return inventoryCode;
    }

    public void setInventoryCode(final String inventoryCode) {
        this.inventoryCode = inventoryCode;
    }

    public Integer getOldQty() {
        return oldQty;
    }

    public void setOldQty(final Integer oldQty) {
        this.oldQty = oldQty;
    }

    public Integer getNewQty() {
        return newQty;
    }

    public void setNewQty(final Integer newQty) {
        this.newQty = newQty;
    }

    public Integer getGap() {
        return gap;
    }

    public void setGap(final Integer gap) {
        this.gap = gap;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(final String reason) {
        this.reason = reason;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public OffsetDateTime getDatePerformed() {
        return datePerformed;
    }

    public void setDatePerformed(final OffsetDateTime datePerformed) {
        this.datePerformed = datePerformed;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaIteminventory getInventoryid() {
        return inventoryid;
    }

    public void setInventoryid(final BcaIteminventory inventoryid) {
        this.inventoryid = inventoryid;
    }

}
