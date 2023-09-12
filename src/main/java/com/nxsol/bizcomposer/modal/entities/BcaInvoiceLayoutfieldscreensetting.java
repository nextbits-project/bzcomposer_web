package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaInvoiceLayoutfieldscreensetting {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private Boolean invoiceTitle;

    @Column
    private Boolean invoiceDate;

    @Column
    private Boolean invoiceNumber;

    @Column
    private Boolean billTo;

    @Column
    private Boolean shipTo;

    @Column
    private Boolean poNo;

    @Column
    private Boolean terms;

    @Column
    private Boolean rep;

    @Column
    private Boolean shipDate;

    @Column
    private Boolean shipVia;

    @Column
    private Boolean payMethod;

    @Column
    private Boolean message;

    @Column
    private Boolean subTotal;

    @Column
    private Boolean salesTax;

    @Column
    private Boolean total;

    @Column
    private Boolean paidBalance;

    @Column
    private Boolean weight;

    @Column
    private Boolean adjustedTotal;

    @Column
    private Boolean longTextMessage;

    @Column
    private Boolean balance;

    @Column
    private Boolean dueDate;

    @Column
    private Boolean totalItems;

    @Column
    private Boolean barcode1;

    @Column
    private Boolean barcode2;

    @Column
    private Integer credit;

    @Column
    private Integer discount;

    @Column
    private Integer giftAmount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "template_id")
    private BcaInvoiceTemplate template;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "template_id")
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

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

}
