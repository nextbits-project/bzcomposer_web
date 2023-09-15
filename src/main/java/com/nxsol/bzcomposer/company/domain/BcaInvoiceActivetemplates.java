package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaInvoiceActivetemplates {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer retail;

    @Column
    private Integer wholesale;

    @Column
    private Integer contractor;

    @Column
    private Integer eSales;

    @Column
    private Integer service;

    @Column
    private Integer nonprofit;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "template_id")
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
