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

import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.Set;

@Entity
@Table(name = "bca_lead")
public class BcaLeadNew implements Serializable{

	@Id
	@Column(name = "LeadID", nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer leadID;

	@Column(name = "Name")
	private String name;

	@Column(name = "DBAName", length = 45)
	private String dbaname;

	@Column(name = "Detail", columnDefinition = "longtext")
	private String detail;

	@Column(name = "CustomerTitle", length = 50)
	private String customerTitle;

	@Column(name = "FirstName", length = 50)
	private String firstName;

	@Column(name = "LastName", length = 50)
	private String lastName;

	@Column(name = "Address1")
	private String address1;

	@Column(name = "Address2")
	private String address2;

	@Column(name = "City")
	private String city;

	@Column(name = "State", length = 50)
	private String state;
	
	@Column(name = "Country", length = 50)
	private String country;

	@Column(name = "ZipCode", length = 50)
	private String zipCode;

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
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ShipCarrierID")
	private BcaShipcarrier shipCarrier;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PaymentTypeID")
	private BcaPaymenttype paymentType;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SalesRepID")
	private BcaSalesrep salesRep;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TermID")
	private BcaTerm term;
	
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

	@Column(name = "MiddleName", length = 45)
	private String middleName;
	
	@Column(name = "DateInput")
	private OffsetDateTime dateInput;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CompanyID")
	private BcaCompany company;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LeadSourceID")
    private BcaLeadSource leadSource;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LeadCategoryID")
    private BcaLeadCategory leadCategory;
    
    @OneToMany(mappedBy = "lead")
    private Set<BcaLeadProducts> leadBcaLeadProductss;
    
	@Transient
	private String formattedDateAdded;
	
	public String getFormattedDateAdded() {
		return formattedDateAdded;
	}

	public void setFormattedDateAdded(String formattedDateAdded) {
		this.formattedDateAdded = formattedDateAdded;
	}

	public Integer getLeadID() {
		return leadID;
	}

	public void setLeadID(Integer leadID) {
		this.leadID = leadID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDbaname() {
		return dbaname;
	}

	public void setDbaname(String dbaname) {
		this.dbaname = dbaname;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getCustomerTitle() {
		return customerTitle;
	}

	public void setCustomerTitle(String customerTitle) {
		this.customerTitle = customerTitle;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getResellerTaxId() {
		return resellerTaxId;
	}

	public void setResellerTaxId(String resellerTaxId) {
		this.resellerTaxId = resellerTaxId;
	}

	public Long getTaxable() {
		return taxable;
	}

	public void setTaxable(Long taxable) {
		this.taxable = taxable;
	}

	public Integer getCvtypeId() {
		return cvtypeId;
	}

	public void setCvtypeId(Integer cvtypeId) {
		this.cvtypeId = cvtypeId;
	}

	public Integer getCvcategoryId() {
		return cvcategoryId;
	}

	public void setCvcategoryId(Integer cvcategoryId) {
		this.cvcategoryId = cvcategoryId;
	}

	public String getCvcategoryName() {
		return cvcategoryName;
	}

	public void setCvcategoryName(String cvcategoryName) {
		this.cvcategoryName = cvcategoryName;
	}

	public BcaShipcarrier getShipCarrier() {
		return shipCarrier;
	}

	public void setShipCarrier(BcaShipcarrier shipCarrier) {
		this.shipCarrier = shipCarrier;
	}

	public BcaPaymenttype getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(BcaPaymenttype paymentType) {
		this.paymentType = paymentType;
	}

	public BcaSalesrep getSalesRep() {
		return salesRep;
	}

	public void setSalesRep(BcaSalesrep salesRep) {
		this.salesRep = salesRep;
	}

	public BcaTerm getTerm() {
		return term;
	}

	public void setTerm(BcaTerm term) {
		this.term = term;
	}

	public Integer getCctypeId() {
		return cctypeId;
	}

	public void setCctypeId(Integer cctypeId) {
		this.cctypeId = cctypeId;
	}

	public Double getCustomerOpenDebit() {
		return customerOpenDebit;
	}

	public void setCustomerOpenDebit(Double customerOpenDebit) {
		this.customerOpenDebit = customerOpenDebit;
	}

	public Double getCustomerCreditLine() {
		return customerCreditLine;
	}

	public void setCustomerCreditLine(Double customerCreditLine) {
		this.customerCreditLine = customerCreditLine;
	}

	public Double getVendorOpenDebit() {
		return vendorOpenDebit;
	}

	public void setVendorOpenDebit(Double vendorOpenDebit) {
		this.vendorOpenDebit = vendorOpenDebit;
	}

	public Double getVendorAllowedCredit() {
		return vendorAllowedCredit;
	}

	public void setVendorAllowedCredit(Double vendorAllowedCredit) {
		this.vendorAllowedCredit = vendorAllowedCredit;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

	public OffsetDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(OffsetDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public OffsetDateTime getDateInput() {
		return dateInput;
	}

	public void setDateInput(OffsetDateTime dateInput) {
		this.dateInput = dateInput;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public BcaLeadSource getLeadSource() {
		return leadSource;
	}

	public void setLeadSource(BcaLeadSource leadSource) {
		this.leadSource = leadSource;
	}

	public BcaLeadCategory getLeadCategory() {
		return leadCategory;
	}

	public void setLeadCategory(BcaLeadCategory leadCategory) {
		this.leadCategory = leadCategory;
	}

	public Set<BcaLeadProducts> getLeadBcaLeadProductss() {
		return leadBcaLeadProductss;
	}

	public void setLeadBcaLeadProductss(Set<BcaLeadProducts> leadBcaLeadProductss) {
		this.leadBcaLeadProductss = leadBcaLeadProductss;
	}
	
}
