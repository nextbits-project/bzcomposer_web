package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcaCustomoptions {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer optionId;

    @Column
    private String productId;

    @Column
    private String title;

    @Column
    private String inputType;

    @Column
    private String isRequired;

    @Column
    private Integer sortOrder;

    public Integer getOptionId() {
        return optionId;
    }

    public void setOptionId(final Integer optionId) {
        this.optionId = optionId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(final String productId) {
        this.productId = productId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(final String title) {
        this.title = title;
    }

    public String getInputType() {
        return inputType;
    }

    public void setInputType(final String inputType) {
        this.inputType = inputType;
    }

    public String getIsRequired() {
        return isRequired;
    }

    public void setIsRequired(final String isRequired) {
        this.isRequired = isRequired;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(final Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

}
