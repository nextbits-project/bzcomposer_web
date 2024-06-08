package com.nxsol.bzcomposer.company.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "bca_rmareason")
public class BcaRmareason {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ReasonID", nullable = false, updatable = false)
	private int reasonId;

	@Column(name = "rmaReason")
	private String rmaReason;

	@Column(name = "Active")
	private Integer active;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CompanyID")
	private BcaCompany company;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentReasonID")
	private BcaRmareason parentReason;

	@OneToMany(mappedBy = "reason", fetch = FetchType.LAZY)
	private Set<BcaRma> rma;

	@OneToMany(mappedBy = "reason", fetch = FetchType.LAZY)
	private Set<BcaRmaitem> rmaItem;

	public int getReasonId() {
		return reasonId;
	}

	public void setReasonId(int reasonId) {
		this.reasonId = reasonId;
	}

	public String getRmaReason() {
		return rmaReason;
	}

	public void setRmaReason(String rmaReason) {
		this.rmaReason = rmaReason;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public BcaRmareason getParentReason() {
		return parentReason;
	}

	public void setParentReason(BcaRmareason parentReason) {
		this.parentReason = parentReason;
	}

	public Set<BcaRma> getRma() {
		return rma;
	}

	public void setRma(Set<BcaRma> rma) {
		this.rma = rma;
	}

	public Set<BcaRmaitem> getRmaItem() {
		return rmaItem;
	}

	public void setRmaItem(Set<BcaRmaitem> rmaItem) {
		this.rmaItem = rmaItem;
	}

	

}
