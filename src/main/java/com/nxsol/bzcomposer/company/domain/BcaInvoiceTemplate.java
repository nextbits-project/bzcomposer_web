package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaInvoiceTemplate {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer templateId;

    @Column
    private Integer baseTemplateId;

    @Column(length = 50)
    private String templateName;

    @Column(length = 50)
    private String type;

    @Column
    private Boolean isSpecifiedPrintSetting;

    @Column(length = 50)
    private String orientation;

    @Column(length = 50)
    private String noOfCopies;

    @Column(length = 50)
    private String pageWidth;

    @Column(length = 50)
    private String pageHeight;

    @Column
    private Boolean printPageNumber;

    @Column
    private Boolean printStatus;

    @Column
    private Boolean isPrintCompanyLogo;

    @Column
    private Integer templateTypeId;

    @Column
    private Integer templateStyleTypeId;

    @Column
    private String templatelogo;

    @OneToMany(mappedBy = "template")
    private Set<BcaInvoiceActivetemplates> templateBcaInvoiceActivetemplatess;

    @OneToMany(mappedBy = "template")
    private Set<BcaInvoiceLayoutcolumnsscreensetting> templateBcaInvoiceLayoutcolumnsscreensettings;

    @OneToMany(mappedBy = "template")
    private Set<BcaInvoiceLayoutcolumnssetting> templateBcaInvoiceLayoutcolumnssettings;

    @OneToMany(mappedBy = "template")
    private Set<BcaInvoiceLayoutfieldscreensetting> templateBcaInvoiceLayoutfieldscreensettings;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "template")
    private Set<BcaTemplateConfig> templateBcaTemplateConfigs;

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(final Integer templateId) {
        this.templateId = templateId;
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

    public String getType() {
        return type;
    }

    public void setType(final String type) {
        this.type = type;
    }

    public Boolean getIsSpecifiedPrintSetting() {
        return isSpecifiedPrintSetting;
    }

    public void setIsSpecifiedPrintSetting(final Boolean isSpecifiedPrintSetting) {
        this.isSpecifiedPrintSetting = isSpecifiedPrintSetting;
    }

    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(final String orientation) {
        this.orientation = orientation;
    }

    public String getNoOfCopies() {
        return noOfCopies;
    }

    public void setNoOfCopies(final String noOfCopies) {
        this.noOfCopies = noOfCopies;
    }

    public String getPageWidth() {
        return pageWidth;
    }

    public void setPageWidth(final String pageWidth) {
        this.pageWidth = pageWidth;
    }

    public String getPageHeight() {
        return pageHeight;
    }

    public void setPageHeight(final String pageHeight) {
        this.pageHeight = pageHeight;
    }

    public Boolean getPrintPageNumber() {
        return printPageNumber;
    }

    public void setPrintPageNumber(final Boolean printPageNumber) {
        this.printPageNumber = printPageNumber;
    }

    public Boolean getPrintStatus() {
        return printStatus;
    }

    public void setPrintStatus(final Boolean printStatus) {
        this.printStatus = printStatus;
    }

    public Boolean getIsPrintCompanyLogo() {
        return isPrintCompanyLogo;
    }

    public void setIsPrintCompanyLogo(final Boolean isPrintCompanyLogo) {
        this.isPrintCompanyLogo = isPrintCompanyLogo;
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

    public String getTemplatelogo() {
        return templatelogo;
    }

    public void setTemplatelogo(final String templatelogo) {
        this.templatelogo = templatelogo;
    }

    public Set<BcaInvoiceActivetemplates> getTemplateBcaInvoiceActivetemplatess() {
        return templateBcaInvoiceActivetemplatess;
    }

    public void setTemplateBcaInvoiceActivetemplatess(
            final Set<BcaInvoiceActivetemplates> templateBcaInvoiceActivetemplatess) {
        this.templateBcaInvoiceActivetemplatess = templateBcaInvoiceActivetemplatess;
    }

    public Set<BcaInvoiceLayoutcolumnsscreensetting> getTemplateBcaInvoiceLayoutcolumnsscreensettings(
            ) {
        return templateBcaInvoiceLayoutcolumnsscreensettings;
    }

    public void setTemplateBcaInvoiceLayoutcolumnsscreensettings(
            final Set<BcaInvoiceLayoutcolumnsscreensetting> templateBcaInvoiceLayoutcolumnsscreensettings) {
        this.templateBcaInvoiceLayoutcolumnsscreensettings = templateBcaInvoiceLayoutcolumnsscreensettings;
    }

    public Set<BcaInvoiceLayoutcolumnssetting> getTemplateBcaInvoiceLayoutcolumnssettings() {
        return templateBcaInvoiceLayoutcolumnssettings;
    }

    public void setTemplateBcaInvoiceLayoutcolumnssettings(
            final Set<BcaInvoiceLayoutcolumnssetting> templateBcaInvoiceLayoutcolumnssettings) {
        this.templateBcaInvoiceLayoutcolumnssettings = templateBcaInvoiceLayoutcolumnssettings;
    }

    public Set<BcaInvoiceLayoutfieldscreensetting> getTemplateBcaInvoiceLayoutfieldscreensettings(
            ) {
        return templateBcaInvoiceLayoutfieldscreensettings;
    }

    public void setTemplateBcaInvoiceLayoutfieldscreensettings(
            final Set<BcaInvoiceLayoutfieldscreensetting> templateBcaInvoiceLayoutfieldscreensettings) {
        this.templateBcaInvoiceLayoutfieldscreensettings = templateBcaInvoiceLayoutfieldscreensettings;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaTemplateConfig> getTemplateBcaTemplateConfigs() {
        return templateBcaTemplateConfigs;
    }

    public void setTemplateBcaTemplateConfigs(
            final Set<BcaTemplateConfig> templateBcaTemplateConfigs) {
        this.templateBcaTemplateConfigs = templateBcaTemplateConfigs;
    }

}
