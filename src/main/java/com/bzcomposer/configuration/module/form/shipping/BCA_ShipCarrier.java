/**
 * 
 */
package com.bzcomposer.configuration.module.form.shipping;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.Getter;
import lombok.Setter;

/**
 * @author Maimur   
 *
 */
@Entity
@Table(name="bca_shipcarrier",uniqueConstraints = {@UniqueConstraint(name = "shipCarrierID", columnNames = {"shipCarrierID"})},
	   indexes= {@Index(name ="CompanyID",columnList= ("CompanyID")),@Index(name="ParentID",columnList="ParentID")})
public class BCA_ShipCarrier implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8970172960464695922L;

	@Id
	@Column(name="ShipCarrierID" , updatable = false, nullable = false, columnDefinition= "int(11) NOT NULL AUTO_INCREMENT")
	private @Setter@Getter int shipCarrierID;
	
	@Column(name = "CompanyID", columnDefinition= "int(11) DEFAULT '0'") 
	private @Setter@Getter int companyId;
	
	@Column(name = "ParentID", columnDefinition= "int(11) DEFAULT '0'") 
	private @Setter@Getter int parentId;
	
	@Column(name ="Name", columnDefinition= "varchar(255) DEFAULT '0'")
	private @Setter@Getter String shipCarrierName;
	
	@Column(name = "Active", columnDefinition= "int(11) DEFAULT '1'")
	private @Setter@Getter int active;
	
}
