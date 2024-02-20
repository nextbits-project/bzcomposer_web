package com.nxsol.bzcomposer.company.domain;

import java.time.OffsetDateTime;
import java.util.Set;

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

@Entity
@Table(name = "bca_company")
public class BcaCompany {

	@Id
	@Column(name = "CompanyID", nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long companyId; // JPA Check type changed from integer to long because of java type long used in
							// the Configurationinfo.java

	@Column(name = "Name")
	private String name;

	@Column(name = "NickName")
	private String nickName;

	@Column(name = "FirstName", length = 50)
	private String firstName;

	@Column(name = "LastName", length = 50)
	private String lastName;

	@Column(name = "Detail", columnDefinition = "longtext")
	private String detail;

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

	@Column(name = "Zipcode", length = 50)
	private String zipcode;

	@Column(name = "Phone1", length = 20)
	private String phone1;

	@Column(name = "Phone2", length = 20)
	private String phone2;

	@Column(name = "fax1", length = 20)
	private String fax1;

	@Column(name = "Fax2", length = 20)
	private String fax2;

	@Column(name = "Email", length = 50)
	private String email;

	@Column(name = "HomePage", length = 100)
	private String homePage;

	@Column(name = "FID", length = 50)
	private String fid;

	@Column(name = "SID", length = 50)
	private String sid;

	@Column(name = "Currency", length = 50)
	private String currency;

	@Column(name = "Weight", length = 50)
	private String weight;

	@Column(name = "LabelSize", length = 50)
	private String labelSize;

	@Column(name = "BackupPeriod", length = 50)
	private String backupPeriod;

	@Column(name = "BackupPlace", length = 50)
	private String backupPlace;

	@Column(name = "AdminUsername", length = 50)
	private String adminUsername;

	@Column(name = "AdminPassword", length = 50)
	private String adminPassword;

	@Column(name = "Multimode")
	private Integer multimode;

	@Column(name = "CustomerCountry", length = 50)
	private String customerCountry;

	@Column(name = "CustomerTaxable")
	private Integer customerTaxable;

	@Column(name = "CustomerUsecompanyname")
	private Integer customerUsecompanyname;

	@Column(name = "StartingInvoiceNumber")
	private Integer startingInvoiceNumber;

	@Column(name = "InvoiceStyleID")
	private Integer invoiceStyleId;

	@Column(name = "InvoiceFootNoteID")
	private Integer invoiceFootnoteId;

	@Column(name = "UseProductWeight")
	private Integer useProductWeight;

	@Column(name = "UseShippingTable")
	private Integer useShippingTable;

	@Column(name = "InvoiceUseCountry")
	private Integer invoiceUseCountry;

	@Column(name = "VendorCountry")
	private Integer vendorCountry;

	@Column(name = "VendorUseCompanyname")
	private Integer vendorUseCompanyname;

	@Column(name = "StartingPONumber")
	private Integer startingPonumber;

	@Column(name = "POFootnoteID")
	private Integer pofootnoteId;

	@Column(name = "POUsecountry")
	private Integer pousecountry;

	@Column(name = "StartingRINumber")
	private Integer startingRinumber;

	@Column(name = "ProductTaxable")
	private Integer productTaxable;

	@Column(name = "EmployeeState", length = 50)
	private String employeeState;

	@Column(name = "EmployeeCountry", length = 50)
	private String employeeCountry;

	@Column(name = "ChargeSalestax")
	private Integer chargeSalestax;

	@Column(name = "HowOftenSalesTax")
	private Integer howOftenSalestax;

	@Column(name = "ShowReminder")
	private Integer showReminder;

	@Column(name = "InvoiceMemo")
	private Integer invoiceMemo;

	@Column(name = "InvoiceMemoDays")
	private Integer invoiceMemoDays;

	@Column(name = "OverdueInvoice")
	private Integer overdueInvoice;

	@Column(name = "OverdueInvoiceDays")
	private Integer overdueinvoiceDays;

	@Column(name = "InventoryOrder")
	private Integer inventoryOrder;

	@Column(name = "InventoryOrderDays")
	private Integer inventoryOrderDays;

	@Column(name = "BillstoPay")
	private Integer billstoPay;

	@Column(name = "BillstoPayDays")
	private Integer billstoPayDays;

	@Column(name = "Active", nullable = false)
	private Integer active;

	@Column(name = "StartDate")
	private OffsetDateTime startDate;

	@Column(name = "EndDate")
	private OffsetDateTime endDate;

	@Column(name = "isNodata")
	private Boolean isNodata;

	@Column(name = "isCreated")
	private Integer isCreated;

	@Column(name = "Paypal_Username")
	private String paypalUsername;

	@Column(name = "Paypal_Password")
	private String paypalPassword;

	@Column(name = "Paypal_Signature")
	private String paypalSignature;

	@Column(name = "Paypal_Environment")
	private String paypalEnvironment;

	@Column(name = "IsUse_Paypal_For_eBay_Import")
	private Integer isUsePaypalForEBayImport;

	@Column(name = "FederalTaxID")
	private Integer federalTaxId;

	@Column(name = "FiscalMonth", length = 45)
	private String fiscalMonth;

	@Column(name = "MembershipLevel", length = 100)
	private String membershipLevel;

	@Column(name = "Password", length = 100)
	private String password;

	@Column(name = "TaxID", length = 45)
	private String taxId;

	@Column(name = "SameAsPhoneNumber")
	private Boolean sameAsPhoneNumber;

	@Column(name = "JobPosition", length = 45)
	private String jobPosition;

	@OneToMany(mappedBy = "company")
	private Set<AdjustmentReason> companyAdjustmentReasons;

	@OneToMany(mappedBy = "company")
	private Set<BcaAccount> companyBcaAccounts;

	@OneToMany(mappedBy = "company")
	private Set<BcaAccountable> companyBcaAccountables;

	@OneToMany(mappedBy = "company")
	private Set<BcaApmemorizedgroup> companyBcaApmemorizedgroups;

	@OneToMany(mappedBy = "company")
	private Set<BcaApmemorizedingroup> companyBcaApmemorizedingroups;

	@OneToMany(mappedBy = "company")
	private Set<BcaArgroupbilling> companyBcaArgroupbillings;

	@OneToMany(mappedBy = "company")
	private Set<BcaBalancesheetitem> companyBcaBalancesheetitems;

	@OneToMany(mappedBy = "company")
	private Set<BcaBill> companyBcaBills;

	@OneToMany(mappedBy = "company")
	private Set<BcaBilldetail> companyBcaBilldetails;

	@OneToMany(mappedBy = "company")
	private Set<BcaBillingstatements> companyBcaBillingstatementss;

	@OneToMany(mappedBy = "company")
	private Set<BcaBudget> companyBcaBudgets;

	@OneToMany(mappedBy = "company")
	private Set<BcaBudgetcategory> companyBcaBudgetcategorys;

	@OneToMany(mappedBy = "company")
	private Set<BcaBusinessmodules> companyBcaBusinessmoduless;

	@OneToMany(mappedBy = "company")
	private Set<BcaCart> companyBcaCarts;

	@OneToMany(mappedBy = "company")
	private Set<BcaCartmemorized> companyBcaCartmemorizeds;

	@OneToMany(mappedBy = "company")
	private Set<BcaCategory> companyBcaCategorys;

	@OneToMany(mappedBy = "company")
	private Set<BcaCategorytype> companyBcaCategorytypes;

	@OneToMany(mappedBy = "company")
	private Set<BcaClientcategory> companyBcaClientcategorys;

	@OneToMany(mappedBy = "company")
	private Set<BcaClientvendor> companyBcaClientvendors;

	@OneToMany(mappedBy = "company")
	private Set<BcaClientvendorcontacthistory> companyBcaClientvendorcontacthistorys;

	@OneToMany(mappedBy = "company")
	private Set<BcaClientvendorjob> companyBcaClientvendorjobs;

	@OneToMany(mappedBy = "company")
	private Set<BcaClientvendorservice> companyBcaClientvendorservices;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BusinessTypeID")
	private BcaBusinesstype businessType;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "POStyleID")
	private BcaPostyle postyle;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SalesTaxID")
	private BcaSalestax salesTax;

	@OneToMany(mappedBy = "company")
	private Set<BcaConsignmentsale> companyBcaConsignmentsales;

