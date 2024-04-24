package com.avibha.bizcomposer.sales.dto;


import java.util.List;

public class InvoiceDetailsResponse {
    private int invoiceId;
    private int orderNo;
    private List<CartItem> cartItems;
    private String subTotal;
    private String taxTotal;
    private String discount;
    private String grandTotal;
    private String adjustedTotal;
    public String getAdjustedTotal() {
		return adjustedTotal;
	}

	public void setAdjustedTotal(String adjustedTotal) {
		this.adjustedTotal = adjustedTotal;
	}

	private String grandTotalWithTax;
    private String paymentMethod;
    private String customerId;
    private String customerName;
    private String date;
    private String companyName;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getGrandTotalWithTax() {
        return grandTotalWithTax;
    }

    public void setGrandTotalWithTax(String grandTotalWithTax) {
        this.grandTotalWithTax = grandTotalWithTax;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public String getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(String subTotal) {
        this.subTotal = subTotal;
    }

    public String getTaxTotal() {
        return taxTotal;
    }

    public void setTaxTotal(String taxTotal) {
        this.taxTotal = taxTotal;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(String grandTotal) {
        this.grandTotal = grandTotal;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}
