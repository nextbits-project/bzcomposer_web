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
@Table(name= "bca_billingstatements")
public class BcaBillingstatements {

    @Id
    @Column(name = "StatementNo", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer statementNo;

    @Column(name = "StatementDate")
    private OffsetDateTime statementDate;

    @Column(name = "CartAmount")
    private Double cartAmount;

    @Column(name = "OverdueAmount")
    private Double overdueAmount;

    @Column(name = "OverDueServiceCharge")
    private Double overDueServiceCharge;

    @Column(name = "Amount")
    private Double amount;

    @Column(name = "IsCombined")
    private Integer isCombined;

    @Column(name = "Type")
    private Integer type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
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
