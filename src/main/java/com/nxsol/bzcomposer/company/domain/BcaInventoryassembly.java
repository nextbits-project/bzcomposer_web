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
public class BcaInventoryassembly {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer kitId;

    @Column
    private Integer qty;

    @Column
    private Double cost;

    @Column
    private Double total;

    @Column
    private Integer reservedQty;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_id")
    private BcaIteminventory inventory;

    public Integer getKitId() {
        return kitId;
    }

    public void setKitId(final Integer kitId) {
        this.kitId = kitId;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(final Integer qty) {
        this.qty = qty;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(final Double cost) {
        this.cost = cost;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(final Double total) {
        this.total = total;
    }

    public Integer getReservedQty() {
        return reservedQty;
    }

    public void setReservedQty(final Integer reservedQty) {
        this.reservedQty = reservedQty;
    }

    public BcaIteminventory getInventory() {
        return inventory;
    }

    public void setInventory(final BcaIteminventory inventory) {
        this.inventory = inventory;
    }

}
