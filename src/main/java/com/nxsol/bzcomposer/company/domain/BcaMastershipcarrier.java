package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class BcaMastershipcarrier {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer shipCarrierId;

    @Column(length = 50)
    private String name;

    public Integer getShipCarrierId() {
        return shipCarrierId;
    }

    public void setShipCarrierId(final Integer shipCarrierId) {
        this.shipCarrierId = shipCarrierId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

}
