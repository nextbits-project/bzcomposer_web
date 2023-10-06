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
@Table(name= "crm_lead")
public class CrmLead {

    @Id
    @Column(name= "LeadID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer leadId;

    @Column(name= "Status", length = 10)
    private String status;

    @Column(name= "Source", length = 10)
    private String source;

    @Column(name = "AssignedId")
    private Integer assignedId;

    @Column(name= "Tags", length = 1000)
    private String tags;

    @Column(name= "City", length = 50)
    private String city;

    @Column(name= "State", length = 50)
    private String state;

    @Column(name= "Province", length = 50)
    private String province;

    @Column(name= "Country", length = 50)
    private String country;

    @Column(name= "Title", length = 50)
    private String title;

    @Column(name= "Position", length = 50)
    private String position;

    @Column(name= "FirstName", length = 50)
    private String firstName;

    @Column(name= "LastName", length = 50)
    private String lastName;

    @Column(name= "Address1", length = 75)
    private String address1;

    @Column(name= "Address2", length = 75)
    private String address2;

    @Column(name= "Phone", length = 75)
    private String phone;

    @Column(name= "Email", length = 50)
    private String email;

    @Column(name= "ZipCode", length = 50)
    private String zipCode;

    @Column(name = "WebSite")
    private String webSite;

    @Column(name = "LeadValue")
    private Integer leadValue;

    @Column(name = "Description")
    private String description;

    @Column(name = "isPublic")
    private Boolean isPublic;

    @Column(name = "isContactToday")
    private Boolean isContactToday;

    @Column(name = "contactDate")
    private OffsetDateTime contactDate;

    @Column(name = "createdAt")
    private OffsetDateTime createdAt;

    @Column(name = "updatedAt")
    private OffsetDateTime updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    public Integer getLeadId() {
        return leadId;
    }

    public void setLeadId(final Integer leadId) {
        this.leadId = leadId;
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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

}
