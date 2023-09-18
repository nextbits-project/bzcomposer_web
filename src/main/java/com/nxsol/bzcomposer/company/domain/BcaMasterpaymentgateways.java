package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaMasterpaymentgateways {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer gatewayId;

    @Column(length = 50)
    private String gatewayType;

    @OneToMany(mappedBy = "gateway")
    private Set<BcaInvoice> gatewayBcaInvoices;

    @OneToMany(mappedBy = "gateway")
    private Set<BcaPaymentdetail> gatewayBcaPaymentdetails;

    @OneToMany(mappedBy = "gateway")
    private Set<StorageInvoice> gatewayStorageInvoices;

    public Integer getGatewayId() {
        return gatewayId;
    }

    public void setGatewayId(final Integer gatewayId) {
        this.gatewayId = gatewayId;
    }

    public String getGatewayType() {
        return gatewayType;
    }

    public void setGatewayType(final String gatewayType) {
        this.gatewayType = gatewayType;
    }

    public Set<BcaInvoice> getGatewayBcaInvoices() {
        return gatewayBcaInvoices;
    }

    public void setGatewayBcaInvoices(final Set<BcaInvoice> gatewayBcaInvoices) {
        this.gatewayBcaInvoices = gatewayBcaInvoices;
    }

    public Set<BcaPaymentdetail> getGatewayBcaPaymentdetails() {
        return gatewayBcaPaymentdetails;
    }

    public void setGatewayBcaPaymentdetails(final Set<BcaPaymentdetail> gatewayBcaPaymentdetails) {
        this.gatewayBcaPaymentdetails = gatewayBcaPaymentdetails;
    }

    public Set<StorageInvoice> getGatewayStorageInvoices() {
        return gatewayStorageInvoices;
    }

    public void setGatewayStorageInvoices(final Set<StorageInvoice> gatewayStorageInvoices) {
        this.gatewayStorageInvoices = gatewayStorageInvoices;
    }

}
