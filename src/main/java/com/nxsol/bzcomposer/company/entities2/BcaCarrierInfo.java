package com.nxsol.bzcomposer.company.entities2;

import jakarta.persistence.Entity;

@Entity
public class BcaCarrierInfo {

	private int shipCarrierId;
	private int companyId;
	private String name;
	private int active;
	private int parentId;
}
