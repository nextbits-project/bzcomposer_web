package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class BcaReportproperty {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String reportType;

    @Column(length = 50)
    private String reportDateType;

    @Column
    private OffsetDateTime reportFrom;

    @Column
    private OffsetDateTime reportTo;

    @Column
    private Boolean showCompanyName;

    @Column(length = 70)
    private String companyName;

    @Column
    private Boolean showReportTitle;

    @Column(length = 50)
    private String reportTitle;

    @Column
    private Boolean showDatePrepared;

    @Column
    private Boolean showTimePrepared;

    @Column
    private Boolean printHeadAll;

    @Column(length = 50)
    private String columnFont;

    @Column(length = 50)
    private String rowFont;

    @Column(length = 50)
    private String reportTotalFont;

    @Column(length = 50)
    private String reportDataFont;

    @Column(length = 50)
    private String companyNameFont;

    @Column(length = 50)
    private String reportTitleFont;

    @Column(length = 50)
    private String dateFont;

    @Column(length = 50)
    private String pageNumberFont;

    @Column(length = 50)
    private String timeFont;

    @Column
    private Boolean negativeRed;

    @Column
    private Integer companyId;

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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

}
