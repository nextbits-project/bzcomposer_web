package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaUser {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 50)
    private String loginId;

    @Column(length = 50)
    private String password;

    @Column
    private String confirmPassword;

    @Column
    private String emailAddress;

    @Column
    private String companyName;

    @Column
    private String legalName;

    @Column
    private String taxId;

    @Column
    private String address1;

    @Column
    private String address2;

    @Column
    private String city;

    @Column
    private String state;

    @Column
    private String zip;

    @Column
    private String country;

    @Column
    private String phone;

    @Column
    private String fax;

    @Column
    private String website;

    @Column
    private String province;

    @Column
    private String firstname;

    @Column
    private String lastname;

    @Column
    private String passwordHint;

    @Column
    private String passwordAns;

    @Column
    private String webAddress;

    @Column
    private Boolean active;

    @Column(length = 45)
    private String membershipLevel;

    @Column(length = 45)
    private String jobPosition;

    @Column
    private OffsetDateTime dateAdded;

    @Column
    private OffsetDateTime dateExpiry;

    @Column
    private Boolean deleted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @OneToMany(mappedBy = "user")
    private Set<BcaUseractivity> userBcaUseractivitys;

    @OneToMany(mappedBy = "user")
    private Set<BcaUsermapping> userBcaUsermappings;

    @OneToMany(mappedBy = "user")
    private Set<StorageUseractivity> userStorageUseractivitys;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(final String loginId) {
        this.loginId = loginId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(final String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(final String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(final String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(final String companyName) {
        this.companyName = companyName;
    }

    public String getLegalName() {
        return legalName;
    }

    public void setLegalName(final String legalName) {
        this.legalName = legalName;
    }

    public String getTaxId() {
        return taxId;
    }

    public void setTaxId(final String taxId) {
        this.taxId = taxId;
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

    public String getZip() {
        return zip;
    }

    public void setZip(final String zip) {
        this.zip = zip;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(final String country) {
        this.country = country;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(final String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(final String fax) {
        this.fax = fax;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(final String website) {
        this.website = website;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(final String province) {
        this.province = province;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(final String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(final String lastname) {
        this.lastname = lastname;
    }

    public String getPasswordHint() {
        return passwordHint;
    }

    public void setPasswordHint(final String passwordHint) {
        this.passwordHint = passwordHint;
    }

    public String getPasswordAns() {
        return passwordAns;
    }

    public void setPasswordAns(final String passwordAns) {
        this.passwordAns = passwordAns;
    }

    public String getWebAddress() {
        return webAddress;
    }

    public void setWebAddress(final String webAddress) {
        this.webAddress = webAddress;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(final Boolean active) {
        this.active = active;
    }

    public String getMembershipLevel() {
        return membershipLevel;
    }

    public void setMembershipLevel(final String membershipLevel) {
        this.membershipLevel = membershipLevel;
    }

    public String getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(final String jobPosition) {
        this.jobPosition = jobPosition;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public OffsetDateTime getDateExpiry() {
        return dateExpiry;
    }

    public void setDateExpiry(final OffsetDateTime dateExpiry) {
        this.dateExpiry = dateExpiry;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(final Boolean deleted) {
        this.deleted = deleted;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaUseractivity> getUserBcaUseractivitys() {
        return userBcaUseractivitys;
    }

    public void setUserBcaUseractivitys(final Set<BcaUseractivity> userBcaUseractivitys) {
        this.userBcaUseractivitys = userBcaUseractivitys;
    }

    public Set<BcaUsermapping> getUserBcaUsermappings() {
        return userBcaUsermappings;
    }

    public void setUserBcaUsermappings(final Set<BcaUsermapping> userBcaUsermappings) {
        this.userBcaUsermappings = userBcaUsermappings;
    }

    public Set<StorageUseractivity> getUserStorageUseractivitys() {
        return userStorageUseractivitys;
    }

    public void setUserStorageUseractivitys(
            final Set<StorageUseractivity> userStorageUseractivitys) {
        this.userStorageUseractivitys = userStorageUseractivitys;
    }

}
