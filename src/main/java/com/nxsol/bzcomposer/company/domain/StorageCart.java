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
@Table(name= "storage_cart")
public class StorageCart {

    @Id
    @Column(name= "CartID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cartId;

    @Column(name= "InventoryCode", length = 50)
    private String inventoryCode;

    @Column(name= "InventoryName")
    private String inventoryName;

    @Column(name= "Qty")
    private Integer qty;

    @Column(name= "UnitWeight")
    private Double unitWeight;

    @Column(name= "Weight")
    private Double weight;

    @Column(name= "UnitPrice")
    private Double unitPrice;

    @Column(name= "Taxable")
    private Integer taxable;

    @Column(name= "DateAdded", nullable = false)
    private OffsetDateTime dateAdded;

    @Column(name= "ItemTypeID")
    private Integer itemTypeId;

    @Column(name= "Itemtax")
    private Double itemtax;

    @Column(name= "OrderItemID", length = 50)
    private String orderItemId;

    @Column(name= "shippingprice")
    private Double shippingprice;

    @Column(name= "shippingtax")
    private Double shippingtax;

    @Column(name= "itempromotiondiscount", length = 50)
    private String itempromotiondiscount;

    @Column(name= "itempromotionid", length = 50)
    private String itempromotionid;

    @Column(name= "shippromotiondiscount", length = 50)
    private String shippromotiondiscount;

    @Column(name= "shippromotionid", length = 50)
    private String shippromotionid;

    @Column(name= "ItemSubTotal", length = 50)
    private String itemSubTotal;

    @Column(name= "ItemOrder")
    private Integer itemOrder;

    @Column(name= "BalanceQty")
    private Integer balanceQty;

    @Column(name= "Unit", length = 50)
    private String unit;

    @Column(name= "SalesTaxRate")
    private Double salesTaxRate;

    @Column(name= "PORef", length = 20)
    private String poref;

    @Column(name= "SORef", length = 50)
    private String soref;

    @Column(name= "IsUsedSalesItem")
    private Integer isUsedSalesItem;

    @Column(name= "SupplierID", length = 50)
    private String supplierId;

    @Column(name= "CustomSku")
    private String customSku;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryID")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderid")
    private BcaOrdertemplate orderid;

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

    public BcaCategory getCategory() {
        return category;
    }

    public void setCategory(final BcaCategory category) {
        this.category = category;
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

    public BcaOrdertemplate getOrderid() {
        return orderid;
    }

    public void setOrderid(final BcaOrdertemplate orderid) {
        this.orderid = orderid;
    }

}
