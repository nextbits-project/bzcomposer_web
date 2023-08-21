package com.nxsol.bizcomposer.common;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table( name = "adjustment_reason")
public class AdjustmentReason {

	private int id; // primary key
	private int inventoryId; //foreign key
	private String inventoryCode;
	private int oldQty;
	private int newQty;
	private int gap;
	private String reason;
	private int companyId;// foreign key
	private LocalDateTime datePerformed;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getInventoryId() {
		return inventoryId;
	}
	public void setInventoryId(int inventoryId) {
		this.inventoryId = inventoryId;
	}
	public String getInventoryCode() {
		return inventoryCode;
	}
	public void setInventoryCode(String inventoryCode) {
		this.inventoryCode = inventoryCode;
	}
	public int getOldQty() {
		return oldQty;
	}
	public void setOldQty(int oldQty) {
		this.oldQty = oldQty;
	}
	public int getNewQty() {
		return newQty;
	}
	public void setNewQty(int newQty) {
		this.newQty = newQty;
	}
	public int getGap() {
		return gap;
	}
	public void setGap(int gap) {
		this.gap = gap;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public LocalDateTime getDatePerformed() {
		return datePerformed;
	}
	public void setDatePerformed(LocalDateTime datePerformed) {
		this.datePerformed = datePerformed;
	}
	
	
	
}