	@OneToMany(mappedBy = "company")
	private Set<BcaCreditcardtype> companyBcaCreditcardtypes;

	@OneToMany(mappedBy = "company")
	private Set<BcaCurrency> companyBcaCurrencys;

	@OneToMany(mappedBy = "company")
	private Set<BcaCustomerType> companyBcaCustomerTypes;

	@OneToMany(mappedBy = "company")
	private Set<BcaExporteditemedetail> companyBcaExporteditemedetails;

	@OneToMany(mappedBy = "company")
	private Set<BcaFootnote> companyBcaFootnotes;

	@OneToMany(mappedBy = "company")
	private Set<BcaFormTemplates> companyBcaFormTemplatess;

	@OneToMany(mappedBy = "company")
	private Set<BcaFormTemplatesType> companyBcaFormTemplatesTypes;

	@OneToMany(mappedBy = "company")
	private Set<BcaHistory> companyBcaHistorys;

	@OneToMany(mappedBy = "company")
	private Set<BcaInventorycollectedfromstore> companyBcaInventorycollectedfromstores;

	@OneToMany(mappedBy = "company")
	private Set<BcaInventorysupplierdetail> companyBcaInventorysupplierdetails;

	@OneToMany(mappedBy = "company")
	private Set<BcaInventoryunitmeasure> companyBcaInventoryunitmeasures;

	@OneToMany(mappedBy = "company")
	private Set<BcaInvoice> companyBcaInvoices;

	@OneToMany(mappedBy = "company")
	private Set<BcaInvoiceTemplate> companyBcaInvoiceTemplates;

	@OneToMany(mappedBy = "company")
	private Set<BcaInvoicememorized> companyBcaInvoicememorizeds;

	@OneToMany(mappedBy = "company")
	private Set<BcaInvoicesalessummaryamt> companyBcaInvoicesalessummaryamts;

	@OneToMany(mappedBy = "company")
	private Set<BcaInvoiceshipped> companyBcaInvoiceshippeds;

	@OneToMany(mappedBy = "company")
	private Set<BcaInvstatus> companyBcaInvstatuss;

	@OneToMany(mappedBy = "company")
	private Set<BcaIteminventory> companyBcaIteminventorys;

	@OneToMany(mappedBy = "company")
	private Set<BcaJobcategory> companyBcaJobcategorys;

	@OneToMany(mappedBy = "company")
	private Set<BcaLead> companyBcaLeads;

	@OneToMany(mappedBy = "company")
	private Set<BcaLeadCategory> companyBcaLeadCategorys;

	@OneToMany(mappedBy = "company")
	private Set<BcaLeadProducts> companyBcaLeadProductss;

	@OneToMany(mappedBy = "company")
	private Set<BcaLeadSource> companyBcaLeadSources;

	@OneToMany(mappedBy = "company")
	private Set<BcaLineofcreditterm> companyBcaLineofcreditterms;

	@OneToMany(mappedBy = "company")
	private Set<BcaLocation> companyBcaLocations;

	@OneToMany(mappedBy = "company")
	private Set<BcaOrdertemplate> companyBcaOrdertemplates;

	@OneToMany(mappedBy = "company")
	private Set<BcaPayment> companyBcaPayments;

	@OneToMany(mappedBy = "company")
	private Set<BcaPaymentdetail> companyBcaPaymentdetails;

	@OneToMany(mappedBy = "company")
	private Set<BcaPaymenttype> companyBcaPaymenttypes;

	@OneToMany(mappedBy = "company")
	private Set<BcaPreference> companyBcaPreferences;

	@OneToMany(mappedBy = "company")
	private Set<BcaPricelevel> companyBcaPricelevels;

	@OneToMany(mappedBy = "company")
	private Set<BcaProductchannelsetting> companyBcaProductchannelsettings;

	@OneToMany(mappedBy = "company")
	private Set<BcaQuickbooklist> companyBcaQuickbooklists;

	@OneToMany(mappedBy = "company")
	private Set<BcaReceivedtype> companyBcaReceicedtypes;

	@OneToMany(mappedBy = "company")
	private Set<BcaRecentbills> companyBcaRecentbillss;

	@OneToMany(mappedBy = "company")
	private Set<BcaRecurrentpayment> companyBcaRecurrentpayments;

	@OneToMany(mappedBy = "company")
	private Set<BcaRefundlist> companyBcaRefundlists;

	@OneToMany(mappedBy = "company")
	private Set<BcaRefundreason> companyBcaRefundreasons;

	@OneToMany(mappedBy = "company")
	private Set<BcaReportproperty> companyBcaReportpropertys;

	@OneToMany(mappedBy = "company")
	private Set<BcaRmamaster> companyBcaRmamasters;

	@OneToMany(mappedBy = "company")
	private Set<BcaRmareason> companyBcaRmareasons;

	@OneToMany(mappedBy = "company")
	private Set<BcaRule> companyBcaRules;

	@OneToMany(mappedBy = "company")
	private Set<BcaRuleconditions> companyBcaRuleconditionss;

	@OneToMany(mappedBy = "company")
	private Set<BcaSalesorder> companyBcaSalesorders;

	@OneToMany(mappedBy = "company")
	private Set<BcaSalesrep> companyBcaSalesreps;

	@OneToMany(mappedBy = "company")
	private Set<BcaSalessummary> companyBcaSalessummarys;

	@OneToMany(mappedBy = "company")
	private Set<BcaSalestax> companyBcaSalestaxs;

	@OneToMany(mappedBy = "company")
	private Set<BcaScheduletimes> companyBcaScheduletimess;

	@OneToMany(mappedBy = "company")
	private Set<BcaServicetype> companyBcaServicetypes;

	@OneToMany(mappedBy = "company")
	private Set<BcaSettings> companyBcaSettingss;

	@OneToMany(mappedBy = "company")
	private Set<BcaShipcarrier> companyBcaShipcarriers;

	@OneToMany(mappedBy = "company")
	private Set<BcaStore> companyBcaStores;

	@OneToMany(mappedBy = "company")
	private Set<BcaTemplateConfig> companyBcaTemplateConfigs;

	@OneToMany(mappedBy = "company")
	private Set<BcaTerm> companyBcaTerms;

	@OneToMany(mappedBy = "company")
	private Set<BcaTitle> companyBcaTitles;

	@OneToMany(mappedBy = "company")
	private Set<BcaCvcategory> companyBcaCvcategory;

	@OneToMany(mappedBy = "company")
	private Set<BcaCctype> companyBcaCctype;

	@OneToMany(mappedBy = "company")
	private Set<BcaMessage> companyBcaMessage;

	@OneToMany(mappedBy = "company")
	private Set<BcaUnitofmeasure> companyBcaUnitofmeasures;

	@OneToMany(mappedBy = "company")
	private Set<BcaUser> companyBcaUsers;

	@OneToMany(mappedBy = "company")
	private Set<BcaUseractivity> companyBcaUseractivitys;

	@OneToMany(mappedBy = "company")
	private Set<BcaUserdefineshipcarrier> companyBcaUserdefineshipcarriers;

	@OneToMany(mappedBy = "company")
	private Set<BcaUsergroup> companyBcaUsergroups;

	@OneToMany(mappedBy = "company")
	private Set<BcaUsermapping> companyBcaUsermappings;

	@OneToMany(mappedBy = "company")
	private Set<BcaVendorcategory> companyBcaVendorcategorys;

	@OneToMany(mappedBy = "company")
	private Set<BcpDeductionlist> companyBcpDeductionlists;

	@OneToMany(mappedBy = "company")
	private Set<BcpEmployee> companyBcpEmployees;

	@OneToMany(mappedBy = "company")
	private Set<BcpEmployeetype> companyBcpEmployeetypes;

	@OneToMany(mappedBy = "company")
	private Set<BcpFilingstate> companyBcpFilingstates;

	@OneToMany(mappedBy = "company")
	private Set<BcpFilingstatus> companyBcpFilingstatuss;

	@OneToMany(mappedBy = "company")
	private Set<BcpIncome> companyBcpIncomes;

	@OneToMany(mappedBy = "company")
	private Set<BcpJobcode> companyBcpJobcodes;

	@OneToMany(mappedBy = "company")
	private Set<BcpJobtitle> companyBcpJobtitles;

	@OneToMany(mappedBy = "company")
	private Set<BcpPayroll> companyBcpPayrolls;

