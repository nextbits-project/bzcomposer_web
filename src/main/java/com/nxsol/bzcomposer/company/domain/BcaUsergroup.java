package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.util.Set;


@Entity
@Table(name= "bca_usergroup")
public class BcaUsergroup {

    @Id
    @Column(name= "GroupID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer groupId;

    @Column(name= "UserGroupName", length = 50)
    private String userGroupName;

    @Column(name= "Level")
    private Integer level;

    @Column(name = "Description", length = 50)
    private String description;

    @Column(name= "Active")
    private Boolean active;

    @Column(name= "Deleted")
    private Boolean deleted;

    @Column(name= "AccessPermissions", length = 50)
    private String accessPermissions;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @OneToMany(mappedBy = "userGroup")
    private Set<BcaUsermapping> userGroupBcaUsermappings;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(final Integer groupId) {
        this.groupId = groupId;
    }

    public String getUserGroupName() {
        return userGroupName;
    }

    public void setUserGroupName(final String userGroupName) {
        this.userGroupName = userGroupName;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(final Integer level) {
        this.level = level;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
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

    public String getAccessPermissions() {
        return accessPermissions;
    }

    public void setAccessPermissions(final String accessPermissions) {
        this.accessPermissions = accessPermissions;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaUsermapping> getUserGroupBcaUsermappings() {
        return userGroupBcaUsermappings;
    }

    public void setUserGroupBcaUsermappings(final Set<BcaUsermapping> userGroupBcaUsermappings) {
        this.userGroupBcaUsermappings = userGroupBcaUsermappings;
    }

}
