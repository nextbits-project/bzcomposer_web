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
    private Integer budgetCategoryId;

    @Column
    private Boolean isActive;

    @OneToMany(mappedBy = "category")
    private Set<BcaAccountable> categoryBcaAccountables;

    @OneToMany(mappedBy = "category")
    private Set<BcaBill> categoryBcaBills;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "category")
    private Set<BcaClientvendor> categoryBcaClientvendors;

    @OneToMany(mappedBy = "category")
    private Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "category")
    private Set<BcaInvoice> categoryBcaInvoices;

    @OneToMany(mappedBy = "category")
    private Set<BcaInvoicediscount> categoryBcaInvoicediscounts;

    @OneToMany(mappedBy = "category")
    private Set<BcaInvoiceshipped> categoryBcaInvoiceshippeds;

    @OneToMany(mappedBy = "category")
    private Set<BcaIteminventory> categoryBcaIteminventorys;

    @OneToMany(mappedBy = "category")
    private Set<BcaPayment> categoryBcaPayments;

    @OneToMany(mappedBy = "category")
    private Set<StorageCart> categoryStorageCarts;

    @OneToMany(mappedBy = "category")
    private Set<StorageClientvendor> categoryStorageClientvendors;

    @OneToMany(mappedBy = "category")
    private Set<StorageInvoice> categoryStorageInvoices;

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

    public Set<BcaBill> getCategoryBcaBills() {
        return categoryBcaBills;
    }

    public void setCategoryBcaBills(final Set<BcaBill> categoryBcaBills) {
        this.categoryBcaBills = categoryBcaBills;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaClientvendor> getCategoryBcaClientvendors() {
        return categoryBcaClientvendors;
    }

    public void setCategoryBcaClientvendors(final Set<BcaClientvendor> categoryBcaClientvendors) {
        this.categoryBcaClientvendors = categoryBcaClientvendors;
    }

    public Set<BcaEsalesitemcategory> getCategoryBcaEsalesitemcategorys() {
        return categoryBcaEsalesitemcategorys;
    }

    public void setCategoryBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> categoryBcaEsalesitemcategorys) {
        this.categoryBcaEsalesitemcategorys = categoryBcaEsalesitemcategorys;
    }

    public Set<BcaInvoice> getCategoryBcaInvoices() {
        return categoryBcaInvoices;
    }

    public void setCategoryBcaInvoices(final Set<BcaInvoice> categoryBcaInvoices) {
        this.categoryBcaInvoices = categoryBcaInvoices;
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

    public Set<BcaIteminventory> getCategoryBcaIteminventorys() {
        return categoryBcaIteminventorys;
    }

    public void setCategoryBcaIteminventorys(
            final Set<BcaIteminventory> categoryBcaIteminventorys) {
        this.categoryBcaIteminventorys = categoryBcaIteminventorys;
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

    public Set<StorageClientvendor> getCategoryStorageClientvendors() {
        return categoryStorageClientvendors;
    }

    public void setCategoryStorageClientvendors(
            final Set<StorageClientvendor> categoryStorageClientvendors) {
        this.categoryStorageClientvendors = categoryStorageClientvendors;
    }

    public Set<StorageInvoice> getCategoryStorageInvoices() {
        return categoryStorageInvoices;
    }

    public void setCategoryStorageInvoices(final Set<StorageInvoice> categoryStorageInvoices) {
        this.categoryStorageInvoices = categoryStorageInvoices;
    }

}
