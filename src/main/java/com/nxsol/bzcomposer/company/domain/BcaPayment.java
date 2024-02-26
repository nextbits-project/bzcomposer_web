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
import java.time.OffsetDateTime;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bca_payment")
public class BcaPayment {

    @Id
    @Column(name= "PaymentID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentId;

    @Column(name= "Amount")
    private Double amount;

    @Column(name= "PayerID")
    private Integer payerId;

    @Column(name= "PayeeID")
    private Integer payeeId;

    @Column(name= "PayFromBalance")
    private Double payFromBalance;

    @Column(name= "PayToBalance")
    private Double payToBalance;

    @Column(name= "DateAdded", nullable = false)
    private OffsetDateTime dateAdded;

    @Column(name= "IsToBePrinted")
    private Boolean isToBePrinted;

    @Column(name= "isNeedtoDeposit")
    private Boolean isNeedtoDeposit;

    @Column(name= "CheckNumber", length = 50)
    private String checkNumber;

    @Column(name= "Deleted")
    private Boolean deleted =false;

    @Column(name= "RmaNo")
    private Integer rmaNo;

    @Column(name= "RmaItemID")
    private Integer rmaItemId;

    @Column(name= "TransactionID", length = 50)
    private String transactionId;

    @Column(name= "BillNum")
    private Integer billNum;

    @Column(name= "Priority")
    private Integer priority;

    @Column(name= "TransactionType")
    private Integer transactionType;

    @Column(name= "AccountCategoryID")
    private Integer accountCategoryId;

    @OneToMany(mappedBy = "payment")
    private Set<BcaBill> paymentBcaBills;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentTypeID")
    private BcaPaymenttype paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "AccountID")
    private BcaAccount account;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CategoryID")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PayableID")
    private BcaAccountable payable;

    @OneToMany(mappedBy = "payment")
    private Set<BcaPaymentdetail> paymentBcaPaymentdetails;

//    @OneToMany(mappedBy = "payment")
//    private Set<BcaRecurrentpayment> paymentBcaRecurrentpayments;

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

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
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

    public Set<BcaPaymentdetail> getPaymentBcaPaymentdetails() {
        return paymentBcaPaymentdetails;
    }

    public void setPaymentBcaPaymentdetails(final Set<BcaPaymentdetail> paymentBcaPaymentdetails) {
        this.paymentBcaPaymentdetails = paymentBcaPaymentdetails;
    }

//    public Set<BcaRecurrentpayment> getPaymentBcaRecurrentpayments() {
//        return paymentBcaRecurrentpayments;
//    }
//
//    public void setPaymentBcaRecurrentpayments(
//            final Set<BcaRecurrentpayment> paymentBcaRecurrentpayments) {
//        this.paymentBcaRecurrentpayments = paymentBcaRecurrentpayments;
//    }

    public Set<BcaRefundlist> getPaymentBcaRefundlists() {
        return paymentBcaRefundlists;
    }

    public void setPaymentBcaRefundlists(final Set<BcaRefundlist> paymentBcaRefundlists) {
        this.paymentBcaRefundlists = paymentBcaRefundlists;
    }

}
