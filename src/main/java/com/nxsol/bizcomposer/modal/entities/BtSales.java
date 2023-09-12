package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class BtSales {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer saleId;

    @Column
    private Boolean consignmentSale;

    @Column
    private Integer buyerId;

    @Column
    private Double salePrice;

    @Column
    private Integer qtySold;

    @Column
    private Double salesTax;

    @Column(length = 20)
    private String sourceOfSale;

    @Column(length = 25)
    private String typeOfPayment;

    @Column
    private Double shippingCost;

    @Column
    private Double insuranceCost;

    @Column
    private Double commissionIn;

    @Column
    private Double listingFee;

    @Column
    private OffsetDateTime dateOfSale;

    @Column
    private Boolean feedbackLeft;

    @Column
    private Boolean invoiced;

    @Column
    private OffsetDateTime datePaymentReceived;

    @Column
    private OffsetDateTime datePaymentCleared;

    @Column
    private OffsetDateTime dateItemShipped;

    @Column
    private OffsetDateTime dateSaleClosed;

    @Column
    private Double shippingCharged;

    @Column
    private String trackingNum;

    @Column
    private OffsetDateTime datePaymentRequestSent;

    @Column
    private OffsetDateTime dateSecondPaymentRequestSent;

    @Column
    private OffsetDateTime dateFinalPaymentRequestSent;

    @Column
    private OffsetDateTime dateFvfrequested;

    @Column
    private Integer statusId;

    @Column
    private OffsetDateTime dateFinalNotificationSent;

    @Column
    private OffsetDateTime dateItemClosed;

    @Column(length = 15)
    private String transactionId;

    @Column
    private Integer feedbackReceived;

    @Column(length = 25)
    private String orderId;

    @Column
    private Double itemCost;

    @Column
    private Double handlingFee;

    @Column
    private Double adjustmentCost;

    @Column(length = 30)
    private String adjustmentCostReason;

    @Column
    private Double adjustmentFee;

    @Column(length = 30)
    private String adjustmentReason;

    @Column
    private Integer billingAddressId;

    @Column
    private Boolean buyerSelectedShipping;

    @Column
    private Integer ccid;

    @Column
    private Integer consignModelId;

    @Column
    private Integer consignorId;

    @Column
    private Boolean consignorPaid;

    @Column
    private String custom1;

    @Column
    private String custom2;

    @Column
    private OffsetDateTime dateLastModified;

    @Column
    private OffsetDateTime dateStatusChanged;

    @Column(length = 25)
    private String disputeId;

    @Column(length = 30)
    private String eBayId;

    @Column
    private Integer emailTemplateId;

    @Column
    private Double fvf;

    @Column
    private Boolean insuranceWanted;

    @Column
    private Boolean isArchive;

    @Column
    private Integer listingId;

    @Column
    private Integer listingType;

    @Column(columnDefinition = "longtext")
    private String notes;

    @Column
    private Integer orgTemplateId;

    @Column
    private Double payPalFees;

    @Column
    private Integer shippingAddressId;

    @Column
    private String shippingCo;

    @Column
    private Integer siteId;

    @Column(length = 100)
    private String title;

    @Column(length = 32)
    private String dbtoken;

    @Column
    private Boolean notUpdate;

    @Column
    private Integer inventoryId;

    @Column
    private Double insuranceValue;

    @Column
    private Boolean checkOutCompleted;

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

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(final String orderId) {
        this.orderId = orderId;
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

    public Integer getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(final Integer inventoryId) {
        this.inventoryId = inventoryId;
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

}
