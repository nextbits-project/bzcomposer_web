package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaOrdertemplate {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderId;

    @Column
    private String templatePath;

    @Column
    private String templateName;

    @Column
    private Integer activeData;

    @Column
    private Boolean defaultValue;

    @OneToMany(mappedBy = "orderid")
    private Set<BcaCart> orderidBcaCarts;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "orderid")
    private Set<StorageCart> orderidStorageCarts;

    @OneToMany(mappedBy = "orderid")
    private Set<StorageInvoice> orderidStorageInvoices;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(final Integer orderId) {
        this.orderId = orderId;
    }

    public String getTemplatePath() {
        return templatePath;
    }

    public void setTemplatePath(final String templatePath) {
        this.templatePath = templatePath;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(final String templateName) {
        this.templateName = templateName;
    }

    public Integer getActiveData() {
        return activeData;
    }

    public void setActiveData(final Integer activeData) {
        this.activeData = activeData;
    }

    public Boolean getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(final Boolean defaultValue) {
        this.defaultValue = defaultValue;
    }

    public Set<BcaCart> getOrderidBcaCarts() {
        return orderidBcaCarts;
    }

    public void setOrderidBcaCarts(final Set<BcaCart> orderidBcaCarts) {
        this.orderidBcaCarts = orderidBcaCarts;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<StorageCart> getOrderidStorageCarts() {
        return orderidStorageCarts;
    }

    public void setOrderidStorageCarts(final Set<StorageCart> orderidStorageCarts) {
        this.orderidStorageCarts = orderidStorageCarts;
    }

    public Set<StorageInvoice> getOrderidStorageInvoices() {
        return orderidStorageInvoices;
    }

    public void setOrderidStorageInvoices(final Set<StorageInvoice> orderidStorageInvoices) {
        this.orderidStorageInvoices = orderidStorageInvoices;
    }

}
