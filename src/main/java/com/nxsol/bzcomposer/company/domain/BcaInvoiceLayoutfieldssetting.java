package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_invoice_layoutfieldssetting")
public class BcaInvoiceLayoutfieldssetting {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name= "TemplateId")
    private Double templateId;

    @Column(name= "FieldText", length = 50)
    private String fieldText;

    @Column(name= "FieldTitle", length = 50)
    private String fieldTitle;

    @Column(name= "IsFilled")
    private Boolean isFilled;

    @Column(name= "XCoordinate")
    private Double xcoordinate;

    @Column(name= "YCoordinate")
    private Double ycoordinate;

    @Column(name= "Width")
    private Double width;

    @Column(name= "Height")
    private Double height;

    @Column(name= "printStatus")
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
