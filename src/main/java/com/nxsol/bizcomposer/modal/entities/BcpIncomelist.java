package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcpIncomelist {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer incomeListId;

    @Column(nullable = false, length = 128)
    private String incomeList;

    @Column(nullable = false)
    private Integer company;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "incomeList")
    private Set<BcpIncome> incomeListBcpIncomes;

    public Integer getIncomeListId() {
        return incomeListId;
    }

    public void setIncomeListId(final Integer incomeListId) {
        this.incomeListId = incomeListId;
    }

    public String getIncomeList() {
        return incomeList;
    }

    public void setIncomeList(final String incomeList) {
        this.incomeList = incomeList;
    }

    public Integer getCompany() {
        return company;
    }

    public void setCompany(final Integer company) {
        this.company = company;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcpIncome> getIncomeListBcpIncomes() {
        return incomeListBcpIncomes;
    }

    public void setIncomeListBcpIncomes(final Set<BcpIncome> incomeListBcpIncomes) {
        this.incomeListBcpIncomes = incomeListBcpIncomes;
    }

}
