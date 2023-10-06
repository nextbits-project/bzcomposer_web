package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name= "bca_customoptions")
public class BcaCustomoptions {

    @Id
    @Column(name= "OptionId", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer optionId;

    @Column(name= "ProductId")
    private String productId;

    @Column(name= "Title")
    private String title;

    @Column(name= "InputType")
    private String inputType;

    @Column(name= "IsRequired")
    private String isRequired;

    @Column(name= "SortOrder")
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
