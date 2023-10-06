package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_masterbalancesheetitem")
public class BcaMasterbalancesheetitem {

    @Id
    @Column(name= "balancesheetitemID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer balancesheetitemId;

    @Column(name= "CategoryTypeID")
    private Integer categoryTypeId;

    @Column(name= "Name", length = 50)
    private String name;

    @Column(name= "Amount")
    private Double amount;

    public Integer getBalancesheetitemId() {
        return balancesheetitemId;
    }

    public void setBalancesheetitemId(final Integer balancesheetitemId) {
        this.balancesheetitemId = balancesheetitemId;
    }

    public Integer getCategoryTypeId() {
        return categoryTypeId;
    }

    public void setCategoryTypeId(final Integer categoryTypeId) {
        this.categoryTypeId = categoryTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(final Double amount) {
        this.amount = amount;
    }

}
