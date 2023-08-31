package com.nxsol.bizcomposer.modal.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.OffsetDateTime;


@Entity
public class AdjustmentReason {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private String inventoryCode;

    @Column
    private Integer oldQty;

    @Column
    private Integer newQty;

    @Column
    private Integer gap;

    @Column
    private String reason;

    @Column
    private String memo;

    @Column
    private OffsetDateTime datePerformed;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private BcaCompany company;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventoryid_id")
    private BcaIteminventory inventoryid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getInventoryCode() {
		return inventoryCode;
	}

	public void setInventoryCode(String inventoryCode) {
		this.inventoryCode = inventoryCode;
	}

	public Integer getOldQty() {
		return oldQty;
	}

	public void setOldQty(Integer oldQty) {
		this.oldQty = oldQty;
	}

	public Integer getNewQty() {
		return newQty;
	}

	public void setNewQty(Integer newQty) {
		this.newQty = newQty;
	}

	public Integer getGap() {
		return gap;
	}

	public void setGap(Integer gap) {
		this.gap = gap;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public OffsetDateTime getDatePerformed() {
		return datePerformed;
	}

	public void setDatePerformed(OffsetDateTime datePerformed) {
		this.datePerformed = datePerformed;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public BcaIteminventory getInventoryid() {
		return inventoryid;
	}

	public void setInventoryid(BcaIteminventory inventoryid) {
		this.inventoryid = inventoryid;
	}

   



}
