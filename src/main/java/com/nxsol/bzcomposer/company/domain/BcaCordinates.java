package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_cordinates")
public class BcaCordinates {

    @Id
    @Column(name= "cordinatesID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cordinatesId;

    @Column(name= "LeftCordinate")
    private Integer leftCordinate;

    @Column(name= "RightCordinate")
    private Integer rightCordinate;

    @Column(name= "UpCordiante")
    private Integer upCordiante;

    @Column(name= "DownCordainte")
    private Integer downCordainte;

    @Column(name= "MenuName", length = 50)
    private String menuName;

    @Column(name= "ResolutionHeight")
    private Integer resolutionHeight;

    @Column(name= "ResolutionWidth")
    private Integer resolutionWidth;

    @Column(name= "UseSalesOrder")
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
