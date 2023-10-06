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
@Table(name= "bca_invoicememorized")
public class BcaInvoicememorized {

    @Id
    @Column(name= "InvoiceID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invoiceId;

    @Column(name= "OrderNum")
    private Integer orderNum;

    @Column(name= "PONum")
    private Integer ponum;

    @Column(name= "RcvNum")
    private Integer rcvNum;

    @Column(name= "EstNum")
    private Integer estNum;

    @Column(name= "EmployeeID")
    private Integer employeeId;

    @Column(name= "RefNum", length = 35)
    private String refNum;

    @Column(name= "Memo", length = 150)
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

    @Column(name= "SalesRepID")
    private Integer salesRepId;

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

    @Column(name= "CategoryID")
    private Integer categoryId;

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

    @Column(name= "IsPrinted")
    private Boolean isPrinted;

    @Column(name= "IsEmailed")
    private Boolean isEmailed;

    @Column(name= "ServiceID")
    private Integer serviceId;

    @Column(name= "AmazonGiftWrapType")
    private String amazonGiftWrapType;

    @Column(name= "AmazonGiftMessageText")
    private String amazonGiftMessageText;

    @Column(name= "ShippingMethod")
    private String shippingMethod;

    @Column(name= "dropShipCustomerID")
    private Integer dropShipCustomerId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ShipCarrier")
    private BcaShipcarrier shipCarrier;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "StoreID")
    private BcaStore store;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TermID")
    private BcaTerm term;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceTypeID")
    private BcaInvoicetype invoiceType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceStyleID")
    private BcaInvoicestyle invoiceStyle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MessageID")
    private BcaMessage message;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderid")
    private SmcOrders orderid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PaymentTypeID")
    private BcaPaymenttype paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SalesTaxID")
    private BcaSalestax salesTax;

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

    public Integer getSalesRepId() {
        return salesRepId;
    }

    public void setSalesRepId(final Integer salesRepId) {
        this.salesRepId = salesRepId;
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

    public String getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(final String shippingMethod) {
        this.shippingMethod = shippingMethod;
    }

    public Integer getDropShipCustomerId() {
        return dropShipCustomerId;
    }

    public void setDropShipCustomerId(final Integer dropShipCustomerId) {
        this.dropShipCustomerId = dropShipCustomerId;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

 

    public void setShipCarrier(final BcaShipcarrier shipCarrier) {
        this.shipCarrier = shipCarrier;
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

    public BcaInvoicetype getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(final BcaInvoicetype invoiceType) {
        this.invoiceType = invoiceType;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
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

    public SmcOrders getOrderid() {
        return orderid;
    }

    public void setOrderid(final SmcOrders orderid) {
        this.orderid = orderid;
    }

    public BcaPaymenttype getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(final BcaPaymenttype paymentType) {
        this.paymentType = paymentType;
    }

    public BcaSalestax getSalesTax() {
        return salesTax;
    }

    public void setSalesTax(final BcaSalestax salesTax) {
        this.salesTax = salesTax;
    }

}
