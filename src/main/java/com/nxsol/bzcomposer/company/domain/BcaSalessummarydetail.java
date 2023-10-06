package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import javax.persistence.Table;

@Entity
@Table(name="bca_salessummarydetail")
public class BcaSalessummarydetail {

    @Id
    @Column(name = "Id", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Amount", precision = 23, scale = 4)
    private BigDecimal amount;

    @Column(name = "Description", length = 100)
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SalesID")
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

}
