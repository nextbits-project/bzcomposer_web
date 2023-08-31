package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class BcaInvoiceLayoutfieldssetting {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "template_id")
    private BcaInvoiceTemplate template;

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

    public BcaInvoiceTemplate getTemplate() {
        return template;
    }

    public void setTemplate(final BcaInvoiceTemplate template) {
        this.template = template;
    }

}
