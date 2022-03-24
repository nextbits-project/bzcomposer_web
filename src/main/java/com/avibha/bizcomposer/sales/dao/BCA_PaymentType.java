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
@Table(name ="bca_paymenttype",uniqueConstraints = {@UniqueConstraint(name = "PaymentTypeID", columnNames = {"PaymentTypeID"})}
,indexes = {@Index(name ="CCTypeID",columnList = "CCTypeID"),@Index(name="BankAcctID",columnList="BankAcctID")})
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class BCA_PaymentType implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4222100171171225035L;

	
	@Id
	@Column(name="PaymentTypeID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL")
	private @Setter@Getter int paymentTypeId;
	
	@Column(name="CompanyID" , columnDefinition= "int(11)  NULL")
	private @Setter@Getter int companyId;
	
	@Column(name="Name", columnDefinition="varchar(50)  NULL")
	private @Setter@Getter String paymentTypeName;
	
	@Column(name="Active" , columnDefinition= "int(11)  NULL")
	private @Setter@Getter int active;
	
	@Column(name="Type", columnDefinition="varchar(50)  NULL")
	private @Setter@Getter String type;
	
	@Column(name="CCTypeID" , columnDefinition= "int(11)  NULL")
	private @Setter@Getter int ccTypeId;
	
	@Column(name="BankAcctID" , columnDefinition= "int(11)  NULL")
	private @Setter@Getter int bankAcctId;
	
	@Column(name="TypeCategory" , columnDefinition= "int(11)  NULL")
	private @Setter@Getter int typeCategory;
	
}
