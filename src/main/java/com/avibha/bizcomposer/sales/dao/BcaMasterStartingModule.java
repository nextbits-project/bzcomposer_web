package com.avibha.bizcomposer.sales.dao;

import jakarta.persistence.Entity;
import lombok.Data;

@Entity
@Data
public class BcaMasterStartingModule {

	private int startModuleId;
	private int businessTypeId;
	private String moduleName;
	
}
