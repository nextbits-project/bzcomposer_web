package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


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
