package com.nxsol.bzcomposer.company.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;


@Entity
public class BcaAccttype {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer acctTypeId;

    @Column(length = 50)
    private String name;

    @Column
    private Integer parentAcctTypeId;

    @Column
    private Integer rootAcctTypeId;

    @Column
    private OffsetDateTime dateAdded;

    @OneToMany(mappedBy = "acctType")
    private Set<BcaAccount> acctTypeBcaAccounts;

    public Integer getAcctTypeId() {
        return acctTypeId;
    }

    public void setAcctTypeId(final Integer acctTypeId) {
        this.acctTypeId = acctTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getParentAcctTypeId() {
        return parentAcctTypeId;
    }

    public void setParentAcctTypeId(final Integer parentAcctTypeId) {
        this.parentAcctTypeId = parentAcctTypeId;
    }

    public Integer getRootAcctTypeId() {
        return rootAcctTypeId;
    }

    public void setRootAcctTypeId(final Integer rootAcctTypeId) {
        this.rootAcctTypeId = rootAcctTypeId;
    }

    public OffsetDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(final OffsetDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public Set<BcaAccount> getAcctTypeBcaAccounts() {
        return acctTypeBcaAccounts;
    }

    public void setAcctTypeBcaAccounts(final Set<BcaAccount> acctTypeBcaAccounts) {
        this.acctTypeBcaAccounts = acctTypeBcaAccounts;
    }

}
