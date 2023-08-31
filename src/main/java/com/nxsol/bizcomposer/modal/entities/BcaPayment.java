package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaPayment {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentId;

    @Column
    private Double amount;

    @Column
    private Integer payerId;

    @Column
    private Integer payeeId;

    @Column
    private Integer clientVendorId;

    @Column
    private Double payFromBalance;

    @Column
    private Double payToBalance;

    @Column(nullable = false)
    private OffsetDateTime dateAdded;

    @Column
    private Boolean isToBePrinted;

    @Column
    private Boolean isNeedtoDeposit;

    @Column(length = 50)
    private String checkNumber;

    @Column
    private Boolean deleted;

    @Column
    private Integer rmaNo;

    @Column
    private Integer rmaItemId;

    @Column(length = 50)
    private String transactionId;

    @Column
    private Integer billNum;

    @Column
    private Integer priority;

    @Column
    private Integer transactionType;

    @Column
    private Integer accountCategoryId;

    @OneToMany(mappedBy = "payment")
    private Set<BcaBill> paymentBcaBills;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_type_id")
    private BcaPaymenttype paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id")
    private BcaAccount account;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_id")
    private BcaInvoice invoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payable_id")
    private BcaAccountable payable;

    @OneToMany(mappedBy = "payment")
    private Set<BcaPayment2invoice> paymentBcaPayment2invoices;

    @OneToMany(mappedBy = "payment")
    private Set<BcaRecurrentpayment> paymentBcaRecurrentpayments;

    @OneToMany(mappedBy = "payment")
    private Set<BcaRefundlist> paymentBcaRefundlists;

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(final Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(final Double amount) {
        this.amount = amount;
    }

    public Integer getPayerId() {
        return payerId;
    }

    public void setPayerId(final Integer payerId) {
        this.payerId = payerId;
    }

    public Integer getPayeeId() {
        return payeeId;
    }

    public void setPayeeId(final Integer payeeId) {
        this.payeeId = payeeId;
    }

    public Integer getClientVendorId() {
        return clientVendorId;
    }

    public void setClientVendorId(final Integer clientVendorId) {
        this.clientVendorId = clientVendorId;
    }

    public Double getPayFromBalance() {
        return payFromBalance;
    }

    public void setPayFromBalance(final Double payFromBalance) {
        this.payFromBalance = payFromBalance;
    }

    public Double getPayToBalance() {
        return payToBalance;
    }

    public void setPayToBalance(final Double payToBalance) {
        this.payToBalance = payToBalance;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Boolean getIsToBePrinted() {
        return isToBePrinted;
    }

    public void setIsToBePrinted(final Boolean isToBePrinted) {
        this.isToBePrinted = isToBePrinted;
    }

    public Boolean getIsNeedtoDeposit() {
        return isNeedtoDeposit;
    }

    public void setIsNeedtoDeposit(final Boolean isNeedtoDeposit) {
        this.isNeedtoDeposit = isNeedtoDeposit;
    }

    public String getCheckNumber() {
        return checkNumber;
    }

    public void setCheckNumber(final String checkNumber) {
        this.checkNumber = checkNumber;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(final Boolean deleted) {
        this.deleted = deleted;
    }

    public Integer getRmaNo() {
        return rmaNo;
    }

    public void setRmaNo(final Integer rmaNo) {
        this.rmaNo = rmaNo;
    }

    public Integer getRmaItemId() {
        return rmaItemId;
    }

    public void setRmaItemId(final Integer rmaItemId) {
        this.rmaItemId = rmaItemId;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(final String transactionId) {
        this.transactionId = transactionId;
    }

    public Integer getBillNum() {
        return billNum;
    }

    public void setBillNum(final Integer billNum) {
        this.billNum = billNum;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(final Integer priority) {
        this.priority = priority;
    }

    public Integer getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(final Integer transactionType) {
        this.transactionType = transactionType;
    }

    public Integer getAccountCategoryId() {
        return accountCategoryId;
    }

    public void setAccountCategoryId(final Integer accountCategoryId) {
        this.accountCategoryId = accountCategoryId;
    }

    public Set<BcaBill> getPaymentBcaBills() {
        return paymentBcaBills;
    }

    public void setPaymentBcaBills(final Set<BcaBill> paymentBcaBills) {
        this.paymentBcaBills = paymentBcaBills;
    }

    public BcaPaymenttype getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(final BcaPaymenttype paymentType) {
        this.paymentType = paymentType;
    }

    public BcaAccount getAccount() {
        return account;
    }

    public void setAccount(final BcaAccount account) {
        this.account = account;
    }

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
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

    public BcaAccountable getPayable() {
        return payable;
    }

    public void setPayable(final BcaAccountable payable) {
        this.payable = payable;
    }

    public Set<BcaPayment2invoice> getPaymentBcaPayment2invoices() {
        return paymentBcaPayment2invoices;
    }

    public void setPaymentBcaPayment2invoices(
            final Set<BcaPayment2invoice> paymentBcaPayment2invoices) {
        this.paymentBcaPayment2invoices = paymentBcaPayment2invoices;
    }

    public Set<BcaRecurrentpayment> getPaymentBcaRecurrentpayments() {
        return paymentBcaRecurrentpayments;
    }

    public void setPaymentBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> paymentBcaRecurrentpayments) {
        this.paymentBcaRecurrentpayments = paymentBcaRecurrentpayments;
    }

    public Set<BcaRefundlist> getPaymentBcaRefundlists() {
        return paymentBcaRefundlists;
    }

    public void setPaymentBcaRefundlists(final Set<BcaRefundlist> paymentBcaRefundlists) {
        this.paymentBcaRefundlists = paymentBcaRefundlists;
    }

}
