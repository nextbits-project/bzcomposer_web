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
import javax.persistence.Table;

@Entity
@Table(name="bca_salesrep")
public class BcaSalesrep {

    @Id
    @Column(name="SalesRepID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer salesRepId;

    @Column(name="Name", length = 50)
    private String name;

    @Column(name="Active")
    private Integer active;
    
    @Column(name="IsDefault")
    private Boolean isDefault;

    @OneToMany(mappedBy = "salesRep")
    private Set<BcaLead> salesRepBcaLeads;
    
    @OneToMany(mappedBy = "salesRep")
    private Set<BcaClientvendor> salesRepBcaClientVendor;

    @OneToMany(mappedBy = "salesRep")
    private Set<BcaRefundlist> salesRepBcaRefundlists;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @OneToMany(mappedBy = "salesRep")
    private Set<StorageClientvendor> salesRepStorageClientvendors;

    @OneToMany(mappedBy = "salesRep")
    private Set<StorageInvoice> salesRepStorageInvoices;


    
    public Integer getSalesRepId() {
        return salesRepId;
    }

    public void setSalesRepId(final Integer salesRepId) {
        this.salesRepId = salesRepId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

    public Set<BcaLead> getSalesRepBcaLeads() {
        return salesRepBcaLeads;
    }

    public void setSalesRepBcaLeads(final Set<BcaLead> salesRepBcaLeads) {
        this.salesRepBcaLeads = salesRepBcaLeads;
    }

    public Set<BcaRefundlist> getSalesRepBcaRefundlists() {
        return salesRepBcaRefundlists;
    }

    public void setSalesRepBcaRefundlists(final Set<BcaRefundlist> salesRepBcaRefundlists) {
        this.salesRepBcaRefundlists = salesRepBcaRefundlists;
    }

    public Set<BcaClientvendor> getSalesRepBcaClientVendor() {
		return salesRepBcaClientVendor;
	}

	public void setSalesRepBcaClientVendor(Set<BcaClientvendor> salesRepBcaClientVendor) {
		this.salesRepBcaClientVendor = salesRepBcaClientVendor;
	}

	public BcaCompany getCompany() {
        return company;
    }

    public void setCompany(final BcaCompany company) {
        this.company = company;
    }

    public Set<StorageClientvendor> getSalesRepStorageClientvendors() {
        return salesRepStorageClientvendors;
    }

    public void setSalesRepStorageClientvendors(
            final Set<StorageClientvendor> salesRepStorageClientvendors) {
        this.salesRepStorageClientvendors = salesRepStorageClientvendors;
    }

//    public Set<StorageInvoice> getSalesRepStorageInvoices() {
//        return salesRepStorageInvoices;
//    }

//    public void setSalesRepStorageInvoices(final Set<StorageInvoice> salesRepStorageInvoices) {
//        this.salesRepStorageInvoices = salesRepStorageInvoices;
//    }

    public Set<StorageInvoice> getSalesRepStorageInvoices() {
        return salesRepStorageInvoices;
    }

    public void setSalesRepStorageInvoices(final Set<StorageInvoice> salesRepStorageInvoices) {
        this.salesRepStorageInvoices = salesRepStorageInvoices;
    }

	public Boolean getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}
    

}
