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
import javax.persistence.Table;

@Entity
@Table(name= "smc_orders")
public class SmcOrders {

    @Id
    @Column(name= "OrderID", nullable = false, updatable = false, length = 50)
    private String orderId;

    @Column(name= "PayPal_txn_id", length = 50)
    private String payPalTxnId;

    @Column(name= "CustomerID")
    private Integer customerId;

    @Column(name= "ShippingEmail", length = 50)
    private String shippingEmail;

    @Column(name= "OrderDate")
    private OffsetDateTime orderDate;

    @Column(name= "Discount")
    private Double discount;

    @Column(name= "Total")
    private Double total;

    @Column(name= "Tax")
    private Double tax;

    @Column(name= "ShippingFee")
    private Double shippingFee;

    @Column(name= "ShippingName", length = 50)
    private String shippingName;

    @Column(name= "ShippingMethod", length = 50)
    private String shippingMethod;

    @Column(name= "Receiver", length = 50)
    private String receiver;

    @Column(name= "ShippingAddr", length = 100)
    private String shippingAddr;

    @Column(name= "ShippingCity", length = 50)
    private String shippingCity;

    @Column(name= "ShippingState", length = 50)
    private String shippingState;

    @Column(name= "ShippingZip", length = 50)
    private String shippingZip;

    @Column(name= "ShippingCountry", length = 50)
    private String shippingCountry;

    @Column(name= "ShippingPhone", length = 50)
    private String shippingPhone;

    @Column(name= "PaymentMethod", length = 50)
    private String paymentMethod;

    @Column(name= "CardName", length = 50)
    private String cardName;

    @Column(name= "CardNo", length = 50)
    private String cardNo;

    @Column(name= "CardExpire", length = 50)
    private String cardExpire;

    @Column(name= "CardHolder", length = 50)
    private String cardHolder;

    @Column(name= "CVV2", length = 50)
    private String cvv2;

    @Column(name= "BillingAddr", length = 100)
    private String billingAddr;

    @Column(name= "BillingCity", length = 50)
    private String billingCity;

    @Column(name= "BillingState", length = 50)
    private String billingState;

    @Column(name= "BillingZip", length = 50)
    private String billingZip;

    @Column(name = "BillingCountry", length = 50)
    private String billingCountry;

    @Column(name= "BillingPhone", length = 50)
    private String billingPhone;

    @Column(name= "BillingEmail", length = 50)
    private String billingEmail;

    @Column(name= "SMCNote", columnDefinition = "longtext")
    private String smcnote;

    @Column(name= "isChecked", length = 50)
    private String isChecked;

    @Column(name= "Status", length = 50)
    private String status;

    @Column(name= "DealerID")
    private Integer dealerId;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaCartmemorized> orderidBcaCartmemorizeds;

    @OneToMany(mappedBy = "order")
    private Set<BcaInventorycollectedfromstore> orderBcaInventorycollectedfromstores;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaInvoice> orderidBcaInvoices;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaInvoicememorized> orderidBcaInvoicememorizeds;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaInvoiceshipped> orderidBcaInvoiceshippeds;

    @OneToMany(mappedBy = "order")
    private Set<BtSales> orderBtSaless;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(final String orderId) {
        this.orderId = orderId;
    }

    public String getPayPalTxnId() {
        return payPalTxnId;
    }

