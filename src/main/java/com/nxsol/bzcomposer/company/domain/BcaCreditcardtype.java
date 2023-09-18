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
import java.util.Set;


@Entity
public class BcaCreditcardtype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cctypeId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer cvv2;

    @Column
    private Integer active;

    @Column
    private Integer typeCategory;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id", nullable = false)
    private BcaCompany company;

    @OneToMany(mappedBy = "cctype")
    private Set<BcaPaymenttype> cctypeBcaPaymenttypes;

    @OneToMany(mappedBy = "cctype")
    private Set<StorageClientvendor> cctypeStorageClientvendors;

    public Integer getCctypeId() {
        return cctypeId;
    }

    public void setCctypeId(final Integer cctypeId) {
        this.cctypeId = cctypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getCvv2() {
        return cvv2;
    }

    public void setCvv2(final Integer cvv2) {
        this.cvv2 = cvv2;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Integer getTypeCategory() {
        return typeCategory;
    }

    public void setTypeCategory(final Integer typeCategory) {
        this.typeCategory = typeCategory;
    }

    public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<BcaPaymenttype> getCctypeBcaPaymenttypes() {
        return cctypeBcaPaymenttypes;
    }

    public void setCctypeBcaPaymenttypes(final Set<BcaPaymenttype> cctypeBcaPaymenttypes) {
        this.cctypeBcaPaymenttypes = cctypeBcaPaymenttypes;
    }

    public Set<StorageClientvendor> getCctypeStorageClientvendors() {
        return cctypeStorageClientvendors;
    }

    public void setCctypeStorageClientvendors(
            final Set<StorageClientvendor> cctypeStorageClientvendors) {
        this.cctypeStorageClientvendors = cctypeStorageClientvendors;
    }

}
