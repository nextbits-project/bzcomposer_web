/**
 * 
 */
package com.avibha.bizcomposer.sales.dao;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 * @author Maimur   
 *
 */
@Entity
@Table(name="bca_unitofmeasure", indexes= {@Index(name ="UnitCategoryID",columnList= ("UnitCategoryID"))})
public class BCA_UnitOfMeasure implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8624003557398025502L;

	@Id
	@Column(name="UnitCategoryID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL AUTO_INCREMENT")
	private @Setter@Getter int unitCategoryId;
	
	@Column(name = "CompanyID", columnDefinition= "int(11) DEFAULT '0'") 
	private @Setter@Getter int companyId;
	
	@Column(name = "ParentID", columnDefinition= "int(11) DEFAULT '0'") 
	private @Setter@Getter int parentId;
	
	@Column(name ="Name", columnDefinition= "varchar(50) DEFAULT NULL")
	private @Setter@Getter String unitName;
	
	@Column(name ="UseName", columnDefinition= "varchar(50) DEFAULT NULL")
	private @Setter@Getter String useName;
	
	@Column(name = "Active", columnDefinition= "int(11) DEFAULT '1'")
	private @Setter@Getter int active;
	
}
