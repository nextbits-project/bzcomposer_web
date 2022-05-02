/**
 * 
 */
package com.avibha.bizcomposer.sales.dao;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Maimur
 *
 */
@EqualsAndHashCode
@ToString
@Entity
@Table(name="bca_cvcategory")
public class BCA_CVCategory implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = -2865342373251839491L;
	
	@Id
	@Column(name="CVCategoryID" , columnDefinition= "int(11) NOT NULL AUTO_INCREMENT")
	private @Setter@Getter int cvCategoryId;
	
	@Column(name="CompanyID" , columnDefinition= "int(255) DEFAULT NULL")
	private @Setter@Getter int companyId;
	
	@Column(name="Name", columnDefinition="varchar(50) DEFAULT NULL")
	private @Setter@Getter String cvCategoryName;
	
	@Column(name="Active" , columnDefinition= "int(11) DEFAULT '0'")
	private @Setter@Getter int active;
	
}
