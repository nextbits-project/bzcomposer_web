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
@Table(name= "bca_apmemorizebca_argroupbillingdingroup")
public class BcaArgroupbilling {

    @Id
    @Column(name = "BillingNumber", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer billingNumber;

    @Column(name = "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name = "IsBillingPrinted")
    private Boolean isBillingPrinted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

    public Integer getBillingNumber() {
        return billingNumber;
    }

    public void setBillingNumber(final Integer billingNumber) {
        this.billingNumber = billingNumber;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Boolean getIsBillingPrinted() {
        return isBillingPrinted;
    }

    public void setIsBillingPrinted(final Boolean isBillingPrinted) {
        this.isBillingPrinted = isBillingPrinted;
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
