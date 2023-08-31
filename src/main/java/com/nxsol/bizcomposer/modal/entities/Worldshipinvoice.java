package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;


@Entity
public class Worldshipinvoice {

    @Id
    @Column(nullable = false, updatable = false, length = 10)
    private String siIsVoid;

    @Column(length = 50)
    private String siServiceType;

    @Column(length = 50)
    private String siBillingOption;

    @Column(length = 35)
    private String siShipmentReference1;

    @Column(length = 35)
    private String siShipmentReference2;

    @Column
    private Boolean siCallTagOption;

    @Column(length = 12)
    private String siCallTagReferenceNumber;

    @Column
    private Boolean siSaturdayDeliveryOption;

    @Column
    private Boolean siSaturdayPickupOption;

    @Column
    private Boolean siShipmentNotification1Option;

    @Column
    private Boolean siShipmentNotification2Option;

    @Column(length = 50)
    private String siDescriptionOfGoods;

    @Column(length = 35)
    private String stAttention;

    @Column(length = 50)
    private String stFirstName;

    @Column(length = 50)
    private String stLastName;

    @Column(length = 35)
    private String stCompanyName;

    @Column(length = 35)
    private String stDepartment;

    @Column(length = 35)
    private String stRoomFloor;

    @Column(length = 35)
    private String stStreetAddress;

    @Column(length = 30)
    private String stCity;

    @Column(length = 5)
    private String stState;

    @Column(length = 9)
    private String stZipCode;

    @Column(length = 10)
    private String stReceiverAccountNumber;

    @Column(length = 15)
    private String stTelephone;

    @Column(length = 15)
    private String stFax;

    @Column(length = 50)
    private String stCountry;

    @Column
    private Boolean stResidential;

    @Column(length = 35)
    private String sfAttention;

    @Column(length = 35)
    private String sfCompanyName;

    @Column(length = 35)
    private String sfDepartment;

    @Column(length = 35)
    private String sfRoomFloor;

    @Column(length = 35)
    private String sfStreetAddress;

    @Column(length = 30)
    private String sfCity;

    @Column(length = 5)
    private String sfState;

    @Column(length = 9)
    private String sfZipCode;

    @Column(length = 15)
    private String sfTelephone;

    @Column(length = 15)
    private String sfFax;

    @Column(length = 50)
    private String sfCountry;

    @Column
    private Boolean pkgIsOversize;

    @Column(length = 35)
    private String pkgPackageReference1;

    @Column(length = 35)
    private String pkgPackageReference2;

    @Column(length = 35)
    private String pkgPackageReference3;

    @Column(length = 35)
    private String pkgPackageReference4;

    @Column(length = 35)
    private String pkgPackageReference5;

    @Column
    private Boolean pkgAdditionalHandlingOption;

    @Column
    private Boolean pkgShipmentNotification1Option;

    @Column
    private Boolean pkgShipmentNotification2Option;

    @Column
    private Boolean pkgHazardousMaterialsOption;

    @Column
    private Boolean pkgCodoption;

    @Column(length = 11)
    private String pkgCodcontrolNumber;

    @Column(length = 50)
    private String pkgCodamount;

    @Column
    private Boolean pkgDeliveryConfirmationOption;

    @Column
    private Boolean pkgVerbalConfirmationOption;

    @Column
    private Boolean pkgInsuredValueOption;

    @Column(length = 50)
    private String pkgInsuredValueAmount;

    @Column(length = 50)
    private String pkgPackageType;

    @Column(length = 50)
    private String pkgWeight;

    public String getSiIsVoid() {
        return siIsVoid;
    }

    public void setSiIsVoid(final String siIsVoid) {
        this.siIsVoid = siIsVoid;
    }

    public String getSiServiceType() {
        return siServiceType;
    }

    public void setSiServiceType(final String siServiceType) {
        this.siServiceType = siServiceType;
    }

    public String getSiBillingOption() {
        return siBillingOption;
    }

    public void setSiBillingOption(final String siBillingOption) {
        this.siBillingOption = siBillingOption;
    }

    public String getSiShipmentReference1() {
        return siShipmentReference1;
    }

    public void setSiShipmentReference1(final String siShipmentReference1) {
        this.siShipmentReference1 = siShipmentReference1;
    }

    public String getSiShipmentReference2() {
        return siShipmentReference2;
    }

    public void setSiShipmentReference2(final String siShipmentReference2) {
        this.siShipmentReference2 = siShipmentReference2;
    }

    public Boolean getSiCallTagOption() {
        return siCallTagOption;
    }

    public void setSiCallTagOption(final Boolean siCallTagOption) {
        this.siCallTagOption = siCallTagOption;
    }

    public String getSiCallTagReferenceNumber() {
        return siCallTagReferenceNumber;
    }

    public void setSiCallTagReferenceNumber(final String siCallTagReferenceNumber) {
        this.siCallTagReferenceNumber = siCallTagReferenceNumber;
    }

    public Boolean getSiSaturdayDeliveryOption() {
        return siSaturdayDeliveryOption;
    }

