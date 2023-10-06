package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name="bca_postyle")
public class BcaPostyle {

    @Id
    @Column(name="POStyleID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer postyleId;

    @Column(name="Name", length = 50)
    private String name;

    @Column(name="Active")
    private Integer active;

    @OneToMany(mappedBy = "postyle")
    private Set<BcaCompany> postyleBcaCompanys;

    @OneToMany(mappedBy = "postyle")
    private Set<BcaPreference> postyleBcaPreferences;

    public Integer getPostyleId() {
        return postyleId;
    }

    public void setPostyleId(final Integer postyleId) {
        this.postyleId = postyleId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcaCompany> getPostyleBcaCompanys() {
        return postyleBcaCompanys;
    }

    public void setPostyleBcaCompanys(final Set<BcaCompany> postyleBcaCompanys) {
        this.postyleBcaCompanys = postyleBcaCompanys;
    }

    public Set<BcaPreference> getPostyleBcaPreferences() {
        return postyleBcaPreferences;
    }

    public void setPostyleBcaPreferences(final Set<BcaPreference> postyleBcaPreferences) {
        this.postyleBcaPreferences = postyleBcaPreferences;
    }

}
