package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaShipcarrier {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shipCarrierId;

    @Column
    private Integer companyId;

    @Column
    private String name;

    @Column
    private Integer active;

    @Column
    private Integer parentId;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaInvoicememorized> shipCarrierBcaInvoicememorizeds;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaInvoiceshipped> shipCarrierBcaInvoiceshippeds;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaShippingrate> shipCarrierBcaShippingrates;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaShippingrate> shipCarrierBcaShippingrates;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaShippingrate> shipCarrierBcaShippingrates;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaShippingservice> shipCarrierBcaShippingservices;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaShippingservice> shipCarrierBcaShippingservices;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaShippingservice> shipCarrierBcaShippingservices;

    public Integer getShipCarrierId() {
        return shipCarrierId;
    }

    public void setShipCarrierId(final Integer shipCarrierId) {
        this.shipCarrierId = shipCarrierId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(final Integer parentId) {
        this.parentId = parentId;
    }

    public Set<BcaInvoicememorized> getShipCarrierBcaInvoicememorizeds() {
        return shipCarrierBcaInvoicememorizeds;
    }

    public void setShipCarrierBcaInvoicememorizeds(
            final Set<BcaInvoicememorized> shipCarrierBcaInvoicememorizeds) {
        this.shipCarrierBcaInvoicememorizeds = shipCarrierBcaInvoicememorizeds;
    }

    public Set<BcaInvoiceshipped> getShipCarrierBcaInvoiceshippeds() {
        return shipCarrierBcaInvoiceshippeds;
    }

    public void setShipCarrierBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> shipCarrierBcaInvoiceshippeds) {
        this.shipCarrierBcaInvoiceshippeds = shipCarrierBcaInvoiceshippeds;
    }

    public Set<BcaShippingrate> getShipCarrierBcaShippingrates() {
        return shipCarrierBcaShippingrates;
    }

    public void setShipCarrierBcaShippingrates(
            final Set<BcaShippingrate> shipCarrierBcaShippingrates) {
        this.shipCarrierBcaShippingrates = shipCarrierBcaShippingrates;
    }

    public Set<BcaShippingrate> getShipCarrierBcaShippingrates() {
        return shipCarrierBcaShippingrates;
    }

    public void setShipCarrierBcaShippingrates(
            final Set<BcaShippingrate> shipCarrierBcaShippingrates) {
        this.shipCarrierBcaShippingrates = shipCarrierBcaShippingrates;
    }

    public Set<BcaShippingrate> getShipCarrierBcaShippingrates() {
        return shipCarrierBcaShippingrates;
    }

    public void setShipCarrierBcaShippingrates(
            final Set<BcaShippingrate> shipCarrierBcaShippingrates) {
        this.shipCarrierBcaShippingrates = shipCarrierBcaShippingrates;
    }

    public Set<BcaShippingservice> getShipCarrierBcaShippingservices() {
        return shipCarrierBcaShippingservices;
    }

    public void setShipCarrierBcaShippingservices(
            final Set<BcaShippingservice> shipCarrierBcaShippingservices) {
        this.shipCarrierBcaShippingservices = shipCarrierBcaShippingservices;
    }

    public Set<BcaShippingservice> getShipCarrierBcaShippingservices() {
        return shipCarrierBcaShippingservices;
    }

    public void setShipCarrierBcaShippingservices(
            final Set<BcaShippingservice> shipCarrierBcaShippingservices) {
        this.shipCarrierBcaShippingservices = shipCarrierBcaShippingservices;
    }

    public Set<BcaShippingservice> getShipCarrierBcaShippingservices() {
        return shipCarrierBcaShippingservices;
    }

    public void setShipCarrierBcaShippingservices(
            final Set<BcaShippingservice> shipCarrierBcaShippingservices) {
        this.shipCarrierBcaShippingservices = shipCarrierBcaShippingservices;
    }

}
