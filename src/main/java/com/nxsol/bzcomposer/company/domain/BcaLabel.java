package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_label")
public class BcaLabel {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "LabelType", unique = true, length = 50)
    private String labelType;

    @Column(name= "Mar_Top")
    private Double marTop;

    @Column(name= "Mar_Left")
    private Double marLeft;

    @Column(name= "Size_Width")
    private Double sizeWidth;

    @Column(name= "Size_Height")
    private Double sizeHeight;

    @Column(name= "Spacing_Hor")
    private Double spacingHor;

    @Column(name= "Spacing_Vert")
    private Double spacingVert;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getLabelType() {
        return labelType;
    }

    public void setLabelType(final String labelType) {
        this.labelType = labelType;
    }

    public Double getMarTop() {
        return marTop;
    }

    public void setMarTop(final Double marTop) {
        this.marTop = marTop;
    }

    public Double getMarLeft() {
        return marLeft;
    }

    public void setMarLeft(final Double marLeft) {
        this.marLeft = marLeft;
    }

    public Double getSizeWidth() {
        return sizeWidth;
    }

    public void setSizeWidth(final Double sizeWidth) {
        this.sizeWidth = sizeWidth;
    }

    public Double getSizeHeight() {
        return sizeHeight;
    }

    public void setSizeHeight(final Double sizeHeight) {
        this.sizeHeight = sizeHeight;
    }

    public Double getSpacingHor() {
        return spacingHor;
    }

    public void setSpacingHor(final Double spacingHor) {
        this.spacingHor = spacingHor;
    }

    public Double getSpacingVert() {
        return spacingVert;
    }

    public void setSpacingVert(final Double spacingVert) {
        this.spacingVert = spacingVert;
    }

}
