package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="bca_settings")
public class BcaSettings {

    @Id
    @Column(name="DefaultPrinter", nullable = false, updatable = false, length = 50)
    private String defaultPrinter;

    @Column(name="InvoicePrinter", length = 50)
    private String invoicePrinter;

    @Column(name="LabelPrinter", length = 50)
    private String labelPrinter;

    @Column(name="eSalesPrinter", length = 50)
    private String eSalesPrinter;

    @Column(name="CheckPrinter", length = 50)
    private String checkPrinter;

    @Column(name="SalesSlipPrinter", length = 50)
    private String salesSlipPrinter;

    @Column(name="ReportPrinter", length = 50)
    private String reportPrinter;

    @Column(name="PurchasePrinter", length = 50)
    private String purchasePrinter;

    @Column(name="isInvoiceMultiCopyPrintable")
    private Boolean isInvoiceMultiCopyPrintable;

    @Column(name="isLabelMultiCopyPrintable")
    private Boolean isLabelMultiCopyPrintable;

    @Column(name="isESalesMultiCopyPrintable")
    private Boolean isEsalesMultiCopyPrintable;

    @Column(name="isCheckMultiCopyPrintable")
    private Boolean isCheckMultiCopyPrintable;

    @Column(name="isSalesSlipMultiCopyPrintable")
    private Boolean isSalesSlipMultiCopyPrintable;

    @Column(name="isReportMultiCopyPrintable")
    private Boolean isReportMultiCopyPrintable;

    @Column(name="isPurchaseMultiCopyPrintable")
    private Boolean isPurchaseMultiCopyPrintable;

    @Column(name="InvoicePrintableCopies")
    private Integer invoicePrintableCopies;

    @Column(name="LabelPrintableCopies")
    private Integer labelPrintableCopies;

    @Column(name="ESalesPrintableCopies")
    private Integer esalesPrintableCopies;

    @Column(name="CheckPrintableCopies")
    private Integer checkPrintableCopies;

    @Column(name="SalesSlipPrintableCopies")
    private Integer salesSlipPrintableCopies;

    @Column(name="ReportPrintableCopies")
    private Integer reportPrintableCopies;

    @Column(name="PurchasePrintableCopies")
    private Integer purchasePrintableCopies;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    public String getDefaultPrinter() {
        return defaultPrinter;
    }

    public void setDefaultPrinter(final String defaultPrinter) {
        this.defaultPrinter = defaultPrinter;
    }

    public String getInvoicePrinter() {
        return invoicePrinter;
    }

    public void setInvoicePrinter(final String invoicePrinter) {
        this.invoicePrinter = invoicePrinter;
    }

    public String getLabelPrinter() {
        return labelPrinter;
    }

    public void setLabelPrinter(final String labelPrinter) {
        this.labelPrinter = labelPrinter;
    }

    public String getESalesPrinter() {
        return eSalesPrinter;
    }

    public void setESalesPrinter(final String eSalesPrinter) {
        this.eSalesPrinter = eSalesPrinter;
    }

    public String getCheckPrinter() {
        return checkPrinter;
    }

    public void setCheckPrinter(final String checkPrinter) {
        this.checkPrinter = checkPrinter;
    }

    public String getSalesSlipPrinter() {
        return salesSlipPrinter;
    }

    public void setSalesSlipPrinter(final String salesSlipPrinter) {
        this.salesSlipPrinter = salesSlipPrinter;
    }

    public String getReportPrinter() {
        return reportPrinter;
    }

    public void setReportPrinter(final String reportPrinter) {
        this.reportPrinter = reportPrinter;
    }

    public String getPurchasePrinter() {
        return purchasePrinter;
    }

    public void setPurchasePrinter(final String purchasePrinter) {
        this.purchasePrinter = purchasePrinter;
    }

    public Boolean getIsInvoiceMultiCopyPrintable() {
        return isInvoiceMultiCopyPrintable;
    }