    public void setSiSaturdayDeliveryOption(final Boolean siSaturdayDeliveryOption) {
        this.siSaturdayDeliveryOption = siSaturdayDeliveryOption;
    }

    public Boolean getSiSaturdayPickupOption() {
        return siSaturdayPickupOption;
    }

    public void setSiSaturdayPickupOption(final Boolean siSaturdayPickupOption) {
        this.siSaturdayPickupOption = siSaturdayPickupOption;
    }

    public Boolean getSiShipmentNotification1Option() {
        return siShipmentNotification1Option;
    }

    public void setSiShipmentNotification1Option(final Boolean siShipmentNotification1Option) {
        this.siShipmentNotification1Option = siShipmentNotification1Option;
    }

    public Boolean getSiShipmentNotification2Option() {
        return siShipmentNotification2Option;
    }

    public void setSiShipmentNotification2Option(final Boolean siShipmentNotification2Option) {
        this.siShipmentNotification2Option = siShipmentNotification2Option;
    }

    public String getSiDescriptionOfGoods() {
        return siDescriptionOfGoods;
    }

    public void setSiDescriptionOfGoods(final String siDescriptionOfGoods) {
        this.siDescriptionOfGoods = siDescriptionOfGoods;
    }

    public String getStAttention() {
        return stAttention;
    }

    public void setStAttention(final String stAttention) {
        this.stAttention = stAttention;
    }

    public String getStFirstName() {
        return stFirstName;
    }

    public void setStFirstName(final String stFirstName) {
        this.stFirstName = stFirstName;
    }

    public String getStLastName() {
        return stLastName;
    }

    public void setStLastName(final String stLastName) {
        this.stLastName = stLastName;
    }

    public String getStCompanyName() {
        return stCompanyName;
    }

    public void setStCompanyName(final String stCompanyName) {
        this.stCompanyName = stCompanyName;
    }

    public String getStDepartment() {
        return stDepartment;
    }

    public void setStDepartment(final String stDepartment) {
        this.stDepartment = stDepartment;
    }

    public String getStRoomFloor() {
        return stRoomFloor;
    }

    public void setStRoomFloor(final String stRoomFloor) {
        this.stRoomFloor = stRoomFloor;
    }

    public String getStStreetAddress() {
        return stStreetAddress;
    }

    public void setStStreetAddress(final String stStreetAddress) {
        this.stStreetAddress = stStreetAddress;
    }

    public String getStCity() {
        return stCity;
    }

    public void setStCity(final String stCity) {
        this.stCity = stCity;
    }

    public String getStState() {
        return stState;
    }

    public void setStState(final String stState) {
        this.stState = stState;
    }

    public String getStZipCode() {
        return stZipCode;
    }

    public void setStZipCode(final String stZipCode) {
        this.stZipCode = stZipCode;
    }

    public String getStReceiverAccountNumber() {
        return stReceiverAccountNumber;
    }

    public void setStReceiverAccountNumber(final String stReceiverAccountNumber) {
        this.stReceiverAccountNumber = stReceiverAccountNumber;
    }

    public String getStTelephone() {
        return stTelephone;
    }

    public void setStTelephone(final String stTelephone) {
        this.stTelephone = stTelephone;
    }

    public String getStFax() {
        return stFax;
    }

    public void setStFax(final String stFax) {
        this.stFax = stFax;
    }

    public String getStCountry() {
        return stCountry;
    }

    public void setStCountry(final String stCountry) {
        this.stCountry = stCountry;
    }

    public Boolean getStResidential() {
        return stResidential;
    }

    public void setStResidential(final Boolean stResidential) {
        this.stResidential = stResidential;
    }

    public String getSfAttention() {
        return sfAttention;
    }

    public void setSfAttention(final String sfAttention) {
        this.sfAttention = sfAttention;
    }

    public String getSfCompanyName() {
        return sfCompanyName;
    }

    public void setSfCompanyName(final String sfCompanyName) {
        this.sfCompanyName = sfCompanyName;
    }

    public String getSfDepartment() {
        return sfDepartment;
    }

    public void setSfDepartment(final String sfDepartment) {
        this.sfDepartment = sfDepartment;
    }

    public String getSfRoomFloor() {
        return sfRoomFloor;
    }

    public void setSfRoomFloor(final String sfRoomFloor) {
        this.sfRoomFloor = sfRoomFloor;
    }

    public String getSfStreetAddress() {
        return sfStreetAddress;
    }

    public void setSfStreetAddress(final String sfStreetAddress) {
        this.sfStreetAddress = sfStreetAddress;
    }

    public String getSfCity() {
        return sfCity;
    }

    public void setSfCity(final String sfCity) {
        this.sfCity = sfCity;
    }

    public String getSfState() {
        return sfState;
    }

    public void setSfState(final String sfState) {
        this.sfState = sfState;
    }

    public String getSfZipCode() {
        return sfZipCode;
    }

    public void setSfZipCode(final String sfZipCode) {
        this.sfZipCode = sfZipCode;
    }

    public String getSfTelephone() {
        return sfTelephone;
    }

