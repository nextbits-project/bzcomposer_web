package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaPaymenttype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentTypeId;

    @Column
    private Integer companyId;

    @Column(length = 50)
    private String name;

    @Column(length = 50)
    private String type;

    @Column
    private Integer cctypeId;

    @Column
    private Integer active;

    @Column
    private Integer bankAcctId;

    @Column
    private Integer typeCategory;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaAccountable> paymentTypeBcaAccountables;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaAccountable> paymentTypeBcaAccountables;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaAccountable> paymentTypeBcaAccountables;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaInvoicememorized> paymentTypeBcaInvoicememorizeds;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaInvoiceshipped> paymentTypeBcaInvoiceshippeds;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaMasterpaymenttype> paymentTypeBcaMasterpaymenttypes;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaMasterreceivedtype> paymentTypeBcaMasterreceivedtypes;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaPayment> paymentTypeBcaPayments;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaRecurrentpayment> paymentTypeBcaRecurrentpayments;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaRefundlist> paymentTypeBcaRefundlists;

    @OneToMany(mappedBy = "orderPaymentType")
    private Set<BcaRefundlist> orderPaymentTypeBcaRefundlists;

    @OneToMany(mappedBy = "paymentType")
    private Set<StoragePayment> paymentTypeStoragePayments;

    public Integer getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(final Integer paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(final String type) {
        this.type = type;
    }

    public Integer getCctypeId() {
        return cctypeId;
    }

    public void setCctypeId(final Integer cctypeId) {
        this.cctypeId = cctypeId;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getBankAcctId() {
        return bankAcctId;
    }

    public void setBankAcctId(final Integer bankAcctId) {
        this.bankAcctId = bankAcctId;
    }

    public Integer getTypeCategory() {
        return typeCategory;
    }

    public void setTypeCategory(final Integer typeCategory) {
        this.typeCategory = typeCategory;
    }

    public Set<BcaAccountable> getPaymentTypeBcaAccountables() {
        return paymentTypeBcaAccountables;
    }

    public void setPaymentTypeBcaAccountables(
            final Set<BcaAccountable> paymentTypeBcaAccountables) {
        this.paymentTypeBcaAccountables = paymentTypeBcaAccountables;
    }

    public Set<BcaAccountable> getPaymentTypeBcaAccountables() {
        return paymentTypeBcaAccountables;
    }

    public void setPaymentTypeBcaAccountables(
            final Set<BcaAccountable> paymentTypeBcaAccountables) {
        this.paymentTypeBcaAccountables = paymentTypeBcaAccountables;
    }

    public Set<BcaAccountable> getPaymentTypeBcaAccountables() {
        return paymentTypeBcaAccountables;
    }

    public void setPaymentTypeBcaAccountables(
            final Set<BcaAccountable> paymentTypeBcaAccountables) {
        this.paymentTypeBcaAccountables = paymentTypeBcaAccountables;
    }

    public Set<BcaInvoicememorized> getPaymentTypeBcaInvoicememorizeds() {
        return paymentTypeBcaInvoicememorizeds;
    }

    public void setPaymentTypeBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> paymentTypeBcaInvoicememorizeds) {
        this.paymentTypeBcaInvoicememorizeds = paymentTypeBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getPaymentTypeBcaInvoiceshippeds() {
        return paymentTypeBcaInvoiceshippeds;
    }

    public void setPaymentTypeBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> paymentTypeBcaInvoiceshippeds) {
        this.paymentTypeBcaInvoiceshippeds = paymentTypeBcaInvoiceshippeds;
    }

    public Set<BcaMasterpaymenttype> getPaymentTypeBcaMasterpaymenttypes() {
        return paymentTypeBcaMasterpaymenttypes;
    }

    public void setPaymentTypeBcaMasterpaymenttypes(
            final Set<BcaMasterpaymenttype> paymentTypeBcaMasterpaymenttypes) {
        this.paymentTypeBcaMasterpaymenttypes = paymentTypeBcaMasterpaymenttypes;
    }

    public Set<BcaMasterreceivedtype> getPaymentTypeBcaMasterreceivedtypes() {
        return paymentTypeBcaMasterreceivedtypes;
    }

    public void setPaymentTypeBcaMasterreceivedtypes(
            final Set<BcaMasterreceivedtype> paymentTypeBcaMasterreceivedtypes) {
        this.paymentTypeBcaMasterreceivedtypes = paymentTypeBcaMasterreceivedtypes;
    }

    public Set<BcaPayment> getPaymentTypeBcaPayments() {
        return paymentTypeBcaPayments;
    }

    public void setPaymentTypeBcaPayments(final Set<BcaPayment> paymentTypeBcaPayments) {
        this.paymentTypeBcaPayments = paymentTypeBcaPayments;
    }

    public Set<BcaRecurrentpayment> getPaymentTypeBcaRecurrentpayments() {
        return paymentTypeBcaRecurrentpayments;
    }

    public void setPaymentTypeBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> paymentTypeBcaRecurrentpayments) {
        this.paymentTypeBcaRecurrentpayments = paymentTypeBcaRecurrentpayments;
    }

    public Set<BcaRefundlist> getPaymentTypeBcaRefundlists() {
        return paymentTypeBcaRefundlists;
    }

    public void setPaymentTypeBcaRefundlists(final Set<BcaRefundlist> paymentTypeBcaRefundlists) {
        this.paymentTypeBcaRefundlists = paymentTypeBcaRefundlists;
    }

    public Set<BcaRefundlist> getOrderPaymentTypeBcaRefundlists() {
        return orderPaymentTypeBcaRefundlists;
    }

    public void setOrderPaymentTypeBcaRefundlists(
            final Set<BcaRefundlist> orderPaymentTypeBcaRefundlists) {
        this.orderPaymentTypeBcaRefundlists = orderPaymentTypeBcaRefundlists;
    }

    public Set<StoragePayment> getPaymentTypeStoragePayments() {
        return paymentTypeStoragePayments;
    }

    public void setPaymentTypeStoragePayments(
            final Set<StoragePayment> paymentTypeStoragePayments) {
        this.paymentTypeStoragePayments = paymentTypeStoragePayments;
    }

}
