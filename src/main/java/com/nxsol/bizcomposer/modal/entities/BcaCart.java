package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaCart {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cartId;

    @Column(length = 50)
    private String inventoryCode;

    @Column
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
    private Integer balanceQty;

    @Column(length = 50)
    private String unit;

    @Column
    private Integer categoryId;

    @Column
    private Double salesTaxRate;

    @Column(length = 20)
    private String poref;

    @Column(length = 50)
    private String soref;

    @Column
    private Integer isUsedSalesItem;

    @Column(length = 50)
    private String supplierId;

    @Column
    private String customSku;

    @Column
    private OffsetDateTime dateUpdated;

    @Column
    private Integer receivedQty;

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

    @OneToMany(mappedBy = "cart")
    private Set<BcaRmaitem> cartBcaRmaitems;

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

    public Integer getBalanceQty() {
        return balanceQty;
    }

    public void setBalanceQty(final Integer balanceQty) {
        this.balanceQty = balanceQty;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(final String unit) {
        this.unit = unit;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(final Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Double getSalesTaxRate() {
        return salesTaxRate;
    }

    public void setSalesTaxRate(final Double salesTaxRate) {
        this.salesTaxRate = salesTaxRate;
    }

    public String getPoref() {
        return poref;
    }

    public void setPoref(final String poref) {
        this.poref = poref;
    }

    public String getSoref() {
        return soref;
    }

    public void setSoref(final String soref) {
        this.soref = soref;
    }

    public Integer getIsUsedSalesItem() {
        return isUsedSalesItem;
    }

    public void setIsUsedSalesItem(final Integer isUsedSalesItem) {
        this.isUsedSalesItem = isUsedSalesItem;
    }

    public String getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(final String supplierId) {
        this.supplierId = supplierId;
    }

    public String getCustomSku() {
        return customSku;
    }

    public void setCustomSku(final String customSku) {
        this.customSku = customSku;
    }

    public OffsetDateTime getDateUpdated() {
        return dateUpdated;
    }

    public void setDateUpdated(final OffsetDateTime dateUpdated) {
        this.dateUpdated = dateUpdated;
    }

    public Integer getReceivedQty() {
        return receivedQty;
    }

    public void setReceivedQty(final Integer receivedQty) {
        this.receivedQty = receivedQty;
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

    public Set<BcaRmaitem> getCartBcaRmaitems() {
        return cartBcaRmaitems;
    }

    public void setCartBcaRmaitems(final Set<BcaRmaitem> cartBcaRmaitems) {
        this.cartBcaRmaitems = cartBcaRmaitems;
    }

}
