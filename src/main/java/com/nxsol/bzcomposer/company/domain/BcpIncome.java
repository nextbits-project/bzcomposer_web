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
import javax.persistence.Table;

@Entity
@Table(name= "bcp_income")
public class BcpIncome {

    @Id
    @Column(name= "IncomeID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer incomeId;

    @Column(name= "IncomeAmount", precision = 23, scale = 4)
    private BigDecimal incomeAmount;

    @Column(name= "DeductionID")
    private Integer deductionId;

    @Column(name= "Active")
    private Integer active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeTypeID")
    private BcpEmployeetype employeeType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IncomeListID")
    private BcpIncomelist incomeList;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PayrollPeriodID")
    private BcpPayrollperiod payrollPeriod;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeID")
    private BcpEmployee employee;

    public Integer getIncomeId() {
        return incomeId;
    }

    public void setIncomeId(final Integer incomeId) {
        this.incomeId = incomeId;
    }

    public BigDecimal getIncomeAmount() {
        return incomeAmount;
    }

    public void setIncomeAmount(final BigDecimal incomeAmount) {
        this.incomeAmount = incomeAmount;
    }

    public Integer getDeductionId() {
        return deductionId;
    }

    public void setDeductionId(final Integer deductionId) {
        this.deductionId = deductionId;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcpEmployeetype getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(final BcpEmployeetype employeeType) {
        this.employeeType = employeeType;
    }

    public BcpIncomelist getIncomeList() {
        return incomeList;
    }

    public void setIncomeList(final BcpIncomelist incomeList) {
        this.incomeList = incomeList;
    }

    public BcpPayrollperiod getPayrollPeriod() {
        return payrollPeriod;
    }

    public void setPayrollPeriod(final BcpPayrollperiod payrollPeriod) {
        this.payrollPeriod = payrollPeriod;
    }

    public BcpEmployee getEmployee() {
        return employee;
    }

    public void setEmployee(final BcpEmployee employee) {
        this.employee = employee;
    }

}
