package com.nxsol.bizcomposer.common;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "smd_subproduct")
public class SmdSubProduct {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int subProductId;// primary
	private Integer subProductcount;
	private Integer masterProductId;
	public int getSubProductId() {
		return subProductId;
	}
	public void setSubProductId(int subProductId) {
		this.subProductId = subProductId;
	}
	public Integer getSubProductcount() {
		return subProductcount;
	}
	public void setSubProductcount(Integer subProductcount) {
		this.subProductcount = subProductcount;
	}
	public Integer getMasterProductId() {
		return masterProductId;
	}
	public void setMasterProductId(Integer masterProductId) {
		this.masterProductId = masterProductId;
	}
	
	

}
