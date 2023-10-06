package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "galaxyshipinvoice")
public class Galaxyshipinvoice {

    @Id
    @Column(name= "ID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name= "OrderNumber")
    private Integer orderNumber;

    @Column(name= "MailClass", length = 50)
    private String mailClass;

    @Column(name= "TrackingType", length = 50)
    private String trackingType;

    @Column(name= "GroupCode", length = 50)
    private String groupCode;

    @Column(name= "Value")
    private Integer value;

    @Column(name = "Description", length = 50)
    private String description;

    @Column(name= "Lenght", length = 50)
    private String lenght;

    @Column(name= "Width", length = 50)
    private String width;

    @Column(name= "Height", length = 50)
    private String height;

    @Column(name= "Weight", length = 50)
    private String weight;

    @Column(name= "FirstName", length = 50)
    private String firstName;

    @Column(name= "LastName", length = 50)
    private String lastName;

    @Column(name= "Company", length = 50)
    private String company;

    @Column(name= "Address1", length = 50)
    private String address1;

    @Column(name= "Address2", length = 50)
    private String address2;

    @Column(name= "City", length = 50)
    private String city;

    @Column(name= "State", length = 50)
    private String state;

    @Column(name= "ZipCode", length = 50)
    private String zipCode;

    @Column(name= "Country", length = 50)
    private String country;

    @Column(name= "Email", length = 50)
    private String email;

    @Column(name= "Phone", length = 50)
    private String phone;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(final Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getMailClass() {
        return mailClass;
    }

    public void setMailClass(final String mailClass) {
        this.mailClass = mailClass;
    }

    public String getTrackingType() {
        return trackingType;
    }

    public void setTrackingType(final String trackingType) {
        this.trackingType = trackingType;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(final String groupCode) {
        this.groupCode = groupCode;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(final Integer value) {
        this.value = value;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public String getLenght() {
        return lenght;
    }

    public void setLenght(final String lenght) {
        this.lenght = lenght;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(final String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(final String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(final String weight) {
        this.weight = weight;
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

    public String getCompany() {
        return company;
    }

    public void setCompany(final String company) {
        this.company = company;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(final String phone) {
        this.phone = phone;
    }

}
