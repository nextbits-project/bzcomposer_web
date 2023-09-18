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
public class BcaCategorytype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryTypeId;

    @Column(length = 50)
    private String categoryTypeName;

    @Column
    private Boolean isActive;

    @OneToMany(mappedBy = "categoryType")
    private Set<BcaBusinesscategories> categoryTypeBcaBusinesscategoriess;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    public Integer getCategoryTypeId() {
        return categoryTypeId;
    }

    public void setCategoryTypeId(final Integer categoryTypeId) {
        this.categoryTypeId = categoryTypeId;
    }

    public String getCategoryTypeName() {
        return categoryTypeName;
    }

    public void setCategoryTypeName(final String categoryTypeName) {
        this.categoryTypeName = categoryTypeName;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(final Boolean isActive) {
        this.isActive = isActive;
    }

    public Set<BcaBusinesscategories> getCategoryTypeBcaBusinesscategoriess() {
        return categoryTypeBcaBusinesscategoriess;
    }

    public void setCategoryTypeBcaBusinesscategoriess(
            final Set<BcaBusinesscategories> categoryTypeBcaBusinesscategoriess) {
        this.categoryTypeBcaBusinesscategoriess = categoryTypeBcaBusinesscategoriess;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
