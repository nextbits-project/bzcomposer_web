/**
 * 
 */
package com.avibha.bizcomposer.sales.dao;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name ="bca_title")
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class BCA_Title implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1082315724157993481L;
	
	@Id
	@Column(name="TitleID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL AUTO_INCREMENT")
	private @Setter@Getter int titleId;
	
	@Column(name="Title", columnDefinition="varchar(50) DEFAULT NULL")
	private @Setter@Getter String title;
	
	@Column(name="CompanyID" , columnDefinition= "int(11) DEFAULT '0'")
	private @Setter@Getter int companyId;
	
	@Column(name="Active" , columnDefinition= "int(11) DEFAULT '1'")
	private @Setter@Getter int active;
}
