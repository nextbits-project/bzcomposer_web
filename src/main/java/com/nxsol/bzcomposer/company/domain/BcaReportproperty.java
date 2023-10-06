package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name="bca_reportproperty")
public class BcaReportproperty {

    @Id
    @Column(name="ReportType", nullable = false, updatable = false, length = 50)
    private String reportType;

    @Column(name="ReportDateType", length = 50)
    private String reportDateType;

    @Column(name="ReportFrom")
    private OffsetDateTime reportFrom;

    @Column(name="ReportTo")
    private OffsetDateTime reportTo;

    @Column(name="ShowCompanyName")
    private Boolean showCompanyName;

    @Column(name="CompanyName", length = 70)
    private String companyName;

    @Column(name="ShowReportTitle")
    private Boolean showReportTitle;

    @Column(name="ReportTitle", length = 50)
    private String reportTitle;

    @Column(name="ShowDatePrepared")
    private Boolean showDatePrepared;

    @Column(name="ShowTimePrepared")
    private Boolean showTimePrepared;

    @Column(name="PrintHeadAll")
    private Boolean printHeadAll;

    @Column(name="ColumnFont", length = 50)
    private String columnFont;

    @Column(name="RowFont", length = 50)
    private String rowFont;

    @Column(name="ReportTotalFont", length = 50)
    private String reportTotalFont;

    @Column(name="ReportDataFont", length = 50)
    private String reportDataFont;

    @Column(name="CompanyNameFont", length = 50)
    private String companyNameFont;

    @Column(name="ReportTitleFont", length = 50)
    private String reportTitleFont;

    @Column(name="DateFont", length = 50)
    private String dateFont;

    @Column(name="PageNumberFont", length = 50)
    private String pageNumberFont;

    @Column(name="TimeFont", length = 50)
    private String timeFont;

    @Column(name="NegativeRed")
    private Boolean negativeRed;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    public String getReportType() {
        return reportType;
    }

    public void setReportType(final String reportType) {
        this.reportType = reportType;
    }

    public String getReportDateType() {
        return reportDateType;
    }

    public void setReportDateType(final String reportDateType) {
        this.reportDateType = reportDateType;
    }

    public OffsetDateTime getReportFrom() {
        return reportFrom;
    }

    public void setReportFrom(final OffsetDateTime reportFrom) {
        this.reportFrom = reportFrom;
    }

    public OffsetDateTime getReportTo() {
        return reportTo;
    }

    public void setReportTo(final OffsetDateTime reportTo) {
        this.reportTo = reportTo;
    }

    public Boolean getShowCompanyName() {
        return showCompanyName;
    }

    public void setShowCompanyName(final Boolean showCompanyName) {
        this.showCompanyName = showCompanyName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(final String companyName) {
        this.companyName = companyName;
    }

    public Boolean getShowReportTitle() {
        return showReportTitle;
    }

    public void setShowReportTitle(final Boolean showReportTitle) {
        this.showReportTitle = showReportTitle;
    }

    public String getReportTitle() {
        return reportTitle;
    }

    public void setReportTitle(final String reportTitle) {
        this.reportTitle = reportTitle;
    }

    public Boolean getShowDatePrepared() {
        return showDatePrepared;
    }

    public void setShowDatePrepared(final Boolean showDatePrepared) {
        this.showDatePrepared = showDatePrepared;
    }

    public Boolean getShowTimePrepared() {
        return showTimePrepared;
    }

    public void setShowTimePrepared(final Boolean showTimePrepared) {
        this.showTimePrepared = showTimePrepared;
    }

    public Boolean getPrintHeadAll() {
        return printHeadAll;
    }

    public void setPrintHeadAll(final Boolean printHeadAll) {
        this.printHeadAll = printHeadAll;
    }

    public String getColumnFont() {
        return columnFont;
    }

    public void setColumnFont(final String columnFont) {
        this.columnFont = columnFont;
    }

    public String getRowFont() {
        return rowFont;
    }

    public void setRowFont(final String rowFont) {
        this.rowFont = rowFont;
    }

    public String getReportTotalFont() {
        return reportTotalFont;
    }

    public void setReportTotalFont(final String reportTotalFont) {
        this.reportTotalFont = reportTotalFont;
    }

    public String getReportDataFont() {
        return reportDataFont;
    }

    public void setReportDataFont(final String reportDataFont) {
        this.reportDataFont = reportDataFont;
    }

    public String getCompanyNameFont() {
        return companyNameFont;
    }

    public void setCompanyNameFont(final String companyNameFont) {
        this.companyNameFont = companyNameFont;
    }

    public String getReportTitleFont() {
        return reportTitleFont;
    }

    public void setReportTitleFont(final String reportTitleFont) {
        this.reportTitleFont = reportTitleFont;
    }

    public String getDateFont() {
        return dateFont;
    }

    public void setDateFont(final String dateFont) {
        this.dateFont = dateFont;
    }

    public String getPageNumberFont() {
        return pageNumberFont;
    }

    public void setPageNumberFont(final String pageNumberFont) {
        this.pageNumberFont = pageNumberFont;
    }

    public String getTimeFont() {
        return timeFont;
    }

    public void setTimeFont(final String timeFont) {
        this.timeFont = timeFont;
    }

    public Boolean getNegativeRed() {
        return negativeRed;
    }

    public void setNegativeRed(final Boolean negativeRed) {
        this.negativeRed = negativeRed;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
