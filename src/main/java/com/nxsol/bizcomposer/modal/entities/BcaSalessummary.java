package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaSalessummary {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer salesId;

    @Column(length = 50)
    private String companyId;

    @Column
    private OffsetDateTime dateAdded;

    @Column(columnDefinition = "longtext")
    private String memo;

    @Column
    private Integer isActive;

    @OneToMany(mappedBy = "sales")
    private Set<BcaSalessummarydetail> salesBcaSalessummarydetails;

    @OneToMany(mappedBy = "sales")
    private Set<BcaSalessummarydetail> salesBcaSalessummarydetails;

    @OneToMany(mappedBy = "sales")
    private Set<BcaSalessummarydetail> salesBcaSalessummarydetails;

    public Integer getSalesId() {
        return salesId;
    }

    public void setSalesId(final Integer salesId) {
        this.salesId = salesId;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(final String companyId) {
        this.companyId = companyId;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(final String memo) {
        this.memo = memo;
    }

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(final Integer isActive) {
        this.isActive = isActive;
    }

    public Set<BcaSalessummarydetail> getSalesBcaSalessummarydetails() {
        return salesBcaSalessummarydetails;
    }

    public void setSalesBcaSalessummarydetails(
            final Set<BcaSalessummarydetail> salesBcaSalessummarydetails) {
        this.salesBcaSalessummarydetails = salesBcaSalessummarydetails;
    }

    public Set<BcaSalessummarydetail> getSalesBcaSalessummarydetails() {
        return salesBcaSalessummarydetails;
    }

    public void setSalesBcaSalessummarydetails(
            final Set<BcaSalessummarydetail> salesBcaSalessummarydetails) {
        this.salesBcaSalessummarydetails = salesBcaSalessummarydetails;
    }

    public Set<BcaSalessummarydetail> getSalesBcaSalessummarydetails() {
        return salesBcaSalessummarydetails;
    }

    public void setSalesBcaSalessummarydetails(
            final Set<BcaSalessummarydetail> salesBcaSalessummarydetails) {
        this.salesBcaSalessummarydetails = salesBcaSalessummarydetails;
    }

}
