package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcaMasteritemcategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer itemCategoryId;

    @Column(length = 50)
    private String name;

    @Column(length = 50)
    private String detail;

    @Column
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
