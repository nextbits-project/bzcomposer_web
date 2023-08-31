package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaClientcategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cvcategoryId;

    @Column
    private Integer companyId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "cvcategory")
    private Set<BcaVendorcategory> cvcategoryBcaVendorcategorys;

    public Integer getCvcategoryId() {
        return cvcategoryId;
    }

    public void setCvcategoryId(final Integer cvcategoryId) {
        this.cvcategoryId = cvcategoryId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final Integer companyId) {
        this.companyId = companyId;
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

    public Set<BcaVendorcategory> getCvcategoryBcaVendorcategorys() {
        return cvcategoryBcaVendorcategorys;
    }

    public void setCvcategoryBcaVendorcategorys(
            final Set<BcaVendorcategory> cvcategoryBcaVendorcategorys) {
        this.cvcategoryBcaVendorcategorys = cvcategoryBcaVendorcategorys;
    }

}
