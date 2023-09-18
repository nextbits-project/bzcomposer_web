package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BcaFormTemplates {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer templateTypeNo;

    @Column
    private String imagePath;

    @Column(nullable = false)
    private Boolean isSelected;

    @Column
    private Integer templateIdType;

    @Column
    private String templateTypeName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id", nullable = false)
    private BcaCompany company;

    public Integer getTemplateTypeNo() {
        return templateTypeNo;
    }

    public void setTemplateTypeNo(final Integer templateTypeNo) {
        this.templateTypeNo = templateTypeNo;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(final String imagePath) {
        this.imagePath = imagePath;
    }

    public Boolean getIsSelected() {
        return isSelected;
    }

    public void setIsSelected(final Boolean isSelected) {
        this.isSelected = isSelected;
    }

    public Integer getTemplateIdType() {
        return templateIdType;
    }

    public void setTemplateIdType(final Integer templateIdType) {
        this.templateIdType = templateIdType;
    }

    public String getTemplateTypeName() {
        return templateTypeName;
    }

    public void setTemplateTypeName(final String templateTypeName) {
        this.templateTypeName = templateTypeName;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
