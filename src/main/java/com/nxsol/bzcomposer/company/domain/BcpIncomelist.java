package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name= "bcp_incomelist")
public class BcpIncomelist {

    @Id
    @Column(name= "IncomeListID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer incomeListId;

    @Column(name= "IncomeList", nullable = false, length = 128)
    private String incomeList;

    @Column(name= "Company", nullable = false)
    private Integer company;

    @Column(name= "Active")
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
