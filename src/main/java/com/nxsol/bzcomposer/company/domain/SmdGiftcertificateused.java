package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "smd_giftcertificateused")
public class SmdGiftcertificateused {

    @Id
    @Column(name= "gcuID", nullable = false, updatable = false, length = 20)
    private String gcuId;

    @Column(name= "gcuIsMailed")
    private Integer gcuIsMailed;

    @Column(name= "gcuAddDate")
    private OffsetDateTime gcuAddDate;

    @Column(name= "gcuUseDate")
    private OffsetDateTime gcuUseDate;

    @Column(name= "gcuBalence", precision = 18, scale = 0)
    private BigDecimal gcuBalence;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gcID")
    private SmdGiftcertificate gc;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
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
