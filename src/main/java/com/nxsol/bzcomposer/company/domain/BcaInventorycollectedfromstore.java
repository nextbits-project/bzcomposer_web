package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.time.OffsetDateTime;


@Entity
public class BcaInventorycollectedfromstore {

    @Id
    @Column(nullable = false, updatable = false, length = 30)
    private String asin;

    @Column(length = 50)
    private String orderItemId;

    @Column(length = 50)
    private String sku;

    @Column
    private String productName;

    @Column(precision = 23, scale = 4)
    private BigDecimal salePrice;

    @Column(nullable = false)
    private OffsetDateTime dateAdded;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id")
    private SmcOrders order;

    public String getAsin() {
        return asin;
    }

    public void setAsin(final String asin) {
        this.asin = asin;
    }

    public String getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(final String orderItemId) {
        this.orderItemId = orderItemId;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(final String sku) {
        this.sku = sku;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(final String productName) {
        this.productName = productName;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(final BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public SmcOrders getOrder() {
        return order;
    }

    public void setOrder(final SmcOrders order) {
        this.order = order;
    }

}
