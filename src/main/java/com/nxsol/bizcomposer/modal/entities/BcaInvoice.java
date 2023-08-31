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
public class BcaInvoice {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invoiceId;

    @Column
    private Integer orderNum;

    @Column
    private Integer ponum;

    @Column
    private Integer sonum;

    @Column
    private Integer rcvNum;

    @Column
    private Integer estNum;

    @Column
    private Integer employeeId;

    @Column(length = 35)
    private String refNum;

    @Column
    private Integer clientVendorId;

    @Column
    private String memo;

    @Column
    private Integer billingAddrId;

    @Column
    private Integer shippingAddrId;

    @Column
    private Integer bsaddressId;

    @Column
    private Integer companyId;

    @Column
    private Integer invoiceTypeId;

    @Column
    private Integer invoiceStyleId;

    @Column
    private Double weight;

    @Column
    private Double subTotal;

    @Column
    private Double tax;

    @Column
    private Double sh;

    @Column
    private Double total;

    @Column
    private Double adjustedTotal;

    @Column
    private Double paidAmount;

    @Column
    private Double balance;

    @Column
    private Integer salesRepId;

    @Column
    private Integer termId;

    @Column
    private Integer paymentTypeId;

    @Column
    private Integer shipCarrierId;

    @Column
    private Integer messageId;

    @Column
    private Integer salesTaxId;

    @Column
    private Integer taxable;

    @Column
    private Integer shipped;

    @Column
    private Boolean isReceived;

    @Column
    private Boolean isPaymentCompleted;

    @Column
    private Boolean fromPo;

    @Column
    private OffsetDateTime dateConfirmed;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer categoryId;

    @Column
    private Integer invoiceStatus;

    @Column(length = 50)
    private String orderid;

    @Column(length = 50)
    private String shipservicelevel;

    @Column(length = 200)
    private String shippingNote1;

    @Column(length = 50)
    private String shippingNote2;

    @Column
    private Integer storeTypeId;

    @Column
    private Integer storeId;

    @Column(length = 50)
    private String shipCarrier;

    @Column
    private Boolean isPrinted;

    @Column
    private Boolean isEmailed;

    @Column
    private Integer serviceId;

    @Column
    private String amazonGiftWrapType;

    @Column
    private String amazonGiftMessageText;

    @Column(length = 50)
    private String transactionId;

    @Column
    private Integer transactionType;

    @Column(length = 50)
    private String trackingCode;

    @Column
    private Integer gatewayId;

    @Column(length = 50)
    private String shippingMethod;

    @Column(length = 200)
    private String shippingLabel;

    @Column(length = 50)
    private String labelPrinted;

    @Column
    private Integer dropShipCustomerId;

    @Column
    private Integer jobCategoryId;

    @Column
    private Integer billId;

    @Column
    private Boolean isBillReceived;

    @Column
    private Double upfrontAmount;

    @Column(columnDefinition = "longtext")
    private String note;

    @Column
    private String billDate;

    @Column
    private Double giftAmount;

    @Column(length = 20)
    private String giftCertificateCode;

    @Column
    private Double totalCommission;

    @Column
    private Integer bankAccountId;

    @Column
    private Integer noOfBoxes;

    @Column
    private String shipNumber;

    @Column
    private Integer isInvoice;

    @Column
    private Integer isSalestype;

    @Column
    private Integer isPending;

    @Column
    private OffsetDateTime dateReceived;

    @Column
    private Integer vendorAddrId;

    @Column
    private Integer orderType;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaAccountable> invoiceBcaAccountables;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaAccountable> invoiceBcaAccountables;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaAccountable> invoiceBcaAccountables;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaArgroupbilling> invoiceBcaArgroupbillings;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaArgroupbilling> invoiceBcaArgroupbillings;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaArgroupbilling> invoiceBcaArgroupbillings;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaArgroupbilling> invoiceBcaArgroupbillings;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaArgroupbilling> invoiceBcaArgroupbillings;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaArgroupbilling> invoiceBcaArgroupbillings;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaArgroupbilling> invoiceBcaArgroupbillings;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaArgroupbilling> invoiceBcaArgroupbillings;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaBilldetail> invoiceBcaBilldetails;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaBillingstatements> invoiceBcaBillingstatementss;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaCart> invoiceBcaCarts;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaCartmemorized> invoiceBcaCartmemorizeds;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaConsignmentsale> invoiceBcaConsignmentsales;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaInvoicecredit> invoiceBcaInvoicecredits;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaInvoicecredit> invoiceBcaInvoicecredits;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaInvoicediscount> invoiceBcaInvoicediscounts;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaInvoicediscount> invoiceBcaInvoicediscounts;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaInvoicediscount> invoiceBcaInvoicediscounts;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaInvoicesalessummaryamt> invoiceBcaInvoicesalessummaryamts;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaInvoiceshipdetail> invoiceBcaInvoiceshipdetails;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaPayment> invoiceBcaPayments;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaPayment2invoice> invoiceBcaPayment2invoices;

