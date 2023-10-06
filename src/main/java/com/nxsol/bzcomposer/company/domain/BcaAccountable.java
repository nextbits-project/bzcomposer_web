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
import javax.persistence.Table;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
@Table(name = "bca_accountable")
public class BcaAccountable {

    @Id
    @Column(name = "PayableID",nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer payableId;

    @Column(name = "PayeeCvID")
    private Integer payeeCvId;

    @Column(name = "PayeeCvServiceID")
    private Integer payeeCvServiceId;

    @Column(name = "PayerCvID")
    private Integer payerCvId;

    @Column(name = "PayerCvServiceID")
    private Integer payerCvServiceId;

    @Column(name = "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name = "Amount", precision = 23, scale = 4)
    private BigDecimal amount;

    @Column(name = "Memo", length = 50)
    private String memo;

    @Column(name = "Ref", length = 100)
    private String ref;

    @Column(name = "PayFromID")
    private Integer payFromId;

    @Column(name = "PaymentCompleted")
    private Boolean paymentCompleted;

    @Column(name = "Deleted")
    private Boolean deleted;

    @Column(name = "IsPayable")
    private Boolean isPayable;

    @Column(name = "CheckNumber", length = 50)
    private String checkNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CategoryID")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CreditCardID")
    private BcaCvcreditcard creditCard;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentTypeID")
    private BcaPaymenttype paymentType;

    @OneToMany(mappedBy = "payable")
    private Set<BcaPayment> payableBcaPayments;

    public Integer getPayableId() {
        return payableId;
    }

    public void setPayableId(final Integer payableId) {
        this.payableId = payableId;
    }

    public Integer getPayeeCvId() {
        return payeeCvId;
    }

    public void setPayeeCvId(final Integer payeeCvId) {
        this.payeeCvId = payeeCvId;
    }

    public Integer getPayeeCvServiceId() {
        return payeeCvServiceId;
    }

    public void setPayeeCvServiceId(final Integer payeeCvServiceId) {
        this.payeeCvServiceId = payeeCvServiceId;
    }

    public Integer getPayerCvId() {
        return payerCvId;
    }

    public void setPayerCvId(final Integer payerCvId) {
        this.payerCvId = payerCvId;
    }

    public Integer getPayerCvServiceId() {
        return payerCvServiceId;
    }

    public void setPayerCvServiceId(final Integer payerCvServiceId) {
        this.payerCvServiceId = payerCvServiceId;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(final BigDecimal amount) {
        this.amount = amount;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(final String ref) {
        this.ref = ref;
    }

    public Integer getPayFromId() {
        return payFromId;
    }

    public void setPayFromId(final Integer payFromId) {
        this.payFromId = payFromId;
    }

    public Boolean getPaymentCompleted() {
        return paymentCompleted;
    }

    public void setPaymentCompleted(final Boolean paymentCompleted) {
        this.paymentCompleted = paymentCompleted;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(final Boolean deleted) {
        this.deleted = deleted;
    }

    public Boolean getIsPayable() {
        return isPayable;
    }

    public void setIsPayable(final Boolean isPayable) {
        this.isPayable = isPayable;
    }

    public String getCheckNumber() {
        return checkNumber;
    }

    public void setCheckNumber(final String checkNumber) {
        this.checkNumber = checkNumber;
    }

    public BcaCategory getCategory() {
        return category;
    }

    public void setCategory(final BcaCategory category) {
        this.category = category;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaCvcreditcard getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(final BcaCvcreditcard creditCard) {
        this.creditCard = creditCard;
    }

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
    }

    public BcaPaymenttype getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(final BcaPaymenttype paymentType) {
        this.paymentType = paymentType;
    }

    public Set<BcaPayment> getPayableBcaPayments() {
        return payableBcaPayments;
    }

    public void setPayableBcaPayments(final Set<BcaPayment> payableBcaPayments) {
        this.payableBcaPayments = payableBcaPayments;
    }

}
