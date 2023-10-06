package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import javax.persistence.Table;

@Entity
@Table(name= "smd_itemgroupprice")
public class SmdItemgroupprice {

    @Id
    @Column(name= "InventoryID", nullable = false, updatable = false, length = 20)
    private String inventoryId;

    @Column(name= "CustomerGroupID")
    private Integer customerGroupId;

    @Column(name= "DefaultPrice")
    private Boolean defaultPrice;

    @Column(name= "Price", precision = 18, scale = 0)
    private BigDecimal price;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
