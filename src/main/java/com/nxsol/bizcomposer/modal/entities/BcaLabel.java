package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class BcaLabel {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(unique = true, length = 50)
    private String labelType;

    @Column
    private Double marTop;

    @Column
    private Double marLeft;

    @Column
    private Double sizeWidth;

    @Column
    private Double sizeHeight;

    @Column
    private Double spacingHor;

    @Column
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
