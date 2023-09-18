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
public class BcaBillingstatements {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer statementNo;

    @Column
    private OffsetDateTime statementDate;

    @Column
    private Double cartAmount;

    @Column
    private Double overdueAmount;

    @Column
    private Double overDueServiceCharge;

    @Column
    private Double amount;

    @Column
    private Integer isCombined;

    @Column
    private Integer type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_vendor_id")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_id")
    private BcaInvoice invoice;

    public Integer getStatementNo() {
        return statementNo;
    }

    public void setStatementNo(final Integer statementNo) {
        this.statementNo = statementNo;
    }

    public OffsetDateTime getStatementDate() {
        return statementDate;
    }

    public void setStatementDate(final OffsetDateTime statementDate) {
        this.statementDate = statementDate;
    }

    public Double getCartAmount() {
        return cartAmount;
    }

    public void setCartAmount(final Double cartAmount) {
        this.cartAmount = cartAmount;
    }

    public Double getOverdueAmount() {
        return overdueAmount;
    }

    public void setOverdueAmount(final Double overdueAmount) {
        this.overdueAmount = overdueAmount;
    }

    public Double getOverDueServiceCharge() {
        return overDueServiceCharge;
    }

    public void setOverDueServiceCharge(final Double overDueServiceCharge) {
        this.overDueServiceCharge = overDueServiceCharge;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(final Double amount) {
        this.amount = amount;
    }

    public Integer getIsCombined() {
        return isCombined;
    }

    public void setIsCombined(final Integer isCombined) {
        this.isCombined = isCombined;
    }

    public Integer getType() {
        return type;
    }

    public void setType(final Integer type) {
        this.type = type;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
    }

}
