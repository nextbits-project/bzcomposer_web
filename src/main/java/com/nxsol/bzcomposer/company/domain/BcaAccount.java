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
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaAccount {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer accountId;

    @Column
    private Integer parentId;

    @Column
    private Boolean isCategory;

    @Column(nullable = false, length = 50)
    private String name;

    @Column(name = "\"description\"", length = 50)
    private String description;

    @Column
    private Integer depositPaymentId;

    @Column
    private Double customerStartingBalance;

    @Column
    private Double customerCurrentBalance;

    @Column
    private Double vendorStartingBalance;

    @Column
    private Double vendorCurrentBalance;

    @Column(nullable = false)
    private Integer active;

    @Column(nullable = false)
    private OffsetDateTime dateAdded;

    @Column
    private Integer firstCheck;

    @Column
    private Integer lastCheck;

    @Column(precision = 10, scale = 2)
    private BigDecimal mainaccount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_vendor_id")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "acct_category_id")
    private BcaAcctcategory acctCategory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "acct_type_id")
    private BcaAccttype acctType;

    @OneToMany(mappedBy = "account")
    private Set<BcaPayment> accountBcaPayments;

    @OneToMany(mappedBy = "payee")
    private Set<BcaRecurrentpayment> payeeBcaRecurrentpayments;

    @OneToMany(mappedBy = "payer")
    private Set<BcaRecurrentpayment> payerBcaRecurrentpayments;

    @OneToMany(mappedBy = "payee")
    private Set<BcaRecurrentpaymentplan> payeeBcaRecurrentpaymentplans;

    @OneToMany(mappedBy = "paymentAccount")
    private Set<BcaRecurrentpaymentplan> paymentAccountBcaRecurrentpaymentplans;

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(final Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(final Integer parentId) {
        this.parentId = parentId;
    }

    public Boolean getIsCategory() {
        return isCategory;
    }

    public void setIsCategory(final Boolean isCategory) {
        this.isCategory = isCategory;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public Integer getDepositPaymentId() {
        return depositPaymentId;
    }

    public void setDepositPaymentId(final Integer depositPaymentId) {
        this.depositPaymentId = depositPaymentId;
    }

    public Double getCustomerStartingBalance() {
        return customerStartingBalance;
    }

    public void setCustomerStartingBalance(final Double customerStartingBalance) {
        this.customerStartingBalance = customerStartingBalance;
    }

    public Double getCustomerCurrentBalance() {
        return customerCurrentBalance;
    }

    public void setCustomerCurrentBalance(final Double customerCurrentBalance) {
        this.customerCurrentBalance = customerCurrentBalance;
    }

    public Double getVendorStartingBalance() {
        return vendorStartingBalance;
    }

    public void setVendorStartingBalance(final Double vendorStartingBalance) {
        this.vendorStartingBalance = vendorStartingBalance;
    }

    public Double getVendorCurrentBalance() {
        return vendorCurrentBalance;
    }

    public void setVendorCurrentBalance(final Double vendorCurrentBalance) {
        this.vendorCurrentBalance = vendorCurrentBalance;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getFirstCheck() {
        return firstCheck;
    }

    public void setFirstCheck(final Integer firstCheck) {
        this.firstCheck = firstCheck;
    }

    public Integer getLastCheck() {
        return lastCheck;
    }

    public void setLastCheck(final Integer lastCheck) {
        this.lastCheck = lastCheck;
    }

    public BigDecimal getMainaccount() {
        return mainaccount;
    }

    public void setMainaccount(final BigDecimal mainaccount) {
        this.mainaccount = mainaccount;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

    public BcaAcctcategory getAcctCategory() {
        return acctCategory;
    }

    public void setAcctCategory(final BcaAcctcategory acctCategory) {
        this.acctCategory = acctCategory;
    }

    public BcaAccttype getAcctType() {
        return acctType;
    }

    public void setAcctType(final BcaAccttype acctType) {
        this.acctType = acctType;
    }

    public Set<BcaPayment> getAccountBcaPayments() {
        return accountBcaPayments;
    }

    public void setAccountBcaPayments(final Set<BcaPayment> accountBcaPayments) {
        this.accountBcaPayments = accountBcaPayments;
    }

    public Set<BcaRecurrentpayment> getPayeeBcaRecurrentpayments() {
        return payeeBcaRecurrentpayments;
    }

    public void setPayeeBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> payeeBcaRecurrentpayments) {
        this.payeeBcaRecurrentpayments = payeeBcaRecurrentpayments;
    }

    public Set<BcaRecurrentpayment> getPayerBcaRecurrentpayments() {
        return payerBcaRecurrentpayments;
    }

    public void setPayerBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> payerBcaRecurrentpayments) {
        this.payerBcaRecurrentpayments = payerBcaRecurrentpayments;
    }

    public Set<BcaRecurrentpaymentplan> getPayeeBcaRecurrentpaymentplans() {
        return payeeBcaRecurrentpaymentplans;
    }

    public void setPayeeBcaRecurrentpaymentplans(
            final Set<BcaRecurrentpaymentplan> payeeBcaRecurrentpaymentplans) {
        this.payeeBcaRecurrentpaymentplans = payeeBcaRecurrentpaymentplans;
    }

    public Set<BcaRecurrentpaymentplan> getPaymentAccountBcaRecurrentpaymentplans() {
        return paymentAccountBcaRecurrentpaymentplans;
    }

    public void setPaymentAccountBcaRecurrentpaymentplans(
            final Set<BcaRecurrentpaymentplan> paymentAccountBcaRecurrentpaymentplans) {
        this.paymentAccountBcaRecurrentpaymentplans = paymentAccountBcaRecurrentpaymentplans;
    }

}
