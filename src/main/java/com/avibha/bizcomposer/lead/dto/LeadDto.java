/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.lead.dto;

import java.util.Date;

public class LeadDto {

	private static final long serialVersionUID = 0;

	private Long leadId;
	private Long assignedId;
	private String status;
	private String source;
	private String assigned;
	private String city;
	private String tags;

	private String position;
	private String address1;
	private String address2;
	private String firstName;
	private String lastName;
	private String title;
	private String email;

	private String state;
	private String website;
	private String country;
	private String phone;
	private String zipCode;
	private Long leadValue;
	private String defaultLanguage;
	private String company;
	private String description;

	private boolean leadPublic;
	private boolean contactToday;
	private String contactDate;
	private String createdAT;
	private String updatedAT;

	public Long getLeadId() {
		return leadId;
	}

	public void setLeadId(Long leadId) {
		this.leadId = leadId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getAssigned() {
		return assigned;
	}

	public void setAssigned(String assigned) {
		this.assigned = assigned;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public Long getLeadValue() {
		return leadValue;
	}

	public void setLeadValue(Long leadValue) {
		this.leadValue = leadValue;
	}

	public String getDefaultLanguage() {
		return defaultLanguage;
	}

	public void setDefaultLanguage(String defaultLanguage) {
		this.defaultLanguage = defaultLanguage;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setLeadPublic(boolean leadPublic) {
		this.leadPublic = leadPublic;
	}

	public boolean isLeadPublic() {
		return leadPublic;
	}

	public boolean isContactToday() {
		return contactToday;
	}

	public void setContactToday(boolean contactToday) {
		this.contactToday = contactToday;
	}

	public String getContactDate() {
		return contactDate;
	}

	public void setContactDate(String contactDate) {
		this.contactDate = contactDate;
	}

	public void setAssignedId(Long assignedId) {
		this.assignedId = assignedId;
	}

	public Long getAssignedId() {
		return assignedId;
	}

	public void setCreatedAT(String createdAT) {
		this.createdAT = createdAT;
	}

	public void setUpdatedAT(String updatedAT) {
		this.updatedAT = updatedAT;
	}

	public String getCreatedAT() {
		return createdAT;
	}

	public String getUpdatedAT() {
		return updatedAT;
	}

}