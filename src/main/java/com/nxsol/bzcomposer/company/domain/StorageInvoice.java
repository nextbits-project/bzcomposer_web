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
@Table(name= "storage_invoice")
public class StorageInvoice {

    @Id
    @Column(name= "InvoiceID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invoiceId;

    @Column(name= "OrderNum")
    private Integer orderNum;

    @Column(name= "PONum")
    private Integer ponum;

    @Column(name= "SONum")
    private Integer sonum;

    @Column(name= "RcvNum")
    private Integer rcvNum;

    @Column(name= "EstNum")
    private Integer estNum;

    @Column(name= "RefNum", length = 35)
    private String refNum;

    @Column(name= "Memo")
    private String memo;

    @Column(name= "BillingAddrID")
    private Integer billingAddrId;

    @Column(name= "ShippingAddrID")
    private Integer shippingAddrId;

    @Column(name= "BSAddressID")
    private Integer bsaddressId;

    @Column(name= "Weight")
    private Double weight;

    @Column(name= "SubTotal")
    private Double subTotal;

    @Column(name= "Tax")
    private Double tax;

    @Column(name= "SH")
    private Double sh;

    @Column(name= "Total")
    private Double total;

    @Column(name= "AdjustedTotal")
    private Double adjustedTotal;

    @Column(name= "PaidAmount")
    private Double paidAmount;

    @Column(name= "Balance")
    private Double balance;

    @Column(name= "Taxable")
    private Integer taxable;

    @Column(name= "Shipped")
    private Integer shipped;

    @Column(name= "IsReceived")
    private Boolean isReceived;

    @Column(name= "IsPaymentCompleted")
    private Boolean isPaymentCompleted;

    @Column(name= "FromPO")
    private Boolean fromPo;

    @Column(name= "DateConfirmed")
    private OffsetDateTime dateConfirmed;

    @Column(name= "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name= "invoiceStatus")
    private Integer invoiceStatus;

    @Column(name= "shipservicelevel", length = 50)
    private String shipservicelevel;

    @Column(name= "ShippingNote1", length = 200)
    private String shippingNote1;

    @Column(name= "ShippingNote2", length = 50)
    private String shippingNote2;

    @Column(name= "StoreTypeID")
    private Integer storeTypeId;

    @Column(name= "ShipCarrier", length = 50)
    private String shipCarrier;

    @Column(name= "IsPrinted")
    private Boolean isPrinted;

    @Column(name= "IsEmailed")
    private Boolean isEmailed;

    @Column(name= "AmazonGiftWrapType")
    private String amazonGiftWrapType;

    @Column(name= "AmazonGiftMessageText")
    private String amazonGiftMessageText;

    @Column(name= "TransactionID", length = 50)
    private String transactionId;

    @Column(name = "TransactionType")
    private Integer transactionType;

    @Column(name= "TrackingCode", length = 50)
    private String trackingCode;

    @Column(name= "ShippingMethod", length = 50)
    private String shippingMethod;

    @Column(name= "ShippingLabel", length = 200)
    private String shippingLabel;

    @Column(name= "LabelPrinted", length = 50)
    private String labelPrinted;

    @Column(name= "dropShipCustomerID")
    private Integer dropShipCustomerId;

    @Column(name= "JobCategoryID")
    private Integer jobCategoryId;

    @Column(name= "BillID")
    private Integer billId;

    @Column(name= "isBillReceived")
    private Boolean isBillReceived;

    @Column(name= "UpfrontAmount")
    private Double upfrontAmount;

    @Column(name= "Note", columnDefinition = "longtext")
    private String note;

    @Column(name= "BillDate")
    private String billDate;

    @Column(name= "GiftAmount")
    private Double giftAmount;

    @Column(name= "GiftCertificateCode", length = 20)
    private String giftCertificateCode;

    @Column(name= "TotalCommission")
    private Double totalCommission;

    @Column(name= "BankAccountID")
    private Integer bankAccountId;

    @Column(name= "NoOfBoxes")
    private Integer noOfBoxes;

    @Column(name= "ShipNumber")
    private String shipNumber;

    @Column(name= "DateReceived")
    private OffsetDateTime dateReceived;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SalesTaxID")
    private BcaSalestax salesTax;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ServiceID")
    private BcaServicetype service;

 

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "StoreID")
    private BcaStore store;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TermID")
    private BcaTerm term;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeID")
    private BcpEmployee employee;



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceTypeID")
    private BcaInvoicetype invoiceType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SalesRepID")
    private BcaSalesrep salesRep;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CategoryID")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "GatewayID")
    private BcaMasterpaymentgateways gateway;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceStyleID")
    private BcaInvoicestyle invoiceStyle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MessageID")
    private BcaMessage message;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderid")
    private BcaOrdertemplate orderid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentTypeID")
    private BcaPaymenttype paymentType;

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

    public String getRefNum() {
        return refNum;
    }

    public void setRefNum(final String refNum) {
        this.refNum = refNum;
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

    public Integer getInvoiceStatus() {
        return invoiceStatus;
    }

    public void setInvoiceStatus(final Integer invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
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

    public OffsetDateTime getDateReceived() {
        return dateReceived;
    }

    public void setDateReceived(final OffsetDateTime dateReceived) {
        this.dateReceived = dateReceived;
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

    public BcaServicetype getService() {
        return service;
    }

    public void setService(final BcaServicetype service) {
        this.service = service;
    }

    public BcaStore getStore() {
        return store;
    }

    public void setStore(final BcaStore store) {
        this.store = store;
    }

    public BcaTerm getTerm() {
        return term;
    }

    public void setTerm(final BcaTerm term) {
        this.term = term;
    }

    public BcpEmployee getEmployee() {
        return employee;
    }

    public void setEmployee(final BcpEmployee employee) {
        this.employee = employee;
    }


    public BcaInvoicetype getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(final BcaInvoicetype invoiceType) {
        this.invoiceType = invoiceType;
    }

    public BcaSalesrep getSalesRep() {
        return salesRep;
    }

    public void setSalesRep(final BcaSalesrep salesRep) {
        this.salesRep = salesRep;
    }

    public BcaCategory getCategory() {
        return category;
    }

    public void setCategory(final BcaCategory category) {
        this.category = category;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

    public BcaMasterpaymentgateways getGateway() {
        return gateway;
    }

    public void setGateway(final BcaMasterpaymentgateways gateway) {
        this.gateway = gateway;
    }

    public BcaInvoicestyle getInvoiceStyle() {
        return invoiceStyle;
    }

    public void setInvoiceStyle(final BcaInvoicestyle invoiceStyle) {
        this.invoiceStyle = invoiceStyle;
    }

    public BcaMessage getMessage() {
        return message;
    }

    public void setMessage(final BcaMessage message) {
        this.message = message;
    }

    public BcaOrdertemplate getOrderid() {
        return orderid;
    }

    public void setOrderid(final BcaOrdertemplate orderid) {
        this.orderid = orderid;
    }

    public BcaPaymenttype getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(final BcaPaymenttype paymentType) {
        this.paymentType = paymentType;
    }

}
