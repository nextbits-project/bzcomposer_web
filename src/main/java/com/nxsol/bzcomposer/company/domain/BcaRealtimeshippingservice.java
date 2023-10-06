package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bca_realtimeshippingservice")
public class BcaRealtimeshippingservice {

    @Id
    @Column(name="ShippingServiceID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shippingServiceId;

    @Column(name="ShippingType")
    private Integer shippingType;

    @Column(name="ShippingService", length = 50)
    private String shippingService;

    @Column(name="Price")
    private Double price;

    @Column(name="Active")
    private Integer active;

    public Integer getShippingServiceId() {
        return shippingServiceId;
    }

    public void setShippingServiceId(final Integer shippingServiceId) {
        this.shippingServiceId = shippingServiceId;
    }

    public Integer getShippingType() {
        return shippingType;
    }

    public void setShippingType(final Integer shippingType) {
        this.shippingType = shippingType;
    }

    public String getShippingService() {
        return shippingService;
    }

    public void setShippingService(final String shippingService) {
        this.shippingService = shippingService;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(final Double price) {
        this.price = price;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

}
