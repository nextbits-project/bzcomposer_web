package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.math.BigDecimal;
import java.time.OffsetDateTime;


@Entity
public class SmdGiftcertificateused {

    @Id
    @Column(nullable = false, updatable = false, length = 20)
    private String gcuId;

    @Column
    private Integer gcuIsMailed;

    @Column
    private OffsetDateTime gcuAddDate;

    @Column
    private OffsetDateTime gcuUseDate;

    @Column(precision = 18, scale = 0)
    private BigDecimal gcuBalence;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gc_id")
    private SmdGiftcertificate gc;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_id")
    private BcaInvoice invoice;

    public String getGcuId() {
        return gcuId;
    }

    public void setGcuId(final String gcuId) {
        this.gcuId = gcuId;
    }

    public Integer getGcuIsMailed() {
        return gcuIsMailed;
    }

    public void setGcuIsMailed(final Integer gcuIsMailed) {
        this.gcuIsMailed = gcuIsMailed;
    }

    public OffsetDateTime getGcuAddDate() {
        return gcuAddDate;
    }

    public void setGcuAddDate(final OffsetDateTime gcuAddDate) {
        this.gcuAddDate = gcuAddDate;
    }

    public OffsetDateTime getGcuUseDate() {
        return gcuUseDate;
    }

    public void setGcuUseDate(final OffsetDateTime gcuUseDate) {
        this.gcuUseDate = gcuUseDate;
    }

    public BigDecimal getGcuBalence() {
        return gcuBalence;
    }

    public void setGcuBalence(final BigDecimal gcuBalence) {
        this.gcuBalence = gcuBalence;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public SmdGiftcertificate getGc() {
        return gc;
    }

    public void setGc(final SmdGiftcertificate gc) {
        this.gc = gc;
    }

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
    }

}
