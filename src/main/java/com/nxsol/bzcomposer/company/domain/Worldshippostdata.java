package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;


@Entity
public class Worldshippostdata {

    @Id
    @Column(nullable = false, updatable = false, length = 10)
    private String siIsVoid;

    @Column(length = 50)
    private String siServiceType;

    @Column(length = 50)
    private String siShipmentId;

    @Column
    private Boolean siIsHundredWeight;

    @Column
    private Boolean siIsExtendedArea;

    @Column(length = 50)
    private String siBillableWeight;

    @Column(length = 50)
    private String siBillingOption;

    @Column(length = 35)
    private String siShipmentReference1;

    @Column(length = 35)
    private String siShipmentReference2;

    @Column
    private Boolean siInsuredValueOption;

    @Column(length = 50)
    private String siInsuredValueCharge;

    @Column(length = 50)
    private String siInsuredValueAmount;

    @Column
    private Boolean siCallTagOption;

    @Column(length = 12)
    private String siCallTagReferenceNumber;

    @Column(length = 50)
    private String siCallTagCharge;

    @Column
    private Boolean siSaturdayDeliveryOption;

    @Column(length = 50)
    private String siSaturdayDeliveryCharge;

    @Column
    private Boolean siSaturdayPickupOption;

    @Column(length = 50)
    private String siSaturdayPickupCharge;

    @Column
    private Boolean siShipmentNotification1Option;

    @Column(length = 50)
    private String siShipmentNotification1Charge;

    @Column
    private Boolean siShipmentNotification2Option;

    @Column(length = 50)
    private String siShipmentNotification2Charge;

    @Column(length = 50)
    private String siDescriptionOfGoods;

    @Column(length = 50)
    private String siTotalShipmentCharge;

    @Column(length = 50)
    private String siTotalShipperCharge;

    @Column(length = 50)
    private String siTotalReceiverCharge;

    @Column(length = 50)
    private String siNumberOfPackages;

    @Column(length = 35)
    private String stAttention;

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

    @Column(length = 30)
    private String pkgTrackingNumber;

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

    @Column(length = 50)
    private String pkgAdditionalHandlingCharge;

    @Column
    private Boolean pkgShipmentNotification1Option;

    @Column(length = 50)
    private String pkgShipmentNotification1Charge;

    @Column
    private Boolean pkgShipmentNotification2Option;

    @Column(length = 50)
    private String pkgShipmentNotification2Charge;

    @Column
    private Boolean pkgHazardousMaterialsOption;

    @Column(length = 50)
    private String pkgHazardousMaterialsCharge;

    @Column
    private Boolean pkgCodoption;

    @Column(length = 11)
    private String pkgCodcontrolNumber;

    @Column(length = 50)
    private String pkgCodcharge;

    @Column(length = 50)
    private String pkgCodamount;

    @Column
    private Boolean pkgDeliveryConfirmationOption;

    @Column(length = 50)
    private String pkgDeliveryConfirmationCharge;

    @Column
    private Boolean pkgVerbalConfirmationOption;

    @Column(length = 50)
    private String pkgVerbalConfirmationCharge;

    @Column
    private Boolean pkgInsuredValueOption;

    @Column(length = 50)
    private String pkgInsuredValueCharge;

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

    public String getSiShipmentId() {
        return siShipmentId;
    }

    public void setSiShipmentId(final String siShipmentId) {
        this.siShipmentId = siShipmentId;
    }

    public Boolean getSiIsHundredWeight() {
        return siIsHundredWeight;
    }

    public void setSiIsHundredWeight(final Boolean siIsHundredWeight) {
        this.siIsHundredWeight = siIsHundredWeight;
    }

    public Boolean getSiIsExtendedArea() {
        return siIsExtendedArea;
    }

    public void setSiIsExtendedArea(final Boolean siIsExtendedArea) {
        this.siIsExtendedArea = siIsExtendedArea;
    }

    public String getSiBillableWeight() {
        return siBillableWeight;
    }

