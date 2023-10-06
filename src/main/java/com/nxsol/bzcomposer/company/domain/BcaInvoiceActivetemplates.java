package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "bca_invoice_activetemplates")
public class BcaInvoiceActivetemplates {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "Retail")
    private Integer retail;

    @Column(name= "Wholesale")
    private Integer wholesale;

    @Column(name= "Contractor")
    private Integer contractor;

    @Column(name= "eSales")
    private Integer eSales;

    @Column(name= "Service")
    private Integer service;

    @Column(name= "Nonprofit")
    private Integer nonprofit;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TemplateID")
    private BcaInvoiceTemplate template;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Integer getRetail() {
        return retail;
    }

    public void setRetail(final Integer retail) {
        this.retail = retail;
    }

    public Integer getWholesale() {
        return wholesale;
    }

    public void setWholesale(final Integer wholesale) {
        this.wholesale = wholesale;
    }

    public Integer getContractor() {
        return contractor;
    }

    public void setContractor(final Integer contractor) {
        this.contractor = contractor;
    }

    public Integer getESales() {
        return eSales;
    }

    public void setESales(final Integer eSales) {
        this.eSales = eSales;
    }

    public Integer getService() {
        return service;
    }

    public void setService(final Integer service) {
        this.service = service;
    }

    public Integer getNonprofit() {
        return nonprofit;
    }

    public void setNonprofit(final Integer nonprofit) {
        this.nonprofit = nonprofit;
    }

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

}
