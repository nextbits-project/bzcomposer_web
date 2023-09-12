package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
    private Integer companyId;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "employeeType")
    private Set<BcpEmployee> employeeTypeBcpEmployees;

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

    public Set<BcpEmployee> getEmployeeTypeBcpEmployees() {
        return employeeTypeBcpEmployees;
    }

    public void setEmployeeTypeBcpEmployees(final Set<BcpEmployee> employeeTypeBcpEmployees) {
        this.employeeTypeBcpEmployees = employeeTypeBcpEmployees;
    }

    public Set<BcpIncome> getEmployeeTypeBcpIncomes() {
        return employeeTypeBcpIncomes;
    }

    public void setEmployeeTypeBcpIncomes(final Set<BcpIncome> employeeTypeBcpIncomes) {
        this.employeeTypeBcpIncomes = employeeTypeBcpIncomes;
    }

}
