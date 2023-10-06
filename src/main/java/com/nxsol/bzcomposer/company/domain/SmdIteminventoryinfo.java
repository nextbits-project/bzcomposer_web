package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "smd_iteminventoryinfo")
public class SmdIteminventoryinfo {

    @Id
    @Column(name= "MenuID", nullable = false, updatable = false, length = 50)
    private String menuId;

    @Column(name= "Manufacturer", length = 200)
    private String manufacturer;

    @Column(name= "SupplierName", length = 50)
    private String supplierName;

    @Column(name= "DiscountPrice", precision = 18, scale = 0)
    private BigDecimal discountPrice;

    @Column(name= "ShortDescription", columnDefinition = "longtext")
    private String shortDescription;

    @Column(name= "Priority")
    private Integer priority;

    @Column(name= "DisplayBeginDepth")
    private Integer displayBeginDepth;

    @Column(name = "Show", length = 50)
    private String show;

    @Column(name= "Flag1")
    private Boolean flag1;

    @Column(name= "Flag2")
    private Boolean flag2;

    @Column(name= "Flag3")
    private Boolean flag3;

    @Column(name= "Flag4")
    private Boolean flag4;

    @Column(name= "isHtmDescription")
    private Boolean isHtmDescription;

    @Column(name= "IsGiftCertificate")
    private Boolean isGiftCertificate;

    @Column(name= "IsExpire")
    private Boolean isExpire;

    @Column(name= "ExpireDate")
    private OffsetDateTime expireDate;

    @Column(name= "ExpireDays")
    private Integer expireDays;

    @Column(name= "Item_rank")
    private Integer itemRank;

    @Column(name= "Item_Review", columnDefinition = "longtext")
    private String itemReview;

    @Column(name= "ItemClassID")
    private Integer itemClassId;

    @Column(name= "DiscountGroupID")
    private Integer discountGroupId;

    @Column(name= "IsDeleted", length = 2)
    private String isDeleted;

    @Column(name= "Keywords", columnDefinition = "longtext")
    private String keywords;

    @Column(name= "LongDescription", columnDefinition = "longtext")
    private String longDescription;

    @Column(name= "MetatagTitle", columnDefinition = "longtext")
    private String metatagTitle;

    @Column(name= "MetatagDesc", columnDefinition = "longtext")
    private String metatagDesc;

    @Column(name= "MetatagKeyword", columnDefinition = "longtext")
    private String metatagKeyword;

    @Column(name= "ReorderLevel")
    private Integer reorderLevel;

    @Column(name= "MaxQty")
    private Integer maxQty;

    @Column(name= "GiftWrappingID")
    private Integer giftWrappingId;

    @Column(name= "ItemUploadable")
    private Boolean itemUploadable;

    @Column(name= "StorePrice", precision = 18, scale = 0)
    private BigDecimal storePrice;

    @Column(name= "Special_List")
    private Boolean specialList;

    @Column(name= "weightUnit", length = 4)
    private String weightUnit;

    @Column(name= "heightUnit", length = 4)
    private String heightUnit;

    @Column(name= "eBayItemCode", length = 30)
    private String eBayItemCode;

    @Column(name= "categoryOneeBay", length = 15)
    private String categoryOneeBay;

    @Column(name= "itemListingDays", length = 15)
    private String itemListingDays;

    @Column(name= "itemShippigCost")
    private Double itemShippigCost;

