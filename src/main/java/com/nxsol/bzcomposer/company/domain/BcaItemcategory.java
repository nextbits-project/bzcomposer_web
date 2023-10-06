package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_itemcategory")
public class BcaItemcategory {

    @Id
    @Column(name= "ItemCategoryID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer itemCategoryId;

    @Column(name= "Name", length = 50)
    private String name;

    @Column(name= "Detail", length = 50)
    private String detail;

    @Column(name= "ParentItemCategoryID")
    private Integer parentItemCategoryId;

    public Integer getItemCategoryId() {
        return itemCategoryId;
    }

    public void setItemCategoryId(final Integer itemCategoryId) {
        this.itemCategoryId = itemCategoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(final String detail) {
        this.detail = detail;
    }

    public Integer getParentItemCategoryId() {
        return parentItemCategoryId;
    }

    public void setParentItemCategoryId(final Integer parentItemCategoryId) {
        this.parentItemCategoryId = parentItemCategoryId;
    }

}
