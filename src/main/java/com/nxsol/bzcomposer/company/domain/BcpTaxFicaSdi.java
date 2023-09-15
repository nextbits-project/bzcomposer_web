package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.math.BigDecimal;
import java.time.OffsetDateTime;


@Entity
public class BcpTaxFicaSdi {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer companyId;

    @Column(length = 50)
    private String fid;

    @Column(length = 50)
    private String fiscalMonth;

    @Column
    private Boolean useFica;

    @Column
    private Double ficarate;

    @Column
    private Boolean useSocialTax;

    @Column(precision = 23, scale = 4)
    private BigDecimal socialTaxRate;

    @Column(precision = 23, scale = 4)
    private BigDecimal socialTaxLimit;

    @Column
    private Boolean useMedicareTax;

    @Column(precision = 23, scale = 4)
    private BigDecimal medicareTaxRate;

    @Column
    private Boolean useFit;

    @Column
    private Integer fityear;

    @Column
    private Double fitrate;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer active;

    @Column
    private Double futarate;

    @Column
    private Boolean selectedFit;

    @Column
    private Boolean auto;

    @Column
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
