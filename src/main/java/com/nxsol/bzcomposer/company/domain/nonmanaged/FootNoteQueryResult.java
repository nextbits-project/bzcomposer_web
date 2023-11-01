package com.nxsol.bzcomposer.company.domain.nonmanaged;

import lombok.Data;

@Data
public class FootNoteQueryResult {

	private String footNoteID;
	private String name;
	private String description;

	public FootNoteQueryResult(String footNoteID, String name, String description) {
		this.footNoteID = footNoteID;
		this.name = name;
		this.description = description;
	}

	
}
