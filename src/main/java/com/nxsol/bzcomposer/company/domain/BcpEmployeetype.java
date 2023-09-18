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
public class BcpEmployeetype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer employeeTypeId;

    @Column(length = 50)
    private String employeeType;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "employeeType")
    private Set<BcpEmployee> employeeTypeBcpEmployees;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "employeeType")
    private Set<BcpIncome> employeeTypeBcpIncomes;

    public Integer getEmployeeTypeId() {
        return employeeTypeId;
    }

    public void setEmployeeTypeId(final Integer employeeTypeId) {
        this.employeeTypeId = employeeTypeId;
    }

    public String getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(final String employeeType) {
        this.employeeType = employeeType;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcpEmployee> getEmployeeTypeBcpEmployees() {
        return employeeTypeBcpEmployees;
    }

    public void setEmployeeTypeBcpEmployees(final Set<BcpEmployee> employeeTypeBcpEmployees) {
        this.employeeTypeBcpEmployees = employeeTypeBcpEmployees;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcpIncome> getEmployeeTypeBcpIncomes() {
        return employeeTypeBcpIncomes;
    }

    public void setEmployeeTypeBcpIncomes(final Set<BcpIncome> employeeTypeBcpIncomes) {
        this.employeeTypeBcpIncomes = employeeTypeBcpIncomes;
    }

}
