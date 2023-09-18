package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class BcaInvoiceLayoutfieldssetting {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private Double templateId;

    @Column(length = 50)
    private String fieldText;

    @Column(length = 50)
    private String fieldTitle;

    @Column
    private Boolean isFilled;

    @Column
    private Double xcoordinate;

    @Column
    private Double ycoordinate;

    @Column
    private Double width;

    @Column
    private Double height;

    @Column
    private Integer printStatus;

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public Double getTemplateId() {
        return templateId;
    }

    public void setTemplateId(final Double templateId) {
        this.templateId = templateId;
    }

    public String getFieldText() {
        return fieldText;
    }

    public void setFieldText(final String fieldText) {
        this.fieldText = fieldText;
    }

    public String getFieldTitle() {
        return fieldTitle;
    }

    public void setFieldTitle(final String fieldTitle) {
        this.fieldTitle = fieldTitle;
    }

    public Boolean getIsFilled() {
        return isFilled;
    }

    public void setIsFilled(final Boolean isFilled) {
        this.isFilled = isFilled;
    }

    public Double getXcoordinate() {
        return xcoordinate;
    }

    public void setXcoordinate(final Double xcoordinate) {
        this.xcoordinate = xcoordinate;
    }

    public Double getYcoordinate() {
        return ycoordinate;
    }

    public void setYcoordinate(final Double ycoordinate) {
        this.ycoordinate = ycoordinate;
    }

    public Double getWidth() {
        return width;
    }

    public void setWidth(final Double width) {
        this.width = width;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(final Double height) {
        this.height = height;
    }

    public Integer getPrintStatus() {
        return printStatus;
    }

    public void setPrintStatus(final Integer printStatus) {
        this.printStatus = printStatus;
    }

}
