package com.avibha.bizcomposer.sales.dao;


import java.time.LocalDateTime;
import java.util.List;

public class BoxInvoice {
    private List<BoxInvoiceItem> invoiceItems;
    private double subTotal;
    private double taxTotal;
    private double discount;
    private double grandTotal;
    private int paymentMethod;
    private int customerId;
    private int orderNo;
    private int termId;
    private int isInvoice;
    private int isSalesType;
    private int isPaymentCompleted;
    private int salesRepId;
    private int companyId;
    private int invoiceTypeId;
    private LocalDateTime dateAdded;
    private LocalDateTime dateConfirmed;
    private int invoiceId;

    public BoxInvoice() {
    }

    public List<BoxInvoiceItem> getInvoiceItems() {
        return invoiceItems;
    }

    public void setInvoiceItems(List<BoxInvoiceItem> invoiceItems) {
        this.invoiceItems = invoiceItems;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public double getTaxTotal() {
        return taxTotal;
    }

    public void setTaxTotal(double taxTotal) {
        this.taxTotal = taxTotal;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(double grandTotal) {
        this.grandTotal = grandTotal;
    }

    public int getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getTermId() {
        return termId;
    }

    public void setTermId(int termId) {
        this.termId = termId;
    }

    public int getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(int isInvoice) {
        this.isInvoice = isInvoice;
    }

    public int getIsSalesType() {
        return isSalesType;
    }

    public void setIsSalesType(int isSalesType) {
        this.isSalesType = isSalesType;
    }

    public int getIsPaymentCompleted() {
        return isPaymentCompleted;
    }

    public void setIsPaymentCompleted(int isPaymentCompleted) {
        this.isPaymentCompleted = isPaymentCompleted;
    }

    public int getSalesRepId() {
        return salesRepId;
    }

    public void setSalesRepId(int salesRepId) {
        this.salesRepId = salesRepId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getInvoiceTypeId() {
        return invoiceTypeId;
    }

    public void setInvoiceTypeId(int invoiceTypeId) {
        this.invoiceTypeId = invoiceTypeId;
    }

    public LocalDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(LocalDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public LocalDateTime getDateConfirmed() {
        return dateConfirmed;
    }

    public void setDateConfirmed(LocalDateTime dateConfirmed) {
        this.dateConfirmed = dateConfirmed;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }
}
