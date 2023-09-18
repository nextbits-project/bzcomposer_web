package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
    private Integer active;

    @OneToMany(mappedBy = "payrollPeriod")
    private Set<BcpEmployee> payrollPeriodBcpEmployees;

    @OneToMany(mappedBy = "payrollPeriod")
    private Set<BcpIncome> payrollPeriodBcpIncomes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
