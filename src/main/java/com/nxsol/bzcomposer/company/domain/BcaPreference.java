package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name="bca_preference")
public class BcaPreference {

    @Id
    @Column(name="PreferenceID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer preferenceId;

    @Column(name="CurrencyText", length = 50)
    private String currencyText;

    @Column(name="CurrencyID")
    private Integer currencyId;

    @Column(name="Weight", length = 50)
    private String weight;

    @Column(name="WeightID")
    private Integer weightId;

    @Column(name="LabelSize", length = 50)
    private String labelSize;

    @Column(name="LabelSizeID")
    private Integer labelSizeId;

    @Column(name="BackupPeriod", length = 50)
    private String backupPeriod;

    @Column(name="BackupPeriodID")
    private Integer backupPeriodId;

    @Column(name="BackupPlace", length = 50)
    private String backupPlace;

    @Column(name="AdminUsername", length = 50)
    private String adminUsername;

    @Column(name="AdminPassword", length = 50)
    private String adminPassword;

    @Column(name="Multimode")
    private Integer multimode;


    @Column(name="CustomerProvience", length = 50)
    private String customerProvience;

    @Column(name="CustomerTaxable")
    private Integer customerTaxable;

    @Column(name="CustomerUsecompanyname")
    private Integer customerUsecompanyname;

    @Column(name="StartingInvoiceNumber")
    private Integer startingInvoiceNumber;

    @Column(name="InvoiceFootnoteID")
    private Integer invoiceFootnoteId;

    @Column(name="UseProductWeight")
    private Integer useProductWeight;

    @Column(name="UseShippingTable")
    private Integer useShippingTable;

    @Column(name="SaleShowCountry")
    private Boolean saleShowCountry;

    @Column(name="SaleShowTelephone")
    private Boolean saleShowTelephone;

    @Column(name="VendorProvience", length = 50)
    private String vendorProvience;

    @Column(name="VendorUseCompanyname")
    private Integer vendorUseCompanyname;

    @Column(name="StartingPONumber", length = 50)
    private String startingPonumber;

    @Column(name="POFootnoteID")
    private Integer pofootnoteId;

    @Column(name="POShowCountry")
    private Boolean poshowCountry;

    @Column(name="POShowTelephone")
    private Boolean poshowTelephone;

    @Column(name="StartingRINumber", length = 50)
    private String startingRinumber;

    @Column(name="ProductTaxable")
    private Integer productTaxable;

    @Column(name="EmployeeIDtoUse")
    private Integer employeeIdtoUse;

    @Column(name="SalesTaxRate")
    private Double salesTaxRate;

    @Column(name="HowOftenSalestax")
    private Integer howOftenSalestax;

    @Column(name="SalesTaxCode", length = 20)
    private String salesTaxCode;

    @Column(name="ShowReminder")
    private Integer showReminder;

    @Column(name="InvoiceMemo")
    private Integer invoiceMemo;

    @Column(name="InvoiceMemoDays")
    private Integer invoiceMemoDays;

    @Column(name="OverdueInvoice")
    private Integer overdueInvoice;

    @Column(name="OverdueinvoiceDays")
    private Integer overdueinvoiceDays;

    @Column(name="InventoryOrder")
    private Integer inventoryOrder;

    @Column(name="InventoryOrderDays")
    private Integer inventoryOrderDays;

    @Column(name="BillstoPay")
    private Integer billstoPay;

    @Column(name="BillstoPayDays")
    private Integer billstoPayDays;

    @Column(name="EstimationMemo")
    private Integer estimationMemo;

    @Column(name="EstimationMemoDays")
    private Integer estimationMemoDays;

    @Column(name="POMemo")
    private Integer pomemo;

    @Column(name="POMemoDays")
    private Integer pomemoDays;

    @Column(name="ServiceBillsMemo")
    private Integer serviceBillsMemo;

    @Column(name="ServiceBillsMemoDays")
    private Integer serviceBillsMemoDays;

    @Column(name="Active")
    private Integer active;

    @Column(name="DateAdded", nullable = false)
    private OffsetDateTime dateAdded;

    @Column(name="CompanyLogoPath")
    private String companyLogoPath;

    @Column(name="Charge_interest")
    private Double chargeInterest;

    @Column(name="Charge_minimum")
    private Double chargeMinimum;

    @Column(name="Charge_grace")
    private Double chargeGrace;

    @Column(name="Charge_reassess")
    private Boolean chargeReassess;

    @Column(name="Charge_name_display")
    private Integer chargeNameDisplay;

    @Column(name="Charge_MarkFinance")
    private Boolean chargeMarkFinance;

    @Column(name="PrintByOrder")
    private Boolean printByOrder;

    @Column(name="PrintInvoiceFrom")
    private Integer printInvoiceFrom;

    @Column(name="PrintInvoiceTo")
    private Integer printInvoiceTo;

    @Column(name="PrintDateFrom")
    private OffsetDateTime printDateFrom;

    @Column(name="PrintDateTo")
    private OffsetDateTime printDateTo;

    @Column(name="PrintTimeFrom")
    private OffsetDateTime printTimeFrom;

    @Column(name="PrintTimeTo")
    private OffsetDateTime printTimeTo;

    @Column(name="PageSort_ShippingMethod")
    private Boolean pageSortShippingMethod;

    @Column(name="PageSort_ItemTitle")
    private Boolean pageSortItemTitle;

    @Column(name="PageSort_Destination")
    private Boolean pageSortDestination;

    @Column(name="PageSort_SpecialHanding")
    private Boolean pageSortSpecialHanding;

    @Column(name="PageSort_Location")
    private Boolean pageSortLocation;

    @Column(name="SkipPrinted")
    private Boolean skipPrinted;

    @Column(name="MarkPrinted")
    private Boolean markPrinted;

    @Column(name="InvoicesToPrint")
    private Integer invoicesToPrint;

    @Column(name="PackingSlipsToPrint")
    private Integer packingSlipsToPrint;

    @Column(name="PackingReturnPolicy", columnDefinition = "longtext")
    private String packingReturnPolicy;

    @Column(name="PrintPaperType")
    private Integer printPaperType;

    @Column(name="PrintCoupon")
    private Boolean printCoupon;

    @Column(name="PrintGiftMessage")
    private Boolean printGiftMessage;

    @Column(name="CouponLocation")
    private String couponLocation;

    @Column(name="BarcodeID")
    private Integer barcodeId;

    @Column(name="Mailserver", length = 80)
    private String mailserver;

    @Column(name="Mail_username", length = 50)
    private String mailUsername;

    @Column(name="Mail_password", length = 20)
    private String mailPassword;

    @Column(name="Mail_Auth")
    private Boolean mailAuth;

    @Column(name="Mail_senderEmail", length = 50)
    private String mailSenderEmail;

    @Column(name="AR_Term")
    private Integer arTerm;

    @Column(name="AR_Latefee", precision = 23, scale = 4)
    private BigDecimal arLatefee;

    @Column(name="PrintFormNo_Billing")
    private Integer printFormNoBilling;

    @Column(name="PrintFormNo_Invoice")
    private Integer printFormNoInvoice;

    @Column(name="Performance")
    private String performance;

    @Column(name="TimeSheetSet")
    private Integer timeSheetSet;

    @Column(name="ShippingFeeMethod")
    private Integer shippingFeeMethod;

    @Column(name="SalesViaID")
    private Integer salesViaId;

    @Column(name="SalesTermID")
    private Integer salesTermId;

    @Column(name="SalesRepID")
    private Integer salesRepId;

    @Column(name="SalesPayMethodID")
    private Integer salesPayMethodId;

    @Column(name="SalesPOPrefix", length = 50)
    private String salesPoprefix;

    @Column(name="IsEsalesEnabled")
    private Boolean isEsalesEnabled;

    @Column(name="EsalesAmazonMerchant")
    private Boolean esalesAmazonMerchant;

    @Column(name="EsalesAmazonMerchantOnline")
    private Boolean esalesAmazonMerchantOnline;

    @Column(name="EsalesAmazonMarket")
    private Boolean esalesAmazonMarket;

    @Column(name="EsaleseBay")
    private Boolean esaleseBay;

    @Column(name="EsaleseBayBlackthorne")
    private Boolean esaleseBayBlackthorne;

    @Column(name="EsalesHalfdotcom")
    private Boolean esalesHalfdotcom;

    @Column(name="EsalesMagento")
    private Boolean esalesMagento;

    @Column(name="EsalesSmc")
    private Boolean esalesSmc;

    @Column(name="DefaultAmazonSellerBankID")
    private Integer defaultAmazonSellerBankId;

    @Column(name="DefaultAmazonSellerOnlineBankID")
    private Integer defaultAmazonSellerOnlineBankId;

    @Column(name="DefaultAmazonMarketBankID")
    private Integer defaultAmazonMarketBankId;

    @Column(name="DefaultHalfdotComBankID")
    private Integer defaultHalfdotComBankId;

    @Column(name="DefaultEBayBankID")
    private Integer defaultEbayBankId;

    @Column(name="DefaultEBayOnlineBankID")
    private Integer defaultEbayOnlineBankId;

    @Column(name="DefaultSMCBankID")
    private Integer defaultSmcbankId;

    @Column(name="POViaID")
    private Integer poviaId;

    @Column(name="POTermID")
    private Integer potermId;

    @Column(name="PORepID")
    private Integer porepId;

    @Column(name="POPayMethodID")
    private Integer popayMethodId;

    @Column(name="DefaultPayableAccountID")
    private Integer defaultPayableAccountId;

    @Column(name="AutoPaymentDuration")
    private Integer autoPaymentDuration;

    @Column(name="DefaultCategoryID")
    private Integer defaultCategoryId;

    @Column(name="DefaultVendorCategoryID")
    private Integer defaultVendorCategoryId;

    @Column(name="DefaultRMARepairmentCharge")
    private Double defaultRmarepairmentCharge;

    @Column(name="DefaultRMACheckingBankID")
    private Integer defaultRmacheckingBankId;

    @Column(name="DefaultBankTransferAccID")
    private Integer defaultBankTransferAccId;

    @Column(name="DefaultARCategoryID")
    private Integer defaultArcategoryId;

    @Column(name="DefaultReimbusrementSetting")
    private Integer defaultReimbusrementSetting;

    @Column(name="IsRatePriceChangeble")
    private Boolean isRatePriceChangeble;

    @Column(name="IsSalePrefix")
    private Boolean isSalePrefix;

    @Column(name="IsPurchasePrefix")
    private Boolean isPurchasePrefix;

    @Column(name="shippadjustmentvalue", length = 50)
    private String shippadjustmentvalue;

    @Column(name="shippadjustmentunit", length = 50)
    private String shippadjustmentunit;

    @Column(name="DefaultCustomerSortID")
    private Integer defaultCustomerSortId;

    @Column(name="DefaultVendorrSortID")
    private Integer defaultVendorrSortId;

    @Column(name="ExtraCharge")
    private Boolean extraCharge;

    @Column(name="ChargeAmount")
    private Integer chargeAmount;

    @Column(name="OrderAmount")
    private Integer orderAmount;

    @Column(name="DropShipCharge")
    private Integer dropShipCharge;

    @Column(name="ShowDropShipItems")
    private Boolean showDropShipItems;

    @Column(name="FilterOption", length = 50)
    private String filterOption;

    @Column(name="DefaultCustomerGroupID")
    private Integer defaultCustomerGroupId;

    @Column(name="IsRefundAllowed")
    private Boolean isRefundAllowed;

    @Column(name="CopyAddress")
    private Boolean copyAddress;

    @Column(name="GlobalShipSetup")
    private Boolean globalShipSetup;

    @Column(name="WorldShipSetup")
    private Boolean worldShipSetup;

    @Column(name="FedExSetup")
    private Boolean fedExSetup;

    @Column(name="MISetup")
    private Boolean misetup;

    @Column(name="DefaultMSAccountingBankID")
    private Integer defaultMsaccountingBankId;

    @Column(name="InvoiceSaveLocation")
    private String invoiceSaveLocation;

    @Column(name="PrinteSalesInvoiceFrom")
    private Integer printeSalesInvoiceFrom;

    @Column(name="PrinteSalesInvoiceTo")
    private Integer printeSalesInvoiceTo;

    @Column(name="eSalesPrintDateFrom")
    private OffsetDateTime eSalesPrintDateFrom;

    @Column(name="eSalesPrintDateTo")
    private OffsetDateTime eSalesPrintDateTo;

    @Column(name="eSalesPrintTimeFrom")
    private OffsetDateTime eSalesPrintTimeFrom;

    @Column(name="eSalesPrintTimeTo")
    private OffsetDateTime eSalesPrintTimeTo;

    @Column(name="eSalesInvoicesToPrint")
    private Integer eSalesInvoicesToPrint;

    @Column(name="eSalesPackingSlipsToPrint")
    private Integer eSalesPackingSlipsToPrint;

    @Column(name="eSalesPrintPaperType")
    private Integer eSalesPrintPaperType;

    @Column(name="eSalesPrintByOrder")
    private Integer eSalesPrintByOrder;

    @Column(name="eSalesSkipPrinted")
    private Integer eSalesSkipPrinted;

    @Column(name="eSalesPrintMarketName")
    private Integer eSalesPrintMarketName;

    @Column(name="eSalesPageSort_Store")
    private Integer eSalesPageSortStore;

    @Column(name="eSalesPageSort_ShippingMethod")
    private Integer eSalesPageSortShippingMethod;

    @Column(name="eSalesPageSort_ItemTitle")
    private Integer eSalesPageSortItemTitle;

    @Column(name="eSalesPageSort_Destination")
    private Integer eSalesPageSortDestination;

    @Column(name="eSalesPageSort_SpecialHanding")
    private Integer eSalesPageSortSpecialHanding;

    @Column(name="eSalesPageSort_Location")
    private Integer eSalesPageSortLocation;

    @Column(name="eSalesPrintCoupon")
    private Integer eSalesPrintCoupon;

    @Column(name="eSalesPrintGiftMessage")
    private Integer eSalesPrintGiftMessage;

    @Column(name="eSalesCouponLocation")
    private String eSalesCouponLocation;

    @Column(name="PrintBills")
    private Integer printBills;

    @Column(name="MailToCustomer")
    private Integer mailToCustomer;

    @Column(name="EmployeeInChargeID")
    private Integer employeeInChargeId;

    @Column(name="UseCurrentDate")
    private Integer useCurrentDate;

    @Column(name="ImportDays")
    private Integer importDays;

    @Column(name="AllowMutipleTimeImport")
    private Integer allowMutipleTimeImport;

    @Column(name="PrintTestPage")
    private Integer printTestPage;

    @Column(name="eSalesPrintTestPage")
    private Integer eSalesPrintTestPage;

    @Column(name="StartingBillNumber")
    private Integer startingBillNumber;

    @Column(name="showBillingStatStyle")
    private Integer showBillingStatStyle;

    @Column(name="showReorderPointList")
    private Integer showReorderPointList;

    @Column(name="ShowReorderPointWarring")
    private Integer showReorderPointWarring;

    @Column(name="MailOrderConfirm")
    private Integer mailOrderConfirm;

    @Column(name="BudgetStartMonth")
    private Integer budgetStartMonth;

    @Column(name="BudgetEndMonth")
    private Integer budgetEndMonth;

    @Column(name="RecentActivityCount")
    private Integer recentActivityCount;

    @Column(name="isGalaxyShip")
    private Boolean isGalaxyShip;

    @Column(name="isMailInnovation")
    private Boolean isMailInnovation;

    @Column(name="DefaultPackingSlipStyleID")
    private Integer defaultPackingSlipStyleId;

    @Column(name="isUPSWorldShip")
    private Boolean isUpsworldShip;

    @Column(name="showCombinedBilling")
    private Integer showCombinedBilling;

    @Column(name="showSalesOrder")
    private Integer showSalesOrder;

    @Column(name="PrintSalesFrom")
    private Integer printSalesFrom;

    @Column(name="PrintSalesTo")
    private Integer printSalesTo;

    @Column(name="LineofCreditTermID")
    private Integer lineofCreditTermId;

    @Column(name="Memobill")
    private Integer memobill;

    @Column(name="MemobillDays")
    private Integer memobillDays;

    @Column(name="InvoiceStyleTypeID")
    private Integer invoiceStyleTypeId;

    @Column(name="SalesOrderStyleTypeID")
    private Integer salesOrderStyleTypeId;

    @Column(name="EstimationStyleTypeID")
    private Integer estimationStyleTypeId;

    @Column(name="POStyleTypeID")
    private Integer postyleTypeId;

    @Column(name="BillingStyleTypeID")
    private Integer billingStyleTypeId;

    @Column(name="PackingSlipStyleTypeID")
    private Integer packingSlipStyleTypeId;

    @Column(name="dateFrom")
    private OffsetDateTime dateFrom;

    @Column(name="dateTo")
    private OffsetDateTime dateTo;

    @Column(name="defaultModule")
    private Integer defaultModule;

    @Column(name="eBayListingDays")
    private String eBayListingDays;

    @Column(name="eBayPaymentMethod")
    private String eBayPaymentMethod;

    @Column(name="eBayShippingFees")
    private Double eBayShippingFees;

    @Column(name="isIgnoreQOH")
    private Integer isIgnoreQoh;

    @Column(name="StartingEstimationNumber")
    private Integer startingEstimationNumber;

    @Column(name="EstimationStyleID")
    private Integer estimationStyleId;

    @Column(name="SOStyleID")
    private Integer sostyleId;

    @Column(name="ReservedQuantity")
    private Integer reservedQuantity;

    @Column(name="SalesOrderQty")
    private Integer salesOrderQty;

    @Column(name="BuildRefNo")
    private Integer buildRefNo;

    @Column(name="AmazonSellerTextFilepath")
    private String amazonSellerTextFilepath;

    @Column(name="AmazonMarchantTextFilepath")
    private String amazonMarchantTextFilepath;

    @Column(name="ShippingDBIPAddress", columnDefinition = "longtext")
    private String shippingDbipaddress;

    @Column(name="ShippingDBName", columnDefinition = "longtext")
    private String shippingDbname;

    @Column(name="PackingSlipCompanyName")
    private String packingSlipCompanyName;

    @Column(name="IsPackingSlipNameEnable")
    private Integer isPackingSlipNameEnable;

    @Column(name="PackingSlipAddress")
    private String packingSlipAddress;

    @Column(name="PackingSlipCity")
    private String packingSlipCity;

    @Column(name="PackingSlipState", length = 50)
    private String packingSlipState;

    @Column(name="PackingSlipProvince", length = 50)
    private String packingSlipProvince;

    @Column(name="PackingSlipCountry", length = 50)
    private String packingSlipCountry;

    @Column(name="PackingSlipZipcode", length = 50)
    private String packingSlipZipcode;

    @Column(name="iseSalesItemUploadSchedule")
    private Integer iseSalesItemUploadSchedule;

    @Column(name="isAddAsin")
    private Integer isAddAsin;

    @Column(name="poboard")
    private Integer poboard;

    @Column(name="itemsReceivedBoard")
    private Integer itemsReceivedBoard;

    @Column(name="itemsShippedBoard")
    private Integer itemsShippedBoard;

    @Column(name="SalesOrderBoard")
    private Integer salesOrderBoard;

    @Column(name="StartingSalesOrderNumber")
    private Integer startingSalesOrderNumber;

    @Column(name="ProductCategoryID")
    private Integer productCategoryId;

    @Column(name="LocationID")
    private Integer locationId;

    @Column(name="ReOrderPoint")
    private Integer reOrderPoint;

    @Column(name="VendorBusinessTypeID")
    private Integer vendorBusinessTypeId;

    @Column(name="VendorInvoiceStyleId")
    private Integer vendorInvoiceStyleId;

    @Column(name="defaultARCategoryIDforac")
    private Integer defaultArcategoryIdforac;

    @Column(name="defaultARCategoryIDforpo")
    private Integer defaultArcategoryIdforpo;

    @Column(name="defaultARCategoryIDforbp")
    private Integer defaultArcategoryIdforbp;

    @Column(name="defaultdepositoforac")
    private Integer defaultdepositoforac;

    @Column(name="defaultdepositoforpo")
    private Integer defaultdepositoforpo;

    @Column(name="defaultdepositoforbp")
    private Integer defaultdepositoforbp;

    @Column(name="defaultReceivedforac")
    private Integer defaultReceivedforac;

    @Column(name="defaultReceivedforpo")
    private Integer defaultReceivedforpo;

    @Column(name="defaultReceivedforbp")
    private Integer defaultReceivedforbp;

    @Column(name="CVCategoryID")
    private Integer cvcategoryId;

    @Column(name="Packing_slip_terms", length = 3000)
    private String packingSlipTerms;

    @Column(name="invoice_terms", length = 3000)
    private String invoiceTerms;

    @Column(name="ShowUSAInBillShipAddress")
    private Boolean showUsainBillShipAddress;

    @Column(name="DisplayPeriod")
    private Integer displayPeriod;

    @Column(name="InventoryDefaultCategory")
    private Integer inventoryDefaultCategory;

    @Column(name="CustomerType")
    private Integer customerType;

    @Column(name="PriceLevelCustomer")
    private Integer priceLevelCustomer;

    @Column(name="PriceLevelDealer")
    private Integer priceLevelDealer;

    @Column(name="PriceLevelGeneral")
    private Integer priceLevelGeneral;

    @Column(name="PriceLevelPriority")
    private Integer priceLevelPriority;

    @Column(name="InvoiceTemplateType")
    private Integer invoiceTemplateType;

    @Column(name="EstimationTemplateType")
    private Integer estimationTemplateType;

    @Column(name="SalesOrderTemplateType")
    private Integer salesOrderTemplateType;

    @Column(name="PurchaseOrderTemplateType")
    private Integer purchaseOrderTemplateType;

    @Column(name="PackingSlipTemplateType")
    private Integer packingSlipTemplateType;

    @Column(name="ChargeSalestax")
    private Integer chargeSalestax;

    @Column(name="SalesTaxRate2")
    private Double salesTaxRate2;

    @Column(name="isBackOrderNeeded")
    private Boolean isBackOrderNeeded;

    @Column(name="isRecurringServiceBill")
    private Boolean isRecurringServiceBill;

    @Column(name="serviceBillName")
    private String serviceBillName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SalesTaxID")
    private BcaSalestax salesTax;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CustomerCountryID")
    private BcaCountries customerCountry;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CustomerStateID")
    private BcaStates customerState;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceStyleID")
    private BcaInvoicestyle invoiceStyle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "VendorCountryID")
    private BcaCountries vendorCountry;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "VendorStateID")
    private BcaStates vendorState;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "POStyleID")
    private BcaPostyle postyle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeCountryID")
    private BcaCountries employeeCountry;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeStateID")
    private BcaStates employeeState;

    public Integer getPreferenceId() {
        return preferenceId;
    }

    public void setPreferenceId(final Integer preferenceId) {
        this.preferenceId = preferenceId;
    }

    public String getCurrencyText() {
        return currencyText;
    }

    public void setCurrencyText(final String currencyText) {
        this.currencyText = currencyText;
    }

    public Integer getCurrencyId() {
        return currencyId;
    }

    public void setCurrencyId(final Integer currencyId) {
        this.currencyId = currencyId;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(final String weight) {
        this.weight = weight;
    }

    public Integer getWeightId() {
        return weightId;
    }

    public void setWeightId(final Integer weightId) {
        this.weightId = weightId;
    }

    public String getLabelSize() {
        return labelSize;
    }

    public void setLabelSize(final String labelSize) {
        this.labelSize = labelSize;
    }

    public Integer getLabelSizeId() {
        return labelSizeId;
    }

    public void setLabelSizeId(final Integer labelSizeId) {
        this.labelSizeId = labelSizeId;
    }

    public String getBackupPeriod() {
        return backupPeriod;
    }

    public void setBackupPeriod(final String backupPeriod) {
        this.backupPeriod = backupPeriod;
    }

    public Integer getBackupPeriodId() {
        return backupPeriodId;
    }

    public void setBackupPeriodId(final Integer backupPeriodId) {
        this.backupPeriodId = backupPeriodId;
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


    public String getCustomerProvience() {
        return customerProvience;
    }

    public void setCustomerProvience(final String customerProvience) {
        this.customerProvience = customerProvience;
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

    public Boolean getSaleShowCountry() {
        return saleShowCountry;
    }

    public void setSaleShowCountry(final Boolean saleShowCountry) {
        this.saleShowCountry = saleShowCountry;
    }

    public Boolean getSaleShowTelephone() {
        return saleShowTelephone;
    }

    public void setSaleShowTelephone(final Boolean saleShowTelephone) {
        this.saleShowTelephone = saleShowTelephone;
    }


    public String getVendorProvience() {
        return vendorProvience;
    }

    public void setVendorProvience(final String vendorProvience) {
        this.vendorProvience = vendorProvience;
    }

    public Integer getVendorUseCompanyname() {
        return vendorUseCompanyname;
    }

    public void setVendorUseCompanyname(final Integer vendorUseCompanyname) {
        this.vendorUseCompanyname = vendorUseCompanyname;
    }

    public String getStartingPonumber() {
        return startingPonumber;
    }

    public void setStartingPonumber(final String startingPonumber) {
        this.startingPonumber = startingPonumber;
    }

    public Integer getPofootnoteId() {
        return pofootnoteId;
    }

    public void setPofootnoteId(final Integer pofootnoteId) {
        this.pofootnoteId = pofootnoteId;
    }

    public Boolean getPoshowCountry() {
        return poshowCountry;
    }

    public void setPoshowCountry(final Boolean poshowCountry) {
        this.poshowCountry = poshowCountry;
    }

    public Boolean getPoshowTelephone() {
        return poshowTelephone;
    }

    public void setPoshowTelephone(final Boolean poshowTelephone) {
        this.poshowTelephone = poshowTelephone;
    }

    public String getStartingRinumber() {
        return startingRinumber;
    }

    public void setStartingRinumber(final String startingRinumber) {
        this.startingRinumber = startingRinumber;
    }

    public Integer getProductTaxable() {
        return productTaxable;
    }

    public void setProductTaxable(final Integer productTaxable) {
        this.productTaxable = productTaxable;
    }

    public Integer getEmployeeIdtoUse() {
        return employeeIdtoUse;
    }

    public void setEmployeeIdtoUse(final Integer employeeIdtoUse) {
        this.employeeIdtoUse = employeeIdtoUse;
    }


    public Double getSalesTaxRate() {
        return salesTaxRate;
    }

    public void setSalesTaxRate(final Double salesTaxRate) {
        this.salesTaxRate = salesTaxRate;
    }

    public Integer getHowOftenSalestax() {
        return howOftenSalestax;
    }

    public void setHowOftenSalestax(final Integer howOftenSalestax) {
        this.howOftenSalestax = howOftenSalestax;
    }

    public String getSalesTaxCode() {
        return salesTaxCode;
    }

    public void setSalesTaxCode(final String salesTaxCode) {
        this.salesTaxCode = salesTaxCode;
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

    public Integer getEstimationMemo() {
        return estimationMemo;
    }

    public void setEstimationMemo(final Integer estimationMemo) {
        this.estimationMemo = estimationMemo;
    }

    public Integer getEstimationMemoDays() {
        return estimationMemoDays;
    }

    public void setEstimationMemoDays(final Integer estimationMemoDays) {
        this.estimationMemoDays = estimationMemoDays;
    }

    public Integer getPomemo() {
        return pomemo;
    }

    public void setPomemo(final Integer pomemo) {
        this.pomemo = pomemo;
    }

    public Integer getPomemoDays() {
        return pomemoDays;
    }

    public void setPomemoDays(final Integer pomemoDays) {
        this.pomemoDays = pomemoDays;
    }

    public Integer getServiceBillsMemo() {
        return serviceBillsMemo;
    }

    public void setServiceBillsMemo(final Integer serviceBillsMemo) {
        this.serviceBillsMemo = serviceBillsMemo;
    }

    public Integer getServiceBillsMemoDays() {
        return serviceBillsMemoDays;
    }

    public void setServiceBillsMemoDays(final Integer serviceBillsMemoDays) {
        this.serviceBillsMemoDays = serviceBillsMemoDays;
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

    public String getCompanyLogoPath() {
        return companyLogoPath;
    }

    public void setCompanyLogoPath(final String companyLogoPath) {
        this.companyLogoPath = companyLogoPath;
    }

    public Double getChargeInterest() {
        return chargeInterest;
    }

    public void setChargeInterest(final Double chargeInterest) {
        this.chargeInterest = chargeInterest;
    }

    public Double getChargeMinimum() {
        return chargeMinimum;
    }

    public void setChargeMinimum(final Double chargeMinimum) {
        this.chargeMinimum = chargeMinimum;
    }

    public Double getChargeGrace() {
        return chargeGrace;
    }

    public void setChargeGrace(final Double chargeGrace) {
        this.chargeGrace = chargeGrace;
    }

    public Boolean getChargeReassess() {
        return chargeReassess;
    }

    public void setChargeReassess(final Boolean chargeReassess) {
        this.chargeReassess = chargeReassess;
    }

    public Integer getChargeNameDisplay() {
        return chargeNameDisplay;
    }

    public void setChargeNameDisplay(final Integer chargeNameDisplay) {
        this.chargeNameDisplay = chargeNameDisplay;
    }

    public Boolean getChargeMarkFinance() {
        return chargeMarkFinance;
    }

    public void setChargeMarkFinance(final Boolean chargeMarkFinance) {
        this.chargeMarkFinance = chargeMarkFinance;
    }

    public Boolean getPrintByOrder() {
        return printByOrder;
    }

    public void setPrintByOrder(final Boolean printByOrder) {
        this.printByOrder = printByOrder;
    }

    public Integer getPrintInvoiceFrom() {
        return printInvoiceFrom;
    }

    public void setPrintInvoiceFrom(final Integer printInvoiceFrom) {
        this.printInvoiceFrom = printInvoiceFrom;
    }

    public Integer getPrintInvoiceTo() {
        return printInvoiceTo;
    }

    public void setPrintInvoiceTo(final Integer printInvoiceTo) {
        this.printInvoiceTo = printInvoiceTo;
    }

    public OffsetDateTime getPrintDateFrom() {
        return printDateFrom;
    }

    public void setPrintDateFrom(final OffsetDateTime printDateFrom) {
        this.printDateFrom = printDateFrom;
    }

    public OffsetDateTime getPrintDateTo() {
        return printDateTo;
    }

    public void setPrintDateTo(final OffsetDateTime printDateTo) {
        this.printDateTo = printDateTo;
    }

    public OffsetDateTime getPrintTimeFrom() {
        return printTimeFrom;
    }

    public void setPrintTimeFrom(final OffsetDateTime printTimeFrom) {
        this.printTimeFrom = printTimeFrom;
    }

    public OffsetDateTime getPrintTimeTo() {
        return printTimeTo;
    }

    public void setPrintTimeTo(final OffsetDateTime printTimeTo) {
        this.printTimeTo = printTimeTo;
    }

    public Boolean getPageSortShippingMethod() {
        return pageSortShippingMethod;
    }

    public void setPageSortShippingMethod(final Boolean pageSortShippingMethod) {
        this.pageSortShippingMethod = pageSortShippingMethod;
    }

    public Boolean getPageSortItemTitle() {
        return pageSortItemTitle;
    }

    public void setPageSortItemTitle(final Boolean pageSortItemTitle) {
        this.pageSortItemTitle = pageSortItemTitle;
    }

    public Boolean getPageSortDestination() {
        return pageSortDestination;
    }

    public void setPageSortDestination(final Boolean pageSortDestination) {
        this.pageSortDestination = pageSortDestination;
    }

    public Boolean getPageSortSpecialHanding() {
        return pageSortSpecialHanding;
    }

    public void setPageSortSpecialHanding(final Boolean pageSortSpecialHanding) {
        this.pageSortSpecialHanding = pageSortSpecialHanding;
    }

    public Boolean getPageSortLocation() {
        return pageSortLocation;
    }

    public void setPageSortLocation(final Boolean pageSortLocation) {
        this.pageSortLocation = pageSortLocation;
    }

    public Boolean getSkipPrinted() {
        return skipPrinted;
    }

    public void setSkipPrinted(final Boolean skipPrinted) {
        this.skipPrinted = skipPrinted;
    }

    public Boolean getMarkPrinted() {
        return markPrinted;
    }

    public void setMarkPrinted(final Boolean markPrinted) {
        this.markPrinted = markPrinted;
    }

    public Integer getInvoicesToPrint() {
        return invoicesToPrint;
    }

    public void setInvoicesToPrint(final Integer invoicesToPrint) {
        this.invoicesToPrint = invoicesToPrint;
    }

    public Integer getPackingSlipsToPrint() {
        return packingSlipsToPrint;
    }

    public void setPackingSlipsToPrint(final Integer packingSlipsToPrint) {
        this.packingSlipsToPrint = packingSlipsToPrint;
    }

    public String getPackingReturnPolicy() {
        return packingReturnPolicy;
    }

    public void setPackingReturnPolicy(final String packingReturnPolicy) {
        this.packingReturnPolicy = packingReturnPolicy;
    }

    public Integer getPrintPaperType() {
        return printPaperType;
    }

    public void setPrintPaperType(final Integer printPaperType) {
        this.printPaperType = printPaperType;
    }

    public Boolean getPrintCoupon() {
        return printCoupon;
    }

    public void setPrintCoupon(final Boolean printCoupon) {
        this.printCoupon = printCoupon;
    }

    public Boolean getPrintGiftMessage() {
        return printGiftMessage;
    }

    public void setPrintGiftMessage(final Boolean printGiftMessage) {
        this.printGiftMessage = printGiftMessage;
    }

    public String getCouponLocation() {
        return couponLocation;
    }

    public void setCouponLocation(final String couponLocation) {
        this.couponLocation = couponLocation;
    }

    public Integer getBarcodeId() {
        return barcodeId;
    }

    public void setBarcodeId(final Integer barcodeId) {
        this.barcodeId = barcodeId;
    }

    public String getMailserver() {
        return mailserver;
    }

    public void setMailserver(final String mailserver) {
        this.mailserver = mailserver;
    }

    public String getMailUsername() {
        return mailUsername;
    }

    public void setMailUsername(final String mailUsername) {
        this.mailUsername = mailUsername;
    }

    public String getMailPassword() {
        return mailPassword;
    }

    public void setMailPassword(final String mailPassword) {
        this.mailPassword = mailPassword;
    }

    public Boolean getMailAuth() {
        return mailAuth;
    }

    public void setMailAuth(final Boolean mailAuth) {
        this.mailAuth = mailAuth;
    }

    public String getMailSenderEmail() {
        return mailSenderEmail;
    }

    public void setMailSenderEmail(final String mailSenderEmail) {
        this.mailSenderEmail = mailSenderEmail;
    }

    public Integer getArTerm() {
        return arTerm;
    }

    public void setArTerm(final Integer arTerm) {
        this.arTerm = arTerm;
    }

    public BigDecimal getArLatefee() {
        return arLatefee;
    }

    public void setArLatefee(final BigDecimal arLatefee) {
        this.arLatefee = arLatefee;
    }

    public Integer getPrintFormNoBilling() {
        return printFormNoBilling;
    }

    public void setPrintFormNoBilling(final Integer printFormNoBilling) {
        this.printFormNoBilling = printFormNoBilling;
    }

    public Integer getPrintFormNoInvoice() {
        return printFormNoInvoice;
    }

    public void setPrintFormNoInvoice(final Integer printFormNoInvoice) {
        this.printFormNoInvoice = printFormNoInvoice;
    }

    public String getPerformance() {
        return performance;
    }

    public void setPerformance(final String performance) {
        this.performance = performance;
    }

    public Integer getTimeSheetSet() {
        return timeSheetSet;
    }

    public void setTimeSheetSet(final Integer timeSheetSet) {
        this.timeSheetSet = timeSheetSet;
    }

    public Integer getShippingFeeMethod() {
        return shippingFeeMethod;
    }

    public void setShippingFeeMethod(final Integer shippingFeeMethod) {
        this.shippingFeeMethod = shippingFeeMethod;
    }

    public Integer getSalesViaId() {
        return salesViaId;
    }

    public void setSalesViaId(final Integer salesViaId) {
        this.salesViaId = salesViaId;
    }

    public Integer getSalesTermId() {
        return salesTermId;
    }

    public void setSalesTermId(final Integer salesTermId) {
        this.salesTermId = salesTermId;
    }

    public Integer getSalesRepId() {
        return salesRepId;
    }

    public void setSalesRepId(final Integer salesRepId) {
        this.salesRepId = salesRepId;
    }

    public Integer getSalesPayMethodId() {
        return salesPayMethodId;
    }

    public void setSalesPayMethodId(final Integer salesPayMethodId) {
        this.salesPayMethodId = salesPayMethodId;
    }

    public String getSalesPoprefix() {
        return salesPoprefix;
    }

    public void setSalesPoprefix(final String salesPoprefix) {
        this.salesPoprefix = salesPoprefix;
    }

    public Boolean getIsEsalesEnabled() {
        return isEsalesEnabled;
    }

    public void setIsEsalesEnabled(final Boolean isEsalesEnabled) {
        this.isEsalesEnabled = isEsalesEnabled;
    }

    public Boolean getEsalesAmazonMerchant() {
        return esalesAmazonMerchant;
    }

    public void setEsalesAmazonMerchant(final Boolean esalesAmazonMerchant) {
        this.esalesAmazonMerchant = esalesAmazonMerchant;
    }

    public Boolean getEsalesAmazonMerchantOnline() {
        return esalesAmazonMerchantOnline;
    }

    public void setEsalesAmazonMerchantOnline(final Boolean esalesAmazonMerchantOnline) {
        this.esalesAmazonMerchantOnline = esalesAmazonMerchantOnline;
    }

    public Boolean getEsalesAmazonMarket() {
        return esalesAmazonMarket;
    }

    public void setEsalesAmazonMarket(final Boolean esalesAmazonMarket) {
        this.esalesAmazonMarket = esalesAmazonMarket;
    }

    public Boolean getEsaleseBay() {
        return esaleseBay;
    }

    public void setEsaleseBay(final Boolean esaleseBay) {
        this.esaleseBay = esaleseBay;
    }

    public Boolean getEsaleseBayBlackthorne() {
        return esaleseBayBlackthorne;
    }

    public void setEsaleseBayBlackthorne(final Boolean esaleseBayBlackthorne) {
        this.esaleseBayBlackthorne = esaleseBayBlackthorne;
    }

    public Boolean getEsalesHalfdotcom() {
        return esalesHalfdotcom;
    }

    public void setEsalesHalfdotcom(final Boolean esalesHalfdotcom) {
        this.esalesHalfdotcom = esalesHalfdotcom;
    }

    public Boolean getEsalesMagento() {
        return esalesMagento;
    }

    public void setEsalesMagento(final Boolean esalesMagento) {
        this.esalesMagento = esalesMagento;
    }

    public Boolean getEsalesSmc() {
        return esalesSmc;
    }

    public void setEsalesSmc(final Boolean esalesSmc) {
        this.esalesSmc = esalesSmc;
    }

    public Integer getDefaultAmazonSellerBankId() {
        return defaultAmazonSellerBankId;
    }

    public void setDefaultAmazonSellerBankId(final Integer defaultAmazonSellerBankId) {
        this.defaultAmazonSellerBankId = defaultAmazonSellerBankId;
    }

    public Integer getDefaultAmazonSellerOnlineBankId() {
        return defaultAmazonSellerOnlineBankId;
    }

    public void setDefaultAmazonSellerOnlineBankId(final Integer defaultAmazonSellerOnlineBankId) {
        this.defaultAmazonSellerOnlineBankId = defaultAmazonSellerOnlineBankId;
    }

    public Integer getDefaultAmazonMarketBankId() {
        return defaultAmazonMarketBankId;
    }

    public void setDefaultAmazonMarketBankId(final Integer defaultAmazonMarketBankId) {
        this.defaultAmazonMarketBankId = defaultAmazonMarketBankId;
    }

    public Integer getDefaultHalfdotComBankId() {
        return defaultHalfdotComBankId;
    }

    public void setDefaultHalfdotComBankId(final Integer defaultHalfdotComBankId) {
        this.defaultHalfdotComBankId = defaultHalfdotComBankId;
    }

    public Integer getDefaultEbayBankId() {
        return defaultEbayBankId;
    }

    public void setDefaultEbayBankId(final Integer defaultEbayBankId) {
        this.defaultEbayBankId = defaultEbayBankId;
    }

    public Integer getDefaultEbayOnlineBankId() {
        return defaultEbayOnlineBankId;
    }

    public void setDefaultEbayOnlineBankId(final Integer defaultEbayOnlineBankId) {
        this.defaultEbayOnlineBankId = defaultEbayOnlineBankId;
    }

    public Integer getDefaultSmcbankId() {
        return defaultSmcbankId;
    }

    public void setDefaultSmcbankId(final Integer defaultSmcbankId) {
        this.defaultSmcbankId = defaultSmcbankId;
    }

    public Integer getPoviaId() {
        return poviaId;
    }

    public void setPoviaId(final Integer poviaId) {
        this.poviaId = poviaId;
    }

    public Integer getPotermId() {
        return potermId;
    }

    public void setPotermId(final Integer potermId) {
        this.potermId = potermId;
    }

    public Integer getPorepId() {
        return porepId;
    }

    public void setPorepId(final Integer porepId) {
        this.porepId = porepId;
    }

    public Integer getPopayMethodId() {
        return popayMethodId;
    }

    public void setPopayMethodId(final Integer popayMethodId) {
        this.popayMethodId = popayMethodId;
    }

    public Integer getDefaultPayableAccountId() {
        return defaultPayableAccountId;
    }

    public void setDefaultPayableAccountId(final Integer defaultPayableAccountId) {
        this.defaultPayableAccountId = defaultPayableAccountId;
    }

    public Integer getAutoPaymentDuration() {
        return autoPaymentDuration;
    }

    public void setAutoPaymentDuration(final Integer autoPaymentDuration) {
        this.autoPaymentDuration = autoPaymentDuration;
    }

    public Integer getDefaultCategoryId() {
        return defaultCategoryId;
    }

    public void setDefaultCategoryId(final Integer defaultCategoryId) {
        this.defaultCategoryId = defaultCategoryId;
    }

    public Integer getDefaultVendorCategoryId() {
        return defaultVendorCategoryId;
    }

    public void setDefaultVendorCategoryId(final Integer defaultVendorCategoryId) {
        this.defaultVendorCategoryId = defaultVendorCategoryId;
    }

    public Double getDefaultRmarepairmentCharge() {
        return defaultRmarepairmentCharge;
    }

    public void setDefaultRmarepairmentCharge(final Double defaultRmarepairmentCharge) {
        this.defaultRmarepairmentCharge = defaultRmarepairmentCharge;
    }

    public Integer getDefaultRmacheckingBankId() {
        return defaultRmacheckingBankId;
    }

    public void setDefaultRmacheckingBankId(final Integer defaultRmacheckingBankId) {
        this.defaultRmacheckingBankId = defaultRmacheckingBankId;
    }

    public Integer getDefaultBankTransferAccId() {
        return defaultBankTransferAccId;
    }

    public void setDefaultBankTransferAccId(final Integer defaultBankTransferAccId) {
        this.defaultBankTransferAccId = defaultBankTransferAccId;
    }

    public Integer getDefaultArcategoryId() {
        return defaultArcategoryId;
    }

    public void setDefaultArcategoryId(final Integer defaultArcategoryId) {
        this.defaultArcategoryId = defaultArcategoryId;
    }

    public Integer getDefaultReimbusrementSetting() {
        return defaultReimbusrementSetting;
    }

    public void setDefaultReimbusrementSetting(final Integer defaultReimbusrementSetting) {
        this.defaultReimbusrementSetting = defaultReimbusrementSetting;
    }

    public Boolean getIsRatePriceChangeble() {
        return isRatePriceChangeble;
    }

    public void setIsRatePriceChangeble(final Boolean isRatePriceChangeble) {
        this.isRatePriceChangeble = isRatePriceChangeble;
    }

    public Boolean getIsSalePrefix() {
        return isSalePrefix;
    }

    public void setIsSalePrefix(final Boolean isSalePrefix) {
        this.isSalePrefix = isSalePrefix;
    }

    public Boolean getIsPurchasePrefix() {
        return isPurchasePrefix;
    }

    public void setIsPurchasePrefix(final Boolean isPurchasePrefix) {
        this.isPurchasePrefix = isPurchasePrefix;
    }

    public String getShippadjustmentvalue() {
        return shippadjustmentvalue;
    }

    public void setShippadjustmentvalue(final String shippadjustmentvalue) {
        this.shippadjustmentvalue = shippadjustmentvalue;
    }

    public String getShippadjustmentunit() {
        return shippadjustmentunit;
    }

    public void setShippadjustmentunit(final String shippadjustmentunit) {
        this.shippadjustmentunit = shippadjustmentunit;
    }

    public Integer getDefaultCustomerSortId() {
        return defaultCustomerSortId;
    }

    public void setDefaultCustomerSortId(final Integer defaultCustomerSortId) {
        this.defaultCustomerSortId = defaultCustomerSortId;
    }

    public Integer getDefaultVendorrSortId() {
        return defaultVendorrSortId;
    }

    public void setDefaultVendorrSortId(final Integer defaultVendorrSortId) {
        this.defaultVendorrSortId = defaultVendorrSortId;
    }

    public Boolean getExtraCharge() {
        return extraCharge;
    }

    public void setExtraCharge(final Boolean extraCharge) {
        this.extraCharge = extraCharge;
    }

    public Integer getChargeAmount() {
        return chargeAmount;
    }

    public void setChargeAmount(final Integer chargeAmount) {
        this.chargeAmount = chargeAmount;
    }

    public Integer getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(final Integer orderAmount) {
        this.orderAmount = orderAmount;
    }

    public Integer getDropShipCharge() {
        return dropShipCharge;
    }

    public void setDropShipCharge(final Integer dropShipCharge) {
        this.dropShipCharge = dropShipCharge;
    }

    public Boolean getShowDropShipItems() {
        return showDropShipItems;
    }

    public void setShowDropShipItems(final Boolean showDropShipItems) {
        this.showDropShipItems = showDropShipItems;
    }

    public String getFilterOption() {
        return filterOption;
    }

    public void setFilterOption(final String filterOption) {
        this.filterOption = filterOption;
    }

    public Integer getDefaultCustomerGroupId() {
        return defaultCustomerGroupId;
    }

    public void setDefaultCustomerGroupId(final Integer defaultCustomerGroupId) {
        this.defaultCustomerGroupId = defaultCustomerGroupId;
    }

    public Boolean getIsRefundAllowed() {
        return isRefundAllowed;
    }

    public void setIsRefundAllowed(final Boolean isRefundAllowed) {
        this.isRefundAllowed = isRefundAllowed;
    }

    public Boolean getCopyAddress() {
        return copyAddress;
    }

    public void setCopyAddress(final Boolean copyAddress) {
        this.copyAddress = copyAddress;
    }

    public Boolean getGlobalShipSetup() {
        return globalShipSetup;
    }

    public void setGlobalShipSetup(final Boolean globalShipSetup) {
        this.globalShipSetup = globalShipSetup;
    }

    public Boolean getWorldShipSetup() {
        return worldShipSetup;
    }

    public void setWorldShipSetup(final Boolean worldShipSetup) {
        this.worldShipSetup = worldShipSetup;
    }

    public Boolean getFedExSetup() {
        return fedExSetup;
    }

    public void setFedExSetup(final Boolean fedExSetup) {
        this.fedExSetup = fedExSetup;
    }

    public Boolean getMisetup() {
        return misetup;
    }

    public void setMisetup(final Boolean misetup) {
        this.misetup = misetup;
    }

    public Integer getDefaultMsaccountingBankId() {
        return defaultMsaccountingBankId;
    }

    public void setDefaultMsaccountingBankId(final Integer defaultMsaccountingBankId) {
        this.defaultMsaccountingBankId = defaultMsaccountingBankId;
    }

    public String getInvoiceSaveLocation() {
        return invoiceSaveLocation;
    }

    public void setInvoiceSaveLocation(final String invoiceSaveLocation) {
        this.invoiceSaveLocation = invoiceSaveLocation;
    }

    public Integer getPrinteSalesInvoiceFrom() {
        return printeSalesInvoiceFrom;
    }

    public void setPrinteSalesInvoiceFrom(final Integer printeSalesInvoiceFrom) {
        this.printeSalesInvoiceFrom = printeSalesInvoiceFrom;
    }

    public Integer getPrinteSalesInvoiceTo() {
        return printeSalesInvoiceTo;
    }

    public void setPrinteSalesInvoiceTo(final Integer printeSalesInvoiceTo) {
        this.printeSalesInvoiceTo = printeSalesInvoiceTo;
    }

    public OffsetDateTime getESalesPrintDateFrom() {
        return eSalesPrintDateFrom;
    }

    public void setESalesPrintDateFrom(final OffsetDateTime eSalesPrintDateFrom) {
        this.eSalesPrintDateFrom = eSalesPrintDateFrom;
    }

    public OffsetDateTime getESalesPrintDateTo() {
        return eSalesPrintDateTo;
    }

    public void setESalesPrintDateTo(final OffsetDateTime eSalesPrintDateTo) {
        this.eSalesPrintDateTo = eSalesPrintDateTo;
    }

    public OffsetDateTime getESalesPrintTimeFrom() {
        return eSalesPrintTimeFrom;
    }

    public void setESalesPrintTimeFrom(final OffsetDateTime eSalesPrintTimeFrom) {
        this.eSalesPrintTimeFrom = eSalesPrintTimeFrom;
    }

    public OffsetDateTime getESalesPrintTimeTo() {
        return eSalesPrintTimeTo;
    }

    public void setESalesPrintTimeTo(final OffsetDateTime eSalesPrintTimeTo) {
        this.eSalesPrintTimeTo = eSalesPrintTimeTo;
    }

    public Integer getESalesInvoicesToPrint() {
        return eSalesInvoicesToPrint;
    }

    public void setESalesInvoicesToPrint(final Integer eSalesInvoicesToPrint) {
        this.eSalesInvoicesToPrint = eSalesInvoicesToPrint;
    }

    public Integer getESalesPackingSlipsToPrint() {
        return eSalesPackingSlipsToPrint;
    }

    public void setESalesPackingSlipsToPrint(final Integer eSalesPackingSlipsToPrint) {
        this.eSalesPackingSlipsToPrint = eSalesPackingSlipsToPrint;
    }

    public Integer getESalesPrintPaperType() {
        return eSalesPrintPaperType;
    }

    public void setESalesPrintPaperType(final Integer eSalesPrintPaperType) {
        this.eSalesPrintPaperType = eSalesPrintPaperType;
    }

    public Integer getESalesPrintByOrder() {
        return eSalesPrintByOrder;
    }

    public void setESalesPrintByOrder(final Integer eSalesPrintByOrder) {
        this.eSalesPrintByOrder = eSalesPrintByOrder;
    }

    public Integer getESalesSkipPrinted() {
        return eSalesSkipPrinted;
    }

    public void setESalesSkipPrinted(final Integer eSalesSkipPrinted) {
        this.eSalesSkipPrinted = eSalesSkipPrinted;
    }

    public Integer getESalesPrintMarketName() {
        return eSalesPrintMarketName;
    }

    public void setESalesPrintMarketName(final Integer eSalesPrintMarketName) {
        this.eSalesPrintMarketName = eSalesPrintMarketName;
    }

    public Integer getESalesPageSortStore() {
        return eSalesPageSortStore;
    }

    public void setESalesPageSortStore(final Integer eSalesPageSortStore) {
        this.eSalesPageSortStore = eSalesPageSortStore;
    }

    public Integer getESalesPageSortShippingMethod() {
        return eSalesPageSortShippingMethod;
    }

    public void setESalesPageSortShippingMethod(final Integer eSalesPageSortShippingMethod) {
        this.eSalesPageSortShippingMethod = eSalesPageSortShippingMethod;
    }

    public Integer getESalesPageSortItemTitle() {
        return eSalesPageSortItemTitle;
    }

    public void setESalesPageSortItemTitle(final Integer eSalesPageSortItemTitle) {
        this.eSalesPageSortItemTitle = eSalesPageSortItemTitle;
    }

    public Integer getESalesPageSortDestination() {
        return eSalesPageSortDestination;
    }

    public void setESalesPageSortDestination(final Integer eSalesPageSortDestination) {
        this.eSalesPageSortDestination = eSalesPageSortDestination;
    }

    public Integer getESalesPageSortSpecialHanding() {
        return eSalesPageSortSpecialHanding;
    }

    public void setESalesPageSortSpecialHanding(final Integer eSalesPageSortSpecialHanding) {
        this.eSalesPageSortSpecialHanding = eSalesPageSortSpecialHanding;
    }

    public Integer getESalesPageSortLocation() {
        return eSalesPageSortLocation;
    }

    public void setESalesPageSortLocation(final Integer eSalesPageSortLocation) {
        this.eSalesPageSortLocation = eSalesPageSortLocation;
    }

    public Integer getESalesPrintCoupon() {
        return eSalesPrintCoupon;
    }

    public void setESalesPrintCoupon(final Integer eSalesPrintCoupon) {
        this.eSalesPrintCoupon = eSalesPrintCoupon;
    }

    public Integer getESalesPrintGiftMessage() {
        return eSalesPrintGiftMessage;
    }

    public void setESalesPrintGiftMessage(final Integer eSalesPrintGiftMessage) {
        this.eSalesPrintGiftMessage = eSalesPrintGiftMessage;
    }

    public String getESalesCouponLocation() {
        return eSalesCouponLocation;
    }

    public void setESalesCouponLocation(final String eSalesCouponLocation) {
        this.eSalesCouponLocation = eSalesCouponLocation;
    }

    public Integer getPrintBills() {
        return printBills;
    }

    public void setPrintBills(final Integer printBills) {
        this.printBills = printBills;
    }

    public Integer getMailToCustomer() {
        return mailToCustomer;
    }

    public void setMailToCustomer(final Integer mailToCustomer) {
        this.mailToCustomer = mailToCustomer;
    }

    public Integer getEmployeeInChargeId() {
        return employeeInChargeId;
    }

    public void setEmployeeInChargeId(final Integer employeeInChargeId) {
        this.employeeInChargeId = employeeInChargeId;
    }

    public Integer getUseCurrentDate() {
        return useCurrentDate;
    }

    public void setUseCurrentDate(final Integer useCurrentDate) {
        this.useCurrentDate = useCurrentDate;
    }

    public Integer getImportDays() {
        return importDays;
    }

    public void setImportDays(final Integer importDays) {
        this.importDays = importDays;
    }

    public Integer getAllowMutipleTimeImport() {
        return allowMutipleTimeImport;
    }

    public void setAllowMutipleTimeImport(final Integer allowMutipleTimeImport) {
        this.allowMutipleTimeImport = allowMutipleTimeImport;
    }

    public Integer getPrintTestPage() {
        return printTestPage;
    }

    public void setPrintTestPage(final Integer printTestPage) {
        this.printTestPage = printTestPage;
    }

    public Integer getESalesPrintTestPage() {
        return eSalesPrintTestPage;
    }

    public void setESalesPrintTestPage(final Integer eSalesPrintTestPage) {
        this.eSalesPrintTestPage = eSalesPrintTestPage;
    }

    public Integer getStartingBillNumber() {
        return startingBillNumber;
    }

    public void setStartingBillNumber(final Integer startingBillNumber) {
        this.startingBillNumber = startingBillNumber;
    }

    public Integer getShowBillingStatStyle() {
        return showBillingStatStyle;
    }

    public void setShowBillingStatStyle(final Integer showBillingStatStyle) {
        this.showBillingStatStyle = showBillingStatStyle;
    }

    public Integer getShowReorderPointList() {
        return showReorderPointList;
    }

    public void setShowReorderPointList(final Integer showReorderPointList) {
        this.showReorderPointList = showReorderPointList;
    }

    public Integer getShowReorderPointWarring() {
        return showReorderPointWarring;
    }

    public void setShowReorderPointWarring(final Integer showReorderPointWarring) {
        this.showReorderPointWarring = showReorderPointWarring;
    }

    public Integer getMailOrderConfirm() {
        return mailOrderConfirm;
    }

    public void setMailOrderConfirm(final Integer mailOrderConfirm) {
        this.mailOrderConfirm = mailOrderConfirm;
    }

    public Integer getBudgetStartMonth() {
        return budgetStartMonth;
    }

    public void setBudgetStartMonth(final Integer budgetStartMonth) {
        this.budgetStartMonth = budgetStartMonth;
    }

    public Integer getBudgetEndMonth() {
        return budgetEndMonth;
    }

    public void setBudgetEndMonth(final Integer budgetEndMonth) {
        this.budgetEndMonth = budgetEndMonth;
    }

    public Integer getRecentActivityCount() {
        return recentActivityCount;
    }

    public void setRecentActivityCount(final Integer recentActivityCount) {
        this.recentActivityCount = recentActivityCount;
    }

    public Boolean getIsGalaxyShip() {
        return isGalaxyShip;
    }

    public void setIsGalaxyShip(final Boolean isGalaxyShip) {
        this.isGalaxyShip = isGalaxyShip;
    }

    public Boolean getIsMailInnovation() {
        return isMailInnovation;
    }

    public void setIsMailInnovation(final Boolean isMailInnovation) {
        this.isMailInnovation = isMailInnovation;
    }

    public Integer getDefaultPackingSlipStyleId() {
        return defaultPackingSlipStyleId;
    }

    public void setDefaultPackingSlipStyleId(final Integer defaultPackingSlipStyleId) {
        this.defaultPackingSlipStyleId = defaultPackingSlipStyleId;
    }

    public Boolean getIsUpsworldShip() {
        return isUpsworldShip;
    }

    public void setIsUpsworldShip(final Boolean isUpsworldShip) {
        this.isUpsworldShip = isUpsworldShip;
    }

    public Integer getShowCombinedBilling() {
        return showCombinedBilling;
    }

    public void setShowCombinedBilling(final Integer showCombinedBilling) {
        this.showCombinedBilling = showCombinedBilling;
    }

    public Integer getShowSalesOrder() {
        return showSalesOrder;
    }

    public void setShowSalesOrder(final Integer showSalesOrder) {
        this.showSalesOrder = showSalesOrder;
    }

    public Integer getPrintSalesFrom() {
        return printSalesFrom;
    }

    public void setPrintSalesFrom(final Integer printSalesFrom) {
        this.printSalesFrom = printSalesFrom;
    }

    public Integer getPrintSalesTo() {
        return printSalesTo;
    }

    public void setPrintSalesTo(final Integer printSalesTo) {
        this.printSalesTo = printSalesTo;
    }

    public Integer getLineofCreditTermId() {
        return lineofCreditTermId;
    }

    public void setLineofCreditTermId(final Integer lineofCreditTermId) {
        this.lineofCreditTermId = lineofCreditTermId;
    }

    public Integer getMemobill() {
        return memobill;
    }

    public void setMemobill(final Integer memobill) {
        this.memobill = memobill;
    }

    public Integer getMemobillDays() {
        return memobillDays;
    }

    public void setMemobillDays(final Integer memobillDays) {
        this.memobillDays = memobillDays;
    }

    public Integer getInvoiceStyleTypeId() {
        return invoiceStyleTypeId;
    }

    public void setInvoiceStyleTypeId(final Integer invoiceStyleTypeId) {
        this.invoiceStyleTypeId = invoiceStyleTypeId;
    }

    public Integer getSalesOrderStyleTypeId() {
        return salesOrderStyleTypeId;
    }

    public void setSalesOrderStyleTypeId(final Integer salesOrderStyleTypeId) {
        this.salesOrderStyleTypeId = salesOrderStyleTypeId;
    }

    public Integer getEstimationStyleTypeId() {
        return estimationStyleTypeId;
    }

    public void setEstimationStyleTypeId(final Integer estimationStyleTypeId) {
        this.estimationStyleTypeId = estimationStyleTypeId;
    }

    public Integer getPostyleTypeId() {
        return postyleTypeId;
    }

    public void setPostyleTypeId(final Integer postyleTypeId) {
        this.postyleTypeId = postyleTypeId;
    }

    public Integer getBillingStyleTypeId() {
        return billingStyleTypeId;
    }

    public void setBillingStyleTypeId(final Integer billingStyleTypeId) {
        this.billingStyleTypeId = billingStyleTypeId;
    }

    public Integer getPackingSlipStyleTypeId() {
        return packingSlipStyleTypeId;
    }

    public void setPackingSlipStyleTypeId(final Integer packingSlipStyleTypeId) {
        this.packingSlipStyleTypeId = packingSlipStyleTypeId;
    }

    public OffsetDateTime getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(final OffsetDateTime dateFrom) {
        this.dateFrom = dateFrom;
    }

    public OffsetDateTime getDateTo() {
        return dateTo;
    }

    public void setDateTo(final OffsetDateTime dateTo) {
        this.dateTo = dateTo;
    }

    public Integer getDefaultModule() {
        return defaultModule;
    }

    public void setDefaultModule(final Integer defaultModule) {
        this.defaultModule = defaultModule;
    }

    public String getEBayListingDays() {
        return eBayListingDays;
    }

    public void setEBayListingDays(final String eBayListingDays) {
        this.eBayListingDays = eBayListingDays;
    }

    public String getEBayPaymentMethod() {
        return eBayPaymentMethod;
    }

    public void setEBayPaymentMethod(final String eBayPaymentMethod) {
        this.eBayPaymentMethod = eBayPaymentMethod;
    }

    public Double getEBayShippingFees() {
        return eBayShippingFees;
    }

    public void setEBayShippingFees(final Double eBayShippingFees) {
        this.eBayShippingFees = eBayShippingFees;
    }

    public Integer getIsIgnoreQoh() {
        return isIgnoreQoh;
    }

    public void setIsIgnoreQoh(final Integer isIgnoreQoh) {
        this.isIgnoreQoh = isIgnoreQoh;
    }

    public Integer getStartingEstimationNumber() {
        return startingEstimationNumber;
    }

    public void setStartingEstimationNumber(final Integer startingEstimationNumber) {
        this.startingEstimationNumber = startingEstimationNumber;
    }

    public Integer getEstimationStyleId() {
        return estimationStyleId;
    }

    public void setEstimationStyleId(final Integer estimationStyleId) {
        this.estimationStyleId = estimationStyleId;
    }

    public Integer getSostyleId() {
        return sostyleId;
    }

    public void setSostyleId(final Integer sostyleId) {
        this.sostyleId = sostyleId;
    }

    public Integer getReservedQuantity() {
        return reservedQuantity;
    }

    public void setReservedQuantity(final Integer reservedQuantity) {
        this.reservedQuantity = reservedQuantity;
    }

    public Integer getSalesOrderQty() {
        return salesOrderQty;
    }

    public void setSalesOrderQty(final Integer salesOrderQty) {
        this.salesOrderQty = salesOrderQty;
    }

    public Integer getBuildRefNo() {
        return buildRefNo;
    }

    public void setBuildRefNo(final Integer buildRefNo) {
        this.buildRefNo = buildRefNo;
    }

    public String getAmazonSellerTextFilepath() {
        return amazonSellerTextFilepath;
    }

    public void setAmazonSellerTextFilepath(final String amazonSellerTextFilepath) {
        this.amazonSellerTextFilepath = amazonSellerTextFilepath;
    }

    public String getAmazonMarchantTextFilepath() {
        return amazonMarchantTextFilepath;
    }

    public void setAmazonMarchantTextFilepath(final String amazonMarchantTextFilepath) {
        this.amazonMarchantTextFilepath = amazonMarchantTextFilepath;
    }

    public String getShippingDbipaddress() {
        return shippingDbipaddress;
    }

    public void setShippingDbipaddress(final String shippingDbipaddress) {
        this.shippingDbipaddress = shippingDbipaddress;
    }

    public String getShippingDbname() {
        return shippingDbname;
    }

    public void setShippingDbname(final String shippingDbname) {
        this.shippingDbname = shippingDbname;
    }

    public String getPackingSlipCompanyName() {
        return packingSlipCompanyName;
    }

    public void setPackingSlipCompanyName(final String packingSlipCompanyName) {
        this.packingSlipCompanyName = packingSlipCompanyName;
    }

    public Integer getIsPackingSlipNameEnable() {
        return isPackingSlipNameEnable;
    }

    public void setIsPackingSlipNameEnable(final Integer isPackingSlipNameEnable) {
        this.isPackingSlipNameEnable = isPackingSlipNameEnable;
    }

    public String getPackingSlipAddress() {
        return packingSlipAddress;
    }

    public void setPackingSlipAddress(final String packingSlipAddress) {
        this.packingSlipAddress = packingSlipAddress;
    }

    public String getPackingSlipCity() {
        return packingSlipCity;
    }

    public void setPackingSlipCity(final String packingSlipCity) {
        this.packingSlipCity = packingSlipCity;
    }

    public String getPackingSlipState() {
        return packingSlipState;
    }

    public void setPackingSlipState(final String packingSlipState) {
        this.packingSlipState = packingSlipState;
    }

    public String getPackingSlipProvince() {
        return packingSlipProvince;
    }

    public void setPackingSlipProvince(final String packingSlipProvince) {
        this.packingSlipProvince = packingSlipProvince;
    }

    public String getPackingSlipCountry() {
        return packingSlipCountry;
    }

    public void setPackingSlipCountry(final String packingSlipCountry) {
        this.packingSlipCountry = packingSlipCountry;
    }

    public String getPackingSlipZipcode() {
        return packingSlipZipcode;
    }

    public void setPackingSlipZipcode(final String packingSlipZipcode) {
        this.packingSlipZipcode = packingSlipZipcode;
    }

    public Integer getIseSalesItemUploadSchedule() {
        return iseSalesItemUploadSchedule;
    }

    public void setIseSalesItemUploadSchedule(final Integer iseSalesItemUploadSchedule) {
        this.iseSalesItemUploadSchedule = iseSalesItemUploadSchedule;
    }

    public Integer getIsAddAsin() {
        return isAddAsin;
    }

    public void setIsAddAsin(final Integer isAddAsin) {
        this.isAddAsin = isAddAsin;
    }

    public Integer getPoboard() {
        return poboard;
    }

    public void setPoboard(final Integer poboard) {
        this.poboard = poboard;
    }

    public Integer getItemsReceivedBoard() {
        return itemsReceivedBoard;
    }

    public void setItemsReceivedBoard(final Integer itemsReceivedBoard) {
        this.itemsReceivedBoard = itemsReceivedBoard;
    }

    public Integer getItemsShippedBoard() {
        return itemsShippedBoard;
    }

    public void setItemsShippedBoard(final Integer itemsShippedBoard) {
        this.itemsShippedBoard = itemsShippedBoard;
    }

    public Integer getSalesOrderBoard() {
        return salesOrderBoard;
    }

    public void setSalesOrderBoard(final Integer salesOrderBoard) {
        this.salesOrderBoard = salesOrderBoard;
    }

    public Integer getStartingSalesOrderNumber() {
        return startingSalesOrderNumber;
    }

    public void setStartingSalesOrderNumber(final Integer startingSalesOrderNumber) {
        this.startingSalesOrderNumber = startingSalesOrderNumber;
    }

    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(final Integer productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public Integer getLocationId() {
        return locationId;
    }

    public void setLocationId(final Integer locationId) {
        this.locationId = locationId;
    }

    public Integer getReOrderPoint() {
        return reOrderPoint;
    }

    public void setReOrderPoint(final Integer reOrderPoint) {
        this.reOrderPoint = reOrderPoint;
    }

    public Integer getVendorBusinessTypeId() {
        return vendorBusinessTypeId;
    }

    public void setVendorBusinessTypeId(final Integer vendorBusinessTypeId) {
        this.vendorBusinessTypeId = vendorBusinessTypeId;
    }

    public Integer getVendorInvoiceStyleId() {
        return vendorInvoiceStyleId;
    }

    public void setVendorInvoiceStyleId(final Integer vendorInvoiceStyleId) {
        this.vendorInvoiceStyleId = vendorInvoiceStyleId;
    }

    public Integer getDefaultArcategoryIdforac() {
        return defaultArcategoryIdforac;
    }

    public void setDefaultArcategoryIdforac(final Integer defaultArcategoryIdforac) {
        this.defaultArcategoryIdforac = defaultArcategoryIdforac;
    }

    public Integer getDefaultArcategoryIdforpo() {
        return defaultArcategoryIdforpo;
    }

    public void setDefaultArcategoryIdforpo(final Integer defaultArcategoryIdforpo) {
        this.defaultArcategoryIdforpo = defaultArcategoryIdforpo;
    }

    public Integer getDefaultArcategoryIdforbp() {
        return defaultArcategoryIdforbp;
    }

    public void setDefaultArcategoryIdforbp(final Integer defaultArcategoryIdforbp) {
        this.defaultArcategoryIdforbp = defaultArcategoryIdforbp;
    }

    public Integer getDefaultdepositoforac() {
        return defaultdepositoforac;
    }

    public void setDefaultdepositoforac(final Integer defaultdepositoforac) {
        this.defaultdepositoforac = defaultdepositoforac;
    }

    public Integer getDefaultdepositoforpo() {
        return defaultdepositoforpo;
    }

    public void setDefaultdepositoforpo(final Integer defaultdepositoforpo) {
        this.defaultdepositoforpo = defaultdepositoforpo;
    }

    public Integer getDefaultdepositoforbp() {
        return defaultdepositoforbp;
    }

    public void setDefaultdepositoforbp(final Integer defaultdepositoforbp) {
        this.defaultdepositoforbp = defaultdepositoforbp;
    }

    public Integer getDefaultReceivedforac() {
        return defaultReceivedforac;
    }

    public void setDefaultReceivedforac(final Integer defaultReceivedforac) {
        this.defaultReceivedforac = defaultReceivedforac;
    }

    public Integer getDefaultReceivedforpo() {
        return defaultReceivedforpo;
    }

    public void setDefaultReceivedforpo(final Integer defaultReceivedforpo) {
        this.defaultReceivedforpo = defaultReceivedforpo;
    }

    public Integer getDefaultReceivedforbp() {
        return defaultReceivedforbp;
    }

    public void setDefaultReceivedforbp(final Integer defaultReceivedforbp) {
        this.defaultReceivedforbp = defaultReceivedforbp;
    }

    public Integer getCvcategoryId() {
        return cvcategoryId;
    }

    public void setCvcategoryId(final Integer cvcategoryId) {
        this.cvcategoryId = cvcategoryId;
    }

    public String getPackingSlipTerms() {
        return packingSlipTerms;
    }

    public void setPackingSlipTerms(final String packingSlipTerms) {
        this.packingSlipTerms = packingSlipTerms;
    }

    public String getInvoiceTerms() {
        return invoiceTerms;
    }

    public void setInvoiceTerms(final String invoiceTerms) {
        this.invoiceTerms = invoiceTerms;
    }

    public Boolean getShowUsainBillShipAddress() {
        return showUsainBillShipAddress;
    }

    public void setShowUsainBillShipAddress(final Boolean showUsainBillShipAddress) {
        this.showUsainBillShipAddress = showUsainBillShipAddress;
    }

    public Integer getDisplayPeriod() {
        return displayPeriod;
    }

    public void setDisplayPeriod(final Integer displayPeriod) {
        this.displayPeriod = displayPeriod;
    }

    public Integer getInventoryDefaultCategory() {
        return inventoryDefaultCategory;
    }

    public void setInventoryDefaultCategory(final Integer inventoryDefaultCategory) {
        this.inventoryDefaultCategory = inventoryDefaultCategory;
    }

    public Integer getCustomerType() {
        return customerType;
    }

    public void setCustomerType(final Integer customerType) {
        this.customerType = customerType;
    }

    public Integer getPriceLevelCustomer() {
        return priceLevelCustomer;
    }

    public void setPriceLevelCustomer(final Integer priceLevelCustomer) {
        this.priceLevelCustomer = priceLevelCustomer;
    }

    public Integer getPriceLevelDealer() {
        return priceLevelDealer;
    }

    public void setPriceLevelDealer(final Integer priceLevelDealer) {
        this.priceLevelDealer = priceLevelDealer;
    }

    public Integer getPriceLevelGeneral() {
        return priceLevelGeneral;
    }

    public void setPriceLevelGeneral(final Integer priceLevelGeneral) {
        this.priceLevelGeneral = priceLevelGeneral;
    }

    public Integer getPriceLevelPriority() {
        return priceLevelPriority;
    }

    public void setPriceLevelPriority(final Integer priceLevelPriority) {
        this.priceLevelPriority = priceLevelPriority;
    }

    public Integer getInvoiceTemplateType() {
        return invoiceTemplateType;
    }

    public void setInvoiceTemplateType(final Integer invoiceTemplateType) {
        this.invoiceTemplateType = invoiceTemplateType;
    }

    public Integer getEstimationTemplateType() {
        return estimationTemplateType;
    }

    public void setEstimationTemplateType(final Integer estimationTemplateType) {
        this.estimationTemplateType = estimationTemplateType;
    }

    public Integer getSalesOrderTemplateType() {
        return salesOrderTemplateType;
    }

    public void setSalesOrderTemplateType(final Integer salesOrderTemplateType) {
        this.salesOrderTemplateType = salesOrderTemplateType;
    }

    public Integer getPurchaseOrderTemplateType() {
        return purchaseOrderTemplateType;
    }

    public void setPurchaseOrderTemplateType(final Integer purchaseOrderTemplateType) {
        this.purchaseOrderTemplateType = purchaseOrderTemplateType;
    }

    public Integer getPackingSlipTemplateType() {
        return packingSlipTemplateType;
    }

    public void setPackingSlipTemplateType(final Integer packingSlipTemplateType) {
        this.packingSlipTemplateType = packingSlipTemplateType;
    }

    public Integer getChargeSalestax() {
        return chargeSalestax;
    }

    public void setChargeSalestax(final Integer chargeSalestax) {
        this.chargeSalestax = chargeSalestax;
    }

    public Double getSalesTaxRate2() {
        return salesTaxRate2;
    }

    public void setSalesTaxRate2(final Double salesTaxRate2) {
        this.salesTaxRate2 = salesTaxRate2;
    }

    public Boolean getIsBackOrderNeeded() {
        return isBackOrderNeeded;
    }

    public void setIsBackOrderNeeded(final Boolean isBackOrderNeeded) {
        this.isBackOrderNeeded = isBackOrderNeeded;
    }

    public Boolean getIsRecurringServiceBill() {
        return isRecurringServiceBill;
    }

    public void setIsRecurringServiceBill(final Boolean isRecurringServiceBill) {
        this.isRecurringServiceBill = isRecurringServiceBill;
    }

    public String getServiceBillName() {
        return serviceBillName;
    }

    public void setServiceBillName(final String serviceBillName) {
        this.serviceBillName = serviceBillName;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaSalestax getSalesTax() {
        return salesTax;
    }

    public void setSalesTax(final BcaSalestax salesTax) {
        this.salesTax = salesTax;
    }

    public BcaCountries getCustomerCountry() {
        return customerCountry;
    }

    public void setCustomerCountry(final BcaCountries customerCountry) {
        this.customerCountry = customerCountry;
    }

    public BcaStates getCustomerState() {
        return customerState;
    }

    public void setCustomerState(final BcaStates customerState) {
        this.customerState = customerState;
    }

    public BcaInvoicestyle getInvoiceStyle() {
        return invoiceStyle;
    }

    public void setInvoiceStyle(final BcaInvoicestyle invoiceStyle) {
        this.invoiceStyle = invoiceStyle;
    }

    public BcaCountries getVendorCountry() {
        return vendorCountry;
    }

    public void setVendorCountry(final BcaCountries vendorCountry) {
        this.vendorCountry = vendorCountry;
    }

    public BcaStates getVendorState() {
        return vendorState;
    }

    public void setVendorState(final BcaStates vendorState) {
        this.vendorState = vendorState;
    }

    public BcaPostyle getPostyle() {
        return postyle;
    }

    public void setPostyle(final BcaPostyle postyle) {
        this.postyle = postyle;
    }

    public BcaCountries getEmployeeCountry() {
        return employeeCountry;
    }

    public void setEmployeeCountry(final BcaCountries employeeCountry) {
        this.employeeCountry = employeeCountry;
    }

    public BcaStates getEmployeeState() {
        return employeeState;
    }

    public void setEmployeeState(final BcaStates employeeState) {
        this.employeeState = employeeState;
    }

}