	@OneToMany(mappedBy = "company")
	private Set<BcpPayrollperiod> companyBcpPayrollperiods;

	@OneToMany(mappedBy = "company")
	private Set<BcpTaxCompany> companyBcpTaxCompanys;

	@OneToMany(mappedBy = "company")
	private Set<BcpTimesheetTime> companyBcpTimesheetTimes;

	@OneToMany(mappedBy = "company")
	private Set<BizcalAppoint> companyBizcalAppoints;

	@OneToMany(mappedBy = "company")
	private Set<BizcalReminder> companyBizcalReminders;

	@OneToMany(mappedBy = "company")
	private Set<CrmLead> companyCrmLeads;

	@OneToMany(mappedBy = "company")
	private Set<ItemCategoryDetails> companyItemCategoryDetailss;

	@OneToMany(mappedBy = "company")
	private Set<SmcOrders> companySmcOrderss;

	@OneToMany(mappedBy = "company")
	private Set<SmdAdmin> companySmdAdmins;

	@OneToMany(mappedBy = "company")
	private Set<SmdGatewaydetails> companySmdGatewaydetailss;

	@OneToMany(mappedBy = "company")
	private Set<SmdGiftcertificate> companySmdGiftcertificates;

	@OneToMany(mappedBy = "company")
	private Set<SmdGiftcertificateused> companySmdGiftcertificateuseds;

	@OneToMany(mappedBy = "company")
	private Set<SmdItemgroupprice> companySmdItemgroupprices;

	@OneToMany(mappedBy = "company")
	private Set<SmdItemimage> companySmdItemimages;

	@OneToMany(mappedBy = "company")
	private Set<SmdShipdetails> companySmdShipdetailss;

	@OneToMany(mappedBy = "company")
	private Set<StorageCart> companyStorageCarts;

	@OneToMany(mappedBy = "company")
	private Set<StorageClientvendor> companyStorageClientvendors;

	@OneToMany(mappedBy = "company")
	private Set<StorageInvoice> companyStorageInvoices;

	@OneToMany(mappedBy = "company")
	private Set<StorageUseractivity> companyStorageUseractivitys;

	@OneToMany(mappedBy = "company", fetch = FetchType.LAZY)
	private Set<BcaBillingaddress> billingAddresses;

	@OneToMany(mappedBy = "company", fetch = FetchType.LAZY)
	private Set<BcaShippingaddress> shippingAddresses;

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(final Long companyId) {
		this.companyId = companyId;
	}

