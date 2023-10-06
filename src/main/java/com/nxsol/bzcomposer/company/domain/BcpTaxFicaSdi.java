package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_tax_fica_sdi")
public class BcpTaxFicaSdi {

    @Id
    @Column(name= "CompanyID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer companyId;

    @Column(name= "FID", length = 50)
    private String fid;

    @Column(name= "FiscalMonth", length = 50)
    private String fiscalMonth;

    @Column(name= "UseFICA")
    private Boolean useFica;

    @Column(name= "FICARate")
    private Double ficarate;

    @Column(name= "UseSocialTax")
    private Boolean useSocialTax;

    @Column(name= "SocialTaxRate", precision = 23, scale = 4)
    private BigDecimal socialTaxRate;

    @Column(name= "SocialTaxLimit", precision = 23, scale = 4)
    private BigDecimal socialTaxLimit;

    @Column(name= "UseMedicareTax")
    private Boolean useMedicareTax;

    @Column(name= "MedicareTaxRate", precision = 23, scale = 4)
    private BigDecimal medicareTaxRate;

    @Column(name= "UseFIT")
    private Boolean useFit;

    @Column(name= "FITYear")
    private Integer fityear;

    @Column(name= "FITRate")
    private Double fitrate;

    @Column(name= "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name= "Active")
    private Integer active;

    @Column(name= "FUTARate")
    private Double futarate;

    @Column(name= "selectedFIT")
    private Boolean selectedFit;

    @Column(name= "auto")
    private Boolean auto;

    @Column(name= "autoFIT")
    private Boolean autoFit;

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getFid() {
        return fid;
    }

    public void setFid(final String fid) {
        this.fid = fid;
    }

    public String getFiscalMonth() {
        return fiscalMonth;
    }

    public void setFiscalMonth(final String fiscalMonth) {
        this.fiscalMonth = fiscalMonth;
    }

    public Boolean getUseFica() {
        return useFica;
    }

    public void setUseFica(final Boolean useFica) {
        this.useFica = useFica;
    }

    public Double getFicarate() {
        return ficarate;
    }

    public void setFicarate(final Double ficarate) {
        this.ficarate = ficarate;
    }

    public Boolean getUseSocialTax() {
        return useSocialTax;
    }

    public void setUseSocialTax(final Boolean useSocialTax) {
        this.useSocialTax = useSocialTax;
    }

    public BigDecimal getSocialTaxRate() {
        return socialTaxRate;
    }

    public void setSocialTaxRate(final BigDecimal socialTaxRate) {
        this.socialTaxRate = socialTaxRate;
    }

    public BigDecimal getSocialTaxLimit() {
        return socialTaxLimit;
    }

    public void setSocialTaxLimit(final BigDecimal socialTaxLimit) {
        this.socialTaxLimit = socialTaxLimit;
    }

    public Boolean getUseMedicareTax() {
        return useMedicareTax;
    }

    public void setUseMedicareTax(final Boolean useMedicareTax) {
        this.useMedicareTax = useMedicareTax;
    }

    public BigDecimal getMedicareTaxRate() {
        return medicareTaxRate;
    }

    public void setMedicareTaxRate(final BigDecimal medicareTaxRate) {
        this.medicareTaxRate = medicareTaxRate;
    }

    public Boolean getUseFit() {
        return useFit;
    }

    public void setUseFit(final Boolean useFit) {
        this.useFit = useFit;
    }

    public Integer getFityear() {
        return fityear;
    }

    public void setFityear(final Integer fityear) {
        this.fityear = fityear;
    }

    public Double getFitrate() {
        return fitrate;
    }

    public void setFitrate(final Double fitrate) {
        this.fitrate = fitrate;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Double getFutarate() {
        return futarate;
    }

    public void setFutarate(final Double futarate) {
        this.futarate = futarate;
    }

    public Boolean getSelectedFit() {
        return selectedFit;
    }

    public void setSelectedFit(final Boolean selectedFit) {
        this.selectedFit = selectedFit;
    }

    public Boolean getAuto() {
        return auto;
    }

    public void setAuto(final Boolean auto) {
        this.auto = auto;
    }

    public Boolean getAutoFit() {
        return autoFit;
    }

    public void setAutoFit(final Boolean autoFit) {
        this.autoFit = autoFit;
    }

}
