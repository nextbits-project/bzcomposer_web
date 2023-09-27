package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BcaShippingservice {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shippingServiceId;

    @Column
    private Double handlingFee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "container_id")
    private BcaMastershippingcontainer container;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mail_type_id")
    private BcaMastershippingmailtype mailType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "package_size_id")
    private BcaMastershippingpackagesize packageSize;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ship_carrier_id")
    private BcaShipcarrier shipCarrier;

    public Integer getShippingServiceId() {
        return shippingServiceId;
    }

    public void setShippingServiceId(final Integer shippingServiceId) {
        this.shippingServiceId = shippingServiceId;
    }

    public Double getHandlingFee() {
        return handlingFee;
    }

    public void setHandlingFee(final Double handlingFee) {
        this.handlingFee = handlingFee;
    }

    public BcaMastershippingcontainer getContainer() {
        return container;
    }

    public void setContainer(final BcaMastershippingcontainer container) {
        this.container = container;
    }

    public BcaMastershippingmailtype getMailType() {
        return mailType;
    }

    public void setMailType(final BcaMastershippingmailtype mailType) {
        this.mailType = mailType;
    }

    public BcaMastershippingpackagesize getPackageSize() {
        return packageSize;
    }

    public void setPackageSize(final BcaMastershippingpackagesize packageSize) {
        this.packageSize = packageSize;
    }

    public BcaShipcarrier getShipCarrier() {
        return shipCarrier;
    }

    public void setShipCarrier(final BcaShipcarrier shipCarrier) {
        this.shipCarrier = shipCarrier;
    }

}