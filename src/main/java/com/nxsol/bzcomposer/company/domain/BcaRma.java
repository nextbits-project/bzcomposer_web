package com.nxsol.bzcomposer.company.domain;

import java.time.OffsetDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "bca_rma")
@Data
public class BcaRma {
	@Id
	@Column(name = "RMA_ID", nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer rmaId;
	
	@Column(name= "RMA_No")
	private Integer rmaNo;

	@Column(name = "RMA_qty")
	private Integer rmaQty;

	@Column(name = "RMA_reason")
	private String rmaReason;

	@Column(name = "DateAdded")
	private OffsetDateTime dateAdded;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CartID")
	private BcaCart cart;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "InvoiceID")
	private BcaInvoice invoice;

}
