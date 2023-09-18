package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class BcaCordinates {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cordinatesId;

    @Column
    private Integer leftCordinate;

    @Column
    private Integer rightCordinate;

    @Column
    private Integer upCordiante;

    @Column
    private Integer downCordainte;

    @Column(length = 50)
    private String menuName;

    @Column
    private Integer resolutionHeight;

    @Column
    private Integer resolutionWidth;

    @Column
    private Integer useSalesOrder;

    public Integer getCordinatesId() {
        return cordinatesId;
    }

    public void setCordinatesId(final Integer cordinatesId) {
        this.cordinatesId = cordinatesId;
    }

    public Integer getLeftCordinate() {
        return leftCordinate;
    }

    public void setLeftCordinate(final Integer leftCordinate) {
        this.leftCordinate = leftCordinate;
    }

    public Integer getRightCordinate() {
        return rightCordinate;
    }

    public void setRightCordinate(final Integer rightCordinate) {
        this.rightCordinate = rightCordinate;
    }

    public Integer getUpCordiante() {
        return upCordiante;
    }

    public void setUpCordiante(final Integer upCordiante) {
        this.upCordiante = upCordiante;
    }

    public Integer getDownCordainte() {
        return downCordainte;
    }

    public void setDownCordainte(final Integer downCordainte) {
        this.downCordainte = downCordainte;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(final String menuName) {
        this.menuName = menuName;
    }

    public Integer getResolutionHeight() {
        return resolutionHeight;
    }

    public void setResolutionHeight(final Integer resolutionHeight) {
        this.resolutionHeight = resolutionHeight;
    }

    public Integer getResolutionWidth() {
        return resolutionWidth;
    }

    public void setResolutionWidth(final Integer resolutionWidth) {
        this.resolutionWidth = resolutionWidth;
    }

    public Integer getUseSalesOrder() {
        return useSalesOrder;
    }

    public void setUseSalesOrder(final Integer useSalesOrder) {
        this.useSalesOrder = useSalesOrder;
    }

}
