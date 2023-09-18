package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BcaTemplateConfig {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer baseTemplateId;

    @Column
    private String templateName;

    @Column
    private Integer templateTypeId;

    @Column
    private Integer templateStyleTypeId;

    @Column
    private Integer status;

    @Column
    private Integer templateCatagory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "template_id")
    private BcaInvoiceTemplate template;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Integer getBaseTemplateId() {
        return baseTemplateId;
    }

    public void setBaseTemplateId(final Integer baseTemplateId) {
        this.baseTemplateId = baseTemplateId;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(final String templateName) {
        this.templateName = templateName;
    }

    public Integer getTemplateTypeId() {
        return templateTypeId;
    }

    public void setTemplateTypeId(final Integer templateTypeId) {
        this.templateTypeId = templateTypeId;
    }

    public Integer getTemplateStyleTypeId() {
        return templateStyleTypeId;
    }

    public void setTemplateStyleTypeId(final Integer templateStyleTypeId) {
        this.templateStyleTypeId = templateStyleTypeId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(final Integer status) {
        this.status = status;
    }

    public Integer getTemplateCatagory() {
        return templateCatagory;
    }

    public void setTemplateCatagory(final Integer templateCatagory) {
        this.templateCatagory = templateCatagory;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

}
