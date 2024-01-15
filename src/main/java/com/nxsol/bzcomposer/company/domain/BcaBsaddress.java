package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDate;
import javax.persistence.Table;

@Entity
@Table(name= "bca_bsaddress")
public class BcaBsaddress {

//    @Id
//    @Column(name = "BSAddressID", nullable = false, updatable = false)
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "BSAddressID", nullable = false, updatable = false)
    private Integer bsaddressId;

    @Column(name = "ClientVendorID", nullable = false)
    private Integer clientVendorId;

    @Column(name = "Name", nullable = false, length = 50)
    private String name;

    @Column(name = "DBAName", length = 45)
    private String dbaname;

    @Column(name = "FirstName", nullable = false, length = 20)
    private String firstName;

    @Column(name = "LastName", nullable = false, length = 20)
    private String lastName;

    @Column(name = "Address1", nullable = false, length = 100)
    private String address1;

    @Column(name = "Address2", nullable = false, length = 100)
    private String address2;

    @Column(name = "City", nullable = false, length = 50)
    private String city;

    @Column(name = "ZipCode", nullable = false, length = 20)
    private String zipCode;

    @Column(name = "Country", nullable = false, length = 30)
    private String country;

    @Column(name = "State", nullable = false, length = 30)
    private String state;

    @Column(name = "Province", nullable = false, length = 30)
    private String province;

    @Column(name = "AddressType", nullable = false, length = 25)
    private String addressType;

    @Column(name = "DateAdded", nullable = false)
    private LocalDate dateAdded;

    @Column(name = "Status", nullable = false, length = 10)
    private String status;

    public Integer getBsaddressId() {
        return bsaddressId;
    }

    public void setBsaddressId(final Integer bsaddressId) {
        this.bsaddressId = bsaddressId;
    }

    public Integer getClientVendorId() {
        return clientVendorId;
    }

    public void setClientVendorId(final Integer clientVendorId) {
        this.clientVendorId = clientVendorId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getDbaname() {
        return dbaname;
    }

    public void setDbaname(final String dbaname) {
        this.dbaname = dbaname;
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

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(final String country) {
        this.country = country;
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

    public String getAddressType() {
        return addressType;
    }

    public void setAddressType(final String addressType) {
        this.addressType = addressType;
    }

    public LocalDate getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final LocalDate dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

}
