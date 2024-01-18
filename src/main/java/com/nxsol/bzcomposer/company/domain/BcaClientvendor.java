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
import javax.persistence.Transient;

import java.time.OffsetDateTime;
import java.util.Set;

@Entity
@Table(name = "bca_clientvendor")
public class BcaClientvendor {

	@Id
	@Column(name = "ClientVendorID", nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer clientVendorId;

	@Column(name = "Name")
	private String name;

	@Column(name = "DBAName", length = 45)
	private String dbaname;

	@Column(name = "Detail", columnDefinition = "longtext")
	private String detail;

	@Column(name = "CustomerTitle", length = 50)
	private String customerTitle;

	@Column(name = "CustomerTitleID")
	private Integer customerTitleId;

	@Column(name = "FirstName", length = 50)
	private String firstName;

	@Column(name = "LastName", length = 50)
	private String lastName;

	@Column(name = "BillName", length = 50)
	private String billName;

	@Column(name = "Address1")
	private String address1;

	@Column(name = "Address2")
	private String address2;

	@Column(name = "City")
	private String city;

	@Column(name = "State", length = 50)
	private String state;

	@Column(name = "Province", length = 50)
	private String province;

	@Column(name = "Country", length = 50)
	private String country;

	@Column(name = "ZipCode", length = 50)
	private String zipCode;

	@Column(name = "ZipCodeID", length = 20)
	private String zipCodeId;

	@Column(name = "Phone", length = 50)
	private String phone;

	@Column(name = "CellPhone", length = 50)
	private String cellPhone;

	@Column(name = "Fax", length = 50)
	private String fax;

	@Column(name = "Email", length = 50)
	private String email;

	@Column(name = "HomePage", length = 50)
	private String homePage;

	@Column(name = "ResellerTaxID", length = 50)
	private String resellerTaxId;

	@Column(name = "Taxable")
	private Long taxable;

	@Column(name = "CVTypeID")
	private Integer cvtypeId;

	@Column(name = "CVCategoryID")
	private Integer cvcategoryId;

	@Column(name = "CVCategoryName", length = 50)
	private String cvcategoryName;

	@Column(name = "CCTypeID")
	private Integer cctypeId;

	@Column(name = "CustomerOpenDebit")
	private Double customerOpenDebit;

	@Column(name = "CustomerCreditLine")
	private Double customerCreditLine;

	@Column(name = "VendorOpenDebit")
	private Double vendorOpenDebit;

	@Column(name = "VendorAllowedCredit")
	private Double vendorAllowedCredit;

	@Column(name = "Active")
	private Integer active;

	@Column(name = "Status", length = 10)
	private String status;

	@Column(name = "Deleted")
	private Integer deleted;

	@Column(name = "DateAdded")
	private OffsetDateTime dateAdded;

	@Column(name = "Priority")
	private Integer priority;

	@Column(name = "ItemPriceLevel")
	private Integer itemPriceLevel;

	@Column(name = "PayFromID")
	private Integer payFromId;

	@Column(name = "PriceLevelID")
	private Integer priceLevelId;

	@Column(name = "UseSpecialMessage")
	private Boolean useSpecialMessage;

	@Column(name = "Message")
	private String message;

	@Column(name = "CustomerGroupID")
	private Integer customerGroupId;

	@Column(name = "Form1099")
	private Integer form1099;

	@Column(name = "ReferenceCustomerID")
	private Integer referenceCustomerId;

	@Column(name = "RemainingCredit")
	private Double remainingCredit;

	@Column(name = "LineofCreditTermID")
	private Integer lineofCreditTermId;

	@Column(name = "BankAccountID")
	private Integer bankAccountId;

	@Column(name = "MiddleName", length = 45)
	private String middleName;

	@Column(name = "DateInput")
	private OffsetDateTime dateInput;

	@Column(name = "DateTerminated")
	private OffsetDateTime dateTerminated;

	@Column(name = "isTerminated")
	private Boolean isTerminated;

	@Column(name = "isMobilePhoneNumber")
	private Boolean isMobilePhoneNumber;

	@Column(name = "isPhoneMobileNumber")
	private Boolean isPhoneMobileNumber;

	@Transient
	private String formattedDateAdded;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaAccount> clientVendorBcaAccounts;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaBillingaddress> clientVendorBcaBillingaddresss;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaBillingstatements> clientVendorBcaBillingstatementss;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CategoryID")
	private BcaCategory category;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CompanyID")
	private BcaCompany company;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PaymentTypeID")
	private BcaPaymenttype paymentType;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SalesRepID")
	private BcaSalesrep salesRep;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ShipCarrierID")
	private BcaShipcarrier shipCarrier;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TermID")
	private BcaTerm term;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaClientvendorcontacthistory> clientVendorBcaClientvendorcontacthistorys;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaClientvendorfinancecharges> clientVendorBcaClientvendorfinancechargess;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaClientvendorjob> clientVendorBcaClientvendorjobs;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaClientvendorservice> clientVendorBcaClientvendorservices;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaCvcreditcard> clientVendorBcaCvcreditcards;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaInvoice> clientVendorBcaInvoices;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaInvoicememorized> clientVendorBcaInvoicememorizeds;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaInvoiceshipped> clientVendorBcaInvoiceshippeds;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaLead> clientVendorBcaLeads;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaPayment> clientVendorBcaPayments;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaRecentbills> clientVendorBcaRecentbillss;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaRefundlist> clientVendorBcaRefundlists;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaRmamaster> clientVendorBcaRmamasters;

	@OneToMany(mappedBy = "clientVendor")
	private Set<BcaShippingaddress> clientVendorBcaShippingaddresss;

	@OneToMany(mappedBy = "clientVendor")
	private Set<SmdCvinfo> clientVendorSmdCvinfos;

	@OneToMany(mappedBy = "clientVendor")
	private Set<StorageBillingaddress> clientVendorStorageBillingaddresss;

	@OneToMany(mappedBy = "clientVendor")
	private Set<StorageClientvendor> clientVendorStorageClientvendors;

	@OneToMany(mappedBy = "clientVendor")
	private Set<StorageInvoice> clientVendorStorageInvoices;

	@OneToMany(mappedBy = "clientVendor")
	private Set<StorageShippingaddress> clientVendorStorageShippingaddresss;

	public Integer getClientVendorId() {
		return clientVendorId;
	}

	public void setClientVendorId(final Integer clientVendorId) {
		this.clientVendorId = clientVendorId;
	}

	public String getName() {
		return name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public String getDbaname() {
		return dbaname;
	}

	public void setDbaname(final String dbaname) {
		this.dbaname = dbaname;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(final String detail) {
		this.detail = detail;
	}

	public String getCustomerTitle() {
		return customerTitle;
	}

	public void setCustomerTitle(final String customerTitle) {
		this.customerTitle = customerTitle;
	}

	public Integer getCustomerTitleId() {
		return customerTitleId;
	}

	public void setCustomerTitleId(final Integer customerTitleId) {
		this.customerTitleId = customerTitleId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(final String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(final String lastName) {
		this.lastName = lastName;
	}

	public String getBillName() {
		return billName;
	}

	public void setBillName(final String billName) {
		this.billName = billName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(final String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(final String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(final String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(final String state) {
		this.state = state;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(final String province) {
		this.province = province;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(final String country) {
		this.country = country;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(final String zipCode) {
		this.zipCode = zipCode;
	}

	public String getZipCodeId() {
		return zipCodeId;
	}

	public void setZipCodeId(final String zipCodeId) {
		this.zipCodeId = zipCodeId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(final String phone) {
		this.phone = phone;
	}

	public String getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(final String cellPhone) {
		this.cellPhone = cellPhone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(final String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(final String email) {
		this.email = email;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(final String homePage) {
		this.homePage = homePage;
	}

	public String getResellerTaxId() {
		return resellerTaxId;
	}

	public void setResellerTaxId(final String resellerTaxId) {
		this.resellerTaxId = resellerTaxId;
	}

	public Long getTaxable() {
		return taxable;
	}

	public void setTaxable(final Long taxable) {
		this.taxable = taxable;
	}

	public Integer getCvtypeId() {
		return cvtypeId;
	}

	public void setCvtypeId(final Integer cvtypeId) {
		this.cvtypeId = cvtypeId;
	}

	public Integer getCvcategoryId() {
		return cvcategoryId;
	}

	public void setCvcategoryId(final Integer cvcategoryId) {
		this.cvcategoryId = cvcategoryId;
	}

	public String getCvcategoryName() {
		return cvcategoryName;
	}

	public void setCvcategoryName(final String cvcategoryName) {
		this.cvcategoryName = cvcategoryName;
	}

	public Integer getCctypeId() {
		return cctypeId;
	}

	public void setCctypeId(final Integer cctypeId) {
		this.cctypeId = cctypeId;
	}

	public Double getCustomerOpenDebit() {
		return customerOpenDebit;
	}

	public void setCustomerOpenDebit(final Double customerOpenDebit) {
		this.customerOpenDebit = customerOpenDebit;
	}

	public Double getCustomerCreditLine() {
		return customerCreditLine;
	}

	public void setCustomerCreditLine(final Double customerCreditLine) {
		this.customerCreditLine = customerCreditLine;
	}

	public Double getVendorOpenDebit() {
		return vendorOpenDebit;
	}

	public void setVendorOpenDebit(final Double vendorOpenDebit) {
		this.vendorOpenDebit = vendorOpenDebit;
	}

	public Double getVendorAllowedCredit() {
		return vendorAllowedCredit;
	}

	public void setVendorAllowedCredit(final Double vendorAllowedCredit) {
		this.vendorAllowedCredit = vendorAllowedCredit;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(final Integer active) {
		this.active = active;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(final String status) {
		this.status = status;
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(final Integer deleted) {
		this.deleted = deleted;
	}

	public OffsetDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(final OffsetDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(final Integer priority) {
		this.priority = priority;
	}

	public Integer getItemPriceLevel() {
		return itemPriceLevel;
	}

	public void setItemPriceLevel(final Integer itemPriceLevel) {
		this.itemPriceLevel = itemPriceLevel;
	}

	public Integer getPayFromId() {
		return payFromId;
	}

	public void setPayFromId(final Integer payFromId) {
		this.payFromId = payFromId;
	}

	public Integer getPriceLevelId() {
		return priceLevelId;
	}

	public void setPriceLevelId(final Integer priceLevelId) {
		this.priceLevelId = priceLevelId;
	}

	public Boolean getUseSpecialMessage() {
		return useSpecialMessage;
	}

	public void setUseSpecialMessage(final Boolean useSpecialMessage) {
		this.useSpecialMessage = useSpecialMessage;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(final String message) {
		this.message = message;
	}

	public Integer getCustomerGroupId() {
		return customerGroupId;
	}

	public void setCustomerGroupId(final Integer customerGroupId) {
		this.customerGroupId = customerGroupId;
	}

	public Integer getForm1099() {
		return form1099;
	}

	public void setForm1099(final Integer form1099) {
		this.form1099 = form1099;
	}

	public Integer getReferenceCustomerId() {
		return referenceCustomerId;
	}

	public void setReferenceCustomerId(final Integer referenceCustomerId) {
		this.referenceCustomerId = referenceCustomerId;
	}

	public Double getRemainingCredit() {
		return remainingCredit;
	}

	public void setRemainingCredit(final Double remainingCredit) {
		this.remainingCredit = remainingCredit;
	}

	public Integer getLineofCreditTermId() {
		return lineofCreditTermId;
	}

	public void setLineofCreditTermId(final Integer lineofCreditTermId) {
		this.lineofCreditTermId = lineofCreditTermId;
	}

	public Integer getBankAccountId() {
		return bankAccountId;
	}

	public void setBankAccountId(final Integer bankAccountId) {
		this.bankAccountId = bankAccountId;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(final String middleName) {
		this.middleName = middleName;
	}

	public OffsetDateTime getDateInput() {
		return dateInput;
	}

	public void setDateInput(final OffsetDateTime dateInput) {
		this.dateInput = dateInput;
	}

	public OffsetDateTime getDateTerminated() {
		return dateTerminated;
	}

	public void setDateTerminated(final OffsetDateTime dateTerminated) {
		this.dateTerminated = dateTerminated;
	}

	public Boolean getIsTerminated() {
		return isTerminated;
	}

	public void setIsTerminated(final Boolean isTerminated) {
		this.isTerminated = isTerminated;
	}

	public Boolean getIsMobilePhoneNumber() {
		return isMobilePhoneNumber;
	}

	public void setIsMobilePhoneNumber(final Boolean isMobilePhoneNumber) {
		this.isMobilePhoneNumber = isMobilePhoneNumber;
	}

	public Boolean getIsPhoneMobileNumber() {
		return isPhoneMobileNumber;
	}

	public void setIsPhoneMobileNumber(final Boolean isPhoneMobileNumber) {
		this.isPhoneMobileNumber = isPhoneMobileNumber;
	}

	public Set<BcaAccount> getClientVendorBcaAccounts() {
		return clientVendorBcaAccounts;
	}

	public void setClientVendorBcaAccounts(final Set<BcaAccount> clientVendorBcaAccounts) {
		this.clientVendorBcaAccounts = clientVendorBcaAccounts;
	}

	public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
		return clientVendorBcaArgroupbillings;
	}

	public void setClientVendorBcaArgroupbillings(final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
		this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
	}

	public Set<BcaBillingaddress> getClientVendorBcaBillingaddresss() {
		return clientVendorBcaBillingaddresss;
	}

	public void setClientVendorBcaBillingaddresss(final Set<BcaBillingaddress> clientVendorBcaBillingaddresss) {
		this.clientVendorBcaBillingaddresss = clientVendorBcaBillingaddresss;
	}

	public Set<BcaBillingstatements> getClientVendorBcaBillingstatementss() {
		return clientVendorBcaBillingstatementss;
	}

	public void setClientVendorBcaBillingstatementss(
			final Set<BcaBillingstatements> clientVendorBcaBillingstatementss) {
		this.clientVendorBcaBillingstatementss = clientVendorBcaBillingstatementss;
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

	public BcaPaymenttype getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(final BcaPaymenttype paymentType) {
		this.paymentType = paymentType;
	}

	public BcaSalesrep getSalesRep() {
		return salesRep;
	}

	public void setSalesRep(final BcaSalesrep salesRep) {
		this.salesRep = salesRep;
	}

	public BcaShipcarrier getShipCarrier() {
		return shipCarrier;
	}

	public void setShipCarrier(final BcaShipcarrier shipCarrier) {
		this.shipCarrier = shipCarrier;
	}

	public BcaTerm getTerm() {
		return term;
	}

	public void setTerm(final BcaTerm term) {
		this.term = term;
	}

	public Set<BcaClientvendorcontacthistory> getClientVendorBcaClientvendorcontacthistorys() {
		return clientVendorBcaClientvendorcontacthistorys;
	}

	public void setClientVendorBcaClientvendorcontacthistorys(
			final Set<BcaClientvendorcontacthistory> clientVendorBcaClientvendorcontacthistorys) {
		this.clientVendorBcaClientvendorcontacthistorys = clientVendorBcaClientvendorcontacthistorys;
	}

	public Set<BcaClientvendorfinancecharges> getClientVendorBcaClientvendorfinancechargess() {
		return clientVendorBcaClientvendorfinancechargess;
	}

	public void setClientVendorBcaClientvendorfinancechargess(
			final Set<BcaClientvendorfinancecharges> clientVendorBcaClientvendorfinancechargess) {
		this.clientVendorBcaClientvendorfinancechargess = clientVendorBcaClientvendorfinancechargess;
	}

	public Set<BcaClientvendorjob> getClientVendorBcaClientvendorjobs() {
		return clientVendorBcaClientvendorjobs;
	}

	public void setClientVendorBcaClientvendorjobs(final Set<BcaClientvendorjob> clientVendorBcaClientvendorjobs) {
		this.clientVendorBcaClientvendorjobs = clientVendorBcaClientvendorjobs;
	}

	public Set<BcaClientvendorservice> getClientVendorBcaClientvendorservices() {
		return clientVendorBcaClientvendorservices;
	}

	public void setClientVendorBcaClientvendorservices(
			final Set<BcaClientvendorservice> clientVendorBcaClientvendorservices) {
		this.clientVendorBcaClientvendorservices = clientVendorBcaClientvendorservices;
	}

	public Set<BcaCvcreditcard> getClientVendorBcaCvcreditcards() {
		return clientVendorBcaCvcreditcards;
	}

	public void setClientVendorBcaCvcreditcards(final Set<BcaCvcreditcard> clientVendorBcaCvcreditcards) {
		this.clientVendorBcaCvcreditcards = clientVendorBcaCvcreditcards;
	}

	public Set<BcaInvoice> getClientVendorBcaInvoices() {
		return clientVendorBcaInvoices;
	}

	public void setClientVendorBcaInvoices(final Set<BcaInvoice> clientVendorBcaInvoices) {
		this.clientVendorBcaInvoices = clientVendorBcaInvoices;
	}

	public Set<BcaInvoicememorized> getClientVendorBcaInvoicememorizeds() {
		return clientVendorBcaInvoicememorizeds;
	}

	public void setClientVendorBcaInvoicememorizeds(final Set<BcaInvoicememorized> clientVendorBcaInvoicememorizeds) {
		this.clientVendorBcaInvoicememorizeds = clientVendorBcaInvoicememorizeds;
	}

	public Set<BcaInvoiceshipped> getClientVendorBcaInvoiceshippeds() {
		return clientVendorBcaInvoiceshippeds;
	}

	public void setClientVendorBcaInvoiceshippeds(final Set<BcaInvoiceshipped> clientVendorBcaInvoiceshippeds) {
		this.clientVendorBcaInvoiceshippeds = clientVendorBcaInvoiceshippeds;
	}

	public Set<BcaLead> getClientVendorBcaLeads() {
		return clientVendorBcaLeads;
	}

	public void setClientVendorBcaLeads(final Set<BcaLead> clientVendorBcaLeads) {
		this.clientVendorBcaLeads = clientVendorBcaLeads;
	}

	public Set<BcaPayment> getClientVendorBcaPayments() {
		return clientVendorBcaPayments;
	}

	public void setClientVendorBcaPayments(final Set<BcaPayment> clientVendorBcaPayments) {
		this.clientVendorBcaPayments = clientVendorBcaPayments;
	}

	public Set<BcaRecentbills> getClientVendorBcaRecentbillss() {
		return clientVendorBcaRecentbillss;
	}

	public void setClientVendorBcaRecentbillss(final Set<BcaRecentbills> clientVendorBcaRecentbillss) {
		this.clientVendorBcaRecentbillss = clientVendorBcaRecentbillss;
	}

	public Set<BcaRefundlist> getClientVendorBcaRefundlists() {
		return clientVendorBcaRefundlists;
	}

	public void setClientVendorBcaRefundlists(final Set<BcaRefundlist> clientVendorBcaRefundlists) {
		this.clientVendorBcaRefundlists = clientVendorBcaRefundlists;
	}

	public Set<BcaRmamaster> getClientVendorBcaRmamasters() {
		return clientVendorBcaRmamasters;
	}

	public void setClientVendorBcaRmamasters(final Set<BcaRmamaster> clientVendorBcaRmamasters) {
		this.clientVendorBcaRmamasters = clientVendorBcaRmamasters;
	}

	public Set<BcaShippingaddress> getClientVendorBcaShippingaddresss() {
		return clientVendorBcaShippingaddresss;
	}

	public void setClientVendorBcaShippingaddresss(final Set<BcaShippingaddress> clientVendorBcaShippingaddresss) {
		this.clientVendorBcaShippingaddresss = clientVendorBcaShippingaddresss;
	}

	public Set<SmdCvinfo> getClientVendorSmdCvinfos() {
		return clientVendorSmdCvinfos;
	}

	public void setClientVendorSmdCvinfos(final Set<SmdCvinfo> clientVendorSmdCvinfos) {
		this.clientVendorSmdCvinfos = clientVendorSmdCvinfos;
	}

	public Set<StorageBillingaddress> getClientVendorStorageBillingaddresss() {
		return clientVendorStorageBillingaddresss;
	}

	public void setClientVendorStorageBillingaddresss(
			final Set<StorageBillingaddress> clientVendorStorageBillingaddresss) {
		this.clientVendorStorageBillingaddresss = clientVendorStorageBillingaddresss;
	}

	public Set<StorageClientvendor> getClientVendorStorageClientvendors() {
		return clientVendorStorageClientvendors;
	}

	public void setClientVendorStorageClientvendors(final Set<StorageClientvendor> clientVendorStorageClientvendors) {
		this.clientVendorStorageClientvendors = clientVendorStorageClientvendors;
	}

	public Set<StorageInvoice> getClientVendorStorageInvoices() {
		return clientVendorStorageInvoices;
	}

	public void setClientVendorStorageInvoices(final Set<StorageInvoice> clientVendorStorageInvoices) {
		this.clientVendorStorageInvoices = clientVendorStorageInvoices;
	}

	public Set<StorageShippingaddress> getClientVendorStorageShippingaddresss() {
		return clientVendorStorageShippingaddresss;
	}

	public void setClientVendorStorageShippingaddresss(
			final Set<StorageShippingaddress> clientVendorStorageShippingaddresss) {
		this.clientVendorStorageShippingaddresss = clientVendorStorageShippingaddresss;
	}

	public String getFormattedDateAdded() {
		return formattedDateAdded;
	}

	public void setFormattedDateAdded(String formattedDateAdded) {
		this.formattedDateAdded = formattedDateAdded;
	}

}
