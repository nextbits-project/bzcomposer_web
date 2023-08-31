package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaPricelevel {

    @Id
    @Column(nullable = false, updatable = false, length = 50)
    private String name;

    @Column
    private Boolean isActive;

    @Column
    private OffsetDateTime dateAdded;

    @Column(length = 50)
    private String priceLevelType;

    @Column
    private Double fixedPercentage;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "price_level_id", nullable = false)
    private BcaPricelevel priceLevel;

    @OneToMany(mappedBy = "priceLevel")
    private Set<BcaPricelevel> priceLevelBcaPricelevels;

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(final Boolean isActive) {
        this.isActive = isActive;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getPriceLevelType() {
        return priceLevelType;
    }

    public void setPriceLevelType(final String priceLevelType) {
        this.priceLevelType = priceLevelType;
    }

    public Double getFixedPercentage() {
        return fixedPercentage;
    }

    public void setFixedPercentage(final Double fixedPercentage) {
        this.fixedPercentage = fixedPercentage;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public BcaPricelevel getPriceLevel() {
        return priceLevel;
    }

    public void setPriceLevel(final BcaPricelevel priceLevel) {
        this.priceLevel = priceLevel;
    }

    public Set<BcaPricelevel> getPriceLevelBcaPricelevels() {
        return priceLevelBcaPricelevels;
    }

    public void setPriceLevelBcaPricelevels(final Set<BcaPricelevel> priceLevelBcaPricelevels) {
        this.priceLevelBcaPricelevels = priceLevelBcaPricelevels;
    }

}
