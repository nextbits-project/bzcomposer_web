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
@Table(name= "bca_invoice_layoutcolumnsscreensetting")
public class BcaInvoiceLayoutcolumnsscreensetting {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name= "Tax")
    private Boolean tax;

    @Column(name= "Item")
    private Boolean item;

    @Column(name = "Description")
    private Boolean description;

    @Column(name= "Quantity")
    private Boolean quantity;

    @Column(name= "Rate")
    private Boolean rate;

    @Column(name= "Amount")
    private Boolean amount;

    @Column(name= "RatePrice")
    private Boolean ratePrice;

    @Column(name= "UnitPrice")
    private Boolean unitPrice;

    @Column(name= "SerialNo")
    private Boolean serialNo;

    @Column(name= "Weight")
    private Boolean weight;

    @Column(name= "Unit")
    private Boolean unit;

    @Column(name= "Consignor")
    private Boolean consignor;

    @Column(name = "Option")
    private Boolean option;

    @Column(name= "COLOR/Q'TY(ORDER)")
    private Boolean colorQTyOrder;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TemplateId")
    private BcaInvoiceTemplate template;

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public Boolean getTax() {
        return tax;
    }

    public void setTax(final Boolean tax) {
        this.tax = tax;
    }

    public Boolean getItem() {
        return item;
    }

    public void setItem(final Boolean item) {
        this.item = item;
    }

    public Boolean getDescription() {
        return description;
    }

    public void setDescription(final Boolean description) {
        this.description = description;
    }

    public Boolean getQuantity() {
        return quantity;
    }

    public void setQuantity(final Boolean quantity) {
        this.quantity = quantity;
    }

    public Boolean getRate() {
        return rate;
    }

    public void setRate(final Boolean rate) {
        this.rate = rate;
    }

    public Boolean getAmount() {
        return amount;
    }

    public void setAmount(final Boolean amount) {
        this.amount = amount;
    }

    public Boolean getRatePrice() {
        return ratePrice;
    }

    public void setRatePrice(final Boolean ratePrice) {
        this.ratePrice = ratePrice;
    }

    public Boolean getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(final Boolean unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Boolean getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(final Boolean serialNo) {
        this.serialNo = serialNo;
    }

    public Boolean getWeight() {
        return weight;
    }

    public void setWeight(final Boolean weight) {
        this.weight = weight;
    }

    public Boolean getUnit() {
        return unit;
    }

    public void setUnit(final Boolean unit) {
        this.unit = unit;
    }

    public Boolean getConsignor() {
        return consignor;
    }

    public void setConsignor(final Boolean consignor) {
        this.consignor = consignor;
    }

    public Boolean getOption() {
        return option;
    }

    public void setOption(final Boolean option) {
        this.option = option;
    }

    public Boolean getColorQTyOrder() {
        return colorQTyOrder;
    }

    public void setColorQTyOrder(final Boolean colorQTyOrder) {
        this.colorQTyOrder = colorQTyOrder;
    }

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

}
