package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaStoretype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer storeTypeId;

    @Column(length = 50)
    private String storeTypeName;

    @Column
    private String companyName;

    @Column(length = 50)
    private String firstName;

    @Column(length = 50)
    private String lastName;

    @Column
    private String address1;

    @Column
    private String address2;

    @Column
    private String city;

    @Column(length = 50)
    private String state;

    @Column(length = 50)
    private String province;

    @Column(length = 50)
    private String country;

    @Column(length = 50)
    private String zipcode;

    @Column(length = 50)
    private String email;

    @Column(columnDefinition = "longtext")
    private String packingReturnPolicy;

    @Column
    private Integer defaultStoreId;

    @Column
    private Boolean useDefaultAddress;

    @Column
    private String logoPath;

    @Column(nullable = false)
    private OffsetDateTime lastUpdated;

    @Column
    private Integer isProductSubmission;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaEsalesitemcategory> storeTypeBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaEsalesitemcategory> storeTypeBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaEsalesitemcategory> storeTypeBcaEsalesitemcategorys;

    @OneToMany(mappedBy = "storeType")
    private Set<BcaEsalesitemcategory> storeTypeBcaEsalesitemcategorys;

    public Integer getStoreTypeId() {
        return storeTypeId;
    }

    public void setStoreTypeId(final Integer storeTypeId) {
        this.storeTypeId = storeTypeId;
    }

    public String getStoreTypeName() {
        return storeTypeName;
    }

    public void setStoreTypeName(final String storeTypeName) {
        this.storeTypeName = storeTypeName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(final String companyName) {
        this.companyName = companyName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(final String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(final String lastName) {
        this.lastName = lastName;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(final String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(final String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(final String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(final String state) {
        this.state = state;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(final String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(final String country) {
        this.country = country;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(final String zipcode) {
        this.zipcode = zipcode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public String getPackingReturnPolicy() {
        return packingReturnPolicy;
    }

    public void setPackingReturnPolicy(final String packingReturnPolicy) {
        this.packingReturnPolicy = packingReturnPolicy;
    }

    public Integer getDefaultStoreId() {
        return defaultStoreId;
    }

    public void setDefaultStoreId(final Integer defaultStoreId) {
        this.defaultStoreId = defaultStoreId;
    }

    public Boolean getUseDefaultAddress() {
        return useDefaultAddress;
    }

    public void setUseDefaultAddress(final Boolean useDefaultAddress) {
        this.useDefaultAddress = useDefaultAddress;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(final String logoPath) {
        this.logoPath = logoPath;
    }

    public OffsetDateTime getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(final OffsetDateTime lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public Integer getIsProductSubmission() {
        return isProductSubmission;
    }

    public void setIsProductSubmission(final Integer isProductSubmission) {
        this.isProductSubmission = isProductSubmission;
    }

    public Set<BcaActivestoreforproductssubmission> getStoreTypeBcaActivestoreforproductssubmissions(
            ) {
        return storeTypeBcaActivestoreforproductssubmissions;
    }

    public void setStoreTypeBcaActivestoreforproductssubmissions(
            final Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions) {
        this.storeTypeBcaActivestoreforproductssubmissions = storeTypeBcaActivestoreforproductssubmissions;
    }

    public Set<BcaActivestoreforproductssubmission> getStoreTypeBcaActivestoreforproductssubmissions(
            ) {
        return storeTypeBcaActivestoreforproductssubmissions;
    }

    public void setStoreTypeBcaActivestoreforproductssubmissions(
            final Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions) {
        this.storeTypeBcaActivestoreforproductssubmissions = storeTypeBcaActivestoreforproductssubmissions;
    }

    public Set<BcaActivestoreforproductssubmission> getStoreTypeBcaActivestoreforproductssubmissions(
            ) {
        return storeTypeBcaActivestoreforproductssubmissions;
    }

    public void setStoreTypeBcaActivestoreforproductssubmissions(
            final Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions) {
        this.storeTypeBcaActivestoreforproductssubmissions = storeTypeBcaActivestoreforproductssubmissions;
    }

    public Set<BcaActivestoreforproductssubmission> getStoreTypeBcaActivestoreforproductssubmissions(
            ) {
        return storeTypeBcaActivestoreforproductssubmissions;
    }

    public void setStoreTypeBcaActivestoreforproductssubmissions(
            final Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions) {
        this.storeTypeBcaActivestoreforproductssubmissions = storeTypeBcaActivestoreforproductssubmissions;
    }

    public Set<BcaActivestoreforproductssubmission> getStoreTypeBcaActivestoreforproductssubmissions(
            ) {
        return storeTypeBcaActivestoreforproductssubmissions;
    }

    public void setStoreTypeBcaActivestoreforproductssubmissions(
            final Set<BcaActivestoreforproductssubmission> storeTypeBcaActivestoreforproductssubmissions) {
        this.storeTypeBcaActivestoreforproductssubmissions = storeTypeBcaActivestoreforproductssubmissions;
    }

    public Set<BcaEsalesitemcategory> getStoreTypeBcaEsalesitemcategorys() {
        return storeTypeBcaEsalesitemcategorys;
    }

    public void setStoreTypeBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> storeTypeBcaEsalesitemcategorys) {
        this.storeTypeBcaEsalesitemcategorys = storeTypeBcaEsalesitemcategorys;
    }

    public Set<BcaEsalesitemcategory> getStoreTypeBcaEsalesitemcategorys() {
        return storeTypeBcaEsalesitemcategorys;
    }

    public void setStoreTypeBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> storeTypeBcaEsalesitemcategorys) {
        this.storeTypeBcaEsalesitemcategorys = storeTypeBcaEsalesitemcategorys;
    }

    public Set<BcaEsalesitemcategory> getStoreTypeBcaEsalesitemcategorys() {
        return storeTypeBcaEsalesitemcategorys;
    }

    public void setStoreTypeBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> storeTypeBcaEsalesitemcategorys) {
        this.storeTypeBcaEsalesitemcategorys = storeTypeBcaEsalesitemcategorys;
    }

    public Set<BcaEsalesitemcategory> getStoreTypeBcaEsalesitemcategorys() {
        return storeTypeBcaEsalesitemcategorys;
    }

    public void setStoreTypeBcaEsalesitemcategorys(
            final Set<BcaEsalesitemcategory> storeTypeBcaEsalesitemcategorys) {
        this.storeTypeBcaEsalesitemcategorys = storeTypeBcaEsalesitemcategorys;
    }

}
