package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaBusinesscategories {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryId;

    @Column(length = 50)
    private String name;

    @Column(length = 100)
    private String cateNumber;

    @Column(length = 50)
    private String parent;

    @Column(name = "\"description\"")
    private String description;

    @Column
    private Integer budgetCategoryId;

    @Column
    private Boolean isActive;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_type_id")
    private BcaCategorytype categoryType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "business_type_id")
    private BcaBusinesstype businessType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_type_id")
    private BcaCategorytype categoryType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "business_type_id")
    private BcaBusinesstype businessType;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(final Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getCateNumber() {
        return cateNumber;
    }

    public void setCateNumber(final String cateNumber) {
        this.cateNumber = cateNumber;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(final String parent) {
        this.parent = parent;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public Integer getBudgetCategoryId() {
        return budgetCategoryId;
    }

    public void setBudgetCategoryId(final Integer budgetCategoryId) {
        this.budgetCategoryId = budgetCategoryId;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(final Boolean isActive) {
        this.isActive = isActive;
    }

    public BcaCategorytype getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(final BcaCategorytype categoryType) {
        this.categoryType = categoryType;
    }

    public BcaBusinesstype getBusinessType() {
        return businessType;
    }

    public void setBusinessType(final BcaBusinesstype businessType) {
        this.businessType = businessType;
    }

    public BcaCategorytype getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(final BcaCategorytype categoryType) {
        this.categoryType = categoryType;
    }

    public BcaBusinesstype getBusinessType() {
        return businessType;
    }

    public void setBusinessType(final BcaBusinesstype businessType) {
        this.businessType = businessType;
    }

}
