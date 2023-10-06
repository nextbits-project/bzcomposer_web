package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bca_invoice_layoutcolumnssetting")
public class BcaInvoiceLayoutcolumnssetting {

	@Id
	@Column(nullable = false, updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "ColumnLabel", length = 50)
	private String columnLabel;

	@Column(name = "ColumnTitle", length = 50)
	private String columnTitle;

	@Column(name = "printStatus")
	private Integer printStatus;

	@Column(name = "Templateorder")
	private Integer templateorder;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TemplateId")
	private BcaInvoiceTemplate template;

	public String getColumnLabel() {
		return columnLabel;
	}

	public void setColumnLabel(final String columnLabel) {
		this.columnLabel = columnLabel;
	}

	public String getColumnTitle() {
		return columnTitle;
	}

	public void setColumnTitle(final String columnTitle) {
		this.columnTitle = columnTitle;
	}

	public Integer getPrintStatus() {
		return printStatus;
	}

	public void setPrintStatus(final Integer printStatus) {
		this.printStatus = printStatus;
	}

	public Integer getTemplateorder() {
		return templateorder;
	}

	public void setTemplateorder(final Integer templateorder) {
		this.templateorder = templateorder;
	}

	public BcaInvoiceTemplate getTemplate() {
		return template;
	}

	public void setTemplate(final BcaInvoiceTemplate template) {
		this.template = template;
	}

}
