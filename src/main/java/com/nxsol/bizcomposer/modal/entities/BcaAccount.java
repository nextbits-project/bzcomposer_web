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

    @Column(precision = 10, scale = 0)
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

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Boolean getIsCategory() {
		return isCategory;
	}

	public void setIsCategory(Boolean isCategory) {
		this.isCategory = isCategory;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getDepositPaymentId() {
		return depositPaymentId;
	}

	public void setDepositPaymentId(Integer depositPaymentId) {
		this.depositPaymentId = depositPaymentId;
	}

	public Double getCustomerStartingBalance() {
		return customerStartingBalance;
	}

	public void setCustomerStartingBalance(Double customerStartingBalance) {
		this.customerStartingBalance = customerStartingBalance;
	}

	public Double getCustomerCurrentBalance() {
		return customerCurrentBalance;
	}

	public void setCustomerCurrentBalance(Double customerCurrentBalance) {
		this.customerCurrentBalance = customerCurrentBalance;
	}

	public Double getVendorStartingBalance() {
		return vendorStartingBalance;
	}

	public void setVendorStartingBalance(Double vendorStartingBalance) {
		this.vendorStartingBalance = vendorStartingBalance;
	}

	public Double getVendorCurrentBalance() {
		return vendorCurrentBalance;
	}

	public void setVendorCurrentBalance(Double vendorCurrentBalance) {
		this.vendorCurrentBalance = vendorCurrentBalance;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public OffsetDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(OffsetDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public Integer getFirstCheck() {
		return firstCheck;
	}

	public void setFirstCheck(Integer firstCheck) {
		this.firstCheck = firstCheck;
	}

	public Integer getLastCheck() {
		return lastCheck;
	}

	public void setLastCheck(Integer lastCheck) {
		this.lastCheck = lastCheck;
	}

	public BigDecimal getMainaccount() {
		return mainaccount;
	}

	public void setMainaccount(BigDecimal mainaccount) {
		this.mainaccount = mainaccount;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public BcaClientvendor getClientVendor() {
		return clientVendor;
	}

	public void setClientVendor(BcaClientvendor clientVendor) {
		this.clientVendor = clientVendor;
	}

	public BcaAcctcategory getAcctCategory() {
		return acctCategory;
	}

	public void setAcctCategory(BcaAcctcategory acctCategory) {
		this.acctCategory = acctCategory;
	}

	public BcaAccttype getAcctType() {
		return acctType;
	}

	public void setAcctType(BcaAccttype acctType) {
		this.acctType = acctType;
	}

 

}
