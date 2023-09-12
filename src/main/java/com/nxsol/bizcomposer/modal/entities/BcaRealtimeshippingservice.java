package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaRealtimeshippingservice {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shippingServiceId;

    @Column
    private Integer shippingType;

    @Column(length = 50)
    private String shippingService;

    @Column
    private Double price;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "shippingService")
    private Set<BcaInvoiceshipdetail> shippingServiceBcaInvoiceshipdetails;

    @OneToMany(mappedBy = "service")
    private Set<BcaInvoiceshipped> serviceBcaInvoiceshippeds;

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

    public Set<BcaInvoiceshipdetail> getShippingServiceBcaInvoiceshipdetails() {
        return shippingServiceBcaInvoiceshipdetails;
    }

    public void setShippingServiceBcaInvoiceshipdetails(
            final Set<BcaInvoiceshipdetail> shippingServiceBcaInvoiceshipdetails) {
        this.shippingServiceBcaInvoiceshipdetails = shippingServiceBcaInvoiceshipdetails;
    }

    public Set<BcaInvoiceshipped> getServiceBcaInvoiceshippeds() {
        return serviceBcaInvoiceshippeds;
    }

    public void setServiceBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> serviceBcaInvoiceshippeds) {
        this.serviceBcaInvoiceshippeds = serviceBcaInvoiceshippeds;
    }

}
