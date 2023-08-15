package com.nxsol.bizcomposer.common;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "smd_smditemimage")
public class SmdItemImage {
	

	 @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int itemImageid;
	private String inventoryId; // foreign key
	private Integer companyId;// foreign key
	private String image;
	private String titleImage;
	private String isDeleted="0";
	public int getItemImageid() {
		return itemImageid;
	}
	public void setItemImageid(int itemImageid) {
		this.itemImageid = itemImageid;
	}
	public String getInventoryId() {
		return inventoryId;
	}
	public void setInventoryId(String inventoryId) {
		this.inventoryId = inventoryId;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitleImage() {
		return titleImage;
	}
	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	
}
