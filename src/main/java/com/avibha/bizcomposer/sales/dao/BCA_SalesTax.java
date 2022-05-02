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
import javax.persistence.UniqueConstraint;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Maimur
 *
 */
@Entity
@Table(name ="bca_salestax", uniqueConstraints= {@UniqueConstraint(name="SalesTaxID",columnNames= {"SalesTaxID"})},
	   indexes= {@Index(name="CompanyID", columnList="CompanyID")})
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class BCA_SalesTax implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6647448625765716300L;

	@Id
	@Column(name="SalesTaxID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL AUTO_INCREMENT")
	private @Setter@Getter int salesTaxId;
	
	@Column(name="State", columnDefinition="varchar(50) DEFAULT NULL")
	private @Setter@Getter String state;
	
	@Column(name="CompanyID" , columnDefinition= "int(11) NOT NULL DEFAULT '0'")
	private @Setter@Getter int companyId;
	
	@Column(name="Active" , columnDefinition= "int(11) DEFAULT '1'")
	private @Setter@Getter int active;
	
	@Column(name="rate" , columnDefinition= "float DEFAULT '0'")
	private @Setter@Getter float salesRate;
}
