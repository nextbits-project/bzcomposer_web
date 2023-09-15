package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaBudget {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer budgetId;

    @Column
    private Integer eyear;

    @Column
    private Integer companyBudget;

    @Column(length = 50)
    private String budgetName;

    @Column
    private Integer active;

    @Column
    private Integer isDefault;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "budget")
    private Set<BcaBudgetdetail> budgetBcaBudgetdetails;

    public Integer getBudgetId() {
        return budgetId;
    }

    public void setBudgetId(final Integer budgetId) {
        this.budgetId = budgetId;
    }

    public Integer getEyear() {
        return eyear;
    }

    public void setEyear(final Integer eyear) {
        this.eyear = eyear;
    }

    public Integer getCompanyBudget() {
        return companyBudget;
    }

    public void setCompanyBudget(final Integer companyBudget) {
        this.companyBudget = companyBudget;
    }

    public String getBudgetName() {
        return budgetName;
    }

    public void setBudgetName(final String budgetName) {
        this.budgetName = budgetName;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(final Integer isDefault) {
        this.isDefault = isDefault;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaBudgetdetail> getBudgetBcaBudgetdetails() {
        return budgetBcaBudgetdetails;
    }

    public void setBudgetBcaBudgetdetails(final Set<BcaBudgetdetail> budgetBcaBudgetdetails) {
        this.budgetBcaBudgetdetails = budgetBcaBudgetdetails;
    }

}
