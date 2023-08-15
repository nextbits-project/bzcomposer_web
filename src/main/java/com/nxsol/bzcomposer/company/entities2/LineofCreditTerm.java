package com.nxsol.bzcomposer.company.entities2;

import jakarta.persistence.Entity;

@Entity
public class LineofCreditTerm {

	private int creditTermId;
	private int companyId;
	private String name;
	private int active;
	private int days;
	private int idDefult;
	
}
