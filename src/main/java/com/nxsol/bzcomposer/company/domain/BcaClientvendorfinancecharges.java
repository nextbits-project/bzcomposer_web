package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bca_clientvendorfinancecharges")
public class BcaClientvendorfinancecharges {

//    @Id
//    @Column(nullable = false, updatable = false)
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;

	@Id
	@Column(name = "ClientVendorID", nullable = false, updatable = false)
	private Integer clientVendorId;

	@Column(name = "UseIndividual")
	private Boolean useIndividual;

	@Column(name = "AnnualInterestRate")
	private Double annualInterestRate;

	@Column(name = "MinimumFinanceCharge")
	private Double minimumFinanceCharge;

	@Column(name = "GracePeriod")
	private Integer gracePeriod;

	@Column(name = "AssessFinanceCharge")
	private Boolean assessFinanceCharge;

	@Column(name = "MarkFinanceCharge")
	private Boolean markFinanceCharge;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ClientVendorID", referencedColumnName = "ClientVendorID", insertable = false, updatable = false)
	private BcaClientvendor clientVendor;

//    public Long getId() {
//        return id;
//    }
//
//    public void setId(final Long id) {
//        this.id = id;
//    }

	public Integer getClientVendorId() {
		return clientVendorId;
	}

	public void setClientVendorId(Integer clientVendorId) {
		this.clientVendorId = clientVendorId;
	}

	public Boolean getUseIndividual() {
		return useIndividual;
	}

	public void setUseIndividual(final Boolean useIndividual) {
		this.useIndividual = useIndividual;
	}

	public Double getAnnualInterestRate() {
		return annualInterestRate;
	}

	public void setAnnualInterestRate(final Double annualInterestRate) {
		this.annualInterestRate = annualInterestRate;
	}

	public Double getMinimumFinanceCharge() {
		return minimumFinanceCharge;
	}

	public void setMinimumFinanceCharge(final Double minimumFinanceCharge) {
		this.minimumFinanceCharge = minimumFinanceCharge;
	}

	public Integer getGracePeriod() {
		return gracePeriod;
	}

	public void setGracePeriod(final Integer gracePeriod) {
		this.gracePeriod = gracePeriod;
	}

	public Boolean getAssessFinanceCharge() {
		return assessFinanceCharge;
	}

	public void setAssessFinanceCharge(final Boolean assessFinanceCharge) {
		this.assessFinanceCharge = assessFinanceCharge;
	}

	public Boolean getMarkFinanceCharge() {
		return markFinanceCharge;
	}

	public void setMarkFinanceCharge(final Boolean markFinanceCharge) {
		this.markFinanceCharge = markFinanceCharge;
	}

	public BcaClientvendor getClientVendor() {
		return clientVendor;
	}

	public void setClientVendor(final BcaClientvendor clientVendor) {
		this.clientVendor = clientVendor;
	}

}
