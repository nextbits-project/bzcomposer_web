package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class StorageClientvendor {

    @Id
    @Column(nullable = false, updatable = false)
    private String name;

    @Column(length = 45)
    private String dbaname;

    @Column(columnDefinition = "longtext")
    private String detail;

    @Column(length = 50)
    private String customerTitle;

    @Column
    private Integer customerTitleId;

    @Column(length = 50)
    private String firstName;

    @Column(length = 50)
    private String lastName;

    @Column(length = 50)
    private String billName;

    @Column
    private String address1;

    @Column
    private String address2;

    @Column
    private String city;

    @Column(length = 50)
    private String state;

    @Column(length = 50)
    private String province;

    @Column(length = 50)
    private String country;

    @Column(length = 50)
    private String zipCode;

    @Column(length = 20)
    private String zipCodeId;

    @Column(length = 50)
    private String phone;

    @Column(length = 50)
    private String cellPhone;

    @Column(length = 50)
    private String fax;

    @Column(length = 50)
    private String email;

    @Column(length = 50)
    private String homePage;

    @Column(length = 50)
    private String resellerTaxId;

    @Column
    private Long taxable;

    @Column(length = 50)
    private String cvcategoryName;

    @Column
    private Double customerOpenDebit;

    @Column
    private Double customerCreditLine;

    @Column
    private Double vendorOpenDebit;

    @Column
    private Double vendorAllowedCredit;

    @Column
    private Integer active;

    @Column(length = 10)
    private String status;

    @Column
    private Integer deleted;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer priority;

    @Column
    private Integer itemPriceLevel;

    @Column
    private Integer payFromId;

    @Column
    private Boolean useSpecialMessage;

    @Column
    private String message;

    @Column
    private Integer customerGroupId;

    @Column
    private Integer form1099;

    @Column
    private Integer referenceCustomerId;

    @Column
    private Double remainingCredit;

    @Column
    private Integer lineofCreditTermId;

    @Column
    private Integer bankAccountId;

    @Column(length = 45)
    private String middleName;

    @Column
    private OffsetDateTime dateInput;

    @Column
    private OffsetDateTime dateTerminated;

    @Column
    private Boolean isTerminated;

    @Column
    private Boolean isPhoneMobileNumber;

    @Column
    private Boolean isMobilePhoneNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cctype_id")
    private BcaCreditcardtype cctype;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ship_carrier_id")
    private BcaShipcarrier shipCarrier;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "term_id")
    private BcaTerm term;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_vendor_id")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cvcategory_id")
    private BcaClientcategory cvcategory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cvtype_id")
    private BcaCvtype cvtype;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_type_id")
    private BcaPaymenttype paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "price_level_id")
    private BcaPricelevel priceLevel;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_rep_id")
    private BcaSalesrep salesRep;

    @OneToMany(mappedBy = "clientVendor")
    private Set<StorageInvoice> clientVendorStorageInvoices;

    @OneToMany(mappedBy = "clientVendor")
    private Set<StoragePayment> clientVendorStoragePayments;

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

    public String getCvcategoryName() {
        return cvcategoryName;
    }

    public void setCvcategoryName(final String cvcategoryName) {
        this.cvcategoryName = cvcategoryName;
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

    public Boolean getIsPhoneMobileNumber() {
        return isPhoneMobileNumber;
    }

    public void setIsPhoneMobileNumber(final Boolean isPhoneMobileNumber) {
        this.isPhoneMobileNumber = isPhoneMobileNumber;
    }

    public Boolean getIsMobilePhoneNumber() {
        return isMobilePhoneNumber;
    }

    public void setIsMobilePhoneNumber(final Boolean isMobilePhoneNumber) {
        this.isMobilePhoneNumber = isMobilePhoneNumber;
    }

    public BcaCreditcardtype getCctype() {
        return cctype;
    }

    public void setCctype(final BcaCreditcardtype cctype) {
        this.cctype = cctype;
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

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

    public BcaClientcategory getCvcategory() {
        return cvcategory;
    }

    public void setCvcategory(final BcaClientcategory cvcategory) {
        this.cvcategory = cvcategory;
    }

    public BcaCvtype getCvtype() {
        return cvtype;
    }

    public void setCvtype(final BcaCvtype cvtype) {
        this.cvtype = cvtype;
    }

    public BcaPaymenttype getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(final BcaPaymenttype paymentType) {
        this.paymentType = paymentType;
    }

    public BcaPricelevel getPriceLevel() {
        return priceLevel;
    }

    public void setPriceLevel(final BcaPricelevel priceLevel) {
        this.priceLevel = priceLevel;
    }

    public BcaSalesrep getSalesRep() {
        return salesRep;
    }

    public void setSalesRep(final BcaSalesrep salesRep) {
        this.salesRep = salesRep;
    }

    public Set<StorageInvoice> getClientVendorStorageInvoices() {
        return clientVendorStorageInvoices;
    }

    public void setClientVendorStorageInvoices(
            final Set<StorageInvoice> clientVendorStorageInvoices) {
        this.clientVendorStorageInvoices = clientVendorStorageInvoices;
    }

    public Set<StoragePayment> getClientVendorStoragePayments() {
        return clientVendorStoragePayments;
    }

    public void setClientVendorStoragePayments(
            final Set<StoragePayment> clientVendorStoragePayments) {
        this.clientVendorStoragePayments = clientVendorStoragePayments;
    }

}
