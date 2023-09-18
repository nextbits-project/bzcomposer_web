package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BcaInventorycrosssell {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer crossSellId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    public Integer getCrossSellId() {
        return crossSellId;
    }

    public void setCrossSellId(final Integer crossSellId) {
        this.crossSellId = crossSellId;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

}
