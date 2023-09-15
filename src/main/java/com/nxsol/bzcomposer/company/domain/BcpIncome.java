package com.nxsol.bzcomposer.company.domain;

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
public class BcpIncome {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer incomeId;

    @Column(precision = 23, scale = 4)
    private BigDecimal incomeAmount;

    @Column
    private Integer deductionId;

    @Column
    private Integer active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_type_id")
    private BcpEmployeetype employeeType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "income_list_id")
    private BcpIncomelist incomeList;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payroll_period_id")
    private BcpPayrollperiod payrollPeriod;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id")
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
