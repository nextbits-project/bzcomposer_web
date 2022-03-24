package com.avibha.bizcomposer.sales.dao;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;

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
@Table(name ="bca_receicedtype",indexes = {@Index(name ="Index_PaymentTypeID",columnList = "PaymentTypeID")})
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class BCA_ReceivedType implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4222100171171225035L;

	
	@Id
	@Column(name="PaymentTypeID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL DEFAULT '0'")
	private @Setter@Getter int paymentTypeId;
	
	@Column(name="CompanyID" , columnDefinition= "int(11)DEFAULT '0'")
	private @Setter@Getter int companyId;
	
	@Column(name="Name", columnDefinition="varchar(50) CHARACTER SET utf8 DEFAULT '0'")
	private @Setter@Getter String paymentTypeName;
	
	@Column(name="Active" , columnDefinition= "int(11) DEFAULT '1'")
	private @Setter@Getter int active;
	
	@Column(name="Type", columnDefinition="varchar(50) CHARACTER SET utf8 DEFAULT NULL")
	private @Setter@Getter String type;
	
	@Column(name="CCTypeID" , columnDefinition= "int(11) DEFAULT '-1'")
	private @Setter@Getter int ccTypeId;
	
	@Column(name="BankAcctID" , columnDefinition= "int(11) DEFAULT '0'")
	private @Setter@Getter int bankAcctId;
	
	@Column(name="TypeCategory" , columnDefinition= "int(11) DEFAULT NULL")
	private @Setter@Getter int typeCategory;
	
}
