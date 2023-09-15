package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaPostyle {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer postyleId;

    @Column(length = 50)
    private String name;

    @Column
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
