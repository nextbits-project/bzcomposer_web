package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name= "bca_form_templates")
public class BcaFormTemplates {

    @Id
    @Column(name = "template_type_no", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer templateTypeNo;

    @Column(name= "imagePath")
    private String imagePath;

    @Column(name = "isSelected", nullable = false)
    private Boolean isSelected;

    @Column(name= "template_id_type")
    private Integer templateIdType;

    @Column(name= "template_type_name")
    private String templateTypeName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "companyId", nullable = false)
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
