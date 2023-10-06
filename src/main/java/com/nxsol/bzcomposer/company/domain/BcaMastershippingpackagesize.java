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
@Table(name= "bca_mastershippingpackagesize")
public class BcaMastershippingpackagesize {

    @Id
    @Column(name= "PackageSizeID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer packageSizeId;

    @Column(name= "Name", length = 50)
    private String name;

    @Column(name= "Active")
    private Integer active;

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

}
