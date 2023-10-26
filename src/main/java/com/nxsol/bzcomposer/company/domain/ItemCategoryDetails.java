package com.nxsol.bzcomposer.company.domain;

import java.time.OffsetDateTime;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="item_category_details")
public class ItemCategoryDetails {

    @Id
    @Column(name="CategoryID",nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long categoryId;

    @Column(name="ParentID",nullable = false, length = 45)
    private String parentId;

    @Column(name="CategoryName",nullable = false, unique = true, length = 45)
    private String categoryName;

    @Column(name = "Description", length = 500)
    private String description;


    @Column(name= "Active")
    private Boolean active;

    @Column(name= "Deleted")
    private Boolean deleted;

    @Column(name= "DateAdded", nullable = false)
    private OffsetDateTime dateAdded;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID", nullable = false)
    private BcaCompany company;

    @OneToMany(mappedBy = "category")
    private Set<ItemDetails> categoryItemDetails;

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	public OffsetDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(OffsetDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public Set<ItemDetails> getCategoryItemDetails() {
		return categoryItemDetails;
	}

	public void setCategoryItemDetails(Set<ItemDetails> categoryItemDetails) {
		this.categoryItemDetails = categoryItemDetails;
	}

   

}
