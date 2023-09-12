package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaCategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryId;

    @Column
    private Integer categoryTypeId;

    @Column(length = 50)
    private String name;

    @Column(length = 100)
    private String cateNumber;

    @Column(length = 50)
    private String parent;

    @Column(name = "\"description\"")
    private String description;

    @Column
    private Integer companyId;

    @Column
    private Integer budgetCategoryId;

    @Column
    private Boolean isActive;

    @OneToMany(mappedBy = "category")
    private Set<BcaAccountable> categoryBcaAccountables;

    @OneToMany(mappedBy = "category")
    private Set<BcaAccountable> categoryBcaAccountables;

    @OneToMany(mappedBy = "category")
    private Set<BcaAccountable> categoryBcaAccountables;

    @OneToMany(mappedBy = "category")
    private Set<BcaBill> categoryBcaBills;

    @OneToMany(mappedBy = "category")
    private Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "category")
    private Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "category")
    private Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "category")
    private Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "category")
    private Set<BcaInvoicediscount> categoryBcaInvoicediscounts;

    @OneToMany(mappedBy = "category")
    private Set<BcaInvoicediscount> categoryBcaInvoicediscounts;

    @OneToMany(mappedBy = "category")
    private Set<BcaInvoicediscount> categoryBcaInvoicediscounts;

    @OneToMany(mappedBy = "category")
    private Set<BcaInvoiceshipped> categoryBcaInvoiceshippeds;

    @OneToMany(mappedBy = "category")
    private Set<BcaPayment> categoryBcaPayments;

    @OneToMany(mappedBy = "category")
    private Set<StorageCart> categoryStorageCarts;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(final Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getCategoryTypeId() {
        return categoryTypeId;
    }

    public void setCategoryTypeId(final Integer categoryTypeId) {
        this.categoryTypeId = categoryTypeId;
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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

    public Set<BcaAccountable> getCategoryBcaAccountables() {
        return categoryBcaAccountables;
    }

    public void setCategoryBcaAccountables(final Set<BcaAccountable> categoryBcaAccountables) {
        this.categoryBcaAccountables = categoryBcaAccountables;
    }

    public Set<BcaAccountable> getCategoryBcaAccountables() {
        return categoryBcaAccountables;
    }

    public void setCategoryBcaAccountables(final Set<BcaAccountable> categoryBcaAccountables) {
        this.categoryBcaAccountables = categoryBcaAccountables;
    }

    public Set<BcaAccountable> getCategoryBcaAccountables() {
        return categoryBcaAccountables;
    }

    public void setCategoryBcaAccountables(final Set<BcaAccountable> categoryBcaAccountables) {
        this.categoryBcaAccountables = categoryBcaAccountables;
    }

    public Set<BcaBill> getCategoryBcaBills() {
        return categoryBcaBills;
    }

    public void setCategoryBcaBills(final Set<BcaBill> categoryBcaBills) {
        this.categoryBcaBills = categoryBcaBills;
    }

    public Set<BcaEsalesitemcategory> getCategoryBcaEsalesitemcategorys() {
        return categoryBcaEsalesitemcategorys;
    }

    public void setCategoryBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys) {
        this.categoryBcaEsalesitemcategorys = categoryBcaEsalesitemcategorys;
    }

    public Set<BcaEsalesitemcategory> getCategoryBcaEsalesitemcategorys() {
        return categoryBcaEsalesitemcategorys;
    }

    public void setCategoryBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys) {
        this.categoryBcaEsalesitemcategorys = categoryBcaEsalesitemcategorys;
    }

    public Set<BcaEsalesitemcategory> getCategoryBcaEsalesitemcategorys() {
        return categoryBcaEsalesitemcategorys;
    }

    public void setCategoryBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys) {
        this.categoryBcaEsalesitemcategorys = categoryBcaEsalesitemcategorys;
    }

    public Set<BcaEsalesitemcategory> getCategoryBcaEsalesitemcategorys() {
        return categoryBcaEsalesitemcategorys;
    }

    public void setCategoryBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys) {
        this.categoryBcaEsalesitemcategorys = categoryBcaEsalesitemcategorys;
    }

    public Set<BcaInvoicediscount> getCategoryBcaInvoicediscounts() {
        return categoryBcaInvoicediscounts;
    }

    public void setCategoryBcaInvoicediscounts(
            final Set<BcaInvoicediscount> categoryBcaInvoicediscounts) {
        this.categoryBcaInvoicediscounts = categoryBcaInvoicediscounts;
    }

    public Set<BcaInvoicediscount> getCategoryBcaInvoicediscounts() {
        return categoryBcaInvoicediscounts;
    }

    public void setCategoryBcaInvoicediscounts(
            final Set<BcaInvoicediscount> categoryBcaInvoicediscounts) {
        this.categoryBcaInvoicediscounts = categoryBcaInvoicediscounts;
    }

    public Set<BcaInvoicediscount> getCategoryBcaInvoicediscounts() {
        return categoryBcaInvoicediscounts;
    }

    public void setCategoryBcaInvoicediscounts(
            final Set<BcaInvoicediscount> categoryBcaInvoicediscounts) {
        this.categoryBcaInvoicediscounts = categoryBcaInvoicediscounts;
    }

    public Set<BcaInvoiceshipped> getCategoryBcaInvoiceshippeds() {
        return categoryBcaInvoiceshippeds;
    }

    public void setCategoryBcaInvoiceshippeds(
            final Set<BcaInvoiceshipped> categoryBcaInvoiceshippeds) {
        this.categoryBcaInvoiceshippeds = categoryBcaInvoiceshippeds;
    }

    public Set<BcaPayment> getCategoryBcaPayments() {
        return categoryBcaPayments;
    }

    public void setCategoryBcaPayments(final Set<BcaPayment> categoryBcaPayments) {
        this.categoryBcaPayments = categoryBcaPayments;
    }

    public Set<StorageCart> getCategoryStorageCarts() {
        return categoryStorageCarts;
    }

    public void setCategoryStorageCarts(final Set<StorageCart> categoryStorageCarts) {
        this.categoryStorageCarts = categoryStorageCarts;
    }

}
