package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "bt_sales")
public class BtSales {

    @Id
    @Column(name= "SaleID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer saleId;

    @Column(name= "ConsignmentSale")
    private Boolean consignmentSale;

    @Column(name= "BuyerID")
    private Integer buyerId;

    @Column(name= "SalePrice")
    private Double salePrice;

    @Column(name= "QtySold")
    private Integer qtySold;

    @Column(name= "SalesTax")
    private Double salesTax;

    @Column(name= "SourceOfSale", length = 20)
    private String sourceOfSale;

    @Column(name= "TypeOfPayment", length = 25)
    private String typeOfPayment;

    @Column(name= "ShippingCost")
    private Double shippingCost;

    @Column(name= "InsuranceCost")
    private Double insuranceCost;

    @Column(name= "CommissionIn")
    private Double commissionIn;

    @Column(name= "ListingFee")
    private Double listingFee;

    @Column(name= "DateOfSale")
    private OffsetDateTime dateOfSale;

    @Column(name= "FeedbackLeft")
    private Boolean feedbackLeft;

    @Column(name= "Invoiced")
    private Boolean invoiced;

    @Column(name= "DatePaymentReceived")
    private OffsetDateTime datePaymentReceived;

    @Column(name= "DatePaymentCleared")
    private OffsetDateTime datePaymentCleared;

    @Column(name= "DateItemShipped")
    private OffsetDateTime dateItemShipped;

    @Column(name= "DateSaleClosed")
    private OffsetDateTime dateSaleClosed;

    @Column(name= "ShippingCharged")
    private Double shippingCharged;

    @Column(name= "TrackingNum")
    private String trackingNum;

    @Column(name= "DatePaymentRequestSent")
    private OffsetDateTime datePaymentRequestSent;

    @Column(name= "DateSecondPaymentRequestSent")
    private OffsetDateTime dateSecondPaymentRequestSent;

    @Column(name= "DateFinalPaymentRequestSent")
    private OffsetDateTime dateFinalPaymentRequestSent;

    @Column(name= "DateFVFRequested")
    private OffsetDateTime dateFvfrequested;

    @Column(name= "StatusID")
    private Integer statusId;

    @Column(name= "DateFinalNotificationSent")
    private OffsetDateTime dateFinalNotificationSent;

    @Column(name= "DateItemClosed")
    private OffsetDateTime dateItemClosed;

    @Column(name= "TransactionID", length = 15)
    private String transactionId;

    @Column(name= "FeedbackReceived")
    private Integer feedbackReceived;

    @Column(name= "ItemCost")
    private Double itemCost;

    @Column(name= "HandlingFee")
    private Double handlingFee;

    @Column(name= "AdjustmentCost")
    private Double adjustmentCost;

    @Column(name= "AdjustmentCostReason", length = 30)
    private String adjustmentCostReason;

    @Column(name= "AdjustmentFee")
    private Double adjustmentFee;

    @Column(name= "AdjustmentReason", length = 30)
    private String adjustmentReason;

    @Column(name= "BillingAddressID")
    private Integer billingAddressId;

    @Column(name= "BuyerSelectedShipping")
    private Boolean buyerSelectedShipping;

    @Column(name= "CCID")
    private Integer ccid;

    @Column(name= "ConsignModelID")
    private Integer consignModelId;

    @Column(name= "ConsignorID")
    private Integer consignorId;

    @Column(name= "ConsignorPaid")
    private Boolean consignorPaid;

    @Column(name= "Custom1")
    private String custom1;

    @Column(name= "Custom2")
    private String custom2;

    @Column(name= "DateLastModified")
    private OffsetDateTime dateLastModified;

    @Column(name= "DateStatusChanged")
    private OffsetDateTime dateStatusChanged;

    @Column(name= "DisputeID", length = 25)
    private String disputeId;

    @Column(name= "eBayID", length = 30)
    private String eBayId;

    @Column(name= "EmailTemplateID")
    private Integer emailTemplateId;

    @Column(name= "FVF")
    private Double fvf;

    @Column(name= "InsuranceWanted")
    private Boolean insuranceWanted;

    @Column(name= "IsArchive")
    private Boolean isArchive;

    @Column(name= "ListingID")
    private Integer listingId;

    @Column(name= "ListingType")
    private Integer listingType;

    @Column(name= "Notes", columnDefinition = "longtext")
    private String notes;

    @Column(name= "OrgTemplateID")
    private Integer orgTemplateId;

    @Column(name= "PayPalFees")
    private Double payPalFees;

    @Column(name= "ShippingAddressID")
    private Integer shippingAddressId;

    @Column(name= "ShippingCo")
    private String shippingCo;

    @Column(name= "SiteID")
    private Integer siteId;

    @Column(name= "Title", length = 100)
    private String title;

    @Column(name= "DBToken", length = 32)
    private String dbtoken;

    @Column(name= "NotUpdate")
    private Boolean notUpdate;

    @Column(name= "InsuranceValue")
    private Double insuranceValue;

    @Column(name= "CheckOutCompleted")
    private Boolean checkOutCompleted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OrderID")
    private SmcOrders order;

    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(final Integer saleId) {
        this.saleId = saleId;
    }

    public Boolean getConsignmentSale() {
        return consignmentSale;
    }

    public void setConsignmentSale(final Boolean consignmentSale) {
        this.consignmentSale = consignmentSale;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(final Integer buyerId) {
        this.buyerId = buyerId;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(final Double salePrice) {
        this.salePrice = salePrice;
    }

    public Integer getQtySold() {
        return qtySold;
    }

    public void setQtySold(final Integer qtySold) {
        this.qtySold = qtySold;
    }

    public Double getSalesTax() {
        return salesTax;
    }

    public void setSalesTax(final Double salesTax) {
        this.salesTax = salesTax;
    }

    public String getSourceOfSale() {
        return sourceOfSale;
    }

    public void setSourceOfSale(final String sourceOfSale) {
        this.sourceOfSale = sourceOfSale;
    }

    public String getTypeOfPayment() {
        return typeOfPayment;
    }

    public void setTypeOfPayment(final String typeOfPayment) {
        this.typeOfPayment = typeOfPayment;
    }

    public Double getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(final Double shippingCost) {
        this.shippingCost = shippingCost;
    }

    public Double getInsuranceCost() {
        return insuranceCost;
    }

    public void setInsuranceCost(final Double insuranceCost) {
        this.insuranceCost = insuranceCost;
    }

    public Double getCommissionIn() {
        return commissionIn;
    }

    public void setCommissionIn(final Double commissionIn) {
        this.commissionIn = commissionIn;
    }

    public Double getListingFee() {
        return listingFee;
    }

    public void setListingFee(final Double listingFee) {
        this.listingFee = listingFee;
    }

    public OffsetDateTime getDateOfSale() {
        return dateOfSale;
    }

    public void setDateOfSale(final OffsetDateTime dateOfSale) {
        this.dateOfSale = dateOfSale;
    }

    public Boolean getFeedbackLeft() {
        return feedbackLeft;
    }

    public void setFeedbackLeft(final Boolean feedbackLeft) {
        this.feedbackLeft = feedbackLeft;
    }

    public Boolean getInvoiced() {
        return invoiced;
    }

    public void setInvoiced(final Boolean invoiced) {
        this.invoiced = invoiced;
    }

    public OffsetDateTime getDatePaymentReceived() {
        return datePaymentReceived;
    }

    public void setDatePaymentReceived(final OffsetDateTime datePaymentReceived) {
        this.datePaymentReceived = datePaymentReceived;
    }

    public OffsetDateTime getDatePaymentCleared() {
        return datePaymentCleared;
    }

    public void setDatePaymentCleared(final OffsetDateTime datePaymentCleared) {
        this.datePaymentCleared = datePaymentCleared;
    }

    public OffsetDateTime getDateItemShipped() {
        return dateItemShipped;
    }

    public void setDateItemShipped(final OffsetDateTime dateItemShipped) {
        this.dateItemShipped = dateItemShipped;
    }

    public OffsetDateTime getDateSaleClosed() {
        return dateSaleClosed;
    }

    public void setDateSaleClosed(final OffsetDateTime dateSaleClosed) {
        this.dateSaleClosed = dateSaleClosed;
    }

    public Double getShippingCharged() {
        return shippingCharged;
    }

    public void setShippingCharged(final Double shippingCharged) {
        this.shippingCharged = shippingCharged;
    }

    public String getTrackingNum() {
        return trackingNum;
    }

    public void setTrackingNum(final String trackingNum) {
        this.trackingNum = trackingNum;
    }

    public OffsetDateTime getDatePaymentRequestSent() {
        return datePaymentRequestSent;
    }

    public void setDatePaymentRequestSent(final OffsetDateTime datePaymentRequestSent) {
        this.datePaymentRequestSent = datePaymentRequestSent;
    }

    public OffsetDateTime getDateSecondPaymentRequestSent() {
        return dateSecondPaymentRequestSent;
    }

    public void setDateSecondPaymentRequestSent(final OffsetDateTime dateSecondPaymentRequestSent) {
        this.dateSecondPaymentRequestSent = dateSecondPaymentRequestSent;
    }

    public OffsetDateTime getDateFinalPaymentRequestSent() {
        return dateFinalPaymentRequestSent;
    }

    public void setDateFinalPaymentRequestSent(final OffsetDateTime dateFinalPaymentRequestSent) {
        this.dateFinalPaymentRequestSent = dateFinalPaymentRequestSent;
    }

    public OffsetDateTime getDateFvfrequested() {
        return dateFvfrequested;
    }

    public void setDateFvfrequested(final OffsetDateTime dateFvfrequested) {
        this.dateFvfrequested = dateFvfrequested;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(final Integer statusId) {
        this.statusId = statusId;
    }

    public OffsetDateTime getDateFinalNotificationSent() {
        return dateFinalNotificationSent;
    }

    public void setDateFinalNotificationSent(final OffsetDateTime dateFinalNotificationSent) {
        this.dateFinalNotificationSent = dateFinalNotificationSent;
    }

    public OffsetDateTime getDateItemClosed() {
        return dateItemClosed;
    }

    public void setDateItemClosed(final OffsetDateTime dateItemClosed) {
        this.dateItemClosed = dateItemClosed;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(final String transactionId) {
        this.transactionId = transactionId;
    }

    public Integer getFeedbackReceived() {
        return feedbackReceived;
    }

    public void setFeedbackReceived(final Integer feedbackReceived) {
        this.feedbackReceived = feedbackReceived;
    }

    public Double getItemCost() {
        return itemCost;
    }

    public void setItemCost(final Double itemCost) {
        this.itemCost = itemCost;
    }

    public Double getHandlingFee() {
        return handlingFee;
    }

    public void setHandlingFee(final Double handlingFee) {
        this.handlingFee = handlingFee;
    }

    public Double getAdjustmentCost() {
        return adjustmentCost;
    }

    public void setAdjustmentCost(final Double adjustmentCost) {
        this.adjustmentCost = adjustmentCost;
    }

    public String getAdjustmentCostReason() {
        return adjustmentCostReason;
    }

    public void setAdjustmentCostReason(final String adjustmentCostReason) {
        this.adjustmentCostReason = adjustmentCostReason;
    }

    public Double getAdjustmentFee() {
        return adjustmentFee;
    }

    public void setAdjustmentFee(final Double adjustmentFee) {
        this.adjustmentFee = adjustmentFee;
    }

    public String getAdjustmentReason() {
        return adjustmentReason;
    }

    public void setAdjustmentReason(final String adjustmentReason) {
        this.adjustmentReason = adjustmentReason;
    }

    public Integer getBillingAddressId() {
        return billingAddressId;
    }

    public void setBillingAddressId(final Integer billingAddressId) {
        this.billingAddressId = billingAddressId;
    }

    public Boolean getBuyerSelectedShipping() {
        return buyerSelectedShipping;
    }

    public void setBuyerSelectedShipping(final Boolean buyerSelectedShipping) {
        this.buyerSelectedShipping = buyerSelectedShipping;
    }

    public Integer getCcid() {
        return ccid;
    }

    public void setCcid(final Integer ccid) {
        this.ccid = ccid;
    }

    public Integer getConsignModelId() {
        return consignModelId;
    }

    public void setConsignModelId(final Integer consignModelId) {
        this.consignModelId = consignModelId;
    }

    public Integer getConsignorId() {
        return consignorId;
    }

    public void setConsignorId(final Integer consignorId) {
        this.consignorId = consignorId;
    }

    public Boolean getConsignorPaid() {
        return consignorPaid;
    }

    public void setConsignorPaid(final Boolean consignorPaid) {
        this.consignorPaid = consignorPaid;
    }

    public String getCustom1() {
        return custom1;
    }

    public void setCustom1(final String custom1) {
        this.custom1 = custom1;
    }

    public String getCustom2() {
        return custom2;
    }

    public void setCustom2(final String custom2) {
        this.custom2 = custom2;
    }

    public OffsetDateTime getDateLastModified() {
        return dateLastModified;
    }

    public void setDateLastModified(final OffsetDateTime dateLastModified) {
        this.dateLastModified = dateLastModified;
    }

    public OffsetDateTime getDateStatusChanged() {
        return dateStatusChanged;
    }

    public void setDateStatusChanged(final OffsetDateTime dateStatusChanged) {
        this.dateStatusChanged = dateStatusChanged;
    }

    public String getDisputeId() {
        return disputeId;
    }

    public void setDisputeId(final String disputeId) {
        this.disputeId = disputeId;
    }

    public String getEBayId() {
        return eBayId;
    }

    public void setEBayId(final String eBayId) {
        this.eBayId = eBayId;
    }

    public Integer getEmailTemplateId() {
        return emailTemplateId;
    }

    public void setEmailTemplateId(final Integer emailTemplateId) {
        this.emailTemplateId = emailTemplateId;
    }

    public Double getFvf() {
        return fvf;
    }

    public void setFvf(final Double fvf) {
        this.fvf = fvf;
    }

    public Boolean getInsuranceWanted() {
        return insuranceWanted;
    }

    public void setInsuranceWanted(final Boolean insuranceWanted) {
        this.insuranceWanted = insuranceWanted;
    }

    public Boolean getIsArchive() {
        return isArchive;
    }

    public void setIsArchive(final Boolean isArchive) {
        this.isArchive = isArchive;
    }

    public Integer getListingId() {
        return listingId;
    }

    public void setListingId(final Integer listingId) {
        this.listingId = listingId;
    }

    public Integer getListingType() {
        return listingType;
    }

    public void setListingType(final Integer listingType) {
        this.listingType = listingType;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(final String notes) {
        this.notes = notes;
    }

    public Integer getOrgTemplateId() {
        return orgTemplateId;
    }

    public void setOrgTemplateId(final Integer orgTemplateId) {
        this.orgTemplateId = orgTemplateId;
    }

    public Double getPayPalFees() {
        return payPalFees;
    }

    public void setPayPalFees(final Double payPalFees) {
        this.payPalFees = payPalFees;
    }

    public Integer getShippingAddressId() {
        return shippingAddressId;
    }

    public void setShippingAddressId(final Integer shippingAddressId) {
        this.shippingAddressId = shippingAddressId;
    }

    public String getShippingCo() {
        return shippingCo;
    }

    public void setShippingCo(final String shippingCo) {
        this.shippingCo = shippingCo;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(final Integer siteId) {
        this.siteId = siteId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(final String title) {
        this.title = title;
    }

    public String getDbtoken() {
        return dbtoken;
    }

    public void setDbtoken(final String dbtoken) {
        this.dbtoken = dbtoken;
    }

    public Boolean getNotUpdate() {
        return notUpdate;
    }

    public void setNotUpdate(final Boolean notUpdate) {
        this.notUpdate = notUpdate;
    }

    public Double getInsuranceValue() {
        return insuranceValue;
    }

    public void setInsuranceValue(final Double insuranceValue) {
        this.insuranceValue = insuranceValue;
    }

    public Boolean getCheckOutCompleted() {
        return checkOutCompleted;
    }

    public void setCheckOutCompleted(final Boolean checkOutCompleted) {
        this.checkOutCompleted = checkOutCompleted;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public SmcOrders getOrder() {
        return order;
    }

    public void setOrder(final SmcOrders order) {
        this.order = order;
    }

}
