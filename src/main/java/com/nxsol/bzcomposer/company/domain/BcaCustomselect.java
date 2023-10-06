package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_customselect")
public class BcaCustomselect {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "SUBTITLE")
    private String subtitle;

    @Column(name= "SKU")
    private String sku;

    @Column(name= "PRICETYPE")
    private String pricetype;

    @Column(name= "SORTORDER")
    private Integer sortorder;

    @Column(name= "QTY")
    private Integer qty;

    @Column(name= "PRICE")
    private Integer price;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(final String subtitle) {
        this.subtitle = subtitle;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(final String sku) {
        this.sku = sku;
    }

    public String getPricetype() {
        return pricetype;
    }

    public void setPricetype(final String pricetype) {
        this.pricetype = pricetype;
    }

    public Integer getSortorder() {
        return sortorder;
    }

    public void setSortorder(final Integer sortorder) {
        this.sortorder = sortorder;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(final Integer qty) {
        this.qty = qty;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(final Integer price) {
        this.price = price;
    }

}
