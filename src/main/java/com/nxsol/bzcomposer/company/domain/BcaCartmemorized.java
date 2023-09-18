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


@Entity
public class BcaCartmemorized {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cartId;

    @Column(length = 50)
    private String inventoryCode;

    @Column(length = 100)
    private String inventoryName;

    @Column
    private Integer qty;

    @Column
    private Double unitWeight;

    @Column
    private Double weight;

    @Column
    private Double unitPrice;

    @Column
    private Integer taxable;

    @Column(nullable = false)
    private OffsetDateTime dateAdded;

    @Column
    private Integer itemTypeId;

    @Column
    private Double itemtax;

    @Column(length = 50)
    private String orderItemId;

    @Column
    private Double shippingprice;

    @Column
    private Double shippingtax;

    @Column(length = 50)
    private String itempromotiondiscount;

    @Column(length = 50)
    private String itempromotionid;

    @Column(length = 50)
    private String shippromotiondiscount;

    @Column(length = 50)
    private String shippromotionid;

    @Column(length = 50)
    private String itemSubTotal;

    @Column
    private Integer itemOrder;

    @Column
    private Double salesTaxRate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_id")
    private BcaInvoice invoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderid_id")
    private SmcOrders orderid;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(final Integer cartId) {
        this.cartId = cartId;
    }

    public String getInventoryCode() {
        return inventoryCode;
    }

    public void setInventoryCode(final String inventoryCode) {
        this.inventoryCode = inventoryCode;
    }

    public String getInventoryName() {
        return inventoryName;
    }

    public void setInventoryName(final String inventoryName) {
        this.inventoryName = inventoryName;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(final Integer qty) {
        this.qty = qty;
    }

    public Double getUnitWeight() {
        return unitWeight;
    }

    public void setUnitWeight(final Double unitWeight) {
        this.unitWeight = unitWeight;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(final Double weight) {
        this.weight = weight;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(final Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getTaxable() {
        return taxable;
    }

    public void setTaxable(final Integer taxable) {
        this.taxable = taxable;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getItemTypeId() {
        return itemTypeId;
    }

    public void setItemTypeId(final Integer itemTypeId) {
        this.itemTypeId = itemTypeId;
    }

    public Double getItemtax() {
        return itemtax;
    }

    public void setItemtax(final Double itemtax) {
        this.itemtax = itemtax;
    }

    public String getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(final String orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Double getShippingprice() {
        return shippingprice;
    }

    public void setShippingprice(final Double shippingprice) {
        this.shippingprice = shippingprice;
    }

    public Double getShippingtax() {
        return shippingtax;
    }

    public void setShippingtax(final Double shippingtax) {
        this.shippingtax = shippingtax;
    }

    public String getItempromotiondiscount() {
        return itempromotiondiscount;
    }

    public void setItempromotiondiscount(final String itempromotiondiscount) {
        this.itempromotiondiscount = itempromotiondiscount;
    }

    public String getItempromotionid() {
        return itempromotionid;
    }

    public void setItempromotionid(final String itempromotionid) {
        this.itempromotionid = itempromotionid;
    }

    public String getShippromotiondiscount() {
        return shippromotiondiscount;
    }

    public void setShippromotiondiscount(final String shippromotiondiscount) {
        this.shippromotiondiscount = shippromotiondiscount;
    }

    public String getShippromotionid() {
        return shippromotionid;
    }

    public void setShippromotionid(final String shippromotionid) {
        this.shippromotionid = shippromotionid;
    }

    public String getItemSubTotal() {
        return itemSubTotal;
    }

    public void setItemSubTotal(final String itemSubTotal) {
        this.itemSubTotal = itemSubTotal;
    }

    public Integer getItemOrder() {
        return itemOrder;
    }

    public void setItemOrder(final Integer itemOrder) {
        this.itemOrder = itemOrder;
    }

    public Double getSalesTaxRate() {
        return salesTaxRate;
    }

    public void setSalesTaxRate(final Double salesTaxRate) {
        this.salesTaxRate = salesTaxRate;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaInvoice getInvoice() {
        return invoice;
    }

    public void setInvoice(final BcaInvoice invoice) {
        this.invoice = invoice;
    }

    public SmcOrders getOrderid() {
        return orderid;
    }

    public void setOrderid(final SmcOrders orderid) {
        this.orderid = orderid;
    }

}
