package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaShipcarrier {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shipCarrierId;

    @Column
    private String name;

    @Column
    private Integer active;

    @Column
    private Integer parentId;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaClientvendor> shipCarrierBcaClientvendors;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaInvoice> shipCarrierBcaInvoices;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaInvoicememorized> shipCarrierBcaInvoicememorizeds;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaInvoiceshipped> shipCarrierBcaInvoiceshippeds;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaShippingrate> shipCarrierBcaShippingrates;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaShippingservice> shipCarrierBcaShippingservices;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<BcaUserdefineshipcarrier> shipCarrierBcaUserdefineshipcarriers;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<StorageClientvendor> shipCarrierStorageClientvendors;

    @OneToMany(mappedBy = "shipCarrier")
    private Set<StorageInvoice> shipCarrierStorageInvoices;

    public Integer getShipCarrierId() {
        return shipCarrierId;
    }

    public void setShipCarrierId(final Integer shipCarrierId) {
        this.shipCarrierId = shipCarrierId;
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

    public Set<BcaClientvendor> getShipCarrierBcaClientvendors() {
        return shipCarrierBcaClientvendors;
    }

    public void setShipCarrierBcaClientvendors(
            final Set<BcaClientvendor> shipCarrierBcaClientvendors) {
        this.shipCarrierBcaClientvendors = shipCarrierBcaClientvendors;
    }

    public Set<BcaInvoice> getShipCarrierBcaInvoices() {
        return shipCarrierBcaInvoices;
    }

    public void setShipCarrierBcaInvoices(final Set<BcaInvoice> shipCarrierBcaInvoices) {
        this.shipCarrierBcaInvoices = shipCarrierBcaInvoices;
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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
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

    public Set<BcaUserdefineshipcarrier> getShipCarrierBcaUserdefineshipcarriers() {
        return shipCarrierBcaUserdefineshipcarriers;
    }

    public void setShipCarrierBcaUserdefineshipcarriers(
            final Set<BcaUserdefineshipcarrier> shipCarrierBcaUserdefineshipcarriers) {
        this.shipCarrierBcaUserdefineshipcarriers = shipCarrierBcaUserdefineshipcarriers;
    }

    public Set<StorageClientvendor> getShipCarrierStorageClientvendors() {
        return shipCarrierStorageClientvendors;
    }

    public void setShipCarrierStorageClientvendors(
            final Set<StorageClientvendor> shipCarrierStorageClientvendors) {
        this.shipCarrierStorageClientvendors = shipCarrierStorageClientvendors;
    }

    public Set<StorageInvoice> getShipCarrierStorageInvoices() {
        return shipCarrierStorageInvoices;
    }

    public void setShipCarrierStorageInvoices(
            final Set<StorageInvoice> shipCarrierStorageInvoices) {
        this.shipCarrierStorageInvoices = shipCarrierStorageInvoices;
    }

}
