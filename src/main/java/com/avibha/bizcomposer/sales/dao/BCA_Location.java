/**
 * 
 */
package com.avibha.bizcomposer.sales.dao;

import java.io.Serializable;
import java.util.Date;

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
@Table(name ="bca_location")
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class BCA_Location implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 7580397611264408802L;

	@Id
	@Column(name="LocationID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL")
	private @Setter@Getter int locationId;
	
	@Column(name="CompanyID" , columnDefinition= "int(11)  NULL")
	private @Setter@Getter int companyId;
	
	@Column(name="Name", columnDefinition="varchar(50) NOT NULL")
	private @Setter@Getter String locationName;
	
	@Column(name="Active" , columnDefinition= "int(11)  NULL")
	private @Setter@Getter int active;
	
	@Column(name="DateAdded" , columnDefinition= "timestamp NOT NULL")
	private @Setter@Getter Date dateAdded;
	
}
