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
public class BcaInvoiceLayoutcolumnsscreensetting {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private Boolean tax;

    @Column
    private Boolean item;

    @Column(name = "\"description\"")
    private Boolean description;

    @Column
    private Boolean quantity;

    @Column
    private Boolean rate;

    @Column
    private Boolean amount;

    @Column
    private Boolean ratePrice;

    @Column
    private Boolean unitPrice;

    @Column
    private Boolean serialNo;

    @Column
    private Boolean weight;

    @Column
    private Boolean unit;

    @Column
    private Boolean consignor;

    @Column(name = "\"option\"")
    private Boolean option;

    @Column
    private Boolean colorQTyOrder;

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

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

}
