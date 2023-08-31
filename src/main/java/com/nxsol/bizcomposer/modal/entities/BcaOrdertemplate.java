package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaOrdertemplate {

    @Id
    @Column(nullable = false, updatable = false)
    private String templatePath;

    @Column
    private String templateName;

    @Column
    private Integer activeData;

    @Column
    private Boolean defaultValue;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private BcaOrdertemplate order;

    @OneToMany(mappedBy = "order")
    private Set<BcaOrdertemplate> orderBcaOrdertemplates;

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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaOrdertemplate getOrder() {
        return order;
    }

    public void setOrder(final BcaOrdertemplate order) {
        this.order = order;
    }

    public Set<BcaOrdertemplate> getOrderBcaOrdertemplates() {
        return orderBcaOrdertemplates;
    }

    public void setOrderBcaOrdertemplates(final Set<BcaOrdertemplate> orderBcaOrdertemplates) {
        this.orderBcaOrdertemplates = orderBcaOrdertemplates;
    }

}
