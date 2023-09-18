package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaMastershippingcontainer {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer containerId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer active;

    @OneToMany(mappedBy = "container")
    private Set<BcaShippingservice> containerBcaShippingservices;

    public Integer getContainerId() {
        return containerId;
    }

    public void setContainerId(final Integer containerId) {
        this.containerId = containerId;
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

    public Set<BcaShippingservice> getContainerBcaShippingservices() {
        return containerBcaShippingservices;
    }

    public void setContainerBcaShippingservices(
            final Set<BcaShippingservice> containerBcaShippingservices) {
        this.containerBcaShippingservices = containerBcaShippingservices;
    }

}
