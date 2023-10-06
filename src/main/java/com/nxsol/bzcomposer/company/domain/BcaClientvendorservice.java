package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "bca_clientvendorservice")
public class BcaClientvendorservice {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name= "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name= "InvoiceStyleID")
    private Integer invoiceStyleId;

    @Column(name= "DefaultService")
    private Boolean defaultService;

    @Column(name= "ServiceID")
    private Integer serviceId;

    @Column(name= "SalePrice")
    private Double salePrice;

    @Column(name= "BillDate", length = 50)
    private String billDate;

    @Column(name= "JobCategoryID")
    private Integer jobCategoryId;

    @Column(name= "isRecurringServiceJob")
    private Integer isRecurringServiceJob;

    @Column(name= "StartDate")
    private OffsetDateTime startDate;

    @Column(name= "TerminateDate")
    private OffsetDateTime terminateDate;

    @Column(name= "Active")
    private Integer active;

    @Column(name= "LastBillDate")
    private OffsetDateTime lastBillDate;

    @Column(name= "ServiceTypeID")
    private Integer serviceTypeId;

    @Column(name= "ServiceBalance")
    private Double serviceBalance;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
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
