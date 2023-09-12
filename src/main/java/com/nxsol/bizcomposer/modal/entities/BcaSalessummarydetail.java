package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.math.BigDecimal;


@Entity
public class BcaSalessummarydetail {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(precision = 23, scale = 4)
    private BigDecimal amount;

    @Column(name = "\"description\"", length = 100)
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_id")
    private BcaSalessummary sales;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_id")
    private BcaSalessummary sales;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_id")
    private BcaSalessummary sales;

    public Integer getId() {
        return id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(final BigDecimal amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public BcaSalessummary getSales() {
        return sales;
    }

    public void setSales(final BcaSalessummary sales) {
        this.sales = sales;
    }

    public BcaSalessummary getSales() {
        return sales;
    }

    public void setSales(final BcaSalessummary sales) {
        this.sales = sales;
    }

    public BcaSalessummary getSales() {
        return sales;
    }

    public void setSales(final BcaSalessummary sales) {
        this.sales = sales;
    }

}
