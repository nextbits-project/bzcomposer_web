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
public class BcaRma {	
	
	@Id
	@Column(name = "RMA_No", nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rmaNo;

    @Column(name = "OrderNo")
    private String orderNo;

    @ManyToOne
    @JoinColumn(name = "InvoiceID")
    private BcaInvoice invoice;

    @ManyToOne
    @JoinColumn(name = "InvoiceTypeID")
    private BcaInvoicetype invoiceType;

    @ManyToOne
    @JoinColumn(name = "ClientVendorID")
    private BcaClientvendor clientVendor;

    @Column(name = "Status")
    private String status;

    @Column(name = "Memo")
    private String memo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany company;

    @ManyToOne
    @JoinColumn(name = "ReasonID")
    private BcaRmareason reason;

    @Column(name = "Reason")
    private String reasonText;

    @Column(name = "DateAdded")
    private OffsetDateTime dateAdded;

    @Column(name = "Active")
    private boolean active;

	

	public int getRmaNo() {
		return rmaNo;
	}

	public void setRmaNo(int rmaNo) {
		this.rmaNo = rmaNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public BcaInvoice getInvoice() {
		return invoice;
	}

	public void setInvoice(BcaInvoice invoice) {
		this.invoice = invoice;
	}

	public BcaInvoicetype getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(BcaInvoicetype invoiceType) {
		this.invoiceType = invoiceType;
	}

	public BcaClientvendor getClientVendor() {
		return clientVendor;
	}

	public void setClientVendor(BcaClientvendor clientVendor) {
		this.clientVendor = clientVendor;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public BcaCompany getCompany() {
		return company;
	}

	public void setCompany(BcaCompany company) {
		this.company = company;
	}

	public BcaRmareason getReason() {
		return reason;
	}

	public void setReason(BcaRmareason reason) {
		this.reason = reason;
	}

	public String getReasonText() {
		return reasonText;
	}

	public void setReasonText(String reasonText) {
		this.reasonText = reasonText;
	}

	public OffsetDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(OffsetDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
    
    
    
}
