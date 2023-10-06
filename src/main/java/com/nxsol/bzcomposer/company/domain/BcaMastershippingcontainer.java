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
@Table(name= "bca_mastershippingcontainer")
public class BcaMastershippingcontainer {

    @Id
    @Column(name= "ContainerID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer containerId;

    @Column(name= "Name", length = 50)
    private String name;

    @Column(name= "Active")
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
