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
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaIteminventory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer inventoryId;

    @Column
    private Integer parentId;

    @Column(length = 50)
    private String inventoryCode;

    @Column(length = 50)
    private String serialNum;

    @Column(columnDefinition = "longtext")
    private String inventoryName;

    @Column(columnDefinition = "longtext")
    private String inventoryDescription;

    @Column
    private Integer qty;

    @Column
    private Integer availableQty;

    @Column
    private Double weight;

    @Column
    private Double purchasePrice;

    @Column
    private Double salePrice;

    @Column(precision = 23, scale = 4)
    private BigDecimal dealerPrice;

    @Column
    private Integer taxable;

    @Column
    private Boolean isCategory;

    @Column(length = 50)
    private String location;

    @Column
    private String pictureUrl;

    @Column
    private Integer active;

    @Column
    private OffsetDateTime dateConfirmed;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private Integer itemTypeId;

    @Column(length = 50)
    private String refNum;

    @Column(length = 50)
    private String inventoryBarCode;

    @Column
    private Integer att1Id;

    @Column
    private Integer att2Id;

    @Column(length = 50)
    private String sku;

    @Column
    private Double sizeH;

    @Column
    private Double sizeW;

    @Column
    private Double sizeL;

    @Column
    private Boolean isNewItemCode;

    @Column(columnDefinition = "longtext")
    private String message;

    @Column(length = 50)
    private String specialHanding;

    @Column
    private Integer reorderPoint;

    @Column
    private Boolean isDropShip;

    @Column
    private Boolean isDiscontinued;

    @Column(length = 250)
    private String orderUnit;

    @Column(length = 50)
    private String reorderMessage;

    @Column(length = 50)
    private String smcinventoryId;

    @Column(length = 50)
    private String ebayInventoryId;

    @Column(length = 50)
    private String serviceUnit;

    @Column
    private Double salesTaxRate;

    @Column
    private Integer amazonQty;

    @Column(length = 50)
    private String taxCode;

    @Column
    private Integer invoiceInNum;

    @Column
    private Integer poinNum;

    @Column
    private Double assemblyCost;

    @Column
    private Integer isIgnoreQoh;

    @Column
    private Integer isSynchWitheBay;

    @Column
    private Integer isSynchWithSmc;

    @Column
    private Integer isSynchWithAmazone;

    @Column
    private Boolean isConsignedItem;

    @Column
    private String color;

    @Column
    private Integer itemSubCategory;

    @Column
    private Boolean isItemTaxable;

    @Column
    private Boolean isDiscounted;

    @Column
    private Boolean isPrimarySupplier;

    @Column
    private String productSku;

    @Column
    private String supplierSku;

    @Column
    private Integer minOrderUnit;

    @Column
    private Integer weightUnit;

    @Column(length = 5000)
    private String textAreaContent;

    @Column
    private String supplierIds;

    @Column
    private Double actualWeight;

    @Column
    private Integer accountId;

    @Column
    private Integer measurementId;

    @Column
    private Integer subMeasurementId;

    @Column
    private OffsetDateTime dateReceived;

    @Column(length = 250)
    private String memo;

    @Column
    private Integer expectedQty;

    @OneToMany(mappedBy = "inventoryid")
    private Set<AdjustmentReason> inventoryidAdjustmentReasons;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaBilldetail> inventoryBcaBilldetails;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaCart> inventoryBcaCarts;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaCartmemorized> inventoryBcaCartmemorizeds;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaExporteditemedetail> inventoryBcaExporteditemedetails;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaInventoryassembly> inventoryBcaInventoryassemblys;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaInventorycrosssell> inventoryBcaInventorycrosssells;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaInventorysupplierdetail> inventoryBcaInventorysupplierdetails;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaInventoryunitmeasure> inventoryBcaInventoryunitmeasures;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private BcaCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_type_id")
    private BcaStoretype storeType;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaLeadProducts> inventoryBcaLeadProductss;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaPeritempricelevel> inventoryBcaPeritempricelevels;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaProductchannelsetting> inventoryBcaProductchannelsettings;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaRmaitem> inventoryBcaRmaitems;

    @OneToMany(mappedBy = "inventory")
    private Set<BcaServicetype> inventoryBcaServicetypes;

    @OneToMany(mappedBy = "inventory")
    private Set<BtSales> inventoryBtSaless;

    @OneToMany(mappedBy = "inventory")
    private Set<SmdIteminventoryinfo> inventorySmdIteminventoryinfos;

    @OneToMany(mappedBy = "inventory")
    private Set<StorageCart> inventoryStorageCarts;

    public Integer getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(final Integer inventoryId) {
        this.inventoryId = inventoryId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(final Integer parentId) {
        this.parentId = parentId;
    }

    public String getInventoryCode() {
        return inventoryCode;
    }

    public void setInventoryCode(final String inventoryCode) {
        this.inventoryCode = inventoryCode;
    }

    public String getSerialNum() {
        return serialNum;
    }

    public void setSerialNum(final String serialNum) {
        this.serialNum = serialNum;
    }

    public String getInventoryName() {
        return inventoryName;
    }

    public void setInventoryName(final String inventoryName) {
        this.inventoryName = inventoryName;
    }

    public String getInventoryDescription() {
        return inventoryDescription;
    }

    public void setInventoryDescription(final String inventoryDescription) {
        this.inventoryDescription = inventoryDescription;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(final Integer qty) {
        this.qty = qty;
    }

    public Integer getAvailableQty() {
        return availableQty;
    }

    public void setAvailableQty(final Integer availableQty) {
        this.availableQty = availableQty;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(final Double weight) {
        this.weight = weight;
    }

    public Double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(final Double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(final Double salePrice) {
        this.salePrice = salePrice;
    }

    public BigDecimal getDealerPrice() {
        return dealerPrice;
    }

    public void setDealerPrice(final BigDecimal dealerPrice) {
        this.dealerPrice = dealerPrice;
    }

    public Integer getTaxable() {
        return taxable;
    }

    public void setTaxable(final Integer taxable) {
        this.taxable = taxable;
    }

    public Boolean getIsCategory() {
        return isCategory;
    }

    public void setIsCategory(final Boolean isCategory) {
        this.isCategory = isCategory;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(final String location) {
        this.location = location;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(final String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public OffsetDateTime getDateConfirmed() {
        return dateConfirmed;
    }

    public void setDateConfirmed(final OffsetDateTime dateConfirmed) {
        this.dateConfirmed = dateConfirmed;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Integer getItemTypeId() {
        return itemTypeId;
    }

    public void setItemTypeId(final Integer itemTypeId) {
        this.itemTypeId = itemTypeId;
    }

    public String getRefNum() {
        return refNum;
    }

    public void setRefNum(final String refNum) {
        this.refNum = refNum;
    }

    public String getInventoryBarCode() {
        return inventoryBarCode;
    }

    public void setInventoryBarCode(final String inventoryBarCode) {
        this.inventoryBarCode = inventoryBarCode;
    }

    public Integer getAtt1Id() {
        return att1Id;
    }

    public void setAtt1Id(final Integer att1Id) {
        this.att1Id = att1Id;
    }

    public Integer getAtt2Id() {
        return att2Id;
    }

    public void setAtt2Id(final Integer att2Id) {
        this.att2Id = att2Id;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(final String sku) {
        this.sku = sku;
    }

    public Double getSizeH() {
        return sizeH;
    }

    public void setSizeH(final Double sizeH) {
        this.sizeH = sizeH;
    }

    public Double getSizeW() {
        return sizeW;
    }

    public void setSizeW(final Double sizeW) {
        this.sizeW = sizeW;
    }

    public Double getSizeL() {
        return sizeL;
    }

    public void setSizeL(final Double sizeL) {
        this.sizeL = sizeL;
    }

    public Boolean getIsNewItemCode() {
        return isNewItemCode;
    }

    public void setIsNewItemCode(final Boolean isNewItemCode) {
        this.isNewItemCode = isNewItemCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(final String message) {
        this.message = message;
    }

    public String getSpecialHanding() {
        return specialHanding;
    }

    public void setSpecialHanding(final String specialHanding) {
        this.specialHanding = specialHanding;
    }

    public Integer getReorderPoint() {
        return reorderPoint;
    }

    public void setReorderPoint(final Integer reorderPoint) {
        this.reorderPoint = reorderPoint;
    }

    public Boolean getIsDropShip() {
        return isDropShip;
    }

    public void setIsDropShip(final Boolean isDropShip) {
        this.isDropShip = isDropShip;
    }

    public Boolean getIsDiscontinued() {
        return isDiscontinued;
    }

    public void setIsDiscontinued(final Boolean isDiscontinued) {
        this.isDiscontinued = isDiscontinued;
    }

    public String getOrderUnit() {
        return orderUnit;
    }

    public void setOrderUnit(final String orderUnit) {
        this.orderUnit = orderUnit;
    }

    public String getReorderMessage() {
        return reorderMessage;
    }

    public void setReorderMessage(final String reorderMessage) {
        this.reorderMessage = reorderMessage;
    }

    public String getSmcinventoryId() {
        return smcinventoryId;
    }

    public void setSmcinventoryId(final String smcinventoryId) {
        this.smcinventoryId = smcinventoryId;
    }

    public String getEbayInventoryId() {
        return ebayInventoryId;
    }

    public void setEbayInventoryId(final String ebayInventoryId) {
        this.ebayInventoryId = ebayInventoryId;
    }

    public String getServiceUnit() {
        return serviceUnit;
    }

    public void setServiceUnit(final String serviceUnit) {
        this.serviceUnit = serviceUnit;
    }

    public Double getSalesTaxRate() {
        return salesTaxRate;
    }

    public void setSalesTaxRate(final Double salesTaxRate) {
        this.salesTaxRate = salesTaxRate;
    }

    public Integer getAmazonQty() {
        return amazonQty;
    }

    public void setAmazonQty(final Integer amazonQty) {
        this.amazonQty = amazonQty;
    }

    public String getTaxCode() {
        return taxCode;
    }

    public void setTaxCode(final String taxCode) {
        this.taxCode = taxCode;
    }

    public Integer getInvoiceInNum() {
        return invoiceInNum;
    }

    public void setInvoiceInNum(final Integer invoiceInNum) {
        this.invoiceInNum = invoiceInNum;
    }

    public Integer getPoinNum() {
        return poinNum;
    }

    public void setPoinNum(final Integer poinNum) {
        this.poinNum = poinNum;
    }

    public Double getAssemblyCost() {
        return assemblyCost;
    }

    public void setAssemblyCost(final Double assemblyCost) {
        this.assemblyCost = assemblyCost;
    }

    public Integer getIsIgnoreQoh() {
        return isIgnoreQoh;
    }

    public void setIsIgnoreQoh(final Integer isIgnoreQoh) {
        this.isIgnoreQoh = isIgnoreQoh;
    }

    public Integer getIsSynchWitheBay() {
        return isSynchWitheBay;
    }

    public void setIsSynchWitheBay(final Integer isSynchWitheBay) {
        this.isSynchWitheBay = isSynchWitheBay;
    }

    public Integer getIsSynchWithSmc() {
        return isSynchWithSmc;
    }

    public void setIsSynchWithSmc(final Integer isSynchWithSmc) {
        this.isSynchWithSmc = isSynchWithSmc;
    }

    public Integer getIsSynchWithAmazone() {
        return isSynchWithAmazone;
    }

    public void setIsSynchWithAmazone(final Integer isSynchWithAmazone) {
        this.isSynchWithAmazone = isSynchWithAmazone;
    }

    public Boolean getIsConsignedItem() {
        return isConsignedItem;
    }

    public void setIsConsignedItem(final Boolean isConsignedItem) {
        this.isConsignedItem = isConsignedItem;
    }

    public String getColor() {
        return color;
    }

    public void setColor(final String color) {
        this.color = color;
    }

    public Integer getItemSubCategory() {
        return itemSubCategory;
    }

    public void setItemSubCategory(final Integer itemSubCategory) {
        this.itemSubCategory = itemSubCategory;
    }

    public Boolean getIsItemTaxable() {
        return isItemTaxable;
    }

    public void setIsItemTaxable(final Boolean isItemTaxable) {
        this.isItemTaxable = isItemTaxable;
    }

    public Boolean getIsDiscounted() {
        return isDiscounted;
    }

    public void setIsDiscounted(final Boolean isDiscounted) {
        this.isDiscounted = isDiscounted;
    }

    public Boolean getIsPrimarySupplier() {
        return isPrimarySupplier;
    }

    public void setIsPrimarySupplier(final Boolean isPrimarySupplier) {
        this.isPrimarySupplier = isPrimarySupplier;
    }

    public String getProductSku() {
        return productSku;
    }

    public void setProductSku(final String productSku) {
        this.productSku = productSku;
    }

    public String getSupplierSku() {
        return supplierSku;
    }

    public void setSupplierSku(final String supplierSku) {
        this.supplierSku = supplierSku;
    }

    public Integer getMinOrderUnit() {
        return minOrderUnit;
    }

    public void setMinOrderUnit(final Integer minOrderUnit) {
        this.minOrderUnit = minOrderUnit;
    }

    public Integer getWeightUnit() {
        return weightUnit;
    }

    public void setWeightUnit(final Integer weightUnit) {
        this.weightUnit = weightUnit;
    }

    public String getTextAreaContent() {
        return textAreaContent;
    }

    public void setTextAreaContent(final String textAreaContent) {
        this.textAreaContent = textAreaContent;
    }

    public String getSupplierIds() {
        return supplierIds;
    }

    public void setSupplierIds(final String supplierIds) {
        this.supplierIds = supplierIds;
    }

    public Double getActualWeight() {
        return actualWeight;
    }

    public void setActualWeight(final Double actualWeight) {
        this.actualWeight = actualWeight;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(final Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getMeasurementId() {
        return measurementId;
    }

    public void setMeasurementId(final Integer measurementId) {
        this.measurementId = measurementId;
    }

    public Integer getSubMeasurementId() {
        return subMeasurementId;
    }

    public void setSubMeasurementId(final Integer subMeasurementId) {
        this.subMeasurementId = subMeasurementId;
    }

    public OffsetDateTime getDateReceived() {
        return dateReceived;
    }

    public void setDateReceived(final OffsetDateTime dateReceived) {
        this.dateReceived = dateReceived;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public Integer getExpectedQty() {
        return expectedQty;
    }

    public void setExpectedQty(final Integer expectedQty) {
        this.expectedQty = expectedQty;
    }

    public Set<AdjustmentReason> getInventoryidAdjustmentReasons() {
        return inventoryidAdjustmentReasons;
    }

    public void setInventoryidAdjustmentReasons(
            final Set<AdjustmentReason> inventoryidAdjustmentReasons) {
        this.inventoryidAdjustmentReasons = inventoryidAdjustmentReasons;
    }

    public Set<BcaBilldetail> getInventoryBcaBilldetails() {
        return inventoryBcaBilldetails;
    }

    public void setInventoryBcaBilldetails(final Set<BcaBilldetail> inventoryBcaBilldetails) {
        this.inventoryBcaBilldetails = inventoryBcaBilldetails;
    }

    public Set<BcaCart> getInventoryBcaCarts() {
        return inventoryBcaCarts;
    }

    public void setInventoryBcaCarts(final Set<BcaCart> inventoryBcaCarts) {
        this.inventoryBcaCarts = inventoryBcaCarts;
    }

    public Set<BcaCartmemorized> getInventoryBcaCartmemorizeds() {
        return inventoryBcaCartmemorizeds;
    }

    public void setInventoryBcaCartmemorizeds(
            final Set<BcaCartmemorized> inventoryBcaCartmemorizeds) {
        this.inventoryBcaCartmemorizeds = inventoryBcaCartmemorizeds;
    }

    public Set<BcaExporteditemedetail> getInventoryBcaExporteditemedetails() {
        return inventoryBcaExporteditemedetails;
    }

    public void setInventoryBcaExporteditemedetails(
            final Set<BcaExporteditemedetail> inventoryBcaExporteditemedetails) {
        this.inventoryBcaExporteditemedetails = inventoryBcaExporteditemedetails;
    }

    public Set<BcaInventoryassembly> getInventoryBcaInventoryassemblys() {
        return inventoryBcaInventoryassemblys;
    }

    public void setInventoryBcaInventoryassemblys(
            final Set<BcaInventoryassembly> inventoryBcaInventoryassemblys) {
        this.inventoryBcaInventoryassemblys = inventoryBcaInventoryassemblys;
    }

    public Set<BcaInventorycrosssell> getInventoryBcaInventorycrosssells() {
        return inventoryBcaInventorycrosssells;
    }

    public void setInventoryBcaInventorycrosssells(
            final Set<BcaInventorycrosssell> inventoryBcaInventorycrosssells) {
        this.inventoryBcaInventorycrosssells = inventoryBcaInventorycrosssells;
    }

    public Set<BcaInventorysupplierdetail> getInventoryBcaInventorysupplierdetails() {
        return inventoryBcaInventorysupplierdetails;
    }

    public void setInventoryBcaInventorysupplierdetails(
            final Set<BcaInventorysupplierdetail> inventoryBcaInventorysupplierdetails) {
        this.inventoryBcaInventorysupplierdetails = inventoryBcaInventorysupplierdetails;
    }

    public Set<BcaInventoryunitmeasure> getInventoryBcaInventoryunitmeasures() {
        return inventoryBcaInventoryunitmeasures;
    }

    public void setInventoryBcaInventoryunitmeasures(
            final Set<BcaInventoryunitmeasure> inventoryBcaInventoryunitmeasures) {
        this.inventoryBcaInventoryunitmeasures = inventoryBcaInventoryunitmeasures;
    }

    public BcaCategory getCategory() {
        return category;
    }

    public void setCategory(final BcaCategory category) {
        this.category = category;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaStoretype getStoreType() {
        return storeType;
    }

    public void setStoreType(final BcaStoretype storeType) {
        this.storeType = storeType;
    }

    public Set<BcaLeadProducts> getInventoryBcaLeadProductss() {
        return inventoryBcaLeadProductss;
    }

    public void setInventoryBcaLeadProductss(final Set<BcaLeadProducts> inventoryBcaLeadProductss) {
        this.inventoryBcaLeadProductss = inventoryBcaLeadProductss;
    }

    public Set<BcaPeritempricelevel> getInventoryBcaPeritempricelevels() {
        return inventoryBcaPeritempricelevels;
    }

    public void setInventoryBcaPeritempricelevels(
            final Set<BcaPeritempricelevel> inventoryBcaPeritempricelevels) {
        this.inventoryBcaPeritempricelevels = inventoryBcaPeritempricelevels;
    }

    public Set<BcaProductchannelsetting> getInventoryBcaProductchannelsettings() {
        return inventoryBcaProductchannelsettings;
    }

    public void setInventoryBcaProductchannelsettings(
            final Set<BcaProductchannelsetting> inventoryBcaProductchannelsettings) {
        this.inventoryBcaProductchannelsettings = inventoryBcaProductchannelsettings;
    }

    public Set<BcaRmaitem> getInventoryBcaRmaitems() {
        return inventoryBcaRmaitems;
    }

    public void setInventoryBcaRmaitems(final Set<BcaRmaitem> inventoryBcaRmaitems) {
        this.inventoryBcaRmaitems = inventoryBcaRmaitems;
    }

    public Set<BcaServicetype> getInventoryBcaServicetypes() {
        return inventoryBcaServicetypes;
    }

    public void setInventoryBcaServicetypes(final Set<BcaServicetype> inventoryBcaServicetypes) {
        this.inventoryBcaServicetypes = inventoryBcaServicetypes;
    }

    public Set<BtSales> getInventoryBtSaless() {
        return inventoryBtSaless;
    }

    public void setInventoryBtSaless(final Set<BtSales> inventoryBtSaless) {
        this.inventoryBtSaless = inventoryBtSaless;
    }

    public Set<SmdIteminventoryinfo> getInventorySmdIteminventoryinfos() {
        return inventorySmdIteminventoryinfos;
    }

    public void setInventorySmdIteminventoryinfos(
            final Set<SmdIteminventoryinfo> inventorySmdIteminventoryinfos) {
        this.inventorySmdIteminventoryinfos = inventorySmdIteminventoryinfos;
    }

    public Set<StorageCart> getInventoryStorageCarts() {
        return inventoryStorageCarts;
    }

    public void setInventoryStorageCarts(final Set<StorageCart> inventoryStorageCarts) {
        this.inventoryStorageCarts = inventoryStorageCarts;
    }

}
