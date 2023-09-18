package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class BcaBudgetcategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer budgetCategoryId;

    @Column(length = 50)
    private String budgetCategoryName;

    @Column
    private Integer budgetCategoryNumber;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Boolean isActive;

    @Column
    private Double threshold;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getBudgetCategoryId() {
        return budgetCategoryId;
    }

    public void setBudgetCategoryId(final Integer budgetCategoryId) {
        this.budgetCategoryId = budgetCategoryId;
    }

    public String getBudgetCategoryName() {
        return budgetCategoryName;
    }

    public void setBudgetCategoryName(final String budgetCategoryName) {
        this.budgetCategoryName = budgetCategoryName;
    }

    public Integer getBudgetCategoryNumber() {
        return budgetCategoryNumber;
    }

    public void setBudgetCategoryNumber(final Integer budgetCategoryNumber) {
        this.budgetCategoryNumber = budgetCategoryNumber;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(final Boolean isActive) {
        this.isActive = isActive;
    }

    public Double getThreshold() {
        return threshold;
    }

    public void setThreshold(final Double threshold) {
        this.threshold = threshold;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
