package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcpPayrollperiod {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer payrollPeriodId;

    @Column(length = 50)
    private String payrollPeriod;

    @Column
    private Integer companyId;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "payrollPeriod")
    private Set<BcpEmployee> payrollPeriodBcpEmployees;

    @OneToMany(mappedBy = "payrollPeriod")
    private Set<BcpIncome> payrollPeriodBcpIncomes;

    public Integer getPayrollPeriodId() {
        return payrollPeriodId;
    }

    public void setPayrollPeriodId(final Integer payrollPeriodId) {
        this.payrollPeriodId = payrollPeriodId;
    }

    public String getPayrollPeriod() {
        return payrollPeriod;
    }

    public void setPayrollPeriod(final String payrollPeriod) {
        this.payrollPeriod = payrollPeriod;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcpEmployee> getPayrollPeriodBcpEmployees() {
        return payrollPeriodBcpEmployees;
    }

    public void setPayrollPeriodBcpEmployees(final Set<BcpEmployee> payrollPeriodBcpEmployees) {
        this.payrollPeriodBcpEmployees = payrollPeriodBcpEmployees;
    }

    public Set<BcpIncome> getPayrollPeriodBcpIncomes() {
        return payrollPeriodBcpIncomes;
    }

    public void setPayrollPeriodBcpIncomes(final Set<BcpIncome> payrollPeriodBcpIncomes) {
        this.payrollPeriodBcpIncomes = payrollPeriodBcpIncomes;
    }

}
