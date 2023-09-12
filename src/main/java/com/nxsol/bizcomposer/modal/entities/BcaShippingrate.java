package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.math.BigDecimal;


@Entity
public class BcaShippingrate {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shippingRateId;

    @Column(nullable = false)
    private Double weight;

    @Column(precision = 23, scale = 4)
    private BigDecimal price;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ship_carrier_id")
    private BcaShipcarrier shipCarrier;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ship_carrier_id")
    private BcaShipcarrier shipCarrier;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ship_carrier_id", nullable = false)
    private BcaShipcarrier shipCarrier;

    public Integer getShippingRateId() {
        return shippingRateId;
    }

    public void setShippingRateId(final Integer shippingRateId) {
        this.shippingRateId = shippingRateId;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(final Double weight) {
        this.weight = weight;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(final BigDecimal price) {
        this.price = price;
    }

    public BcaShipcarrier getShipCarrier() {
        return shipCarrier;
    }

    public void setShipCarrier(final BcaShipcarrier shipCarrier) {
        this.shipCarrier = shipCarrier;
    }

    public BcaShipcarrier getShipCarrier() {
        return shipCarrier;
    }

    public void setShipCarrier(final BcaShipcarrier shipCarrier) {
        this.shipCarrier = shipCarrier;
    }

    public BcaShipcarrier getShipCarrier() {
        return shipCarrier;
    }

    public void setShipCarrier(final BcaShipcarrier shipCarrier) {
        this.shipCarrier = shipCarrier;
    }

}
