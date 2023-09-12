package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class SmcOrders {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String orderId;

    @Column(length = 50)
    private String payPalTxnId;

    @Column
    private Integer companyId;

    @Column
    private Integer customerId;

    @Column(length = 50)
    private String shippingEmail;

    @Column
    private OffsetDateTime orderDate;

    @Column
    private Double discount;

    @Column
    private Double total;

    @Column
    private Double tax;

    @Column
    private Double shippingFee;

    @Column(length = 50)
    private String shippingName;

    @Column(length = 50)
    private String shippingMethod;

    @Column(length = 50)
    private String receiver;

    @Column(length = 100)
    private String shippingAddr;

    @Column(length = 50)
    private String shippingCity;

    @Column(length = 50)
    private String shippingState;

    @Column(length = 50)
    private String shippingZip;

    @Column(length = 50)
    private String shippingCountry;

    @Column(length = 50)
    private String shippingPhone;

    @Column(length = 50)
    private String paymentMethod;

    @Column(length = 50)
    private String cardName;

    @Column(length = 50)
    private String cardNo;

    @Column(length = 50)
    private String cardExpire;

    @Column(length = 50)
    private String cardHolder;

    @Column(length = 50)
    private String cvv2;

    @Column(length = 100)
    private String billingAddr;

    @Column(length = 50)
    private String billingCity;

    @Column(length = 50)
    private String billingState;

    @Column(length = 50)
    private String billingZip;

    @Column(length = 50)
    private String billingCountry;

    @Column(length = 50)
    private String billingPhone;

    @Column(length = 50)
    private String billingEmail;

    @Column(columnDefinition = "longtext")
    private String smcnote;

    @Column(length = 50)
    private String isChecked;

    @Column(length = 50)
    private String status;

    @Column
    private Integer dealerId;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaCart> orderidBcaCarts;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaCartmemorized> orderidBcaCartmemorizeds;

    @OneToMany(mappedBy = "order")
    private Set<BcaInventorycollectedfromstore> orderBcaInventorycollectedfromstores;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaInvoicememorized> orderidBcaInvoicememorizeds;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaInvoiceshipped> orderidBcaInvoiceshippeds;

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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

    public Set<BcaCart> getOrderidBcaCarts() {
        return orderidBcaCarts;
    }

    public void setOrderidBcaCarts(final Set<BcaCart> orderidBcaCarts) {
        this.orderidBcaCarts = orderidBcaCarts;
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

}
