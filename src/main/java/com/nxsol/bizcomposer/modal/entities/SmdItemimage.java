package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class SmdItemimage {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer itemImageId;

    @Column(length = 50)
    private String inventoryId;

    @Column
    private Integer companyId;

    @Column(length = 100)
    private String image;

    @Column
    private Boolean titleImage;

    @Column
    private Boolean isDeleted;

    public Integer getItemImageId() {
        return itemImageId;
    }

    public void setItemImageId(final Integer itemImageId) {
        this.itemImageId = itemImageId;
    }

    public String getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(final String inventoryId) {
        this.inventoryId = inventoryId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(final String image) {
        this.image = image;
    }

    public Boolean getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(final Boolean titleImage) {
        this.titleImage = titleImage;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(final Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

}
