package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.math.BigDecimal;


@Entity
public class BcpFilingstate {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer filingStateId;

    @Column(length = 50)
    private String filingState;

    @Column(length = 50)
    private String filingStateTaxId;

    @Column
    private Boolean useSit;

    @Column
    private Integer sittaxYear;

    @Column
    private Double sitrate;

    @Column
    private Boolean useOtherStateTaxName1;

    @Column(length = 50)
    private String otherStateTaxName1;

    @Column(precision = 23, scale = 4)
    private BigDecimal otherStateTaxRate1;

    @Column(precision = 23, scale = 4)
    private BigDecimal otherStateTaxLimit1;

    @Column
    private Boolean useOtherStateTaxName2;

    @Column(length = 50)
    private String otherStateTaxName2;

    @Column(precision = 23, scale = 4)
    private BigDecimal otherStateTaxLimit2;

    @Column(precision = 23, scale = 4)
    private BigDecimal otherStateTaxRate2;

    @Column
    private Boolean useOtherStateTaxName3;

    @Column(length = 50)
    private String otherStateTaxName3;

    @Column(precision = 23, scale = 4)
    private BigDecimal otherStateTaxLimit3;

    @Column(precision = 23, scale = 4)
    private BigDecimal otherStateTaxRate3;

    @Column
    private Integer active;

    @Column
    private Boolean setAsDefault;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getFilingStateId() {
        return filingStateId;
    }

    public void setFilingStateId(final Integer filingStateId) {
        this.filingStateId = filingStateId;
    }

    public String getFilingState() {
        return filingState;
    }

    public void setFilingState(final String filingState) {
        this.filingState = filingState;
    }

    public String getFilingStateTaxId() {
        return filingStateTaxId;
    }

    public void setFilingStateTaxId(final String filingStateTaxId) {
        this.filingStateTaxId = filingStateTaxId;
    }

    public Boolean getUseSit() {
        return useSit;
    }

    public void setUseSit(final Boolean useSit) {
        this.useSit = useSit;
    }

    public Integer getSittaxYear() {
        return sittaxYear;
    }

    public void setSittaxYear(final Integer sittaxYear) {
        this.sittaxYear = sittaxYear;
    }

    public Double getSitrate() {
        return sitrate;
    }

    public void setSitrate(final Double sitrate) {
        this.sitrate = sitrate;
    }

    public Boolean getUseOtherStateTaxName1() {
        return useOtherStateTaxName1;
    }

    public void setUseOtherStateTaxName1(final Boolean useOtherStateTaxName1) {
        this.useOtherStateTaxName1 = useOtherStateTaxName1;
    }

    public String getOtherStateTaxName1() {
        return otherStateTaxName1;
    }

    public void setOtherStateTaxName1(final String otherStateTaxName1) {
        this.otherStateTaxName1 = otherStateTaxName1;
    }

    public BigDecimal getOtherStateTaxRate1() {
        return otherStateTaxRate1;
    }

    public void setOtherStateTaxRate1(final BigDecimal otherStateTaxRate1) {
        this.otherStateTaxRate1 = otherStateTaxRate1;
    }

    public BigDecimal getOtherStateTaxLimit1() {
        return otherStateTaxLimit1;
    }

    public void setOtherStateTaxLimit1(final BigDecimal otherStateTaxLimit1) {
        this.otherStateTaxLimit1 = otherStateTaxLimit1;
    }

    public Boolean getUseOtherStateTaxName2() {
        return useOtherStateTaxName2;
    }

    public void setUseOtherStateTaxName2(final Boolean useOtherStateTaxName2) {
        this.useOtherStateTaxName2 = useOtherStateTaxName2;
    }

    public String getOtherStateTaxName2() {
        return otherStateTaxName2;
    }

    public void setOtherStateTaxName2(final String otherStateTaxName2) {
        this.otherStateTaxName2 = otherStateTaxName2;
    }

    public BigDecimal getOtherStateTaxLimit2() {
        return otherStateTaxLimit2;
    }

    public void setOtherStateTaxLimit2(final BigDecimal otherStateTaxLimit2) {
        this.otherStateTaxLimit2 = otherStateTaxLimit2;
    }

    public BigDecimal getOtherStateTaxRate2() {
        return otherStateTaxRate2;
    }

    public void setOtherStateTaxRate2(final BigDecimal otherStateTaxRate2) {
        this.otherStateTaxRate2 = otherStateTaxRate2;
    }

    public Boolean getUseOtherStateTaxName3() {
        return useOtherStateTaxName3;
    }

    public void setUseOtherStateTaxName3(final Boolean useOtherStateTaxName3) {
        this.useOtherStateTaxName3 = useOtherStateTaxName3;
    }

    public String getOtherStateTaxName3() {
        return otherStateTaxName3;
    }

    public void setOtherStateTaxName3(final String otherStateTaxName3) {
        this.otherStateTaxName3 = otherStateTaxName3;
    }

    public BigDecimal getOtherStateTaxLimit3() {
        return otherStateTaxLimit3;
    }

    public void setOtherStateTaxLimit3(final BigDecimal otherStateTaxLimit3) {
        this.otherStateTaxLimit3 = otherStateTaxLimit3;
    }

    public BigDecimal getOtherStateTaxRate3() {
        return otherStateTaxRate3;
    }

    public void setOtherStateTaxRate3(final BigDecimal otherStateTaxRate3) {
        this.otherStateTaxRate3 = otherStateTaxRate3;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Boolean getSetAsDefault() {
        return setAsDefault;
    }

    public void setSetAsDefault(final Boolean setAsDefault) {
        this.setAsDefault = setAsDefault;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
