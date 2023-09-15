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
    private Set<BcaBill> serviceBcaBills;

    @OneToMany(mappedBy = "service")
    private Set<BcaRecentbills> serviceBcaRecentbillss;

    @OneToMany(mappedBy = "service")
    private Set<BcaRecurrentpayment> serviceBcaRecurrentpayments;

    @OneToMany(mappedBy = "service")
    private Set<BcaRecurrentpaymentplan> serviceBcaRecurrentpaymentplans;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_style_id")
    private BcaInvoicestyle invoiceStyle;

    @OneToMany(mappedBy = "service")
    private Set<StorageInvoice> serviceStorageInvoices;

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

    public Set<BcaBill> getServiceBcaBills() {
        return serviceBcaBills;
    }

    public void setServiceBcaBills(final Set<BcaBill> serviceBcaBills) {
        this.serviceBcaBills = serviceBcaBills;
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

    public Set<BcaRecurrentpaymentplan> getServiceBcaRecurrentpaymentplans() {
        return serviceBcaRecurrentpaymentplans;
    }

    public void setServiceBcaRecurrentpaymentplans(
            final Set<BcaRecurrentpaymentplan> serviceBcaRecurrentpaymentplans) {
        this.serviceBcaRecurrentpaymentplans = serviceBcaRecurrentpaymentplans;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public BcaInvoicestyle getInvoiceStyle() {
        return invoiceStyle;
    }

    public void setInvoiceStyle(final BcaInvoicestyle invoiceStyle) {
        this.invoiceStyle = invoiceStyle;
    }

    public Set<StorageInvoice> getServiceStorageInvoices() {
        return serviceStorageInvoices;
    }

    public void setServiceStorageInvoices(final Set<StorageInvoice> serviceStorageInvoices) {
        this.serviceStorageInvoices = serviceStorageInvoices;
    }

}
