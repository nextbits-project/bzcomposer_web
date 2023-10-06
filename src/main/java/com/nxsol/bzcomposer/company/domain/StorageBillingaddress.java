package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name= "storage_billingaddress")
public class StorageBillingaddress {

    @Id
    @Column(name= "AddressID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer addressId;

    @Column(name= "AddressName", length = 50)
    private String addressName;

    @Column(name= "Name", length = 50)
    private String name;

    @Column(name= "FirstName", length = 50)
    private String firstName;

    @Column(name= "LastName", length = 50)
    private String lastName;

    @Column(name= "Address1", length = 75)
    private String address1;

    @Column(name= "Address2", length = 75)
    private String address2;

    @Column(name= "City", length = 50)
    private String city;

    @Column(name= "State", length = 50)
    private String state;

    @Column(name= "Province", length = 50)
    private String province;

    @Column(name= "Country", length = 50)
    private String country;

    @Column(name= "ZipCode", length = 50)
    private String zipCode;

    @Column(name= "Status", length = 10)
    private String status;

    @Column(name= "DateAdded", nullable = false)
    private OffsetDateTime dateAdded;

    @Column(name= "Phone", length = 20)
    private String phone;

    @Column(name= "CellPhone", length = 20)
    private String cellPhone;

    @Column(name= "Fax", length = 20)
    private String fax;

    @Column(name= "isDefault")
    private Integer isDefault;

    @Column(name= "Active")
    private Integer active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(final Integer addressId) {
        this.addressId = addressId;
    }

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(final String addressName) {
        this.addressName = addressName;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
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

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(final String phone) {
        this.phone = phone;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(final String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(final String fax) {
        this.fax = fax;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(final Integer isDefault) {
        this.isDefault = isDefault;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public BcaClientvendor getClientVendor() {
        return clientVendor;
    }

    public void setClientVendor(final BcaClientvendor clientVendor) {
        this.clientVendor = clientVendor;
    }

}