    public void setIsInvoiceMultiCopyPrintable(final Boolean isInvoiceMultiCopyPrintable) {
        this.isInvoiceMultiCopyPrintable = isInvoiceMultiCopyPrintable;
    }

    public Boolean getIsLabelMultiCopyPrintable() {
        return isLabelMultiCopyPrintable;
    }

    public void setIsLabelMultiCopyPrintable(final Boolean isLabelMultiCopyPrintable) {
        this.isLabelMultiCopyPrintable = isLabelMultiCopyPrintable;
    }

    public Boolean getIsEsalesMultiCopyPrintable() {
        return isEsalesMultiCopyPrintable;
    }

    public void setIsEsalesMultiCopyPrintable(final Boolean isEsalesMultiCopyPrintable) {
        this.isEsalesMultiCopyPrintable = isEsalesMultiCopyPrintable;
    }

    public Boolean getIsCheckMultiCopyPrintable() {
        return isCheckMultiCopyPrintable;
    }

    public void setIsCheckMultiCopyPrintable(final Boolean isCheckMultiCopyPrintable) {
        this.isCheckMultiCopyPrintable = isCheckMultiCopyPrintable;
    }

    public Boolean getIsSalesSlipMultiCopyPrintable() {
        return isSalesSlipMultiCopyPrintable;
    }

    public void setIsSalesSlipMultiCopyPrintable(final Boolean isSalesSlipMultiCopyPrintable) {
        this.isSalesSlipMultiCopyPrintable = isSalesSlipMultiCopyPrintable;
    }

    public Boolean getIsReportMultiCopyPrintable() {
        return isReportMultiCopyPrintable;
    }

    public void setIsReportMultiCopyPrintable(final Boolean isReportMultiCopyPrintable) {
        this.isReportMultiCopyPrintable = isReportMultiCopyPrintable;
    }

    public Boolean getIsPurchaseMultiCopyPrintable() {
        return isPurchaseMultiCopyPrintable;
    }

    public void setIsPurchaseMultiCopyPrintable(final Boolean isPurchaseMultiCopyPrintable) {
        this.isPurchaseMultiCopyPrintable = isPurchaseMultiCopyPrintable;
    }

    public Integer getInvoicePrintableCopies() {
        return invoicePrintableCopies;
    }

    public void setInvoicePrintableCopies(final Integer invoicePrintableCopies) {
        this.invoicePrintableCopies = invoicePrintableCopies;
    }

    public Integer getLabelPrintableCopies() {
        return labelPrintableCopies;
    }

    public void setLabelPrintableCopies(final Integer labelPrintableCopies) {
        this.labelPrintableCopies = labelPrintableCopies;
    }

    public Integer getEsalesPrintableCopies() {
        return esalesPrintableCopies;
    }

    public void setEsalesPrintableCopies(final Integer esalesPrintableCopies) {
        this.esalesPrintableCopies = esalesPrintableCopies;
    }

    public Integer getCheckPrintableCopies() {
        return checkPrintableCopies;
    }

    public void setCheckPrintableCopies(final Integer checkPrintableCopies) {
        this.checkPrintableCopies = checkPrintableCopies;
    }

    public Integer getSalesSlipPrintableCopies() {
        return salesSlipPrintableCopies;
    }

    public void setSalesSlipPrintableCopies(final Integer salesSlipPrintableCopies) {
        this.salesSlipPrintableCopies = salesSlipPrintableCopies;
    }

    public Integer getReportPrintableCopies() {
        return reportPrintableCopies;
    }

    public void setReportPrintableCopies(final Integer reportPrintableCopies) {
        this.reportPrintableCopies = reportPrintableCopies;
    }

    public Integer getPurchasePrintableCopies() {
        return purchasePrintableCopies;
    }

    public void setPurchasePrintableCopies(final Integer purchasePrintableCopies) {
        this.purchasePrintableCopies = purchasePrintableCopies;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
