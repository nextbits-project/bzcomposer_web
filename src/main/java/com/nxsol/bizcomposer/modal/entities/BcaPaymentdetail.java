package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class BcaPaymentdetail {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer detailId;

    @Column
    private Integer paymentId;

    @Column(length = 50)
    private String refNumber;

    @Column
    private String memo;

    @Column
    private Integer creditCardId;

    @Column
    private Integer companyId;

    @Column(nullable = false)
    private OffsetDateTime dateAdded;

    @Column(length = 50)
    private String payPalTxnId;

    @Column
    private Integer gatewayId;

    public Integer getDetailId() {
        return detailId;
    }

    public void setDetailId(final Integer detailId) {
        this.detailId = detailId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(final Integer paymentId) {
        this.paymentId = paymentId;
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

    public Integer getCreditCardId() {
        return creditCardId;
    }

    public void setCreditCardId(final Integer creditCardId) {
        this.creditCardId = creditCardId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

    public Integer getGatewayId() {
        return gatewayId;
    }

    public void setGatewayId(final Integer gatewayId) {
        this.gatewayId = gatewayId;
    }

}
