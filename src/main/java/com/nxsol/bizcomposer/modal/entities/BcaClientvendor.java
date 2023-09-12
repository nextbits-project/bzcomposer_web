package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaClientvendor {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer clientVendorId;

    @Column
    private Integer companyId;

    @Column
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

    @Column
    private Integer cvtypeId;

    @Column
    private Integer cvcategoryId;

    @Column(length = 50)
    private String cvcategoryName;

    @Column
    private Integer shipCarrierId;

    @Column
    private Integer paymentTypeId;

    @Column
    private Integer salesRepId;

    @Column
    private Integer termId;

    @Column
    private Integer cctypeId;

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
    private Integer categoryId;

    @Column
    private Integer payFromId;

    @Column
    private Integer priceLevelId;

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
    private Boolean isMobilePhoneNumber;

    @Column
    private Boolean isPhoneMobileNumber;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaAccount> clientVendorBcaAccounts;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaAccount> clientVendorBcaAccounts;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaArgroupbilling> clientVendorBcaArgroupbillings;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaBillingaddress> clientVendorBcaBillingaddresss;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaBillingstatements> clientVendorBcaBillingstatementss;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaClientvendorcontacthistory> clientVendorBcaClientvendorcontacthistorys;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaClientvendorcontacthistory> clientVendorBcaClientvendorcontacthistorys;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaClientvendorfinancecharges> clientVendorBcaClientvendorfinancechargess;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaClientvendorfinancecharges> clientVendorBcaClientvendorfinancechargess;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaClientvendorservice> clientVendorBcaClientvendorservices;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaClientvendorservice> clientVendorBcaClientvendorservices;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaInvoicememorized> clientVendorBcaInvoicememorizeds;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaInvoiceshipped> clientVendorBcaInvoiceshippeds;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaRecentbills> clientVendorBcaRecentbillss;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaRecentbills> clientVendorBcaRecentbillss;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaRefundlist> clientVendorBcaRefundlists;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaRmamaster> clientVendorBcaRmamasters;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaShippingaddress> clientVendorBcaShippingaddresss;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaShippingaddress> clientVendorBcaShippingaddresss;

    @OneToMany(mappedBy = "clientVendor")
    private Set<BcaShippingaddress> clientVendorBcaShippingaddresss;

    public Integer getClientVendorId() {
        return clientVendorId;
    }

    public void setClientVendorId(final Integer clientVendorId) {
        this.clientVendorId = clientVendorId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

    public Integer getShipCarrierId() {
        return shipCarrierId;
    }

    public void setShipCarrierId(final Integer shipCarrierId) {
        this.shipCarrierId = shipCarrierId;
    }

    public Integer getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(final Integer paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public Integer getSalesRepId() {
        return salesRepId;
    }

    public void setSalesRepId(final Integer salesRepId) {
        this.salesRepId = salesRepId;
    }

    public Integer getTermId() {
        return termId;
    }

    public void setTermId(final Integer termId) {
        this.termId = termId;
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

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(final Integer categoryId) {
        this.categoryId = categoryId;
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

    public Set<BcaAccount> getClientVendorBcaAccounts() {
        return clientVendorBcaAccounts;
    }

    public void setClientVendorBcaAccounts(final Set<BcaAccount> clientVendorBcaAccounts) {
        this.clientVendorBcaAccounts = clientVendorBcaAccounts;
    }

    public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
        return clientVendorBcaArgroupbillings;
    }

    public void setClientVendorBcaArgroupbillings(
            final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
        this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
        return clientVendorBcaArgroupbillings;
    }

    public void setClientVendorBcaArgroupbillings(
            final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
        this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
        return clientVendorBcaArgroupbillings;
    }

    public void setClientVendorBcaArgroupbillings(
            final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
        this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
        return clientVendorBcaArgroupbillings;
    }

    public void setClientVendorBcaArgroupbillings(
            final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
        this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
        return clientVendorBcaArgroupbillings;
    }

    public void setClientVendorBcaArgroupbillings(
            final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
        this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
        return clientVendorBcaArgroupbillings;
    }

    public void setClientVendorBcaArgroupbillings(
            final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
        this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
        return clientVendorBcaArgroupbillings;
    }

    public void setClientVendorBcaArgroupbillings(
            final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
        this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getClientVendorBcaArgroupbillings() {
        return clientVendorBcaArgroupbillings;
    }

    public void setClientVendorBcaArgroupbillings(
            final Set<BcaArgroupbilling> clientVendorBcaArgroupbillings) {
        this.clientVendorBcaArgroupbillings = clientVendorBcaArgroupbillings;
    }

    public Set<BcaBillingaddress> getClientVendorBcaBillingaddresss() {
        return clientVendorBcaBillingaddresss;
    }

    public void setClientVendorBcaBillingaddresss(
            final Set<BcaBillingaddress> clientVendorBcaBillingaddresss) {
        this.clientVendorBcaBillingaddresss = clientVendorBcaBillingaddresss;
    }

    public Set<BcaBillingstatements> getClientVendorBcaBillingstatementss() {
        return clientVendorBcaBillingstatementss;
    }

    public void setClientVendorBcaBillingstatementss(
            final Set<BcaBillingstatements> clientVendorBcaBillingstatementss) {
        this.clientVendorBcaBillingstatementss = clientVendorBcaBillingstatementss;
    }

    public Set<BcaClientvendorcontacthistory> getClientVendorBcaClientvendorcontacthistorys() {
        return clientVendorBcaClientvendorcontacthistorys;
    }

    public void setClientVendorBcaClientvendorcontacthistorys(
            final Set<BcaClientvendorcontacthistory> clientVendorBcaClientvendorcontacthistorys) {
        this.clientVendorBcaClientvendorcontacthistorys = clientVendorBcaClientvendorcontacthistorys;
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

    public Set<BcaClientvendorfinancecharges> getClientVendorBcaClientvendorfinancechargess() {
        return clientVendorBcaClientvendorfinancechargess;
    }

    public void setClientVendorBcaClientvendorfinancechargess(
            final Set<BcaClientvendorfinancecharges> clientVendorBcaClientvendorfinancechargess) {
        this.clientVendorBcaClientvendorfinancechargess = clientVendorBcaClientvendorfinancechargess;
    }

    public Set<BcaClientvendorservice> getClientVendorBcaClientvendorservices() {
        return clientVendorBcaClientvendorservices;
    }

    public void setClientVendorBcaClientvendorservices(
            final Set<BcaClientvendorservice> clientVendorBcaClientvendorservices) {
        this.clientVendorBcaClientvendorservices = clientVendorBcaClientvendorservices;
    }

    public Set<BcaClientvendorservice> getClientVendorBcaClientvendorservices() {
        return clientVendorBcaClientvendorservices;
    }

    public void setClientVendorBcaClientvendorservices(
            final Set<BcaClientvendorservice> clientVendorBcaClientvendorservices) {
        this.clientVendorBcaClientvendorservices = clientVendorBcaClientvendorservices;
    }

    public Set<BcaInvoicememorized> getClientVendorBcaInvoicememorizeds() {
        return clientVendorBcaInvoicememorizeds;
    }

    public void setClientVendorBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> clientVendorBcaInvoicememorizeds) {
        this.clientVendorBcaInvoicememorizeds = clientVendorBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getClientVendorBcaInvoiceshippeds() {
        return clientVendorBcaInvoiceshippeds;
    }

    public void setClientVendorBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> clientVendorBcaInvoiceshippeds) {
        this.clientVendorBcaInvoiceshippeds = clientVendorBcaInvoiceshippeds;
    }

    public Set<BcaRecentbills> getClientVendorBcaRecentbillss() {
        return clientVendorBcaRecentbillss;
    }

    public void setClientVendorBcaRecentbillss(
            final Set<BcaRecentbills> clientVendorBcaRecentbillss) {
        this.clientVendorBcaRecentbillss = clientVendorBcaRecentbillss;
    }

    public Set<BcaRecentbills> getClientVendorBcaRecentbillss() {
        return clientVendorBcaRecentbillss;
    }

    public void setClientVendorBcaRecentbillss(
            final Set<BcaRecentbills> clientVendorBcaRecentbillss) {
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

    public void setClientVendorBcaShippingaddresss(
            final Set<BcaShippingaddress> clientVendorBcaShippingaddresss) {
        this.clientVendorBcaShippingaddresss = clientVendorBcaShippingaddresss;
    }

    public Set<BcaShippingaddress> getClientVendorBcaShippingaddresss() {
        return clientVendorBcaShippingaddresss;
    }

    public void setClientVendorBcaShippingaddresss(
            final Set<BcaShippingaddress> clientVendorBcaShippingaddresss) {
        this.clientVendorBcaShippingaddresss = clientVendorBcaShippingaddresss;
    }

    public Set<BcaShippingaddress> getClientVendorBcaShippingaddresss() {
        return clientVendorBcaShippingaddresss;
    }

    public void setClientVendorBcaShippingaddresss(
            final Set<BcaShippingaddress> clientVendorBcaShippingaddresss) {
        this.clientVendorBcaShippingaddresss = clientVendorBcaShippingaddresss;
    }

}
