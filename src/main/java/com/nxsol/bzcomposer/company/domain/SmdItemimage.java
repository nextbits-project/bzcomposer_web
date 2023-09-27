package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.Set;


@Entity
public class SmdItemimage {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer itemImageId;

    @Column(length = 50)
    private String inventoryId;

    @Column(length = 100)
    private String image;

    @Column
    private Boolean titleImage;

    @Column
    private Boolean isDeleted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "itemImage")
    private Set<SmdIteminventoryinfo> itemImageSmdIteminventoryinfos;

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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<SmdIteminventoryinfo> getItemImageSmdIteminventoryinfos() {
        return itemImageSmdIteminventoryinfos;
    }

    public void setItemImageSmdIteminventoryinfos(
            final Set<SmdIteminventoryinfo> itemImageSmdIteminventoryinfos) {
        this.itemImageSmdIteminventoryinfos = itemImageSmdIteminventoryinfos;
    }

}