package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "bca_invoice_layoutfieldscreensetting")
public class BcaInvoiceLayoutfieldscreensetting {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name= "InvoiceTitle")
    private Boolean invoiceTitle;

    @Column(name= "InvoiceDate")
    private Boolean invoiceDate;

    @Column(name= "InvoiceNumber")
    private Boolean invoiceNumber;

    @Column(name= "BillTo")
    private Boolean billTo;

    @Column(name= "ShipTo")
    private Boolean shipTo;

    @Column(name= "PoNo")
    private Boolean poNo;

    @Column(name= "Terms")
    private Boolean terms;

    @Column(name= "Rep")
    private Boolean rep;

    @Column(name= "ShipDate")
    private Boolean shipDate;

    @Column(name= "ShipVia")
    private Boolean shipVia;

    @Column(name= "PayMethod")
    private Boolean payMethod;

    @Column(name= "Message")
    private Boolean message;

    @Column(name= "SubTotal")
    private Boolean subTotal;

    @Column(name= "SalesTax")
    private Boolean salesTax;

    @Column(name= "Total")
    private Boolean total;

    @Column(name= "PaidBalance")
    private Boolean paidBalance;

    @Column(name= "Weight")
    private Boolean weight;

    @Column(name= "AdjustedTotal")
    private Boolean adjustedTotal;

    @Column(name= "LongTextMessage")
    private Boolean longTextMessage;

    @Column(name= "Balance")
    private Boolean balance;

    @Column(name= "DueDate")
    private Boolean dueDate;

    @Column(name= "TotalItems")
    private Boolean totalItems;

    @Column(name= "Barcode1")
    private Boolean barcode1;

    @Column(name= "Barcode2")
    private Boolean barcode2;

    @Column(name= "Credit")
    private Integer credit;

    @Column(name= "Discount")
    private Integer discount;

    @Column(name= "GiftAmount")
    private Integer giftAmount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TemplateId")
    private BcaInvoiceTemplate template;

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public Boolean getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(final Boolean invoiceTitle) {
        this.invoiceTitle = invoiceTitle;
    }

    public Boolean getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(final Boolean invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public Boolean getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(final Boolean invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public Boolean getBillTo() {
        return billTo;
    }

    public void setBillTo(final Boolean billTo) {
        this.billTo = billTo;
    }

    public Boolean getShipTo() {
        return shipTo;
    }

    public void setShipTo(final Boolean shipTo) {
        this.shipTo = shipTo;
    }

    public Boolean getPoNo() {
        return poNo;
    }

    public void setPoNo(final Boolean poNo) {
        this.poNo = poNo;
    }

    public Boolean getTerms() {
        return terms;
    }

    public void setTerms(final Boolean terms) {
        this.terms = terms;
    }

    public Boolean getRep() {
        return rep;
    }

    public void setRep(final Boolean rep) {
        this.rep = rep;
    }

    public Boolean getShipDate() {
        return shipDate;
    }

    public void setShipDate(final Boolean shipDate) {
        this.shipDate = shipDate;
    }

    public Boolean getShipVia() {
        return shipVia;
    }

    public void setShipVia(final Boolean shipVia) {
        this.shipVia = shipVia;
    }

    public Boolean getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(final Boolean payMethod) {
        this.payMethod = payMethod;
    }

    public Boolean getMessage() {
        return message;
    }

    public void setMessage(final Boolean message) {
        this.message = message;
    }

    public Boolean getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(final Boolean subTotal) {
        this.subTotal = subTotal;
    }

    public Boolean getSalesTax() {
        return salesTax;
    }

    public void setSalesTax(final Boolean salesTax) {
        this.salesTax = salesTax;
    }

    public Boolean getTotal() {
        return total;
    }

    public void setTotal(final Boolean total) {
        this.total = total;
    }

    public Boolean getPaidBalance() {
        return paidBalance;
    }

    public void setPaidBalance(final Boolean paidBalance) {
        this.paidBalance = paidBalance;
    }

    public Boolean getWeight() {
        return weight;
    }

    public void setWeight(final Boolean weight) {
        this.weight = weight;
    }

    public Boolean getAdjustedTotal() {
        return adjustedTotal;
    }

    public void setAdjustedTotal(final Boolean adjustedTotal) {
        this.adjustedTotal = adjustedTotal;
    }

    public Boolean getLongTextMessage() {
        return longTextMessage;
    }

    public void setLongTextMessage(final Boolean longTextMessage) {
        this.longTextMessage = longTextMessage;
    }

    public Boolean getBalance() {
        return balance;
    }

    public void setBalance(final Boolean balance) {
        this.balance = balance;
    }

    public Boolean getDueDate() {
        return dueDate;
    }

    public void setDueDate(final Boolean dueDate) {
        this.dueDate = dueDate;
    }

    public Boolean getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(final Boolean totalItems) {
        this.totalItems = totalItems;
    }

    public Boolean getBarcode1() {
        return barcode1;
    }

    public void setBarcode1(final Boolean barcode1) {
        this.barcode1 = barcode1;
    }

    public Boolean getBarcode2() {
        return barcode2;
    }

    public void setBarcode2(final Boolean barcode2) {
        this.barcode2 = barcode2;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(final Integer credit) {
        this.credit = credit;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(final Integer discount) {
        this.discount = discount;
    }

    public Integer getGiftAmount() {
        return giftAmount;
    }

    public void setGiftAmount(final Integer giftAmount) {
        this.giftAmount = giftAmount;
    }

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

}
