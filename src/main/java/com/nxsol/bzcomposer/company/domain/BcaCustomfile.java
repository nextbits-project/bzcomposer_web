package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class BcaCustomfile {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer price;

    @Column
    private String priceType;

    @Column
    private String sku;

    @Column
    private String allowedFileEx;

    @Column
    private Integer maxImageWidth;

    @Column
    private Integer maxImageheight;

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

    public String getAllowedFileEx() {
        return allowedFileEx;
    }

    public void setAllowedFileEx(final String allowedFileEx) {
        this.allowedFileEx = allowedFileEx;
    }

    public Integer getMaxImageWidth() {
        return maxImageWidth;
    }

    public void setMaxImageWidth(final Integer maxImageWidth) {
        this.maxImageWidth = maxImageWidth;
    }

    public Integer getMaxImageheight() {
        return maxImageheight;
    }

    public void setMaxImageheight(final Integer maxImageheight) {
        this.maxImageheight = maxImageheight;
    }

}
