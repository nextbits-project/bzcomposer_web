package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_amazoncategorytemplate")
public class BcaAmazoncategorytemplate {

    @Id
    @Column(name = "CategoryTemplateID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryTemplateId;

    @Column(name = "Type", length = 50)
    private String type;

    @Column(name = "TemplateFileName", length = 50)
    private String templateFileName;

    @Column(name = "Data", columnDefinition = "longtext")
    private String data;

    @Column(name = "ColumnHeaderData", columnDefinition = "longtext")
    private String columnHeaderData;

    public Integer getCategoryTemplateId() {
        return categoryTemplateId;
    }

    public void setCategoryTemplateId(final Integer categoryTemplateId) {
        this.categoryTemplateId = categoryTemplateId;
    }

    public String getType() {
        return type;
    }

    public void setType(final String type) {
        this.type = type;
    }

    public String getTemplateFileName() {
        return templateFileName;
    }

    public void setTemplateFileName(final String templateFileName) {
        this.templateFileName = templateFileName;
    }

    public String getData() {
        return data;
    }

    public void setData(final String data) {
        this.data = data;
    }

    public String getColumnHeaderData() {
        return columnHeaderData;
    }

    public void setColumnHeaderData(final String columnHeaderData) {
        this.columnHeaderData = columnHeaderData;
    }

}