    public void setSiBillableWeight(final String siBillableWeight) {
        this.siBillableWeight = siBillableWeight;
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

    public Boolean getSiInsuredValueOption() {
        return siInsuredValueOption;
    }

    public void setSiInsuredValueOption(final Boolean siInsuredValueOption) {
        this.siInsuredValueOption = siInsuredValueOption;
    }

    public String getSiInsuredValueCharge() {
        return siInsuredValueCharge;
    }

    public void setSiInsuredValueCharge(final String siInsuredValueCharge) {
        this.siInsuredValueCharge = siInsuredValueCharge;
    }

    public String getSiInsuredValueAmount() {
        return siInsuredValueAmount;
    }

    public void setSiInsuredValueAmount(final String siInsuredValueAmount) {
        this.siInsuredValueAmount = siInsuredValueAmount;
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

    public String getSiCallTagCharge() {
        return siCallTagCharge;
    }

    public void setSiCallTagCharge(final String siCallTagCharge) {
        this.siCallTagCharge = siCallTagCharge;
    }

    public Boolean getSiSaturdayDeliveryOption() {
        return siSaturdayDeliveryOption;
    }

    public void setSiSaturdayDeliveryOption(final Boolean siSaturdayDeliveryOption) {
        this.siSaturdayDeliveryOption = siSaturdayDeliveryOption;
    }

    public String getSiSaturdayDeliveryCharge() {
        return siSaturdayDeliveryCharge;
    }

    public void setSiSaturdayDeliveryCharge(final String siSaturdayDeliveryCharge) {
        this.siSaturdayDeliveryCharge = siSaturdayDeliveryCharge;
    }

    public Boolean getSiSaturdayPickupOption() {
        return siSaturdayPickupOption;
    }

    public void setSiSaturdayPickupOption(final Boolean siSaturdayPickupOption) {
        this.siSaturdayPickupOption = siSaturdayPickupOption;
    }

    public String getSiSaturdayPickupCharge() {
        return siSaturdayPickupCharge;
    }

    public void setSiSaturdayPickupCharge(final String siSaturdayPickupCharge) {
        this.siSaturdayPickupCharge = siSaturdayPickupCharge;
    }

    public Boolean getSiShipmentNotification1Option() {
        return siShipmentNotification1Option;
    }

    public void setSiShipmentNotification1Option(final Boolean siShipmentNotification1Option) {
        this.siShipmentNotification1Option = siShipmentNotification1Option;
    }

    public String getSiShipmentNotification1Charge() {
        return siShipmentNotification1Charge;
    }

    public void setSiShipmentNotification1Charge(final String siShipmentNotification1Charge) {
        this.siShipmentNotification1Charge = siShipmentNotification1Charge;
    }

    public Boolean getSiShipmentNotification2Option() {
        return siShipmentNotification2Option;
    }

    public void setSiShipmentNotification2Option(final Boolean siShipmentNotification2Option) {
        this.siShipmentNotification2Option = siShipmentNotification2Option;
    }

    public String getSiShipmentNotification2Charge() {
        return siShipmentNotification2Charge;
    }

    public void setSiShipmentNotification2Charge(final String siShipmentNotification2Charge) {
        this.siShipmentNotification2Charge = siShipmentNotification2Charge;
    }

    public String getSiDescriptionOfGoods() {
        return siDescriptionOfGoods;
    }

    public void setSiDescriptionOfGoods(final String siDescriptionOfGoods) {
        this.siDescriptionOfGoods = siDescriptionOfGoods;
    }

    public String getSiTotalShipmentCharge() {
        return siTotalShipmentCharge;
    }

    public void setSiTotalShipmentCharge(final String siTotalShipmentCharge) {
        this.siTotalShipmentCharge = siTotalShipmentCharge;
    }

    public String getSiTotalShipperCharge() {
        return siTotalShipperCharge;
    }

    public void setSiTotalShipperCharge(final String siTotalShipperCharge) {
        this.siTotalShipperCharge = siTotalShipperCharge;
    }

    public String getSiTotalReceiverCharge() {
        return siTotalReceiverCharge;
    }

    public void setSiTotalReceiverCharge(final String siTotalReceiverCharge) {
        this.siTotalReceiverCharge = siTotalReceiverCharge;
    }

    public String getSiNumberOfPackages() {
        return siNumberOfPackages;
    }

    public void setSiNumberOfPackages(final String siNumberOfPackages) {
        this.siNumberOfPackages = siNumberOfPackages;
    }

    public String getStAttention() {
        return stAttention;
    }

    public void setStAttention(final String stAttention) {
        this.stAttention = stAttention;
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

    public String getPkgTrackingNumber() {
        return pkgTrackingNumber;
    }

    public void setPkgTrackingNumber(final String pkgTrackingNumber) {
        this.pkgTrackingNumber = pkgTrackingNumber;
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

    public String getPkgAdditionalHandlingCharge() {
        return pkgAdditionalHandlingCharge;
    }

    public void setPkgAdditionalHandlingCharge(final String pkgAdditionalHandlingCharge) {
        this.pkgAdditionalHandlingCharge = pkgAdditionalHandlingCharge;
    }

    public Boolean getPkgShipmentNotification1Option() {
        return pkgShipmentNotification1Option;
    }

    public void setPkgShipmentNotification1Option(final Boolean pkgShipmentNotification1Option) {
        this.pkgShipmentNotification1Option = pkgShipmentNotification1Option;
    }

    public String getPkgShipmentNotification1Charge() {
        return pkgShipmentNotification1Charge;
    }

    public void setPkgShipmentNotification1Charge(final String pkgShipmentNotification1Charge) {
        this.pkgShipmentNotification1Charge = pkgShipmentNotification1Charge;
    }

    public Boolean getPkgShipmentNotification2Option() {
        return pkgShipmentNotification2Option;
    }

    public void setPkgShipmentNotification2Option(final Boolean pkgShipmentNotification2Option) {
        this.pkgShipmentNotification2Option = pkgShipmentNotification2Option;
    }

    public String getPkgShipmentNotification2Charge() {
        return pkgShipmentNotification2Charge;
    }

    public void setPkgShipmentNotification2Charge(final String pkgShipmentNotification2Charge) {
        this.pkgShipmentNotification2Charge = pkgShipmentNotification2Charge;
    }

    public Boolean getPkgHazardousMaterialsOption() {
        return pkgHazardousMaterialsOption;
    }

    public void setPkgHazardousMaterialsOption(final Boolean pkgHazardousMaterialsOption) {
        this.pkgHazardousMaterialsOption = pkgHazardousMaterialsOption;
    }

    public String getPkgHazardousMaterialsCharge() {
        return pkgHazardousMaterialsCharge;
    }

    public void setPkgHazardousMaterialsCharge(final String pkgHazardousMaterialsCharge) {
        this.pkgHazardousMaterialsCharge = pkgHazardousMaterialsCharge;
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

    public String getPkgCodcharge() {
        return pkgCodcharge;
    }

    public void setPkgCodcharge(final String pkgCodcharge) {
        this.pkgCodcharge = pkgCodcharge;
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

    public String getPkgDeliveryConfirmationCharge() {
        return pkgDeliveryConfirmationCharge;
    }

    public void setPkgDeliveryConfirmationCharge(final String pkgDeliveryConfirmationCharge) {
        this.pkgDeliveryConfirmationCharge = pkgDeliveryConfirmationCharge;
    }

    public Boolean getPkgVerbalConfirmationOption() {
        return pkgVerbalConfirmationOption;
    }

    public void setPkgVerbalConfirmationOption(final Boolean pkgVerbalConfirmationOption) {
        this.pkgVerbalConfirmationOption = pkgVerbalConfirmationOption;
    }

    public String getPkgVerbalConfirmationCharge() {
        return pkgVerbalConfirmationCharge;
    }

    public void setPkgVerbalConfirmationCharge(final String pkgVerbalConfirmationCharge) {
        this.pkgVerbalConfirmationCharge = pkgVerbalConfirmationCharge;
    }

    public Boolean getPkgInsuredValueOption() {
        return pkgInsuredValueOption;
    }

    public void setPkgInsuredValueOption(final Boolean pkgInsuredValueOption) {
        this.pkgInsuredValueOption = pkgInsuredValueOption;
    }

    public String getPkgInsuredValueCharge() {
        return pkgInsuredValueCharge;
    }

    public void setPkgInsuredValueCharge(final String pkgInsuredValueCharge) {
        this.pkgInsuredValueCharge = pkgInsuredValueCharge;
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