    public void setPayPalTxnId(final String payPalTxnId) {
        this.payPalTxnId = payPalTxnId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(final Integer customerId) {
        this.customerId = customerId;
    }

    public String getShippingEmail() {
        return shippingEmail;
    }

    public void setShippingEmail(final String shippingEmail) {
        this.shippingEmail = shippingEmail;
    }

    public OffsetDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(final OffsetDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(final Double discount) {
        this.discount = discount;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(final Double total) {
        this.total = total;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(final Double tax) {
        this.tax = tax;
    }

    public Double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(final Double shippingFee) {
        this.shippingFee = shippingFee;
    }

    public String getShippingName() {
        return shippingName;
    }

    public void setShippingName(final String shippingName) {
        this.shippingName = shippingName;
    }

    public String getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(final String shippingMethod) {
        this.shippingMethod = shippingMethod;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(final String receiver) {
        this.receiver = receiver;
    }

    public String getShippingAddr() {
        return shippingAddr;
    }

    public void setShippingAddr(final String shippingAddr) {
        this.shippingAddr = shippingAddr;
    }

    public String getShippingCity() {
        return shippingCity;
    }

    public void setShippingCity(final String shippingCity) {
        this.shippingCity = shippingCity;
    }

    public String getShippingState() {
        return shippingState;
    }

    public void setShippingState(final String shippingState) {
        this.shippingState = shippingState;
    }

    public String getShippingZip() {
        return shippingZip;
    }

    public void setShippingZip(final String shippingZip) {
        this.shippingZip = shippingZip;
    }

    public String getShippingCountry() {
        return shippingCountry;
    }

    public void setShippingCountry(final String shippingCountry) {
        this.shippingCountry = shippingCountry;
    }

    public String getShippingPhone() {
        return shippingPhone;
    }

    public void setShippingPhone(final String shippingPhone) {
        this.shippingPhone = shippingPhone;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(final String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(final String cardName) {
        this.cardName = cardName;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(final String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardExpire() {
        return cardExpire;
    }

    public void setCardExpire(final String cardExpire) {
        this.cardExpire = cardExpire;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(final String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public String getCvv2() {
        return cvv2;
    }

    public void setCvv2(final String cvv2) {
        this.cvv2 = cvv2;
    }

    public String getBillingAddr() {
        return billingAddr;
    }

    public void setBillingAddr(final String billingAddr) {
        this.billingAddr = billingAddr;
    }

    public String getBillingCity() {
        return billingCity;
    }

    public void setBillingCity(final String billingCity) {
        this.billingCity = billingCity;
    }

    public String getBillingState() {
        return billingState;
    }

    public void setBillingState(final String billingState) {
        this.billingState = billingState;
    }

    public String getBillingZip() {
        return billingZip;
    }

    public void setBillingZip(final String billingZip) {
        this.billingZip = billingZip;
    }

    public String getBillingCountry() {
        return billingCountry;
    }

    public void setBillingCountry(final String billingCountry) {
        this.billingCountry = billingCountry;
    }

    public String getBillingPhone() {
        return billingPhone;
    }

    public void setBillingPhone(final String billingPhone) {
        this.billingPhone = billingPhone;
    }

    public String getBillingEmail() {
        return billingEmail;
    }

    public void setBillingEmail(final String billingEmail) {
        this.billingEmail = billingEmail;
    }

    public String getSmcnote() {
        return smcnote;
    }

    public void setSmcnote(final String smcnote) {
        this.smcnote = smcnote;
    }

    public String getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(final String isChecked) {
        this.isChecked = isChecked;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public Integer getDealerId() {
        return dealerId;
    }

    public void setDealerId(final Integer dealerId) {
        this.dealerId = dealerId;
    }

    public Set<BcaCartmemorized> getOrderidBcaCartmemorizeds() {
        return orderidBcaCartmemorizeds;
    }

    public void setOrderidBcaCartmemorizeds(final Set<BcaCartmemorized> orderidBcaCartmemorizeds) {
        this.orderidBcaCartmemorizeds = orderidBcaCartmemorizeds;
    }

    public Set<BcaInventorycollectedfromstore> getOrderBcaInventorycollectedfromstores() {
        return orderBcaInventorycollectedfromstores;
    }

    public void setOrderBcaInventorycollectedfromstores(
            final Set<BcaInventorycollectedfromstore> orderBcaInventorycollectedfromstores) {
        this.orderBcaInventorycollectedfromstores = orderBcaInventorycollectedfromstores;
    }

    public Set<BcaInvoice> getOrderidBcaInvoices() {
        return orderidBcaInvoices;
    }

    public void setOrderidBcaInvoices(final Set<BcaInvoice> orderidBcaInvoices) {
        this.orderidBcaInvoices = orderidBcaInvoices;
    }

    public Set<BcaInvoicememorized> getOrderidBcaInvoicememorizeds() {
        return orderidBcaInvoicememorizeds;
    }

    public void setOrderidBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> orderidBcaInvoicememorizeds) {
        this.orderidBcaInvoicememorizeds = orderidBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getOrderidBcaInvoiceshippeds() {
        return orderidBcaInvoiceshippeds;
    }

    public void setOrderidBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> orderidBcaInvoiceshippeds) {
        this.orderidBcaInvoiceshippeds = orderidBcaInvoiceshippeds;
    }

    public Set<BtSales> getOrderBtSaless() {
        return orderBtSaless;
    }

    public void setOrderBtSaless(final Set<BtSales> orderBtSaless) {
        this.orderBtSaless = orderBtSaless;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