    public void setSfTelephone(final String sfTelephone) {
        this.sfTelephone = sfTelephone;
    }

    public String getSfFax() {
        return sfFax;
    }

    public void setSfFax(final String sfFax) {
        this.sfFax = sfFax;
    }

    public String getSfCountry() {
        return sfCountry;
    }

    public void setSfCountry(final String sfCountry) {
        this.sfCountry = sfCountry;
    }

    public Boolean getPkgIsOversize() {
        return pkgIsOversize;
    }

    public void setPkgIsOversize(final Boolean pkgIsOversize) {
        this.pkgIsOversize = pkgIsOversize;
    }

    public String getPkgPackageReference1() {
        return pkgPackageReference1;
    }

    public void setPkgPackageReference1(final String pkgPackageReference1) {
        this.pkgPackageReference1 = pkgPackageReference1;
    }

    public String getPkgPackageReference2() {
        return pkgPackageReference2;
    }

    public void setPkgPackageReference2(final String pkgPackageReference2) {
        this.pkgPackageReference2 = pkgPackageReference2;
    }

    public String getPkgPackageReference3() {
        return pkgPackageReference3;
    }

    public void setPkgPackageReference3(final String pkgPackageReference3) {
        this.pkgPackageReference3 = pkgPackageReference3;
    }

    public String getPkgPackageReference4() {
        return pkgPackageReference4;
    }

    public void setPkgPackageReference4(final String pkgPackageReference4) {
        this.pkgPackageReference4 = pkgPackageReference4;
    }

    public String getPkgPackageReference5() {
        return pkgPackageReference5;
    }

    public void setPkgPackageReference5(final String pkgPackageReference5) {
        this.pkgPackageReference5 = pkgPackageReference5;
    }

    public Boolean getPkgAdditionalHandlingOption() {
        return pkgAdditionalHandlingOption;
    }

    public void setPkgAdditionalHandlingOption(final Boolean pkgAdditionalHandlingOption) {
        this.pkgAdditionalHandlingOption = pkgAdditionalHandlingOption;
    }

    public Boolean getPkgShipmentNotification1Option() {
        return pkgShipmentNotification1Option;
    }

    public void setPkgShipmentNotification1Option(final Boolean pkgShipmentNotification1Option) {
        this.pkgShipmentNotification1Option = pkgShipmentNotification1Option;
    }

    public Boolean getPkgShipmentNotification2Option() {
        return pkgShipmentNotification2Option;
    }

    public void setPkgShipmentNotification2Option(final Boolean pkgShipmentNotification2Option) {
        this.pkgShipmentNotification2Option = pkgShipmentNotification2Option;
    }

    public Boolean getPkgHazardousMaterialsOption() {
        return pkgHazardousMaterialsOption;
    }

    public void setPkgHazardousMaterialsOption(final Boolean pkgHazardousMaterialsOption) {
        this.pkgHazardousMaterialsOption = pkgHazardousMaterialsOption;
    }

    public Boolean getPkgCodoption() {
        return pkgCodoption;
    }

    public void setPkgCodoption(final Boolean pkgCodoption) {
        this.pkgCodoption = pkgCodoption;
    }

    public String getPkgCodcontrolNumber() {
        return pkgCodcontrolNumber;
    }

    public void setPkgCodcontrolNumber(final String pkgCodcontrolNumber) {
        this.pkgCodcontrolNumber = pkgCodcontrolNumber;
    }

    public String getPkgCodamount() {
        return pkgCodamount;
    }

    public void setPkgCodamount(final String pkgCodamount) {
        this.pkgCodamount = pkgCodamount;
    }

    public Boolean getPkgDeliveryConfirmationOption() {
        return pkgDeliveryConfirmationOption;
    }

    public void setPkgDeliveryConfirmationOption(final Boolean pkgDeliveryConfirmationOption) {
        this.pkgDeliveryConfirmationOption = pkgDeliveryConfirmationOption;
    }

    public Boolean getPkgVerbalConfirmationOption() {
        return pkgVerbalConfirmationOption;
    }

    public void setPkgVerbalConfirmationOption(final Boolean pkgVerbalConfirmationOption) {
        this.pkgVerbalConfirmationOption = pkgVerbalConfirmationOption;
    }

    public Boolean getPkgInsuredValueOption() {
        return pkgInsuredValueOption;
    }

    public void setPkgInsuredValueOption(final Boolean pkgInsuredValueOption) {
        this.pkgInsuredValueOption = pkgInsuredValueOption;
    }

    public String getPkgInsuredValueAmount() {
        return pkgInsuredValueAmount;
    }

    public void setPkgInsuredValueAmount(final String pkgInsuredValueAmount) {
        this.pkgInsuredValueAmount = pkgInsuredValueAmount;
    }

    public String getPkgPackageType() {
        return pkgPackageType;
    }

    public void setPkgPackageType(final String pkgPackageType) {
        this.pkgPackageType = pkgPackageType;
    }

    public String getPkgWeight() {
        return pkgWeight;
    }

    public void setPkgWeight(final String pkgWeight) {
        this.pkgWeight = pkgWeight;
    }

}
