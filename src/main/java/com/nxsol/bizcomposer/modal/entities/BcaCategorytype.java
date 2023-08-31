package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
    private Integer companyId;

    @Column
    private Boolean isActive;

    @OneToMany(mappedBy = "categoryType")
    private Set<BcaBalancesheetitem> categoryTypeBcaBalancesheetitems;

    @OneToMany(mappedBy = "categoryType")
    private Set<BcaBusinesscategories> categoryTypeBcaBusinesscategoriess;

    @OneToMany(mappedBy = "categoryType")
    private Set<BcaBusinesscategories> categoryTypeBcaBusinesscategoriess;

    @OneToMany(mappedBy = "categoryType")
    private Set<BcaMasterbalancesheetitem> categoryTypeBcaMasterbalancesheetitems;

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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(final Boolean isActive) {
        this.isActive = isActive;
    }

    public Set<BcaBalancesheetitem> getCategoryTypeBcaBalancesheetitems() {
        return categoryTypeBcaBalancesheetitems;
    }

    public void setCategoryTypeBcaBalancesheetitems(
            final Set<BcaBalancesheetitem> categoryTypeBcaBalancesheetitems) {
        this.categoryTypeBcaBalancesheetitems = categoryTypeBcaBalancesheetitems;
    }

    public Set<BcaBusinesscategories> getCategoryTypeBcaBusinesscategoriess() {
        return categoryTypeBcaBusinesscategoriess;
    }

    public void setCategoryTypeBcaBusinesscategoriess(
            final Set<BcaBusinesscategories> categoryTypeBcaBusinesscategoriess) {
        this.categoryTypeBcaBusinesscategoriess = categoryTypeBcaBusinesscategoriess;
    }

    public Set<BcaBusinesscategories> getCategoryTypeBcaBusinesscategoriess() {
        return categoryTypeBcaBusinesscategoriess;
    }

    public void setCategoryTypeBcaBusinesscategoriess(
            final Set<BcaBusinesscategories> categoryTypeBcaBusinesscategoriess) {
        this.categoryTypeBcaBusinesscategoriess = categoryTypeBcaBusinesscategoriess;
    }

    public Set<BcaMasterbalancesheetitem> getCategoryTypeBcaMasterbalancesheetitems() {
        return categoryTypeBcaMasterbalancesheetitems;
    }

    public void setCategoryTypeBcaMasterbalancesheetitems(
            final Set<BcaMasterbalancesheetitem> categoryTypeBcaMasterbalancesheetitems) {
        this.categoryTypeBcaMasterbalancesheetitems = categoryTypeBcaMasterbalancesheetitems;
    }

}