    @OneToMany(mappedBy = "invoice")
    private Set<BcaRmamaster> invoiceBcaRmamasters;

    @OneToMany(mappedBy = "invoice")
    private Set<SmdGiftcertificateused> invoiceSmdGiftcertificateuseds;

    @OneToMany(mappedBy = "invoice")
    private Set<SmdGiftcertificateused> invoiceSmdGiftcertificateuseds;

    @OneToMany(mappedBy = "invoice")
    private Set<SmdGiftcertificateused> invoiceSmdGiftcertificateuseds;

    public Integer getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(final Integer invoiceId) {
        this.invoiceId = invoiceId;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(final Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getPonum() {
        return ponum;
    }

    public void setPonum(final Integer ponum) {
        this.ponum = ponum;
    }

    public Integer getSonum() {
        return sonum;
    }

    public void setSonum(final Integer sonum) {
        this.sonum = sonum;
    }

    public Integer getRcvNum() {
        return rcvNum;
    }

    public void setRcvNum(final Integer rcvNum) {
        this.rcvNum = rcvNum;
    }

    public Integer getEstNum() {
        return estNum;
    }

    public void setEstNum(final Integer estNum) {
        this.estNum = estNum;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(final Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getRefNum() {
        return refNum;
    }

    public void setRefNum(final String refNum) {
        this.refNum = refNum;
    }

    public Integer getClientVendorId() {
        return clientVendorId;
    }

    public void setClientVendorId(final Integer clientVendorId) {
        this.clientVendorId = clientVendorId;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public Integer getBillingAddrId() {
        return billingAddrId;
    }

    public void setBillingAddrId(final Integer billingAddrId) {
        this.billingAddrId = billingAddrId;
    }

    public Integer getShippingAddrId() {
        return shippingAddrId;
    }

    public void setShippingAddrId(final Integer shippingAddrId) {
        this.shippingAddrId = shippingAddrId;
    }

    public Integer getBsaddressId() {
        return bsaddressId;
    }

    public void setBsaddressId(final Integer bsaddressId) {
        this.bsaddressId = bsaddressId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getInvoiceTypeId() {
        return invoiceTypeId;
    }

    public void setInvoiceTypeId(final Integer invoiceTypeId) {
        this.invoiceTypeId = invoiceTypeId;
    }

    public Integer getInvoiceStyleId() {
        return invoiceStyleId;
    }

    public void setInvoiceStyleId(final Integer invoiceStyleId) {
        this.invoiceStyleId = invoiceStyleId;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(final Double weight) {
        this.weight = weight;
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(final Double subTotal) {
        this.subTotal = subTotal;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(final Double tax) {
        this.tax = tax;
    }

    public Double getSh() {
        return sh;
    }

    public void setSh(final Double sh) {
        this.sh = sh;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(final Double total) {
        this.total = total;
    }

    public Double getAdjustedTotal() {
        return adjustedTotal;
    }

    public void setAdjustedTotal(final Double adjustedTotal) {
        this.adjustedTotal = adjustedTotal;
    }

    public Double getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(final Double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(final Double balance) {
        this.balance = balance;
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

    public Integer getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(final Integer paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public Integer getShipCarrierId() {
        return shipCarrierId;
    }

    public void setShipCarrierId(final Integer shipCarrierId) {
        this.shipCarrierId = shipCarrierId;
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(final Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getSalesTaxId() {
        return salesTaxId;
    }

    public void setSalesTaxId(final Integer salesTaxId) {
        this.salesTaxId = salesTaxId;
    }

    public Integer getTaxable() {
        return taxable;
    }

    public void setTaxable(final Integer taxable) {
        this.taxable = taxable;
    }

    public Integer getShipped() {
        return shipped;
    }

    public void setShipped(final Integer shipped) {
        this.shipped = shipped;
    }

    public Boolean getIsReceived() {
        return isReceived;
    }

    public void setIsReceived(final Boolean isReceived) {
        this.isReceived = isReceived;
    }

    public Boolean getIsPaymentCompleted() {
        return isPaymentCompleted;
    }

    public void setIsPaymentCompleted(final Boolean isPaymentCompleted) {
        this.isPaymentCompleted = isPaymentCompleted;
    }

    public Boolean getFromPo() {
        return fromPo;
    }

    public void setFromPo(final Boolean fromPo) {
        this.fromPo = fromPo;
    }

    public OffsetDateTime getDateConfirmed() {
        return dateConfirmed;
    }

    public void setDateConfirmed(final OffsetDateTime dateConfirmed) {
        this.dateConfirmed = dateConfirmed;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(final Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getInvoiceStatus() {
        return invoiceStatus;
    }

    public void setInvoiceStatus(final Integer invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(final String orderid) {
        this.orderid = orderid;
    }

    public String getShipservicelevel() {
        return shipservicelevel;
    }

    public void setShipservicelevel(final String shipservicelevel) {
        this.shipservicelevel = shipservicelevel;
    }

    public String getShippingNote1() {
        return shippingNote1;
    }

    public void setShippingNote1(final String shippingNote1) {
        this.shippingNote1 = shippingNote1;
    }

    public String getShippingNote2() {
        return shippingNote2;
    }

    public void setShippingNote2(final String shippingNote2) {
        this.shippingNote2 = shippingNote2;
    }

    public Integer getStoreTypeId() {
        return storeTypeId;
    }

    public void setStoreTypeId(final Integer storeTypeId) {
        this.storeTypeId = storeTypeId;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(final Integer storeId) {
        this.storeId = storeId;
    }

    public String getShipCarrier() {
        return shipCarrier;
    }

    public void setShipCarrier(final String shipCarrier) {
        this.shipCarrier = shipCarrier;
    }

    public Boolean getIsPrinted() {
        return isPrinted;
    }

    public void setIsPrinted(final Boolean isPrinted) {
        this.isPrinted = isPrinted;
    }

    public Boolean getIsEmailed() {
        return isEmailed;
    }

    public void setIsEmailed(final Boolean isEmailed) {
        this.isEmailed = isEmailed;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(final Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getAmazonGiftWrapType() {
        return amazonGiftWrapType;
    }

    public void setAmazonGiftWrapType(final String amazonGiftWrapType) {
        this.amazonGiftWrapType = amazonGiftWrapType;
    }

    public String getAmazonGiftMessageText() {
        return amazonGiftMessageText;
    }

    public void setAmazonGiftMessageText(final String amazonGiftMessageText) {
        this.amazonGiftMessageText = amazonGiftMessageText;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(final String transactionId) {
        this.transactionId = transactionId;
    }

    public Integer getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(final Integer transactionType) {
        this.transactionType = transactionType;
    }

    public String getTrackingCode() {
        return trackingCode;
    }

    public void setTrackingCode(final String trackingCode) {
        this.trackingCode = trackingCode;
    }

    public Integer getGatewayId() {
        return gatewayId;
    }

    public void setGatewayId(final Integer gatewayId) {
        this.gatewayId = gatewayId;
    }

    public String getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(final String shippingMethod) {
        this.shippingMethod = shippingMethod;
    }

    public String getShippingLabel() {
        return shippingLabel;
    }

    public void setShippingLabel(final String shippingLabel) {
        this.shippingLabel = shippingLabel;
    }

    public String getLabelPrinted() {
        return labelPrinted;
    }

    public void setLabelPrinted(final String labelPrinted) {
        this.labelPrinted = labelPrinted;
    }

    public Integer getDropShipCustomerId() {
        return dropShipCustomerId;
    }

    public void setDropShipCustomerId(final Integer dropShipCustomerId) {
        this.dropShipCustomerId = dropShipCustomerId;
    }

    public Integer getJobCategoryId() {
        return jobCategoryId;
    }

    public void setJobCategoryId(final Integer jobCategoryId) {
        this.jobCategoryId = jobCategoryId;
    }

    public Integer getBillId() {
        return billId;
    }

    public void setBillId(final Integer billId) {
        this.billId = billId;
    }

    public Boolean getIsBillReceived() {
        return isBillReceived;
    }

    public void setIsBillReceived(final Boolean isBillReceived) {
        this.isBillReceived = isBillReceived;
    }

    public Double getUpfrontAmount() {
        return upfrontAmount;
    }

    public void setUpfrontAmount(final Double upfrontAmount) {
        this.upfrontAmount = upfrontAmount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(final String note) {
        this.note = note;
    }

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(final String billDate) {
        this.billDate = billDate;
    }

    public Double getGiftAmount() {
        return giftAmount;
    }

    public void setGiftAmount(final Double giftAmount) {
        this.giftAmount = giftAmount;
    }

    public String getGiftCertificateCode() {
        return giftCertificateCode;
    }

    public void setGiftCertificateCode(final String giftCertificateCode) {
        this.giftCertificateCode = giftCertificateCode;
    }

    public Double getTotalCommission() {
        return totalCommission;
    }

    public void setTotalCommission(final Double totalCommission) {
        this.totalCommission = totalCommission;
    }

    public Integer getBankAccountId() {
        return bankAccountId;
    }

    public void setBankAccountId(final Integer bankAccountId) {
        this.bankAccountId = bankAccountId;
    }

    public Integer getNoOfBoxes() {
        return noOfBoxes;
    }

    public void setNoOfBoxes(final Integer noOfBoxes) {
        this.noOfBoxes = noOfBoxes;
    }

    public String getShipNumber() {
        return shipNumber;
    }

    public void setShipNumber(final String shipNumber) {
        this.shipNumber = shipNumber;
    }

    public Integer getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(final Integer isInvoice) {
        this.isInvoice = isInvoice;
    }

    public Integer getIsSalestype() {
        return isSalestype;
    }

    public void setIsSalestype(final Integer isSalestype) {
        this.isSalestype = isSalestype;
    }

    public Integer getIsPending() {
        return isPending;
    }

    public void setIsPending(final Integer isPending) {
        this.isPending = isPending;
    }

    public OffsetDateTime getDateReceived() {
        return dateReceived;
    }

    public void setDateReceived(final OffsetDateTime dateReceived) {
        this.dateReceived = dateReceived;
    }

    public Integer getVendorAddrId() {
        return vendorAddrId;
    }

    public void setVendorAddrId(final Integer vendorAddrId) {
        this.vendorAddrId = vendorAddrId;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(final Integer orderType) {
        this.orderType = orderType;
    }

    public Set<BcaAccountable> getInvoiceBcaAccountables() {
        return invoiceBcaAccountables;
    }

    public void setInvoiceBcaAccountables(final Set<BcaAccountable> invoiceBcaAccountables) {
        this.invoiceBcaAccountables = invoiceBcaAccountables;
    }

    public Set<BcaAccountable> getInvoiceBcaAccountables() {
        return invoiceBcaAccountables;
    }

    public void setInvoiceBcaAccountables(final Set<BcaAccountable> invoiceBcaAccountables) {
        this.invoiceBcaAccountables = invoiceBcaAccountables;
    }

    public Set<BcaAccountable> getInvoiceBcaAccountables() {
        return invoiceBcaAccountables;
    }

    public void setInvoiceBcaAccountables(final Set<BcaAccountable> invoiceBcaAccountables) {
        this.invoiceBcaAccountables = invoiceBcaAccountables;
    }

    public Set<BcaArgroupbilling> getInvoiceBcaArgroupbillings() {
        return invoiceBcaArgroupbillings;
    }

    public void setInvoiceBcaArgroupbillings(
            final Set<BcaArgroupbilling> invoiceBcaArgroupbillings) {
        this.invoiceBcaArgroupbillings = invoiceBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getInvoiceBcaArgroupbillings() {
        return invoiceBcaArgroupbillings;
    }

    public void setInvoiceBcaArgroupbillings(
            final Set<BcaArgroupbilling> invoiceBcaArgroupbillings) {
        this.invoiceBcaArgroupbillings = invoiceBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getInvoiceBcaArgroupbillings() {
        return invoiceBcaArgroupbillings;
    }

    public void setInvoiceBcaArgroupbillings(
            final Set<BcaArgroupbilling> invoiceBcaArgroupbillings) {
        this.invoiceBcaArgroupbillings = invoiceBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getInvoiceBcaArgroupbillings() {
        return invoiceBcaArgroupbillings;
    }

    public void setInvoiceBcaArgroupbillings(
            final Set<BcaArgroupbilling> invoiceBcaArgroupbillings) {
        this.invoiceBcaArgroupbillings = invoiceBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getInvoiceBcaArgroupbillings() {
        return invoiceBcaArgroupbillings;
    }

    public void setInvoiceBcaArgroupbillings(
            final Set<BcaArgroupbilling> invoiceBcaArgroupbillings) {
        this.invoiceBcaArgroupbillings = invoiceBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getInvoiceBcaArgroupbillings() {
        return invoiceBcaArgroupbillings;
    }

    public void setInvoiceBcaArgroupbillings(
            final Set<BcaArgroupbilling> invoiceBcaArgroupbillings) {
        this.invoiceBcaArgroupbillings = invoiceBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getInvoiceBcaArgroupbillings() {
        return invoiceBcaArgroupbillings;
    }

    public void setInvoiceBcaArgroupbillings(
            final Set<BcaArgroupbilling> invoiceBcaArgroupbillings) {
        this.invoiceBcaArgroupbillings = invoiceBcaArgroupbillings;
    }

    public Set<BcaArgroupbilling> getInvoiceBcaArgroupbillings() {
        return invoiceBcaArgroupbillings;
    }

    public void setInvoiceBcaArgroupbillings(
            final Set<BcaArgroupbilling> invoiceBcaArgroupbillings) {
        this.invoiceBcaArgroupbillings = invoiceBcaArgroupbillings;
    }

    public Set<BcaBilldetail> getInvoiceBcaBilldetails() {
        return invoiceBcaBilldetails;
    }

    public void setInvoiceBcaBilldetails(final Set<BcaBilldetail> invoiceBcaBilldetails) {
        this.invoiceBcaBilldetails = invoiceBcaBilldetails;
    }

    public Set<BcaBillingstatements> getInvoiceBcaBillingstatementss() {
        return invoiceBcaBillingstatementss;
    }

    public void setInvoiceBcaBillingstatementss(
            final Set<BcaBillingstatements> invoiceBcaBillingstatementss) {
        this.invoiceBcaBillingstatementss = invoiceBcaBillingstatementss;
    }

    public Set<BcaCart> getInvoiceBcaCarts() {
        return invoiceBcaCarts;
    }

    public void setInvoiceBcaCarts(final Set<BcaCart> invoiceBcaCarts) {
        this.invoiceBcaCarts = invoiceBcaCarts;
    }

    public Set<BcaCartmemorized> getInvoiceBcaCartmemorizeds() {
        return invoiceBcaCartmemorizeds;
    }

    public void setInvoiceBcaCartmemorizeds(final Set<BcaCartmemorized> invoiceBcaCartmemorizeds) {
        this.invoiceBcaCartmemorizeds = invoiceBcaCartmemorizeds;
    }

    public Set<BcaConsignmentsale> getInvoiceBcaConsignmentsales() {
        return invoiceBcaConsignmentsales;
    }

    public void setInvoiceBcaConsignmentsales(
            final Set<BcaConsignmentsale> invoiceBcaConsignmentsales) {
        this.invoiceBcaConsignmentsales = invoiceBcaConsignmentsales;
    }

    public Set<BcaInvoicecredit> getInvoiceBcaInvoicecredits() {
        return invoiceBcaInvoicecredits;
    }

    public void setInvoiceBcaInvoicecredits(final Set<BcaInvoicecredit> invoiceBcaInvoicecredits) {
        this.invoiceBcaInvoicecredits = invoiceBcaInvoicecredits;
    }

    public Set<BcaInvoicecredit> getInvoiceBcaInvoicecredits() {
        return invoiceBcaInvoicecredits;
    }

    public void setInvoiceBcaInvoicecredits(final Set<BcaInvoicecredit> invoiceBcaInvoicecredits) {
        this.invoiceBcaInvoicecredits = invoiceBcaInvoicecredits;
    }

    public Set<BcaInvoicediscount> getInvoiceBcaInvoicediscounts() {
        return invoiceBcaInvoicediscounts;
    }

    public void setInvoiceBcaInvoicediscounts(
            final Set<BcaInvoicediscount> invoiceBcaInvoicediscounts) {
        this.invoiceBcaInvoicediscounts = invoiceBcaInvoicediscounts;
    }

    public Set<BcaInvoicediscount> getInvoiceBcaInvoicediscounts() {
        return invoiceBcaInvoicediscounts;
    }

    public void setInvoiceBcaInvoicediscounts(
            final Set<BcaInvoicediscount> invoiceBcaInvoicediscounts) {
        this.invoiceBcaInvoicediscounts = invoiceBcaInvoicediscounts;
    }

    public Set<BcaInvoicediscount> getInvoiceBcaInvoicediscounts() {
        return invoiceBcaInvoicediscounts;
    }

    public void setInvoiceBcaInvoicediscounts(
            final Set<BcaInvoicediscount> invoiceBcaInvoicediscounts) {
        this.invoiceBcaInvoicediscounts = invoiceBcaInvoicediscounts;
    }

    public Set<BcaInvoicesalessummaryamt> getInvoiceBcaInvoicesalessummaryamts() {
        return invoiceBcaInvoicesalessummaryamts;
    }

    public void setInvoiceBcaInvoicesalessummaryamts(
            final Set<BcaInvoicesalessummaryamt> invoiceBcaInvoicesalessummaryamts) {
        this.invoiceBcaInvoicesalessummaryamts = invoiceBcaInvoicesalessummaryamts;
    }

    public Set<BcaInvoiceshipdetail> getInvoiceBcaInvoiceshipdetails() {
        return invoiceBcaInvoiceshipdetails;
    }

    public void setInvoiceBcaInvoiceshipdetails(
            final Set<BcaInvoiceshipdetail> invoiceBcaInvoiceshipdetails) {
        this.invoiceBcaInvoiceshipdetails = invoiceBcaInvoiceshipdetails;
    }

    public Set<BcaPayment> getInvoiceBcaPayments() {
        return invoiceBcaPayments;
    }

    public void setInvoiceBcaPayments(final Set<BcaPayment> invoiceBcaPayments) {
        this.invoiceBcaPayments = invoiceBcaPayments;
    }

    public Set<BcaPayment2invoice> getInvoiceBcaPayment2invoices() {
        return invoiceBcaPayment2invoices;
    }

    public void setInvoiceBcaPayment2invoices(
            final Set<BcaPayment2invoice> invoiceBcaPayment2invoices) {
        this.invoiceBcaPayment2invoices = invoiceBcaPayment2invoices;
    }

    public Set<BcaRmamaster> getInvoiceBcaRmamasters() {
        return invoiceBcaRmamasters;
    }

    public void setInvoiceBcaRmamasters(final Set<BcaRmamaster> invoiceBcaRmamasters) {
        this.invoiceBcaRmamasters = invoiceBcaRmamasters;
    }

    public Set<SmdGiftcertificateused> getInvoiceSmdGiftcertificateuseds() {
        return invoiceSmdGiftcertificateuseds;
    }

    public void setInvoiceSmdGiftcertificateuseds(
            final Set<SmdGiftcertificateused> invoiceSmdGiftcertificateuseds) {
        this.invoiceSmdGiftcertificateuseds = invoiceSmdGiftcertificateuseds;
    }

    public Set<SmdGiftcertificateused> getInvoiceSmdGiftcertificateuseds() {
        return invoiceSmdGiftcertificateuseds;
    }

    public void setInvoiceSmdGiftcertificateuseds(
            final Set<SmdGiftcertificateused> invoiceSmdGiftcertificateuseds) {
        this.invoiceSmdGiftcertificateuseds = invoiceSmdGiftcertificateuseds;
    }

    public Set<SmdGiftcertificateused> getInvoiceSmdGiftcertificateuseds() {
        return invoiceSmdGiftcertificateuseds;
    }

    public void setInvoiceSmdGiftcertificateuseds(
            final Set<SmdGiftcertificateused> invoiceSmdGiftcertificateuseds) {
        this.invoiceSmdGiftcertificateuseds = invoiceSmdGiftcertificateuseds;
    }

}
