package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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

    @OneToMany(mappedBy = "container")
    private Set<BcaShippingservice> containerBcaShippingservices;

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

    public Set<BcaShippingservice> getContainerBcaShippingservices() {
        return containerBcaShippingservices;
    }

    public void setContainerBcaShippingservices(
            final Set<BcaShippingservice> containerBcaShippingservices) {
        this.containerBcaShippingservices = containerBcaShippingservices;
    }

    public Set<BcaShippingservice> getContainerBcaShippingservices() {
        return containerBcaShippingservices;
    }

    public void setContainerBcaShippingservices(
            final Set<BcaShippingservice> containerBcaShippingservices) {
        this.containerBcaShippingservices = containerBcaShippingservices;
    }

}
