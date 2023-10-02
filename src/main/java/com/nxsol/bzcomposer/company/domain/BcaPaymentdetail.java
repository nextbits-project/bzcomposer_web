package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import java.time.OffsetDateTime;


@Entity
@Table(name="bca_paymentdetail")
public class BcaPaymentdetail {

    @Id
    @Column(name="DetailID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer detailId;

    @Column(name="RefNumber", length = 50)
    private String refNumber;

    @Column(name="Memo")
    private String memo;

    @Column(name="DateAdded", nullable = false)
    private OffsetDateTime dateAdded;

    @Column(name="PayPal_txn_id", length = 50)
    private String payPalTxnId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentID")
    private BcaPayment payment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CreditCardID")
    private BcaCvcreditcard creditCard;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "GatewayID")
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
