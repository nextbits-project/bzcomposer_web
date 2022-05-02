/**
 * 
 */
package com.avibha.bizcomposer.sales.dao;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name ="bca_message", uniqueConstraints= {@UniqueConstraint(name="MessageID",columnNames= {"MessageID"})})
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class BCA_Message implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6647448625765716300L;

	@Id
	@Column(name="MessageID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL AUTO_INCREMENT")
	private @Setter@Getter int messageId;
	
	@Column(name="Name", columnDefinition="varchar(255) DEFAULT '0'")
	private @Setter@Getter String messageName;
	
	@Column(name="CompanyID" , columnDefinition= "int(11) DEFAULT '0'")
	private @Setter@Getter int companyId;
	
	@Column(name="Active" , columnDefinition= "int(11) DEFAULT '1'")
	private @Setter@Getter int active;
}
