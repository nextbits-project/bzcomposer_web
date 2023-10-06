package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.time.OffsetDateTime;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name = "bca_accttype")
public class BcaAccttype {

    @Id
    @Column(name = "AcctTypeID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer acctTypeId;

    @Column(name = "Name", length = 50)
    private String name;

    @Column(name= " ParentAcctTypeID")
    private Integer parentAcctTypeId;

    @Column(name = "RootAcctTypeID")
    private Integer rootAcctTypeId;

    @Column(name = "DateAdded")
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
