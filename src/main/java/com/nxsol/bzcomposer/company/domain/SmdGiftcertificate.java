package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class SmdGiftcertificate {

    @Id
    @Column(nullable = false, updatable = false, length = 10)
    private String gcId;

    @Column(length = 50)
    private String gcName;

    @Column(columnDefinition = "longtext")
    private String gcDetails;

    @Column
    private Double gcPrice;

    @Column
    private Double gcRedeemValue;

    @Column
    private Integer gcUseDays;

    @Column
    private Integer gcIsDeleted;

    @Column(length = 150)
    private String gcImage;

    @Column(columnDefinition = "longtext")
    private String gcNote;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "gc")
    private Set<SmdGiftcertificateused> gcSmdGiftcertificateuseds;

    public String getGcId() {
        return gcId;
    }

    public void setGcId(final String gcId) {
        this.gcId = gcId;
    }

    public String getGcName() {
        return gcName;
    }

    public void setGcName(final String gcName) {
        this.gcName = gcName;
    }

    public String getGcDetails() {
        return gcDetails;
    }

    public void setGcDetails(final String gcDetails) {
        this.gcDetails = gcDetails;
    }

    public Double getGcPrice() {
        return gcPrice;
    }

    public void setGcPrice(final Double gcPrice) {
        this.gcPrice = gcPrice;
    }

    public Double getGcRedeemValue() {
        return gcRedeemValue;
    }

    public void setGcRedeemValue(final Double gcRedeemValue) {
        this.gcRedeemValue = gcRedeemValue;
    }

    public Integer getGcUseDays() {
        return gcUseDays;
    }

    public void setGcUseDays(final Integer gcUseDays) {
        this.gcUseDays = gcUseDays;
    }

    public Integer getGcIsDeleted() {
        return gcIsDeleted;
    }

    public void setGcIsDeleted(final Integer gcIsDeleted) {
        this.gcIsDeleted = gcIsDeleted;
    }

    public String getGcImage() {
        return gcImage;
    }

    public void setGcImage(final String gcImage) {
        this.gcImage = gcImage;
    }

    public String getGcNote() {
        return gcNote;
    }

    public void setGcNote(final String gcNote) {
        this.gcNote = gcNote;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<SmdGiftcertificateused> getGcSmdGiftcertificateuseds() {
        return gcSmdGiftcertificateuseds;
    }

    public void setGcSmdGiftcertificateuseds(
            final Set<SmdGiftcertificateused> gcSmdGiftcertificateuseds) {
        this.gcSmdGiftcertificateuseds = gcSmdGiftcertificateuseds;
    }

}
