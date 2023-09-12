package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class ItemCategoryDetails {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long categoryId;

    @Column(nullable = false, length = 45)
    private String parentId;

    @Column(nullable = false, unique = true, length = 45)
    private String categoryName;

    @Column(name = "\"description\"", length = 500)
    private String description;

    @Column
    private Boolean active;

    @Column
    private Boolean deleted;

    @Column(nullable = false)
    private OffsetDateTime dateAdded;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id", nullable = false)
    private BcaCompany company;

    @OneToMany(mappedBy = "category")
    private Set<ItemDetails> categoryItemDetailss;

    @OneToMany(mappedBy = "category")
    private Set<ItemDetails> categoryItemDetailss;

    @OneToMany(mappedBy = "category")
    private Set<ItemDetails> categoryItemDetailss;

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(final Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(final String parentId) {
        this.parentId = parentId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(final String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(final Boolean active) {
        this.active = active;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(final Boolean deleted) {
        this.deleted = deleted;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<ItemDetails> getCategoryItemDetailss() {
        return categoryItemDetailss;
    }

    public void setCategoryItemDetailss(final Set<ItemDetails> categoryItemDetailss) {
        this.categoryItemDetailss = categoryItemDetailss;
    }

    public Set<ItemDetails> getCategoryItemDetailss() {
        return categoryItemDetailss;
    }

    public void setCategoryItemDetailss(final Set<ItemDetails> categoryItemDetailss) {
        this.categoryItemDetailss = categoryItemDetailss;
    }

    public Set<ItemDetails> getCategoryItemDetailss() {
        return categoryItemDetailss;
    }

    public void setCategoryItemDetailss(final Set<ItemDetails> categoryItemDetailss) {
        this.categoryItemDetailss = categoryItemDetailss;
    }

}
