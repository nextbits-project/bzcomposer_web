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
@Table(name ="bca_term")
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class BCA_Term  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3976905670906858166L;
	@Id
	@Column(name="TermID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL AUTO_INCREMENT")
	private @Setter@Getter int termId;
	
	@Column(name="CompanyID" , columnDefinition= "int(11) DEFAULT '0'")
	private @Setter@Getter int companyId;
	
	@Column(name="Name", columnDefinition="varchar(50) DEFAULT '0'")
	private @Setter@Getter String bcaTermName;
	
	@Column(name="Active" , columnDefinition= "int(11) DEFAULT '1'")
	private @Setter@Getter int active;
	
	@Column(name="Days" , columnDefinition= "int(11) DEFAULT '0'")
	private @Setter@Getter int days;
	
	
	@Column(name="TitleID" , columnDefinition= "TitleID` int(11) NOT NULL")
	private @Setter@Getter int titleId;
	
}
