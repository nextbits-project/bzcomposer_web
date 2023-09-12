package com.nxsol.bizcomposer.modal.entities;

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
public class BcaServicetype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer serviceId;

    @Column(length = 50)
    private String serviceName;

    @Column(length = 50)
    private String serviceBillingDate;

    @Column
    private Integer isUseBillCycle;

    @Column
    private Integer activeFlag;

    @OneToMany(mappedBy = "service")
    private Set<BcaRecentbills> serviceBcaRecentbillss;

    @OneToMany(mappedBy = "service")
    private Set<BcaRecurrentpayment> serviceBcaRecurrentpayments;

    @OneToMany(mappedBy = "service")
    private Set<BcaRecurrentpayment> serviceBcaRecurrentpayments;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_style_id")
    private BcaInvoicestyle invoiceStyle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(final Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(final String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceBillingDate() {
        return serviceBillingDate;
    }

    public void setServiceBillingDate(final String serviceBillingDate) {
        this.serviceBillingDate = serviceBillingDate;
    }

    public Integer getIsUseBillCycle() {
        return isUseBillCycle;
    }

    public void setIsUseBillCycle(final Integer isUseBillCycle) {
        this.isUseBillCycle = isUseBillCycle;
    }

    public Integer getActiveFlag() {
        return activeFlag;
    }

    public void setActiveFlag(final Integer activeFlag) {
        this.activeFlag = activeFlag;
    }

    public Set<BcaRecentbills> getServiceBcaRecentbillss() {
        return serviceBcaRecentbillss;
    }

    public void setServiceBcaRecentbillss(final Set<BcaRecentbills> serviceBcaRecentbillss) {
        this.serviceBcaRecentbillss = serviceBcaRecentbillss;
    }

    public Set<BcaRecurrentpayment> getServiceBcaRecurrentpayments() {
        return serviceBcaRecurrentpayments;
    }

    public void setServiceBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> serviceBcaRecurrentpayments) {
        this.serviceBcaRecurrentpayments = serviceBcaRecurrentpayments;
    }

    public Set<BcaRecurrentpayment> getServiceBcaRecurrentpayments() {
        return serviceBcaRecurrentpayments;
    }

    public void setServiceBcaRecurrentpayments(
            final Set<BcaRecurrentpayment> serviceBcaRecurrentpayments) {
        this.serviceBcaRecurrentpayments = serviceBcaRecurrentpayments;
    }

    public BcaInvoicestyle getInvoiceStyle() {
        return invoiceStyle;
    }

    public void setInvoiceStyle(final BcaInvoicestyle invoiceStyle) {
        this.invoiceStyle = invoiceStyle;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
