package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.OffsetDateTime;
import javax.persistence.Table;

@Entity
@Table(name = "bca_scheduletimes")
public class BcaScheduletimes {

	@Id
	@Column(name = "ScheduleId", nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer scheduleId;

	@Column(name = "ScheduleTime")
	private Integer scheduleTime;

	@Column(name = "ScheduleDate", nullable = false)
	private OffsetDateTime scheduleDate;

	@Column(name = "CategeoryType")
	private Integer categeoryType;

	@Column(name = "ScheduleMinute")
	private Integer scheduleMinute;

	@Column(name = "isCompleted")
	private Integer isCompleted;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CompanyID")
	private BcaCompany company;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "StoreID")
	private BcaStore store;

	public Integer getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Integer getScheduleTime() {
		return scheduleTime;
	}

	public void setScheduleTime(final Integer scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	public OffsetDateTime getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(final OffsetDateTime scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public Integer getCategeoryType() {
		return categeoryType;
	}

	public void setCategeoryType(final Integer categeoryType) {
		this.categeoryType = categeoryType;
	}

	public Integer getScheduleMinute() {
		return scheduleMinute;
	}

	public void setScheduleMinute(final Integer scheduleMinute) {
		this.scheduleMinute = scheduleMinute;
	}

	public Integer getIsCompleted() {
		return isCompleted;
	}

	public void setIsCompleted(final Integer isCompleted) {
		this.isCompleted = isCompleted;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(final BcaCompany company) {
		this.company = company;
	}

	public BcaStore getStore() {
		return store;
	}

	public void setStore(final BcaStore store) {
		this.store = store;
	}

}
