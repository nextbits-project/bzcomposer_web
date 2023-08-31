package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaMastershippingpackagesize {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer packageSizeId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "packageSize")
    private Set<BcaShippingservice> packageSizeBcaShippingservices;

    @OneToMany(mappedBy = "packageSize")
    private Set<BcaShippingservice> packageSizeBcaShippingservices;

    @OneToMany(mappedBy = "packageSize")
    private Set<BcaShippingservice> packageSizeBcaShippingservices;

    public Integer getPackageSizeId() {
        return packageSizeId;
    }

    public void setPackageSizeId(final Integer packageSizeId) {
        this.packageSizeId = packageSizeId;
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

    public Set<BcaShippingservice> getPackageSizeBcaShippingservices() {
        return packageSizeBcaShippingservices;
    }

    public void setPackageSizeBcaShippingservices(
            final Set<BcaShippingservice> packageSizeBcaShippingservices) {
        this.packageSizeBcaShippingservices = packageSizeBcaShippingservices;
    }

    public Set<BcaShippingservice> getPackageSizeBcaShippingservices() {
        return packageSizeBcaShippingservices;
    }

    public void setPackageSizeBcaShippingservices(
            final Set<BcaShippingservice> packageSizeBcaShippingservices) {
        this.packageSizeBcaShippingservices = packageSizeBcaShippingservices;
    }

    public Set<BcaShippingservice> getPackageSizeBcaShippingservices() {
        return packageSizeBcaShippingservices;
    }

    public void setPackageSizeBcaShippingservices(
            final Set<BcaShippingservice> packageSizeBcaShippingservices) {
        this.packageSizeBcaShippingservices = packageSizeBcaShippingservices;
    }

}
