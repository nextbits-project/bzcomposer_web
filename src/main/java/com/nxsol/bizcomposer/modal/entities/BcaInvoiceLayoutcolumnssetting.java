package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaInvoiceLayoutcolumnssetting {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String columnLabel;

    @Column(length = 50)
    private String columnTitle;

    @Column
    private Integer printStatus;

    @Column
    private Integer templateorder;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "template_id")
    private BcaInvoiceTemplate template;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "template_id")
    private BcaInvoiceTemplate template;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "template_id")
    private BcaInvoiceTemplate template;

    public String getColumnLabel() {
        return columnLabel;
    }

    public void setColumnLabel(final String columnLabel) {
        this.columnLabel = columnLabel;
    }

    public String getColumnTitle() {
        return columnTitle;
    }

    public void setColumnTitle(final String columnTitle) {
        this.columnTitle = columnTitle;
    }

    public Integer getPrintStatus() {
        return printStatus;
    }

    public void setPrintStatus(final Integer printStatus) {
        this.printStatus = printStatus;
    }

    public Integer getTemplateorder() {
        return templateorder;
    }

    public void setTemplateorder(final Integer templateorder) {
        this.templateorder = templateorder;
    }

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

}
