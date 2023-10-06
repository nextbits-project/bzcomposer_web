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
@Table(name="bca_store")
public class BcaStore {

    @Id
    @Column(name = "StoreID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer storeId;

    @Column(name = "StoreName", length = 50)
    private String storeName;

    @Column(name="Abbreviation")
    private String abbreviation;

    @Column(name = "StoreTypeName", length = 50)
    private String storeTypeName;

    @Column(name = "CompanyName", length = 50)
    private String companyName;

    @Column(name = "FirstName", length = 50)
    private String firstName;

    @Column(name = "LastName", length = 50)
    private String lastName;

    @Column(name="Address1")
    private String address1;

    @Column(name="Address2", length = 150)
    private String address2;

    @Column(name = "City", length = 50)
    private String city;

    @Column(name = "State", length = 20)
    private String state;

    @Column(name = "Province", length = 50)
    private String province;

    @Column(name = "Country", length = 50)
    private String country;

    @Column(name = "Zipcode", length = 20)
    private String zipcode;

    @Column(name = "PhoneNumber", length = 50)
    private String phoneNumber;

    @Column(name = "FaxNumber", length = 50)
    private String faxNumber;

    @Column(name = "Email", length = 100)
    private String email;

    @Column(name = "PackingReturnPolicy", columnDefinition = "longtext")
    private String packingReturnPolicy;

    @Column(name="LogoPath")
    private String logoPath;

    @Column(name="DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name = "eBayDeveloperID", length = 50)
    private String eBayDeveloperId;

    @Column(name = "eBayApplicationID", length = 50)
    private String eBayApplicationId;

    @Column(name = "eBayCertificate", length = 50)
    private String eBayCertificate;

    @Column(name = "eBayToken", columnDefinition = "longtext")
    private String eBayToken;

    @Column(name = "eBayEPSServerUrl", length = 50)
    private String eBayEpsserverUrl;

    @Column(name = "eBayAPIServerUrl", length = 50)
    private String eBayApiserverUrl;

    @Column(name = "eBaySignInUrl", length = 50)
    private String eBaySignInUrl;

    @Column(name="LastOrderImportDate")
    private OffsetDateTime lastOrderImportDate;

    @Column(name = "amazonAccesKey", length = 50)
    private String amazonAccesKey;

    @Column(name = "amazonSecretKey", length = 50)
    private String amazonSecretKey;

    @Column(name = "amazonMarketPlaceID", length = 50)
    private String amazonMarketPlaceId;

    @Column(name = "amazonMerchantID", length = 50)
    private String amazonMerchantId;

    @Column(name = "quickBookFilePath", length = 200)
    private String quickBookFilePath;

    @Column(name="orderImportTemplate")
    private String orderImportTemplate;

    @Column(name="Active")
    private Integer active;

    @Column(name="Deleted")
    private Integer deleted;

    @Column(name = "smcLoginID", length = 50)
    private String smcLoginId;

    @Column(name = "smcPassword", length = 50)
    private String smcPassword;

    @Column(name="filepath")
    private String filepath;

    @Column(name="IsDefault")
    private Integer isDefault;

    @Column(name="currentStore")
    private Integer currentStore;

    @Column(name="isMultipleAccountSelected")
    private Integer isMultipleAccountSelected;

    @Column(name="FromDate")
    private OffsetDateTime fromDate;

    @Column(name="ToDate")
    private OffsetDateTime toDate;

    @Column(name="eBaypaymentStatusID1")
    private Integer eBaypaymentStatusId1;

    @Column(name="eBaypaymentStatusID2")
    private Integer eBaypaymentStatusId2;

    @Column(name = "eBaychangeInvoiced", length = 50)
    private String eBaychangeInvoiced;

    @Column(name="eBayuseDateRange")
    private Integer eBayuseDateRange;

    @Column(name = "eBaydateBasedOn", length = 50)
    private String eBaydateBasedOn;

    @Column(name="eBaychangePaymentStatusID")
    private Integer eBaychangePaymentStatusId;

    @Column(name = "eBayruleInvoiced", length = 50)
    private String eBayruleInvoiced;

    @Column(name = "ImportHistory", columnDefinition = "longtext")
    private String importHistory;

    @Column(name="isSelected")
    private Boolean isSelected;

    @Column(name="defaultCategoryID")
    private Integer defaultCategoryId;

    @Column(name="NickName")
    private String nickName;

    @Column(name="dbURL")
    private String dbUrl;

    @Column(name="magentoLoginID")
    private String magentoLoginId;

    @Column(name="magentoPassword")
    private String magentoPassword;

    @OneToMany(mappedBy = "store")
    private Set<BcaActivestoreforproductssubmission> storeBcaActivestoreforproductssubmissions;

    @OneToMany(mappedBy = "store")
    private Set<BcaEsalesitemcategory> storeBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "store")
    private Set<BcaExporteditemedetail> storeBcaExporteditemedetails;

    @OneToMany(mappedBy = "store")
    private Set<BcaHistory> storeBcaHistorys;

    @OneToMany(mappedBy = "store")
    private Set<BcaInvoice> storeBcaInvoices;

    @OneToMany(mappedBy = "store")
    private Set<BcaInvoicememorized> storeBcaInvoicememorizeds;

    @OneToMany(mappedBy = "store")
    private Set<BcaInvoiceshipped> storeBcaInvoiceshippeds;

    @OneToMany(mappedBy = "store")
    private Set<BcaProductchannelsetting> storeBcaProductchannelsettings;

    @OneToMany(mappedBy = "store")
    private Set<BcaScheduletimes> storeBcaScheduletimess;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "StoreTypeID")
    private BcaStoretype storeType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @OneToMany(mappedBy = "store")
    private Set<BcaUseractivity> storeBcaUseractivitys;

