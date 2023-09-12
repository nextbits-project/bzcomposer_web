package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.math.BigDecimal;


@Entity
public class SmdItemgroupprice {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer companyId;

    @Column(length = 20)
    private String inventoryId;

    @Column
    private Integer customerGroupId;

    @Column
    private Boolean defaultPrice;

    @Column(precision = 18, scale = 0)
    private BigDecimal price;

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(final String inventoryId) {
        this.inventoryId = inventoryId;
    }

    public Integer getCustomerGroupId() {
        return customerGroupId;
    }

    public void setCustomerGroupId(final Integer customerGroupId) {
        this.customerGroupId = customerGroupId;
    }

    public Boolean getDefaultPrice() {
        return defaultPrice;
    }

    public void setDefaultPrice(final Boolean defaultPrice) {
        this.defaultPrice = defaultPrice;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(final BigDecimal price) {
        this.price = price;
    }

}
