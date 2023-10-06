package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name="bca_salessummary")
public class BcaSalessummary {

    @Id
    @Column(name="SalesID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer salesId;

    @Column(name="DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name="Memo", columnDefinition = "longtext")
    private String memo;

    @Column(name="IsActive")
    private Integer isActive;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @OneToMany(mappedBy = "sales")
    private Set<BcaSalessummarydetail> salesBcaSalessummarydetails;

    public Integer getSalesId() {
        return salesId;
    }

    public void setSalesId(final Integer salesId) {
        this.salesId = salesId;
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

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaSalessummarydetail> getSalesBcaSalessummarydetails() {
        return salesBcaSalessummarydetails;
    }

    public void setSalesBcaSalessummarydetails(
            final Set<BcaSalessummarydetail> salesBcaSalessummarydetails) {
        this.salesBcaSalessummarydetails = salesBcaSalessummarydetails;
    }

}
