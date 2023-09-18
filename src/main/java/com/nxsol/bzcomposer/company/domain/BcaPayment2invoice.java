package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class BcaPayment2invoice {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentId;

    @Column
    private Integer invoiceId;

    @Column
    private Integer companyId;

    @Column
    private OffsetDateTime dateAdded;

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(final Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(final Integer invoiceId) {
        this.invoiceId = invoiceId;
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

}
