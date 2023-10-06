package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_customtext")
public class BcaCustomtext {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "Price")
    private Integer price;

    @Column(name= "PriceType")
    private String priceType;

    @Column(name= "SKU")
    private String sku;

    @Column(name= "MaxCharacter")
    private Integer maxCharacter;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(final Integer price) {
        this.price = price;
    }

    public String getPriceType() {
        return priceType;
    }

    public void setPriceType(final String priceType) {
        this.priceType = priceType;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(final String sku) {
        this.sku = sku;
    }

    public Integer getMaxCharacter() {
        return maxCharacter;
    }

    public void setMaxCharacter(final Integer maxCharacter) {
        this.maxCharacter = maxCharacter;
    }

}