	public String getName() {
		return name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(final String nickName) {
		this.nickName = nickName;
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

	public String getDetail() {
		return detail;
	}

	public void setDetail(final String detail) {
		this.detail = detail;
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(final String zipcode) {
		this.zipcode = zipcode;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(final String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(final String phone2) {
		this.phone2 = phone2;
	}

	public String getFax1() {
		return fax1;
	}

	public void setFax1(final String fax1) {
		this.fax1 = fax1;
	}

	public String getFax2() {
		return fax2;
	}

	public void setFax2(final String fax2) {
		this.fax2 = fax2;
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

	public String getFid() {
		return fid;
	}

	public void setFid(final String fid) {
		this.fid = fid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(final String sid) {
		this.sid = sid;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(final String currency) {
		this.currency = currency;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(final String weight) {
		this.weight = weight;
	}

	public String getLabelSize() {
		return labelSize;
	}

	public void setLabelSize(final String labelSize) {
		this.labelSize = labelSize;
	}

	public String getBackupPeriod() {
		return backupPeriod;
	}

	public void setBackupPeriod(final String backupPeriod) {
		this.backupPeriod = backupPeriod;
	}

	public String getBackupPlace() {
		return backupPlace;
	}

	public void setBackupPlace(final String backupPlace) {
		this.backupPlace = backupPlace;
	}

	public String getAdminUsername() {
		return adminUsername;
	}

	public void setAdminUsername(final String adminUsername) {
		this.adminUsername = adminUsername;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(final String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public Integer getMultimode() {
		return multimode;
	}

	public void setMultimode(final Integer multimode) {
		this.multimode = multimode;
	}

	public String getCustomerCountry() {
		return customerCountry;
	}

	public void setCustomerCountry(final String customerCountry) {
		this.customerCountry = customerCountry;
	}

	public Integer getCustomerTaxable() {
		return customerTaxable;
	}

	public void setCustomerTaxable(final Integer customerTaxable) {
		this.customerTaxable = customerTaxable;
	}

	public Integer getCustomerUsecompanyname() {
		return customerUsecompanyname;
	}

	public void setCustomerUsecompanyname(final Integer customerUsecompanyname) {
		this.customerUsecompanyname = customerUsecompanyname;
	}

	public Integer getStartingInvoiceNumber() {
		return startingInvoiceNumber;
	}

	public void setStartingInvoiceNumber(final Integer startingInvoiceNumber) {
		this.startingInvoiceNumber = startingInvoiceNumber;
	}

	public Integer getInvoiceStyleId() {
		return invoiceStyleId;
	}

	public void setInvoiceStyleId(final Integer invoiceStyleId) {
		this.invoiceStyleId = invoiceStyleId;
	}

	public Integer getInvoiceFootnoteId() {
		return invoiceFootnoteId;
	}

	public void setInvoiceFootnoteId(final Integer invoiceFootnoteId) {
		this.invoiceFootnoteId = invoiceFootnoteId;
	}

	public Integer getUseProductWeight() {
		return useProductWeight;
	}

	public void setUseProductWeight(final Integer useProductWeight) {
		this.useProductWeight = useProductWeight;
	}

	public Integer getUseShippingTable() {
		return useShippingTable;
	}

	public void setUseShippingTable(final Integer useShippingTable) {
		this.useShippingTable = useShippingTable;
	}

	public Integer getInvoiceUseCountry() {
		return invoiceUseCountry;
	}

	public void setInvoiceUseCountry(final Integer invoiceUseCountry) {
		this.invoiceUseCountry = invoiceUseCountry;
	}

	public Integer getVendorCountry() {
		return vendorCountry;
	}

	public void setVendorCountry(final Integer vendorCountry) {
		this.vendorCountry = vendorCountry;
	}

	public Integer getVendorUseCompanyname() {
		return vendorUseCompanyname;
	}

	public void setVendorUseCompanyname(final Integer vendorUseCompanyname) {
		this.vendorUseCompanyname = vendorUseCompanyname;
	}

	public Integer getStartingPonumber() {
		return startingPonumber;
	}

	public void setStartingPonumber(final Integer startingPonumber) {
		this.startingPonumber = startingPonumber;
	}

	public Integer getPofootnoteId() {
		return pofootnoteId;
	}

	public void setPofootnoteId(final Integer pofootnoteId) {
		this.pofootnoteId = pofootnoteId;
	}

	public Integer getPousecountry() {
		return pousecountry;
	}

	public void setPousecountry(final Integer pousecountry) {
		this.pousecountry = pousecountry;
	}

	public Integer getStartingRinumber() {
		return startingRinumber;
	}

	public void setStartingRinumber(final Integer startingRinumber) {
		this.startingRinumber = startingRinumber;
	}

	public Integer getProductTaxable() {
		return productTaxable;
	}

	public void setProductTaxable(final Integer productTaxable) {
		this.productTaxable = productTaxable;
	}

	public String getEmployeeState() {
		return employeeState;
	}

	public void setEmployeeState(final String employeeState) {
		this.employeeState = employeeState;
	}

	public String getEmployeeCountry() {
		return employeeCountry;
	}

	public void setEmployeeCountry(final String employeeCountry) {
		this.employeeCountry = employeeCountry;
	}

	public Integer getChargeSalestax() {
		return chargeSalestax;
	}

	public void setChargeSalestax(final Integer chargeSalestax) {
		this.chargeSalestax = chargeSalestax;
	}

	public Integer getHowOftenSalestax() {
		return howOftenSalestax;
	}

	public void setHowOftenSalestax(final Integer howOftenSalestax) {
		this.howOftenSalestax = howOftenSalestax;
	}

	public Integer getShowReminder() {
		return showReminder;
	}

	public void setShowReminder(final Integer showReminder) {
		this.showReminder = showReminder;
	}

	public Integer getInvoiceMemo() {
		return invoiceMemo;
	}

	public void setInvoiceMemo(final Integer invoiceMemo) {
		this.invoiceMemo = invoiceMemo;
	}

	public Integer getInvoiceMemoDays() {
		return invoiceMemoDays;
	}

	public void setInvoiceMemoDays(final Integer invoiceMemoDays) {
		this.invoiceMemoDays = invoiceMemoDays;
	}

	public Integer getOverdueInvoice() {
		return overdueInvoice;
	}

	public void setOverdueInvoice(final Integer overdueInvoice) {
		this.overdueInvoice = overdueInvoice;
	}

	public Integer getOverdueinvoiceDays() {
		return overdueinvoiceDays;
	}

	public void setOverdueinvoiceDays(final Integer overdueinvoiceDays) {
		this.overdueinvoiceDays = overdueinvoiceDays;
	}

	public Integer getInventoryOrder() {
		return inventoryOrder;
	}

	public void setInventoryOrder(final Integer inventoryOrder) {
		this.inventoryOrder = inventoryOrder;
	}

	public Integer getInventoryOrderDays() {
		return inventoryOrderDays;
	}

	public void setInventoryOrderDays(final Integer inventoryOrderDays) {
		this.inventoryOrderDays = inventoryOrderDays;
	}

	public Integer getBillstoPay() {
		return billstoPay;
	}

	public void setBillstoPay(final Integer billstoPay) {
		this.billstoPay = billstoPay;
	}

	public Integer getBillstoPayDays() {
		return billstoPayDays;
	}

	public void setBillstoPayDays(final Integer billstoPayDays) {
		this.billstoPayDays = billstoPayDays;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(final Integer active) {
		this.active = active;
	}

	public OffsetDateTime getStartDate() {
		return startDate;
	}

	public void setStartDate(final OffsetDateTime startDate) {
		this.startDate = startDate;
	}

	public OffsetDateTime getEndDate() {
		return endDate;
	}

	public void setEndDate(final OffsetDateTime endDate) {
		this.endDate = endDate;
	}

	public Boolean getIsNodata() {
		return isNodata;
	}

	public void setIsNodata(final Boolean isNodata) {
		this.isNodata = isNodata;
	}

	public Integer getIsCreated() {
		return isCreated;
	}

	public void setIsCreated(final Integer isCreated) {
		this.isCreated = isCreated;
	}

	public String getPaypalUsername() {
		return paypalUsername;
	}

	public void setPaypalUsername(final String paypalUsername) {
		this.paypalUsername = paypalUsername;
	}

	public String getPaypalPassword() {
		return paypalPassword;
	}

	public void setPaypalPassword(final String paypalPassword) {
		this.paypalPassword = paypalPassword;
	}

	public String getPaypalSignature() {
		return paypalSignature;
	}

	public void setPaypalSignature(final String paypalSignature) {
		this.paypalSignature = paypalSignature;
	}

	public String getPaypalEnvironment() {
		return paypalEnvironment;
	}

	public void setPaypalEnvironment(final String paypalEnvironment) {
		this.paypalEnvironment = paypalEnvironment;
	}

	public Integer getIsUsePaypalForEBayImport() {
		return isUsePaypalForEBayImport;
	}

	public void setIsUsePaypalForEBayImport(final Integer isUsePaypalForEBayImport) {
		this.isUsePaypalForEBayImport = isUsePaypalForEBayImport;
	}

	public Integer getFederalTaxId() {
		return federalTaxId;
	}

	public void setFederalTaxId(final Integer federalTaxId) {
		this.federalTaxId = federalTaxId;
	}

	public String getFiscalMonth() {
		return fiscalMonth;
	}

	public void setFiscalMonth(final String fiscalMonth) {
		this.fiscalMonth = fiscalMonth;
	}

	public String getMembershipLevel() {
		return membershipLevel;
	}

	public void setMembershipLevel(final String membershipLevel) {
		this.membershipLevel = membershipLevel;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(final String password) {
		this.password = password;
	}

	public String getTaxId() {
		return taxId;
	}

	public void setTaxId(final String taxId) {
		this.taxId = taxId;
	}

	public Boolean getSameAsPhoneNumber() {
		return sameAsPhoneNumber;
	}

	public void setSameAsPhoneNumber(final Boolean sameAsPhoneNumber) {
		this.sameAsPhoneNumber = sameAsPhoneNumber;
	}

	public String getJobPosition() {
		return jobPosition;
	}

	public void setJobPosition(final String jobPosition) {
		this.jobPosition = jobPosition;
	}

	public Set<AdjustmentReason> getCompanyAdjustmentReasons() {
		return companyAdjustmentReasons;
	}

	public void setCompanyAdjustmentReasons(final Set<AdjustmentReason> companyAdjustmentReasons) {
		this.companyAdjustmentReasons = companyAdjustmentReasons;
	}

	public Set<BcaAccount> getCompanyBcaAccounts() {
		return companyBcaAccounts;
	}

	public void setCompanyBcaAccounts(final Set<BcaAccount> companyBcaAccounts) {
		this.companyBcaAccounts = companyBcaAccounts;
	}

	public Set<BcaAccountable> getCompanyBcaAccountables() {
		return companyBcaAccountables;
	}

	public void setCompanyBcaAccountables(final Set<BcaAccountable> companyBcaAccountables) {
		this.companyBcaAccountables = companyBcaAccountables;
	}

	public Set<BcaApmemorizedgroup> getCompanyBcaApmemorizedgroups() {
		return companyBcaApmemorizedgroups;
	}

	public void setCompanyBcaApmemorizedgroups(final Set<BcaApmemorizedgroup> companyBcaApmemorizedgroups) {
		this.companyBcaApmemorizedgroups = companyBcaApmemorizedgroups;
	}

	public Set<BcaApmemorizedingroup> getCompanyBcaApmemorizedingroups() {
		return companyBcaApmemorizedingroups;
	}

	public void setCompanyBcaApmemorizedingroups(final Set<BcaApmemorizedingroup> companyBcaApmemorizedingroups) {
		this.companyBcaApmemorizedingroups = companyBcaApmemorizedingroups;
	}

	public Set<BcaArgroupbilling> getCompanyBcaArgroupbillings() {
		return companyBcaArgroupbillings;
	}

	public void setCompanyBcaArgroupbillings(final Set<BcaArgroupbilling> companyBcaArgroupbillings) {
		this.companyBcaArgroupbillings = companyBcaArgroupbillings;
	}

	public Set<BcaBalancesheetitem> getCompanyBcaBalancesheetitems() {
		return companyBcaBalancesheetitems;
	}

	public void setCompanyBcaBalancesheetitems(final Set<BcaBalancesheetitem> companyBcaBalancesheetitems) {
		this.companyBcaBalancesheetitems = companyBcaBalancesheetitems;
	}

	public Set<BcaBill> getCompanyBcaBills() {
		return companyBcaBills;
	}

	public void setCompanyBcaBills(final Set<BcaBill> companyBcaBills) {
		this.companyBcaBills = companyBcaBills;
	}

	public Set<BcaBilldetail> getCompanyBcaBilldetails() {
		return companyBcaBilldetails;
	}

	public void setCompanyBcaBilldetails(final Set<BcaBilldetail> companyBcaBilldetails) {
		this.companyBcaBilldetails = companyBcaBilldetails;
	}

	public Set<BcaBillingstatements> getCompanyBcaBillingstatementss() {
		return companyBcaBillingstatementss;
	}

	public void setCompanyBcaBillingstatementss(final Set<BcaBillingstatements> companyBcaBillingstatementss) {
		this.companyBcaBillingstatementss = companyBcaBillingstatementss;
	}

	public Set<BcaBudget> getCompanyBcaBudgets() {
		return companyBcaBudgets;
	}

	public void setCompanyBcaBudgets(final Set<BcaBudget> companyBcaBudgets) {
		this.companyBcaBudgets = companyBcaBudgets;
	}

	public Set<BcaBudgetcategory> getCompanyBcaBudgetcategorys() {
		return companyBcaBudgetcategorys;
	}

	public void setCompanyBcaBudgetcategorys(final Set<BcaBudgetcategory> companyBcaBudgetcategorys) {
		this.companyBcaBudgetcategorys = companyBcaBudgetcategorys;
	}

	public Set<BcaBusinessmodules> getCompanyBcaBusinessmoduless() {
		return companyBcaBusinessmoduless;
	}

	public void setCompanyBcaBusinessmoduless(final Set<BcaBusinessmodules> companyBcaBusinessmoduless) {
		this.companyBcaBusinessmoduless = companyBcaBusinessmoduless;
	}

	public Set<BcaCart> getCompanyBcaCarts() {
		return companyBcaCarts;
	}

	public void setCompanyBcaCarts(final Set<BcaCart> companyBcaCarts) {
		this.companyBcaCarts = companyBcaCarts;
	}

	public Set<BcaCartmemorized> getCompanyBcaCartmemorizeds() {
		return companyBcaCartmemorizeds;
	}

	public void setCompanyBcaCartmemorizeds(final Set<BcaCartmemorized> companyBcaCartmemorizeds) {
		this.companyBcaCartmemorizeds = companyBcaCartmemorizeds;
	}

	public Set<BcaCategory> getCompanyBcaCategorys() {
		return companyBcaCategorys;
	}

	public void setCompanyBcaCategorys(final Set<BcaCategory> companyBcaCategorys) {
		this.companyBcaCategorys = companyBcaCategorys;
	}

	public Set<BcaCategorytype> getCompanyBcaCategorytypes() {
		return companyBcaCategorytypes;
	}

	public void setCompanyBcaCategorytypes(final Set<BcaCategorytype> companyBcaCategorytypes) {
		this.companyBcaCategorytypes = companyBcaCategorytypes;
	}

	public Set<BcaClientcategory> getCompanyBcaClientcategorys() {
		return companyBcaClientcategorys;
	}

	public void setCompanyBcaClientcategorys(final Set<BcaClientcategory> companyBcaClientcategorys) {
		this.companyBcaClientcategorys = companyBcaClientcategorys;
	}

	public Set<BcaClientvendor> getCompanyBcaClientvendors() {
		return companyBcaClientvendors;
	}

	public void setCompanyBcaClientvendors(final Set<BcaClientvendor> companyBcaClientvendors) {
		this.companyBcaClientvendors = companyBcaClientvendors;
	}

	public Set<BcaClientvendorcontacthistory> getCompanyBcaClientvendorcontacthistorys() {
		return companyBcaClientvendorcontacthistorys;
	}

	public void setCompanyBcaClientvendorcontacthistorys(
			final Set<BcaClientvendorcontacthistory> companyBcaClientvendorcontacthistorys) {
		this.companyBcaClientvendorcontacthistorys = companyBcaClientvendorcontacthistorys;
	}

	public Set<BcaClientvendorjob> getCompanyBcaClientvendorjobs() {
		return companyBcaClientvendorjobs;
	}

	public void setCompanyBcaClientvendorjobs(final Set<BcaClientvendorjob> companyBcaClientvendorjobs) {
		this.companyBcaClientvendorjobs = companyBcaClientvendorjobs;
	}

	public Set<BcaClientvendorservice> getCompanyBcaClientvendorservices() {
		return companyBcaClientvendorservices;
	}

	public void setCompanyBcaClientvendorservices(final Set<BcaClientvendorservice> companyBcaClientvendorservices) {
		this.companyBcaClientvendorservices = companyBcaClientvendorservices;
	}

	public BcaBusinesstype getBusinessType() {
		return businessType;
	}

	public void setBusinessType(final BcaBusinesstype businessType) {
		this.businessType = businessType;
	}

	public BcaPostyle getPostyle() {
		return postyle;
	}

	public void setPostyle(final BcaPostyle postyle) {
		this.postyle = postyle;
	}

	public BcaSalestax getSalesTax() {
		return salesTax;
	}

	public void setSalesTax(final BcaSalestax salesTax) {
		this.salesTax = salesTax;
	}

	public Set<BcaConsignmentsale> getCompanyBcaConsignmentsales() {
		return companyBcaConsignmentsales;
	}

	public void setCompanyBcaConsignmentsales(final Set<BcaConsignmentsale> companyBcaConsignmentsales) {
		this.companyBcaConsignmentsales = companyBcaConsignmentsales;
	}

	public Set<BcaCreditcardtype> getCompanyBcaCreditcardtypes() {
		return companyBcaCreditcardtypes;
	}

	public void setCompanyBcaCreditcardtypes(final Set<BcaCreditcardtype> companyBcaCreditcardtypes) {
		this.companyBcaCreditcardtypes = companyBcaCreditcardtypes;
	}

	public Set<BcaCurrency> getCompanyBcaCurrencys() {
		return companyBcaCurrencys;
	}

	public void setCompanyBcaCurrencys(final Set<BcaCurrency> companyBcaCurrencys) {
		this.companyBcaCurrencys = companyBcaCurrencys;
	}

	public Set<BcaCustomerType> getCompanyBcaCustomerTypes() {
		return companyBcaCustomerTypes;
	}

	public void setCompanyBcaCustomerTypes(final Set<BcaCustomerType> companyBcaCustomerTypes) {
		this.companyBcaCustomerTypes = companyBcaCustomerTypes;
	}

	public Set<BcaExporteditemedetail> getCompanyBcaExporteditemedetails() {
		return companyBcaExporteditemedetails;
	}

	public void setCompanyBcaExporteditemedetails(final Set<BcaExporteditemedetail> companyBcaExporteditemedetails) {
		this.companyBcaExporteditemedetails = companyBcaExporteditemedetails;
	}

	public Set<BcaFootnote> getCompanyBcaFootnotes() {
		return companyBcaFootnotes;
	}

	public void setCompanyBcaFootnotes(final Set<BcaFootnote> companyBcaFootnotes) {
		this.companyBcaFootnotes = companyBcaFootnotes;
	}

	public Set<BcaFormTemplates> getCompanyBcaFormTemplatess() {
		return companyBcaFormTemplatess;
	}

	public void setCompanyBcaFormTemplatess(final Set<BcaFormTemplates> companyBcaFormTemplatess) {
		this.companyBcaFormTemplatess = companyBcaFormTemplatess;
	}

	public Set<BcaFormTemplatesType> getCompanyBcaFormTemplatesTypes() {
		return companyBcaFormTemplatesTypes;
	}

	public void setCompanyBcaFormTemplatesTypes(final Set<BcaFormTemplatesType> companyBcaFormTemplatesTypes) {
		this.companyBcaFormTemplatesTypes = companyBcaFormTemplatesTypes;
	}

	public Set<BcaHistory> getCompanyBcaHistorys() {
		return companyBcaHistorys;
	}

	public void setCompanyBcaHistorys(final Set<BcaHistory> companyBcaHistorys) {
		this.companyBcaHistorys = companyBcaHistorys;
	}

	public Set<BcaInventorycollectedfromstore> getCompanyBcaInventorycollectedfromstores() {
		return companyBcaInventorycollectedfromstores;
	}

	public void setCompanyBcaInventorycollectedfromstores(
			final Set<BcaInventorycollectedfromstore> companyBcaInventorycollectedfromstores) {
		this.companyBcaInventorycollectedfromstores = companyBcaInventorycollectedfromstores;
	}

	public Set<BcaInventorysupplierdetail> getCompanyBcaInventorysupplierdetails() {
		return companyBcaInventorysupplierdetails;
	}

	public void setCompanyBcaInventorysupplierdetails(
			final Set<BcaInventorysupplierdetail> companyBcaInventorysupplierdetails) {
		this.companyBcaInventorysupplierdetails = companyBcaInventorysupplierdetails;
	}

	public Set<BcaInventoryunitmeasure> getCompanyBcaInventoryunitmeasures() {
		return companyBcaInventoryunitmeasures;
	}

	public void setCompanyBcaInventoryunitmeasures(final Set<BcaInventoryunitmeasure> companyBcaInventoryunitmeasures) {
		this.companyBcaInventoryunitmeasures = companyBcaInventoryunitmeasures;
	}

	public Set<BcaInvoice> getCompanyBcaInvoices() {
		return companyBcaInvoices;
	}

	public void setCompanyBcaInvoices(final Set<BcaInvoice> companyBcaInvoices) {
		this.companyBcaInvoices = companyBcaInvoices;
	}

	public Set<BcaInvoiceTemplate> getCompanyBcaInvoiceTemplates() {
		return companyBcaInvoiceTemplates;
	}

	public void setCompanyBcaInvoiceTemplates(final Set<BcaInvoiceTemplate> companyBcaInvoiceTemplates) {
		this.companyBcaInvoiceTemplates = companyBcaInvoiceTemplates;
	}

	public Set<BcaInvoicememorized> getCompanyBcaInvoicememorizeds() {
		return companyBcaInvoicememorizeds;
	}

	public void setCompanyBcaInvoicememorizeds(final Set<BcaInvoicememorized> companyBcaInvoicememorizeds) {
		this.companyBcaInvoicememorizeds = companyBcaInvoicememorizeds;
	}

	public Set<BcaInvoicesalessummaryamt> getCompanyBcaInvoicesalessummaryamts() {
		return companyBcaInvoicesalessummaryamts;
	}

	public void setCompanyBcaInvoicesalessummaryamts(
			final Set<BcaInvoicesalessummaryamt> companyBcaInvoicesalessummaryamts) {
		this.companyBcaInvoicesalessummaryamts = companyBcaInvoicesalessummaryamts;
	}

	public Set<BcaInvoiceshipped> getCompanyBcaInvoiceshippeds() {
		return companyBcaInvoiceshippeds;
	}

	public void setCompanyBcaInvoiceshippeds(final Set<BcaInvoiceshipped> companyBcaInvoiceshippeds) {
		this.companyBcaInvoiceshippeds = companyBcaInvoiceshippeds;
	}

	public Set<BcaInvstatus> getCompanyBcaInvstatuss() {
		return companyBcaInvstatuss;
	}

	public void setCompanyBcaInvstatuss(final Set<BcaInvstatus> companyBcaInvstatuss) {
		this.companyBcaInvstatuss = companyBcaInvstatuss;
	}

	public Set<BcaIteminventory> getCompanyBcaIteminventorys() {
		return companyBcaIteminventorys;
	}

	public void setCompanyBcaIteminventorys(final Set<BcaIteminventory> companyBcaIteminventorys) {
		this.companyBcaIteminventorys = companyBcaIteminventorys;
	}

	public Set<BcaJobcategory> getCompanyBcaJobcategorys() {
		return companyBcaJobcategorys;
	}

	public void setCompanyBcaJobcategorys(final Set<BcaJobcategory> companyBcaJobcategorys) {
		this.companyBcaJobcategorys = companyBcaJobcategorys;
	}

	public Set<BcaLead> getCompanyBcaLeads() {
		return companyBcaLeads;
	}

	public void setCompanyBcaLeads(final Set<BcaLead> companyBcaLeads) {
		this.companyBcaLeads = companyBcaLeads;
	}

	public Set<BcaLeadCategory> getCompanyBcaLeadCategorys() {
		return companyBcaLeadCategorys;
	}

	public void setCompanyBcaLeadCategorys(final Set<BcaLeadCategory> companyBcaLeadCategorys) {
		this.companyBcaLeadCategorys = companyBcaLeadCategorys;
	}

	public Set<BcaLeadProducts> getCompanyBcaLeadProductss() {
		return companyBcaLeadProductss;
	}

	public void setCompanyBcaLeadProductss(final Set<BcaLeadProducts> companyBcaLeadProductss) {
		this.companyBcaLeadProductss = companyBcaLeadProductss;
	}

	public Set<BcaLeadSource> getCompanyBcaLeadSources() {
		return companyBcaLeadSources;
	}

	public void setCompanyBcaLeadSources(final Set<BcaLeadSource> companyBcaLeadSources) {
		this.companyBcaLeadSources = companyBcaLeadSources;
	}

	public Set<BcaLineofcreditterm> getCompanyBcaLineofcreditterms() {
		return companyBcaLineofcreditterms;
	}

	public void setCompanyBcaLineofcreditterms(final Set<BcaLineofcreditterm> companyBcaLineofcreditterms) {
		this.companyBcaLineofcreditterms = companyBcaLineofcreditterms;
	}

	public Set<BcaLocation> getCompanyBcaLocations() {
		return companyBcaLocations;
	}

	public void setCompanyBcaLocations(final Set<BcaLocation> companyBcaLocations) {
		this.companyBcaLocations = companyBcaLocations;
	}

	public Set<BcaOrdertemplate> getCompanyBcaOrdertemplates() {
		return companyBcaOrdertemplates;
	}

	public void setCompanyBcaOrdertemplates(final Set<BcaOrdertemplate> companyBcaOrdertemplates) {
		this.companyBcaOrdertemplates = companyBcaOrdertemplates;
	}

	public Set<BcaPayment> getCompanyBcaPayments() {
		return companyBcaPayments;
	}

	public void setCompanyBcaPayments(final Set<BcaPayment> companyBcaPayments) {
		this.companyBcaPayments = companyBcaPayments;
	}

	public Set<BcaPaymentdetail> getCompanyBcaPaymentdetails() {
		return companyBcaPaymentdetails;
	}

	public void setCompanyBcaPaymentdetails(final Set<BcaPaymentdetail> companyBcaPaymentdetails) {
		this.companyBcaPaymentdetails = companyBcaPaymentdetails;
	}

	public Set<BcaPaymenttype> getCompanyBcaPaymenttypes() {
		return companyBcaPaymenttypes;
	}

	public void setCompanyBcaPaymenttypes(final Set<BcaPaymenttype> companyBcaPaymenttypes) {
		this.companyBcaPaymenttypes = companyBcaPaymenttypes;
	}

	public Set<BcaPreference> getCompanyBcaPreferences() {
		return companyBcaPreferences;
	}

	public void setCompanyBcaPreferences(final Set<BcaPreference> companyBcaPreferences) {
		this.companyBcaPreferences = companyBcaPreferences;
	}

	public Set<BcaPricelevel> getCompanyBcaPricelevels() {
		return companyBcaPricelevels;
	}

	public void setCompanyBcaPricelevels(final Set<BcaPricelevel> companyBcaPricelevels) {
		this.companyBcaPricelevels = companyBcaPricelevels;
	}

	public Set<BcaProductchannelsetting> getCompanyBcaProductchannelsettings() {
		return companyBcaProductchannelsettings;
	}

	public void setCompanyBcaProductchannelsettings(
			final Set<BcaProductchannelsetting> companyBcaProductchannelsettings) {
		this.companyBcaProductchannelsettings = companyBcaProductchannelsettings;
	}

	public Set<BcaQuickbooklist> getCompanyBcaQuickbooklists() {
		return companyBcaQuickbooklists;
	}

	public void setCompanyBcaQuickbooklists(final Set<BcaQuickbooklist> companyBcaQuickbooklists) {
		this.companyBcaQuickbooklists = companyBcaQuickbooklists;
	}

	public Set<BcaReceivedtype> getCompanyBcaReceicedtypes() {
		return companyBcaReceicedtypes;
	}

	public void setCompanyBcaReceicedtypes(final Set<BcaReceivedtype> companyBcaReceicedtypes) {
		this.companyBcaReceicedtypes = companyBcaReceicedtypes;
	}

	public Set<BcaRecentbills> getCompanyBcaRecentbillss() {
		return companyBcaRecentbillss;
	}

	public void setCompanyBcaRecentbillss(final Set<BcaRecentbills> companyBcaRecentbillss) {
		this.companyBcaRecentbillss = companyBcaRecentbillss;
	}

	public Set<BcaRecurrentpayment> getCompanyBcaRecurrentpayments() {
		return companyBcaRecurrentpayments;
	}

	public void setCompanyBcaRecurrentpayments(final Set<BcaRecurrentpayment> companyBcaRecurrentpayments) {
		this.companyBcaRecurrentpayments = companyBcaRecurrentpayments;
	}

	public Set<BcaRefundlist> getCompanyBcaRefundlists() {
		return companyBcaRefundlists;
	}

	public void setCompanyBcaRefundlists(final Set<BcaRefundlist> companyBcaRefundlists) {
		this.companyBcaRefundlists = companyBcaRefundlists;
	}

	public Set<BcaRefundreason> getCompanyBcaRefundreasons() {
		return companyBcaRefundreasons;
	}

	public void setCompanyBcaRefundreasons(final Set<BcaRefundreason> companyBcaRefundreasons) {
		this.companyBcaRefundreasons = companyBcaRefundreasons;
	}

	public Set<BcaReportproperty> getCompanyBcaReportpropertys() {
		return companyBcaReportpropertys;
	}

	public void setCompanyBcaReportpropertys(final Set<BcaReportproperty> companyBcaReportpropertys) {
		this.companyBcaReportpropertys = companyBcaReportpropertys;
	}

	public Set<BcaRmamaster> getCompanyBcaRmamasters() {
		return companyBcaRmamasters;
	}

	public void setCompanyBcaRmamasters(final Set<BcaRmamaster> companyBcaRmamasters) {
		this.companyBcaRmamasters = companyBcaRmamasters;
	}

	public Set<BcaRmareason> getCompanyBcaRmareasons() {
		return companyBcaRmareasons;
	}

	public void setCompanyBcaRmareasons(final Set<BcaRmareason> companyBcaRmareasons) {
		this.companyBcaRmareasons = companyBcaRmareasons;
	}

	public Set<BcaRule> getCompanyBcaRules() {
		return companyBcaRules;
	}

	public void setCompanyBcaRules(final Set<BcaRule> companyBcaRules) {
		this.companyBcaRules = companyBcaRules;
	}

	public Set<BcaRuleconditions> getCompanyBcaRuleconditionss() {
		return companyBcaRuleconditionss;
	}

	public void setCompanyBcaRuleconditionss(final Set<BcaRuleconditions> companyBcaRuleconditionss) {
		this.companyBcaRuleconditionss = companyBcaRuleconditionss;
	}

	public Set<BcaSalesorder> getCompanyBcaSalesorders() {
		return companyBcaSalesorders;
	}

	public void setCompanyBcaSalesorders(final Set<BcaSalesorder> companyBcaSalesorders) {
		this.companyBcaSalesorders = companyBcaSalesorders;
	}

	public Set<BcaSalesrep> getCompanyBcaSalesreps() {
		return companyBcaSalesreps;
	}

	public void setCompanyBcaSalesreps(final Set<BcaSalesrep> companyBcaSalesreps) {
		this.companyBcaSalesreps = companyBcaSalesreps;
	}

	public Set<BcaSalessummary> getCompanyBcaSalessummarys() {
		return companyBcaSalessummarys;
	}

	public void setCompanyBcaSalessummarys(final Set<BcaSalessummary> companyBcaSalessummarys) {
		this.companyBcaSalessummarys = companyBcaSalessummarys;
	}

	public Set<BcaSalestax> getCompanyBcaSalestaxs() {
		return companyBcaSalestaxs;
	}

	public void setCompanyBcaSalestaxs(final Set<BcaSalestax> companyBcaSalestaxs) {
		this.companyBcaSalestaxs = companyBcaSalestaxs;
	}

	public Set<BcaScheduletimes> getCompanyBcaScheduletimess() {
		return companyBcaScheduletimess;
	}

	public void setCompanyBcaScheduletimess(final Set<BcaScheduletimes> companyBcaScheduletimess) {
		this.companyBcaScheduletimess = companyBcaScheduletimess;
	}

	public Set<BcaServicetype> getCompanyBcaServicetypes() {
		return companyBcaServicetypes;
	}

	public void setCompanyBcaServicetypes(final Set<BcaServicetype> companyBcaServicetypes) {
		this.companyBcaServicetypes = companyBcaServicetypes;
	}

	public Set<BcaSettings> getCompanyBcaSettingss() {
		return companyBcaSettingss;
	}

	public void setCompanyBcaSettingss(final Set<BcaSettings> companyBcaSettingss) {
		this.companyBcaSettingss = companyBcaSettingss;
	}

	public Set<BcaShipcarrier> getCompanyBcaShipcarriers() {
		return companyBcaShipcarriers;
	}

	public void setCompanyBcaShipcarriers(final Set<BcaShipcarrier> companyBcaShipcarriers) {
		this.companyBcaShipcarriers = companyBcaShipcarriers;
	}

	public Set<BcaStore> getCompanyBcaStores() {
		return companyBcaStores;
	}

	public void setCompanyBcaStores(final Set<BcaStore> companyBcaStores) {
		this.companyBcaStores = companyBcaStores;
	}

	public Set<BcaTemplateConfig> getCompanyBcaTemplateConfigs() {
		return companyBcaTemplateConfigs;
	}

	public void setCompanyBcaTemplateConfigs(final Set<BcaTemplateConfig> companyBcaTemplateConfigs) {
		this.companyBcaTemplateConfigs = companyBcaTemplateConfigs;
	}

	public Set<BcaTerm> getCompanyBcaTerms() {
		return companyBcaTerms;
	}

	public void setCompanyBcaTerms(final Set<BcaTerm> companyBcaTerms) {
		this.companyBcaTerms = companyBcaTerms;
	}

	public Set<BcaTitle> getCompanyBcaTitles() {
		return companyBcaTitles;
	}

	public void setCompanyBcaTitles(final Set<BcaTitle> companyBcaTitles) {
		this.companyBcaTitles = companyBcaTitles;
	}

	public Set<BcaUnitofmeasure> getCompanyBcaUnitofmeasures() {
		return companyBcaUnitofmeasures;
	}

	public void setCompanyBcaUnitofmeasures(final Set<BcaUnitofmeasure> companyBcaUnitofmeasures) {
		this.companyBcaUnitofmeasures = companyBcaUnitofmeasures;
	}

	public Set<BcaUser> getCompanyBcaUsers() {
		return companyBcaUsers;
	}

	public void setCompanyBcaUsers(final Set<BcaUser> companyBcaUsers) {
		this.companyBcaUsers = companyBcaUsers;
	}

	public Set<BcaUseractivity> getCompanyBcaUseractivitys() {
		return companyBcaUseractivitys;
	}

	public void setCompanyBcaUseractivitys(final Set<BcaUseractivity> companyBcaUseractivitys) {
		this.companyBcaUseractivitys = companyBcaUseractivitys;
	}

	public Set<BcaUserdefineshipcarrier> getCompanyBcaUserdefineshipcarriers() {
		return companyBcaUserdefineshipcarriers;
	}

	public void setCompanyBcaUserdefineshipcarriers(
			final Set<BcaUserdefineshipcarrier> companyBcaUserdefineshipcarriers) {
		this.companyBcaUserdefineshipcarriers = companyBcaUserdefineshipcarriers;
	}

	public Set<BcaUsergroup> getCompanyBcaUsergroups() {
		return companyBcaUsergroups;
	}

	public void setCompanyBcaUsergroups(final Set<BcaUsergroup> companyBcaUsergroups) {
		this.companyBcaUsergroups = companyBcaUsergroups;
	}

	public Set<BcaUsermapping> getCompanyBcaUsermappings() {
		return companyBcaUsermappings;
	}

	public void setCompanyBcaUsermappings(final Set<BcaUsermapping> companyBcaUsermappings) {
		this.companyBcaUsermappings = companyBcaUsermappings;
	}

	public Set<BcaVendorcategory> getCompanyBcaVendorcategorys() {
		return companyBcaVendorcategorys;
	}

	public void setCompanyBcaVendorcategorys(final Set<BcaVendorcategory> companyBcaVendorcategorys) {
		this.companyBcaVendorcategorys = companyBcaVendorcategorys;
	}

	public Set<BcpDeductionlist> getCompanyBcpDeductionlists() {
		return companyBcpDeductionlists;
	}

	public void setCompanyBcpDeductionlists(final Set<BcpDeductionlist> companyBcpDeductionlists) {
		this.companyBcpDeductionlists = companyBcpDeductionlists;
	}

	public Set<BcpEmployee> getCompanyBcpEmployees() {
		return companyBcpEmployees;
	}

	public void setCompanyBcpEmployees(final Set<BcpEmployee> companyBcpEmployees) {
		this.companyBcpEmployees = companyBcpEmployees;
	}

	public Set<BcpEmployeetype> getCompanyBcpEmployeetypes() {
		return companyBcpEmployeetypes;
	}

	public void setCompanyBcpEmployeetypes(final Set<BcpEmployeetype> companyBcpEmployeetypes) {
		this.companyBcpEmployeetypes = companyBcpEmployeetypes;
	}

	public Set<BcpFilingstate> getCompanyBcpFilingstates() {
		return companyBcpFilingstates;
	}

	public void setCompanyBcpFilingstates(final Set<BcpFilingstate> companyBcpFilingstates) {
		this.companyBcpFilingstates = companyBcpFilingstates;
	}

	public Set<BcpFilingstatus> getCompanyBcpFilingstatuss() {
		return companyBcpFilingstatuss;
	}

	public void setCompanyBcpFilingstatuss(final Set<BcpFilingstatus> companyBcpFilingstatuss) {
		this.companyBcpFilingstatuss = companyBcpFilingstatuss;
	}

	public Set<BcpIncome> getCompanyBcpIncomes() {
		return companyBcpIncomes;
	}

	public void setCompanyBcpIncomes(final Set<BcpIncome> companyBcpIncomes) {
		this.companyBcpIncomes = companyBcpIncomes;
	}

	public Set<BcpJobcode> getCompanyBcpJobcodes() {
		return companyBcpJobcodes;
	}

	public void setCompanyBcpJobcodes(final Set<BcpJobcode> companyBcpJobcodes) {
		this.companyBcpJobcodes = companyBcpJobcodes;
	}

	public Set<BcpJobtitle> getCompanyBcpJobtitles() {
		return companyBcpJobtitles;
	}

	public void setCompanyBcpJobtitles(final Set<BcpJobtitle> companyBcpJobtitles) {
		this.companyBcpJobtitles = companyBcpJobtitles;
	}

	public Set<BcpPayroll> getCompanyBcpPayrolls() {
		return companyBcpPayrolls;
	}

	public void setCompanyBcpPayrolls(final Set<BcpPayroll> companyBcpPayrolls) {
		this.companyBcpPayrolls = companyBcpPayrolls;
	}

	public Set<BcpPayrollperiod> getCompanyBcpPayrollperiods() {
		return companyBcpPayrollperiods;
	}

	public void setCompanyBcpPayrollperiods(final Set<BcpPayrollperiod> companyBcpPayrollperiods) {
		this.companyBcpPayrollperiods = companyBcpPayrollperiods;
	}

	public Set<BcpTaxCompany> getCompanyBcpTaxCompanys() {
		return companyBcpTaxCompanys;
	}

	public void setCompanyBcpTaxCompanys(final Set<BcpTaxCompany> companyBcpTaxCompanys) {
		this.companyBcpTaxCompanys = companyBcpTaxCompanys;
	}

	public Set<BcpTimesheetTime> getCompanyBcpTimesheetTimes() {
		return companyBcpTimesheetTimes;
	}

	public void setCompanyBcpTimesheetTimes(final Set<BcpTimesheetTime> companyBcpTimesheetTimes) {
		this.companyBcpTimesheetTimes = companyBcpTimesheetTimes;
	}

	public Set<BizcalAppoint> getCompanyBizcalAppoints() {
		return companyBizcalAppoints;
	}

	public void setCompanyBizcalAppoints(final Set<BizcalAppoint> companyBizcalAppoints) {
		this.companyBizcalAppoints = companyBizcalAppoints;
	}

	public Set<BizcalReminder> getCompanyBizcalReminders() {
		return companyBizcalReminders;
	}

	public void setCompanyBizcalReminders(final Set<BizcalReminder> companyBizcalReminders) {
		this.companyBizcalReminders = companyBizcalReminders;
	}

	public Set<CrmLead> getCompanyCrmLeads() {
		return companyCrmLeads;
	}

	public void setCompanyCrmLeads(final Set<CrmLead> companyCrmLeads) {
		this.companyCrmLeads = companyCrmLeads;
	}

	public Set<ItemCategoryDetails> getCompanyItemCategoryDetailss() {
		return companyItemCategoryDetailss;
	}

	public void setCompanyItemCategoryDetailss(final Set<ItemCategoryDetails> companyItemCategoryDetailss) {
		this.companyItemCategoryDetailss = companyItemCategoryDetailss;
	}

	public Set<SmcOrders> getCompanySmcOrderss() {
		return companySmcOrderss;
	}

	public void setCompanySmcOrderss(final Set<SmcOrders> companySmcOrderss) {
		this.companySmcOrderss = companySmcOrderss;
	}

	public Set<SmdAdmin> getCompanySmdAdmins() {
		return companySmdAdmins;
	}

	public void setCompanySmdAdmins(final Set<SmdAdmin> companySmdAdmins) {
		this.companySmdAdmins = companySmdAdmins;
	}

	public Set<SmdGatewaydetails> getCompanySmdGatewaydetailss() {
		return companySmdGatewaydetailss;
	}

	public void setCompanySmdGatewaydetailss(final Set<SmdGatewaydetails> companySmdGatewaydetailss) {
		this.companySmdGatewaydetailss = companySmdGatewaydetailss;
	}

	public Set<SmdGiftcertificate> getCompanySmdGiftcertificates() {
		return companySmdGiftcertificates;
	}

	public void setCompanySmdGiftcertificates(final Set<SmdGiftcertificate> companySmdGiftcertificates) {
		this.companySmdGiftcertificates = companySmdGiftcertificates;
	}

	public Set<SmdGiftcertificateused> getCompanySmdGiftcertificateuseds() {
		return companySmdGiftcertificateuseds;
	}

	public void setCompanySmdGiftcertificateuseds(final Set<SmdGiftcertificateused> companySmdGiftcertificateuseds) {
		this.companySmdGiftcertificateuseds = companySmdGiftcertificateuseds;
	}

	public Set<SmdItemgroupprice> getCompanySmdItemgroupprices() {
		return companySmdItemgroupprices;
	}

	public void setCompanySmdItemgroupprices(final Set<SmdItemgroupprice> companySmdItemgroupprices) {
		this.companySmdItemgroupprices = companySmdItemgroupprices;
	}

	public Set<SmdItemimage> getCompanySmdItemimages() {
		return companySmdItemimages;
	}

	public void setCompanySmdItemimages(final Set<SmdItemimage> companySmdItemimages) {
		this.companySmdItemimages = companySmdItemimages;
	}

	public Set<SmdShipdetails> getCompanySmdShipdetailss() {
		return companySmdShipdetailss;
	}

	public void setCompanySmdShipdetailss(final Set<SmdShipdetails> companySmdShipdetailss) {
		this.companySmdShipdetailss = companySmdShipdetailss;
	}

	public Set<StorageCart> getCompanyStorageCarts() {
		return companyStorageCarts;
	}

	public void setCompanyStorageCarts(final Set<StorageCart> companyStorageCarts) {
		this.companyStorageCarts = companyStorageCarts;
	}

	public Set<StorageClientvendor> getCompanyStorageClientvendors() {
		return companyStorageClientvendors;
	}

	public void setCompanyStorageClientvendors(final Set<StorageClientvendor> companyStorageClientvendors) {
		this.companyStorageClientvendors = companyStorageClientvendors;
	}

	public Set<StorageInvoice> getCompanyStorageInvoices() {
		return companyStorageInvoices;
	}

	public void setCompanyStorageInvoices(final Set<StorageInvoice> companyStorageInvoices) {
		this.companyStorageInvoices = companyStorageInvoices;
	}

	public Set<StorageUseractivity> getCompanyStorageUseractivitys() {
		return companyStorageUseractivitys;
	}

	public void setCompanyStorageUseractivitys(final Set<StorageUseractivity> companyStorageUseractivitys) {
		this.companyStorageUseractivitys = companyStorageUseractivitys;
	}

	public Set<BcaCvcategory> getCompanyBcaCvcategory() {
		return companyBcaCvcategory;
	}

	public void setCompanyBcaCvcategory(Set<BcaCvcategory> companyBcaCvcategory) {
		this.companyBcaCvcategory = companyBcaCvcategory;
	}

	public Set<BcaCctype> getCompanyBcaCctype() {
		return companyBcaCctype;
	}

	public void setCompanyBcaCctype(Set<BcaCctype> companyBcaCctype) {
		this.companyBcaCctype = companyBcaCctype;
	}

	public Set<BcaMessage> getCompanyBcaMessage() {
		return companyBcaMessage;
	}

	public void setCompanyBcaMessage(Set<BcaMessage> companyBcaMessage) {
		this.companyBcaMessage = companyBcaMessage;
	}

	public Set<BcaBillingaddress> getBillingAddresses() {
		return billingAddresses;
	}

	public void setBillingAddresses(Set<BcaBillingaddress> billingAddresses) {
		this.billingAddresses = billingAddresses;
	}

	public Set<BcaShippingaddress> getShippingAddresses() {
		return shippingAddresses;
	}

	public void setShippingAddresses(Set<BcaShippingaddress> shippingAddresses) {
		this.shippingAddresses = shippingAddresses;
	}

}