    @OneToMany(mappedBy = "store")
    private Set<SmdCategory> storeSmdCategorys;

    @OneToMany(mappedBy = "store")
    private Set<SmdStoreebaycategory> storeSmdStoreebaycategorys;

    @OneToMany(mappedBy = "store")
    private Set<StorageInvoice> storeStorageInvoices;

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(final Integer storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(final String storeName) {
        this.storeName = storeName;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(final String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public String getStoreTypeName() {
        return storeTypeName;
    }

    public void setStoreTypeName(final String storeTypeName) {
        this.storeTypeName = storeTypeName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(final String companyName) {
        this.companyName = companyName;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(final String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFaxNumber() {
        return faxNumber;
    }

    public void setFaxNumber(final String faxNumber) {
        this.faxNumber = faxNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public String getPackingReturnPolicy() {
        return packingReturnPolicy;
    }

    public void setPackingReturnPolicy(final String packingReturnPolicy) {
        this.packingReturnPolicy = packingReturnPolicy;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(final String logoPath) {
        this.logoPath = logoPath;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getEBayDeveloperId() {
        return eBayDeveloperId;
    }

    public void setEBayDeveloperId(final String eBayDeveloperId) {
        this.eBayDeveloperId = eBayDeveloperId;
    }

    public String getEBayApplicationId() {
        return eBayApplicationId;
    }

    public void setEBayApplicationId(final String eBayApplicationId) {
        this.eBayApplicationId = eBayApplicationId;
    }

    public String getEBayCertificate() {
        return eBayCertificate;
    }

    public void setEBayCertificate(final String eBayCertificate) {
        this.eBayCertificate = eBayCertificate;
    }

    public String getEBayToken() {
        return eBayToken;
    }

    public void setEBayToken(final String eBayToken) {
        this.eBayToken = eBayToken;
    }

    public String getEBayEpsserverUrl() {
        return eBayEpsserverUrl;
    }

    public void setEBayEpsserverUrl(final String eBayEpsserverUrl) {
        this.eBayEpsserverUrl = eBayEpsserverUrl;
    }

    public String getEBayApiserverUrl() {
        return eBayApiserverUrl;
    }

    public void setEBayApiserverUrl(final String eBayApiserverUrl) {
        this.eBayApiserverUrl = eBayApiserverUrl;
    }

    public String getEBaySignInUrl() {
        return eBaySignInUrl;
    }

    public void setEBaySignInUrl(final String eBaySignInUrl) {
        this.eBaySignInUrl = eBaySignInUrl;
    }

    public OffsetDateTime getLastOrderImportDate() {
        return lastOrderImportDate;
    }

    public void setLastOrderImportDate(final OffsetDateTime lastOrderImportDate) {
        this.lastOrderImportDate = lastOrderImportDate;
    }

    public String getAmazonAccesKey() {
        return amazonAccesKey;
    }

    public void setAmazonAccesKey(final String amazonAccesKey) {
        this.amazonAccesKey = amazonAccesKey;
    }

    public String getAmazonSecretKey() {
        return amazonSecretKey;
    }

    public void setAmazonSecretKey(final String amazonSecretKey) {
        this.amazonSecretKey = amazonSecretKey;
    }

    public String getAmazonMarketPlaceId() {
        return amazonMarketPlaceId;
    }

    public void setAmazonMarketPlaceId(final String amazonMarketPlaceId) {
        this.amazonMarketPlaceId = amazonMarketPlaceId;
    }

    public String getAmazonMerchantId() {
        return amazonMerchantId;
    }

    public void setAmazonMerchantId(final String amazonMerchantId) {
        this.amazonMerchantId = amazonMerchantId;
    }

    public String getQuickBookFilePath() {
        return quickBookFilePath;
    }

    public void setQuickBookFilePath(final String quickBookFilePath) {
        this.quickBookFilePath = quickBookFilePath;
    }

    public String getOrderImportTemplate() {
        return orderImportTemplate;
    }

    public void setOrderImportTemplate(final String orderImportTemplate) {
        this.orderImportTemplate = orderImportTemplate;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(final Integer deleted) {
        this.deleted = deleted;
    }

    public String getSmcLoginId() {
        return smcLoginId;
    }

    public void setSmcLoginId(final String smcLoginId) {
        this.smcLoginId = smcLoginId;
    }

    public String getSmcPassword() {
        return smcPassword;
    }

    public void setSmcPassword(final String smcPassword) {
        this.smcPassword = smcPassword;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(final String filepath) {
        this.filepath = filepath;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(final Integer isDefault) {
        this.isDefault = isDefault;
    }

    public Integer getCurrentStore() {
        return currentStore;
    }

    public void setCurrentStore(final Integer currentStore) {
        this.currentStore = currentStore;
    }

    public Integer getIsMultipleAccountSelected() {
        return isMultipleAccountSelected;
    }

    public void setIsMultipleAccountSelected(final Integer isMultipleAccountSelected) {
        this.isMultipleAccountSelected = isMultipleAccountSelected;
    }

    public OffsetDateTime getFromDate() {
        return fromDate;
    }

    public void setFromDate(final OffsetDateTime fromDate) {
        this.fromDate = fromDate;
    }

    public OffsetDateTime getToDate() {
        return toDate;
    }

    public void setToDate(final OffsetDateTime toDate) {
        this.toDate = toDate;
    }

    public Integer getEBaypaymentStatusId1() {
        return eBaypaymentStatusId1;
    }

    public void setEBaypaymentStatusId1(final Integer eBaypaymentStatusId1) {
        this.eBaypaymentStatusId1 = eBaypaymentStatusId1;
    }

    public Integer getEBaypaymentStatusId2() {
        return eBaypaymentStatusId2;
    }

    public void setEBaypaymentStatusId2(final Integer eBaypaymentStatusId2) {
        this.eBaypaymentStatusId2 = eBaypaymentStatusId2;
    }

    public String getEBaychangeInvoiced() {
        return eBaychangeInvoiced;
    }

    public void setEBaychangeInvoiced(final String eBaychangeInvoiced) {
        this.eBaychangeInvoiced = eBaychangeInvoiced;
    }

    public Integer getEBayuseDateRange() {
        return eBayuseDateRange;
    }

    public void setEBayuseDateRange(final Integer eBayuseDateRange) {
        this.eBayuseDateRange = eBayuseDateRange;
    }

    public String getEBaydateBasedOn() {
        return eBaydateBasedOn;
    }

    public void setEBaydateBasedOn(final String eBaydateBasedOn) {
        this.eBaydateBasedOn = eBaydateBasedOn;
    }

    public Integer getEBaychangePaymentStatusId() {
        return eBaychangePaymentStatusId;
    }

    public void setEBaychangePaymentStatusId(final Integer eBaychangePaymentStatusId) {
        this.eBaychangePaymentStatusId = eBaychangePaymentStatusId;
    }

    public String getEBayruleInvoiced() {
        return eBayruleInvoiced;
    }

    public void setEBayruleInvoiced(final String eBayruleInvoiced) {
        this.eBayruleInvoiced = eBayruleInvoiced;
    }

    public String getImportHistory() {
        return importHistory;
    }

    public void setImportHistory(final String importHistory) {
        this.importHistory = importHistory;
    }

    public Boolean getIsSelected() {
        return isSelected;
    }

    public void setIsSelected(final Boolean isSelected) {
        this.isSelected = isSelected;
    }

    public Integer getDefaultCategoryId() {
        return defaultCategoryId;
    }

    public void setDefaultCategoryId(final Integer defaultCategoryId) {
        this.defaultCategoryId = defaultCategoryId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(final String nickName) {
        this.nickName = nickName;
    }

    public String getDbUrl() {
        return dbUrl;
    }

    public void setDbUrl(final String dbUrl) {
        this.dbUrl = dbUrl;
    }

    public String getMagentoLoginId() {
        return magentoLoginId;
    }

    public void setMagentoLoginId(final String magentoLoginId) {
        this.magentoLoginId = magentoLoginId;
    }

    public String getMagentoPassword() {
        return magentoPassword;
    }

    public void setMagentoPassword(final String magentoPassword) {
        this.magentoPassword = magentoPassword;
    }

    public Set<BcaActivestoreforproductssubmission> getStoreBcaActivestoreforproductssubmissions() {
        return storeBcaActivestoreforproductssubmissions;
    }

    public void setStoreBcaActivestoreforproductssubmissions(
            final Set<BcaActivestoreforproductssubmission> storeBcaActivestoreforproductssubmissions) {
        this.storeBcaActivestoreforproductssubmissions = storeBcaActivestoreforproductssubmissions;
    }

    public Set<BcaEsalesitemcategory> getStoreBcaEsalesitemcategorys() {
        return storeBcaEsalesitemcategorys;
    }

    public void setStoreBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> storeBcaEsalesitemcategorys) {
        this.storeBcaEsalesitemcategorys = storeBcaEsalesitemcategorys;
    }

    public Set<BcaExporteditemedetail> getStoreBcaExporteditemedetails() {
        return storeBcaExporteditemedetails;
    }

    public void setStoreBcaExporteditemedetails(
            final Set<BcaExporteditemedetail> storeBcaExporteditemedetails) {
        this.storeBcaExporteditemedetails = storeBcaExporteditemedetails;
    }

    public Set<BcaHistory> getStoreBcaHistorys() {
        return storeBcaHistorys;
    }

    public void setStoreBcaHistorys(final Set<BcaHistory> storeBcaHistorys) {
        this.storeBcaHistorys = storeBcaHistorys;
    }

    public Set<BcaInvoice> getStoreBcaInvoices() {
        return storeBcaInvoices;
    }

    public void setStoreBcaInvoices(final Set<BcaInvoice> storeBcaInvoices) {
        this.storeBcaInvoices = storeBcaInvoices;
    }

    public Set<BcaInvoicememorized> getStoreBcaInvoicememorizeds() {
        return storeBcaInvoicememorizeds;
    }

    public void setStoreBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> storeBcaInvoicememorizeds) {
        this.storeBcaInvoicememorizeds = storeBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getStoreBcaInvoiceshippeds() {
        return storeBcaInvoiceshippeds;
    }

    public void setStoreBcaInvoiceshippeds(final Set<BcaInvoiceshipped> storeBcaInvoiceshippeds) {
        this.storeBcaInvoiceshippeds = storeBcaInvoiceshippeds;
    }

    public Set<BcaProductchannelsetting> getStoreBcaProductchannelsettings() {
        return storeBcaProductchannelsettings;
    }

    public void setStoreBcaProductchannelsettings(
            final Set<BcaProductchannelsetting> storeBcaProductchannelsettings) {
        this.storeBcaProductchannelsettings = storeBcaProductchannelsettings;
    }

    public Set<BcaScheduletimes> getStoreBcaScheduletimess() {
        return storeBcaScheduletimess;
    }

    public void setStoreBcaScheduletimess(final Set<BcaScheduletimes> storeBcaScheduletimess) {
        this.storeBcaScheduletimess = storeBcaScheduletimess;
    }

    public BcaStoretype getStoreType() {
        return storeType;
    }

    public void setStoreType(final BcaStoretype storeType) {
        this.storeType = storeType;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaUseractivity> getStoreBcaUseractivitys() {
        return storeBcaUseractivitys;
    }

    public void setStoreBcaUseractivitys(final Set<BcaUseractivity> storeBcaUseractivitys) {
        this.storeBcaUseractivitys = storeBcaUseractivitys;
    }

    public Set<SmdCategory> getStoreSmdCategorys() {
        return storeSmdCategorys;
    }

    public void setStoreSmdCategorys(final Set<SmdCategory> storeSmdCategorys) {
        this.storeSmdCategorys = storeSmdCategorys;
    }

    public Set<SmdStoreebaycategory> getStoreSmdStoreebaycategorys() {
        return storeSmdStoreebaycategorys;
    }

    public void setStoreSmdStoreebaycategorys(
            final Set<SmdStoreebaycategory> storeSmdStoreebaycategorys) {
        this.storeSmdStoreebaycategorys = storeSmdStoreebaycategorys;
    }

    public Set<StorageInvoice> getStoreStorageInvoices() {
        return storeStorageInvoices;
    }

    public void setStoreStorageInvoices(final Set<StorageInvoice> storeStorageInvoices) {
        this.storeStorageInvoices = storeStorageInvoices;
    }

}