    @Column(name= "amazon_FeedSubmissionId", length = 20)
    private String amazonFeedSubmissionId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "InventoryId")
    private BcaIteminventory inventory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ItemImageID")
    private SmdItemimage itemImage;

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(final String menuId) {
        this.menuId = menuId;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(final String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(final String supplierName) {
        this.supplierName = supplierName;
    }

    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(final BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(final String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(final Integer priority) {
        this.priority = priority;
    }

    public Integer getDisplayBeginDepth() {
        return displayBeginDepth;
    }

    public void setDisplayBeginDepth(final Integer displayBeginDepth) {
        this.displayBeginDepth = displayBeginDepth;
    }

    public String getShow() {
        return show;
    }

    public void setShow(final String show) {
        this.show = show;
    }

    public Boolean getFlag1() {
        return flag1;
    }

    public void setFlag1(final Boolean flag1) {
        this.flag1 = flag1;
    }

    public Boolean getFlag2() {
        return flag2;
    }

    public void setFlag2(final Boolean flag2) {
        this.flag2 = flag2;
    }

    public Boolean getFlag3() {
        return flag3;
    }

    public void setFlag3(final Boolean flag3) {
        this.flag3 = flag3;
    }

    public Boolean getFlag4() {
        return flag4;
    }

    public void setFlag4(final Boolean flag4) {
        this.flag4 = flag4;
    }

    public Boolean getIsHtmDescription() {
        return isHtmDescription;
    }

    public void setIsHtmDescription(final Boolean isHtmDescription) {
        this.isHtmDescription = isHtmDescription;
    }

    public Boolean getIsGiftCertificate() {
        return isGiftCertificate;
    }

    public void setIsGiftCertificate(final Boolean isGiftCertificate) {
        this.isGiftCertificate = isGiftCertificate;
    }

    public Boolean getIsExpire() {
        return isExpire;
    }

    public void setIsExpire(final Boolean isExpire) {
        this.isExpire = isExpire;
    }

    public OffsetDateTime getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(final OffsetDateTime expireDate) {
        this.expireDate = expireDate;
    }

    public Integer getExpireDays() {
        return expireDays;
    }

    public void setExpireDays(final Integer expireDays) {
        this.expireDays = expireDays;
    }

    public Integer getItemRank() {
        return itemRank;
    }

    public void setItemRank(final Integer itemRank) {
        this.itemRank = itemRank;
    }

    public String getItemReview() {
        return itemReview;
    }

    public void setItemReview(final String itemReview) {
        this.itemReview = itemReview;
    }

    public Integer getItemClassId() {
        return itemClassId;
    }

    public void setItemClassId(final Integer itemClassId) {
        this.itemClassId = itemClassId;
    }

    public Integer getDiscountGroupId() {
        return discountGroupId;
    }

    public void setDiscountGroupId(final Integer discountGroupId) {
        this.discountGroupId = discountGroupId;
    }

    public String getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(final String isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(final String keywords) {
        this.keywords = keywords;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public void setLongDescription(final String longDescription) {
        this.longDescription = longDescription;
    }

    public String getMetatagTitle() {
        return metatagTitle;
    }

    public void setMetatagTitle(final String metatagTitle) {
        this.metatagTitle = metatagTitle;
    }

    public String getMetatagDesc() {
        return metatagDesc;
    }

    public void setMetatagDesc(final String metatagDesc) {
        this.metatagDesc = metatagDesc;
    }

    public String getMetatagKeyword() {
        return metatagKeyword;
    }

    public void setMetatagKeyword(final String metatagKeyword) {
        this.metatagKeyword = metatagKeyword;
    }

    public Integer getReorderLevel() {
        return reorderLevel;
    }

    public void setReorderLevel(final Integer reorderLevel) {
        this.reorderLevel = reorderLevel;
    }

    public Integer getMaxQty() {
        return maxQty;
    }

    public void setMaxQty(final Integer maxQty) {
        this.maxQty = maxQty;
    }

    public Integer getGiftWrappingId() {
        return giftWrappingId;
    }

    public void setGiftWrappingId(final Integer giftWrappingId) {
        this.giftWrappingId = giftWrappingId;
    }

    public Boolean getItemUploadable() {
        return itemUploadable;
    }

    public void setItemUploadable(final Boolean itemUploadable) {
        this.itemUploadable = itemUploadable;
    }

    public BigDecimal getStorePrice() {
        return storePrice;
    }

    public void setStorePrice(final BigDecimal storePrice) {
        this.storePrice = storePrice;
    }

    public Boolean getSpecialList() {
        return specialList;
    }

    public void setSpecialList(final Boolean specialList) {
        this.specialList = specialList;
    }

    public String getWeightUnit() {
        return weightUnit;
    }

    public void setWeightUnit(final String weightUnit) {
        this.weightUnit = weightUnit;
    }

    public String getHeightUnit() {
        return heightUnit;
    }

    public void setHeightUnit(final String heightUnit) {
        this.heightUnit = heightUnit;
    }

    public String getEBayItemCode() {
        return eBayItemCode;
    }

    public void setEBayItemCode(final String eBayItemCode) {
        this.eBayItemCode = eBayItemCode;
    }

    public String getCategoryOneeBay() {
        return categoryOneeBay;
    }

    public void setCategoryOneeBay(final String categoryOneeBay) {
        this.categoryOneeBay = categoryOneeBay;
    }

    public String getItemListingDays() {
        return itemListingDays;
    }

    public void setItemListingDays(final String itemListingDays) {
        this.itemListingDays = itemListingDays;
    }

    public Double getItemShippigCost() {
        return itemShippigCost;
    }

    public void setItemShippigCost(final Double itemShippigCost) {
        this.itemShippigCost = itemShippigCost;
    }

    public String getAmazonFeedSubmissionId() {
        return amazonFeedSubmissionId;
    }

    public void setAmazonFeedSubmissionId(final String amazonFeedSubmissionId) {
        this.amazonFeedSubmissionId = amazonFeedSubmissionId;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

    public SmdItemimage getItemImage() {
        return itemImage;
    }

    public void setItemImage(final SmdItemimage itemImage) {
        this.itemImage = itemImage;
    }

}
