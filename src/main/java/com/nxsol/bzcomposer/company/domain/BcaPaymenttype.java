package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name="bca_paymenttype")
public class BcaPaymenttype {

    @Id
    @Column(name="PaymentTypeID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentTypeId;

    @Column(name="Name", length = 50)
    private String name;

    @Column(name="Type", length = 50)
    private String type;

    @Column(name="Active")
    private Integer active;
    
    @Column(name = "IsDefault")
    private Boolean isDefault;

    @Column(name="BankAcctID")
    private Integer bankAcctId;

    @Column(name="TypeCategory")
    private Integer typeCategory;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaAccountable> paymentTypeBcaAccountables;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaClientvendor> paymentTypeBcaClientvendors;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaInvoice> paymentTypeBcaInvoices;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaInvoicememorized> paymentTypeBcaInvoicememorizeds;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaInvoiceshipped> paymentTypeBcaInvoiceshippeds;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaPayment> paymentTypeBcaPayments;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CCTypeID")
    private BcaCreditcardtype cctype;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaRecurrentpayment> paymentTypeBcaRecurrentpayments;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaRecurrentpaymentplan> paymentTypeBcaRecurrentpaymentplans;

    @OneToMany(mappedBy = "paymentType")
    private Set<BcaRefundlist> paymentTypeBcaRefundlists;

    @OneToMany(mappedBy = "orderPaymentType")
    private Set<BcaRefundlist> orderPaymentTypeBcaRefundlists;

    @OneToMany(mappedBy = "paymentType")
    private Set<StorageClientvendor> paymentTypeStorageClientvendors;

    @OneToMany(mappedBy = "paymentType")
    private Set<StorageInvoice> paymentTypeStorageInvoices;

    @OneToMany(mappedBy = "paymentType")
    private Set<StoragePayment> paymentTypeStoragePayments;

    public Integer getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(final Integer paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
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

    public Set<BcaClientvendor> getPaymentTypeBcaClientvendors() {
        return paymentTypeBcaClientvendors;
    }

    public void setPaymentTypeBcaClientvendors(
            final Set<BcaClientvendor> paymentTypeBcaClientvendors) {
        this.paymentTypeBcaClientvendors = paymentTypeBcaClientvendors;
    }

    public Set<BcaInvoice> getPaymentTypeBcaInvoices() {
        return paymentTypeBcaInvoices;
    }

    public void setPaymentTypeBcaInvoices(final Set<BcaInvoice> paymentTypeBcaInvoices) {
        this.paymentTypeBcaInvoices = paymentTypeBcaInvoices;
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

    public Set<BcaPayment> getPaymentTypeBcaPayments() {
        return paymentTypeBcaPayments;
    }

    public void setPaymentTypeBcaPayments(final Set<BcaPayment> paymentTypeBcaPayments) {
        this.paymentTypeBcaPayments = paymentTypeBcaPayments;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaCreditcardtype getCctype() {
        return cctype;
    }

    public void setCctype(final BcaCreditcardtype cctype) {
        this.cctype = cctype;
    }

    public Set<BcaRecurrentpayment> getPaymentTypeBcaRecurrentpayments() {
        return paymentTypeBcaRecurrentpayments;
    }

    public void setPaymentTypeBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> paymentTypeBcaRecurrentpayments) {
        this.paymentTypeBcaRecurrentpayments = paymentTypeBcaRecurrentpayments;
    }

    public Set<BcaRecurrentpaymentplan> getPaymentTypeBcaRecurrentpaymentplans() {
        return paymentTypeBcaRecurrentpaymentplans;
    }

    public void setPaymentTypeBcaRecurrentpaymentplans(
            final Set<BcaRecurrentpaymentplan> paymentTypeBcaRecurrentpaymentplans) {
        this.paymentTypeBcaRecurrentpaymentplans = paymentTypeBcaRecurrentpaymentplans;
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

    public Set<StorageClientvendor> getPaymentTypeStorageClientvendors() {
        return paymentTypeStorageClientvendors;
    }

    public void setPaymentTypeStorageClientvendors(
            final Set<StorageClientvendor> paymentTypeStorageClientvendors) {
        this.paymentTypeStorageClientvendors = paymentTypeStorageClientvendors;
    }

    public Set<StorageInvoice> getPaymentTypeStorageInvoices() {
        return paymentTypeStorageInvoices;
    }

    public void setPaymentTypeStorageInvoices(
            final Set<StorageInvoice> paymentTypeStorageInvoices) {
        this.paymentTypeStorageInvoices = paymentTypeStorageInvoices;
    }

    public Set<StoragePayment> getPaymentTypeStoragePayments() {
        return paymentTypeStoragePayments;
    }

    public void setPaymentTypeStoragePayments(
            final Set<StoragePayment> paymentTypeStoragePayments) {
        this.paymentTypeStoragePayments = paymentTypeStoragePayments;
    }

	public Boolean getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}

}
