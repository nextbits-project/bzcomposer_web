package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.Set;


@Entity
public class BcaAcctcategory {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer acctCategoryId;

    @Column(nullable = false, length = 50)
    private String name;

    @OneToMany(mappedBy = "acctCategory")
    private Set<BcaAccount> acctCategoryBcaAccounts;

	public Integer getAcctCategoryId() {
		return acctCategoryId;
	}

	public void setAcctCategoryId(Integer acctCategoryId) {
		this.acctCategoryId = acctCategoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<BcaAccount> getAcctCategoryBcaAccounts() {
		return acctCategoryBcaAccounts;
	}

	public void setAcctCategoryBcaAccounts(Set<BcaAccount> acctCategoryBcaAccounts) {
		this.acctCategoryBcaAccounts = acctCategoryBcaAccounts;
	}

 


}
