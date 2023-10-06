package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_payroll")
public class BcpPayroll {

    @Id
    @Column(name= "PayrollDate", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long payrollDate;

    @Column(name= "EmployeeID", nullable = false)
    private Integer employeeId;

    @Column(name= "WorkFrom")
    private OffsetDateTime workFrom;

    @Column(name= "WorkTo")
    private OffsetDateTime workTo;

    @Column(name= "NetAmount", precision = 23, scale = 4)
    private BigDecimal netAmount;

    @Column(name= "GrossAmount", precision = 23, scale = 4)
    private BigDecimal grossAmount;

    @Column(name= "FT_SST", precision = 23, scale = 4)
    private BigDecimal ftSst;

    @Column(name= "FT_Medicare", precision = 23, scale = 4)
    private BigDecimal ftMedicare;

    @Column(name= "FT_FIT", precision = 23, scale = 4)
    private BigDecimal ftFit;

    @Column(name= "StateFiled", length = 2)
    private String stateFiled;

    @Column(name= "ST_SIT", precision = 23, scale = 4)
    private BigDecimal stSit;

    @Column(name= "ST_Other1", precision = 23, scale = 4)
    private BigDecimal stOther1;

    @Column(name= "ST_Other2", precision = 23, scale = 4)
    private BigDecimal stOther2;

    @Column(name= "CompanyTaxAmount", precision = 23, scale = 4)
    private BigDecimal companyTaxAmount;

    @Column(name= "CompanyTaxDetail", columnDefinition = "longtext")
    private String companyTaxDetail;

    @Column(name= "CheckPrinted")
    private Boolean checkPrinted;

    @Column(name= "CheckPrintedDate")
    private OffsetDateTime checkPrintedDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    public Long getPayrollDate() {
        return payrollDate;
    }

    public void setPayrollDate(final Long payrollDate) {
        this.payrollDate = payrollDate;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(final Integer employeeId) {
        this.employeeId = employeeId;
    }

    public OffsetDateTime getWorkFrom() {
        return workFrom;
    }

    public void setWorkFrom(final OffsetDateTime workFrom) {
        this.workFrom = workFrom;
    }

    public OffsetDateTime getWorkTo() {
        return workTo;
    }

    public void setWorkTo(final OffsetDateTime workTo) {
        this.workTo = workTo;
    }

    public BigDecimal getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(final BigDecimal netAmount) {
        this.netAmount = netAmount;
    }

    public BigDecimal getGrossAmount() {
        return grossAmount;
    }

    public void setGrossAmount(final BigDecimal grossAmount) {
        this.grossAmount = grossAmount;
    }

    public BigDecimal getFtSst() {
        return ftSst;
    }

    public void setFtSst(final BigDecimal ftSst) {
        this.ftSst = ftSst;
    }

    public BigDecimal getFtMedicare() {
        return ftMedicare;
    }

    public void setFtMedicare(final BigDecimal ftMedicare) {
        this.ftMedicare = ftMedicare;
    }

    public BigDecimal getFtFit() {
        return ftFit;
    }

    public void setFtFit(final BigDecimal ftFit) {
        this.ftFit = ftFit;
    }

    public String getStateFiled() {
        return stateFiled;
    }

    public void setStateFiled(final String stateFiled) {
        this.stateFiled = stateFiled;
    }

    public BigDecimal getStSit() {
        return stSit;
    }

    public void setStSit(final BigDecimal stSit) {
        this.stSit = stSit;
    }

    public BigDecimal getStOther1() {
        return stOther1;
    }

    public void setStOther1(final BigDecimal stOther1) {
        this.stOther1 = stOther1;
    }

    public BigDecimal getStOther2() {
        return stOther2;
    }

    public void setStOther2(final BigDecimal stOther2) {
        this.stOther2 = stOther2;
    }

    public BigDecimal getCompanyTaxAmount() {
        return companyTaxAmount;
    }

    public void setCompanyTaxAmount(final BigDecimal companyTaxAmount) {
        this.companyTaxAmount = companyTaxAmount;
    }

    public String getCompanyTaxDetail() {
        return companyTaxDetail;
    }

    public void setCompanyTaxDetail(final String companyTaxDetail) {
        this.companyTaxDetail = companyTaxDetail;
    }

    public Boolean getCheckPrinted() {
        return checkPrinted;
    }

    public void setCheckPrinted(final Boolean checkPrinted) {
        this.checkPrinted = checkPrinted;
    }

    public OffsetDateTime getCheckPrintedDate() {
        return checkPrintedDate;
    }

    public void setCheckPrintedDate(final OffsetDateTime checkPrintedDate) {
        this.checkPrintedDate = checkPrintedDate;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
