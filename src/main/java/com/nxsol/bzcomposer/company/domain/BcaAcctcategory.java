package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import java.util.Set;
import javax.persistence.Table;

@Entity
@Table(name = "bca_acctcategory")
public class BcaAcctcategory {

    @Id
    @Column(name = "AcctCategoryID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer acctCategoryId;

    @Column(name = "Name", nullable = false, length = 50)
    private String name;

    @Column(name = "Active", nullable = false)
    private Boolean active;
    
    @OneToMany(mappedBy = "acctCategory")
    private Set<BcaAccount> acctCategoryBcaAccounts;

    @ManyToOne
    @JoinColumn(name = "CompanyID", nullable = false)
    private BcaCompany company;
    
    public Integer getAcctCategoryId() {
        return acctCategoryId;
    }

    public void setAcctCategoryId(final Integer acctCategoryId) {
        this.acctCategoryId = acctCategoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Set<BcaAccount> getAcctCategoryBcaAccounts() {
        return acctCategoryBcaAccounts;
    }

    public void setAcctCategoryBcaAccounts(final Set<BcaAccount> acctCategoryBcaAccounts) {
        this.acctCategoryBcaAccounts = acctCategoryBcaAccounts;
    }

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

    
}
