package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaClientvendorservice {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer invoiceStyleId;

    @Column
    private Boolean defaultService;

    @Column
    private Integer serviceId;

    @Column
    private Double salePrice;

    @Column(length = 50)
    private String billDate;

    @Column
    private Integer jobCategoryId;

    @Column
    private Integer isRecurringServiceJob;

    @Column
    private OffsetDateTime startDate;

    @Column
    private OffsetDateTime terminateDate;

    @Column
    private Integer active;

    @Column
    private OffsetDateTime lastBillDate;

    @Column
    private Integer serviceTypeId;

    @Column
    private Double serviceBalance;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_vendor_id")
    private BcaClientvendor clientVendor;

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getInvoiceStyleId() {
        return invoiceStyleId;
    }

    public void setInvoiceStyleId(final Integer invoiceStyleId) {
        this.invoiceStyleId = invoiceStyleId;
    }

    public Boolean getDefaultService() {
        return defaultService;
    }

    public void setDefaultService(final Boolean defaultService) {
        this.defaultService = defaultService;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(final Integer serviceId) {
        this.serviceId = serviceId;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(final Double salePrice) {
        this.salePrice = salePrice;
    }

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(final String billDate) {
        this.billDate = billDate;
    }

    public Integer getJobCategoryId() {
        return jobCategoryId;
    }

    public void setJobCategoryId(final Integer jobCategoryId) {
        this.jobCategoryId = jobCategoryId;
    }

    public Integer getIsRecurringServiceJob() {
        return isRecurringServiceJob;
    }

    public void setIsRecurringServiceJob(final Integer isRecurringServiceJob) {
        this.isRecurringServiceJob = isRecurringServiceJob;
    }

    public OffsetDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(final OffsetDateTime startDate) {
        this.startDate = startDate;
    }

    public OffsetDateTime getTerminateDate() {
        return terminateDate;
    }

    public void setTerminateDate(final OffsetDateTime terminateDate) {
        this.terminateDate = terminateDate;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public OffsetDateTime getLastBillDate() {
        return lastBillDate;
    }

    public void setLastBillDate(final OffsetDateTime lastBillDate) {
        this.lastBillDate = lastBillDate;
    }

    public Integer getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(final Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public Double getServiceBalance() {
        return serviceBalance;
    }

    public void setServiceBalance(final Double serviceBalance) {
        this.serviceBalance = serviceBalance;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

}
