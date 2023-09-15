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
public class BcaPaymentdetail {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer detailId;

    @Column(length = 50)
    private String refNumber;

    @Column
    private String memo;

    @Column(nullable = false)
    private OffsetDateTime dateAdded;

    @Column(length = 50)
    private String payPalTxnId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_id")
    private BcaPayment payment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "credit_card_id")
    private BcaCvcreditcard creditCard;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gateway_id")
    private BcaMasterpaymentgateways gateway;

    public Integer getDetailId() {
        return detailId;
    }

    public void setDetailId(final Integer detailId) {
        this.detailId = detailId;
    }

    public String getRefNumber() {
        return refNumber;
    }

    public void setRefNumber(final String refNumber) {
        this.refNumber = refNumber;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getPayPalTxnId() {
        return payPalTxnId;
    }

    public void setPayPalTxnId(final String payPalTxnId) {
        this.payPalTxnId = payPalTxnId;
    }

    public BcaPayment getPayment() {
        return payment;
    }

    public void setPayment(final BcaPayment payment) {
        this.payment = payment;
    }

    public BcaCvcreditcard getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(final BcaCvcreditcard creditCard) {
        this.creditCard = creditCard;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaMasterpaymentgateways getGateway() {
        return gateway;
    }

    public void setGateway(final BcaMasterpaymentgateways gateway) {
        this.gateway = gateway;
    }

}
