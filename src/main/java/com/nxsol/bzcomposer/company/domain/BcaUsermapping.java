package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BcaUsermapping {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer mappingId;

    @Column(name = "\"role\"", length = 50)
    private String role;

    @Column
    private Boolean active;

    @Column
    private Boolean deleted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_group_id")
    private BcaUsergroup userGroup;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private BcaUser user;

    public Integer getMappingId() {
        return mappingId;
    }

    public void setMappingId(final Integer mappingId) {
        this.mappingId = mappingId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(final String role) {
        this.role = role;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(final Boolean active) {
        this.active = active;
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

    public BcaUsergroup getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(final BcaUsergroup userGroup) {
        this.userGroup = userGroup;
    }

    public BcaUser getUser() {
        return user;
    }

    public void setUser(final BcaUser user) {
        this.user = user;
    }

}
