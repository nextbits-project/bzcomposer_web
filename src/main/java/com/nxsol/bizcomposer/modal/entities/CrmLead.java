package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.OffsetDateTime;


@Entity
public class CrmLead {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadId;

    @Column
    private Integer companyId;

    @Column(length = 10)
    private String status;

    @Column(length = 10)
    private String source;

    @Column
    private Integer assignedId;

    @Column(length = 1000)
    private String tags;

    @Column(length = 50)
    private String city;

    @Column(length = 50)
    private String state;

    @Column(length = 50)
    private String province;

    @Column(length = 50)
    private String country;

    @Column(length = 50)
    private String title;

    @Column(length = 50)
    private String position;

    @Column(length = 50)
    private String firstName;

    @Column(length = 50)
    private String lastName;

    @Column(length = 75)
    private String address1;

    @Column(length = 75)
    private String address2;

    @Column(length = 75)
    private String phone;

    @Column(length = 50)
    private String email;

    @Column(length = 50)
    private String zipCode;

    @Column
    private String webSite;

    @Column
    private Integer leadValue;

    @Column(length = 100)
    private String company;

    @Column(name = "\"description\"")
    private String description;

    @Column
    private Boolean isPublic;

    @Column
    private Boolean isContactToday;

    @Column
    private OffsetDateTime contactDate;

    @Column
    private OffsetDateTime createdAt;

    @Column
    private OffsetDateTime updatedAt;

    public Integer getLeadId() {
        return leadId;
    }

    public void setLeadId(final Integer leadId) {
        this.leadId = leadId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public String getSource() {
        return source;
    }

    public void setSource(final String source) {
        this.source = source;
    }

    public Integer getAssignedId() {
        return assignedId;
    }

    public void setAssignedId(final Integer assignedId) {
        this.assignedId = assignedId;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(final String tags) {
        this.tags = tags;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(final String title) {
        this.title = title;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(final String position) {
        this.position = position;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(final String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(final String webSite) {
        this.webSite = webSite;
    }

    public Integer getLeadValue() {
        return leadValue;
    }

    public void setLeadValue(final Integer leadValue) {
        this.leadValue = leadValue;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(final String company) {
        this.company = company;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public Boolean getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(final Boolean isPublic) {
        this.isPublic = isPublic;
    }

    public Boolean getIsContactToday() {
        return isContactToday;
    }

    public void setIsContactToday(final Boolean isContactToday) {
        this.isContactToday = isContactToday;
    }

    public OffsetDateTime getContactDate() {
        return contactDate;
    }

    public void setContactDate(final OffsetDateTime contactDate) {
        this.contactDate = contactDate;
    }

    public OffsetDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(final OffsetDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public OffsetDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(final OffsetDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

}
