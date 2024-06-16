/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.rma.forms;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import com.nxsol.bzcomposer.company.domain.BcaRmaitem;

import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@NoArgsConstructor
public class RMADto implements Serializable{

	private static final long serialVersionUID = 0;

	private int startPage;

	private int totalPages;

	private String Rma;

	private String status;

	private String fname;

	private String lname;

	private String email;

	private String companyName;

	private String phone;

	private String mobile;

	private String order;

	private String orderDate;

	private String sentDate;

	private String cusName;

	private String itemCode;

	private String itemDesc;

	private String Qty;

	private String Reason;

	private String unitPrice;

	private String unitWeight;

	private String cartID;

	private int invoiceID;
	
	private int rmaItemID;

	// for bca_rmareason starts
	private int reasonId;
	
	private String rmaReason;
	private int parentReasonID;
	
	// for bca_rmareason ends

	private List<RmaItems> rmaItems;
	private List<String> deletedItemIds;

	public static class RmaItems {
		private String rmaItemID;
		private String itemCode;
		private String itemDesc;
		private int qty;
		

		// Getters and setters
		
		public String getItemCode() {
			return itemCode;
		}

		public String getRmaItemID() {
			return rmaItemID;
		}

		public void setRmaItemID(String rmaItemID) {
			this.rmaItemID = rmaItemID;
		}

		public void setItemCode(String itemCode) {
			this.itemCode = itemCode;
		}

		public String getItemDesc() {
			return itemDesc;
		}

		public void setItemDesc(String itemDesc) {
			this.itemDesc = itemDesc;
		}

		public int getQty() {
			return qty;
		}

		public void setQty(int qty) {
			this.qty = qty;
		}

	}

	public String getRma() {
		return Rma;
	}

	public void setRma(String rma) {
		Rma = rma;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getSentDate() {
		return sentDate;
	}

	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getReason() {
		return Reason;
	}

	public void setReason(String reason) {
		Reason = reason;
	}

	public String getQty() {
		return Qty;
	}

	public void setQty(String qty) {
		Qty = qty;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getUnitWeight() {
		return unitWeight;
	}

	public void setUnitWeight(String unitWeight) {
		this.unitWeight = unitWeight;
	}

	public String getCartID() {
		return cartID;
	}

	public void setCartID(String cartID) {
		this.cartID = cartID;
	}

	/*
	 * public void reset(ActionMapping mapping, HttpServletRequest request) {
	 * super.reset(mapping, request);
	 * 
	 * Rma = null;
	 * 
	 * fname = null;
	 * 
	 * lname = null;
	 * 
	 * order = null;
	 * 
	 * orderDate = null;
	 * 
	 * sentDate = null;
	 * 
	 * cusName = null;
	 * 
	 * itemCode = null;
	 * 
	 * itemDesc = null;
	 * 
	 * Qty = null;
	 * 
	 * Reason = null;
	 * 
	 * unitPrice = null;
	 * 
	 * unitWeight = null;
	 * 
	 * cartID = null;
	 * 
	 * }
	 */

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public RMADto(String firstName, String lastName, Integer orderNum, String dateAdded, String dateConfirmed) {
		this.fname = firstName;
		this.lname = lastName;
		this.Rma = Integer.toString(orderNum);
		this.orderDate = dateAdded;
		this.sentDate = dateConfirmed;
	}

	public RMADto(Integer rmaNo, String firstName, String lastName, String inventoryCode, String inventoryName,
			String rmaReason, Integer rmaQty, Double unitPrice, Double unitWeight, OffsetDateTime dateAdded) {
		this.Rma = Integer.toString(rmaNo);
		this.fname = firstName;
		this.lname = lastName;
		this.itemCode = inventoryCode;
		this.itemDesc = inventoryName;
		this.Reason = rmaReason;
		this.Qty = Double.toString(rmaQty);
		this.unitPrice = Double.toString(unitPrice);
		this.unitWeight = Double.toString(unitWeight);
		this.sentDate = dateAdded.toString();
	}

	public RMADto(Integer rmaNo, String firstName, String lastName, String companyName, String inventoryCode,
			String inventoryName, String reason, Integer rmaQty, Double unitPrice, Double unitWeight,
			String dateAdded, Integer orderNum, String status, int invoiceId, String rmaReason) {
		this.Rma = Integer.toString(rmaNo);
		this.fname = firstName;
		this.lname = lastName;
		this.companyName = companyName;
		this.itemCode = inventoryCode;
		this.itemDesc = inventoryName;
		this.Reason = reason;
		this.Qty = Double.toString(rmaQty);
		this.unitPrice = Double.toString(unitPrice);
		this.unitWeight = Double.toString(unitWeight);
		this.sentDate = dateAdded;
		this.order = orderNum.toString();
		this.status = status;
		this.invoiceID = invoiceId;
		this.rmaReason= rmaReason;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getInvoiceID() {
		return invoiceID;
	}

	public void setInvoiceID(int invoiceID) {
		this.invoiceID = invoiceID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getReasonId() {
		return reasonId;
	}

	public void setReasonId(int reasonId) {
		this.reasonId = reasonId;
	}

	public String getRmaReason() {
		return rmaReason;
	}

	public void setRmaReason(String rmaReason) {
		this.rmaReason = rmaReason;
	}

	public int getParentReasonID() {
		return parentReasonID;
	}

	public void setParentReasonID(int parentReasonID) {
		this.parentReasonID = parentReasonID;
	}

	public List<RmaItems> getRmaItems() {
		return rmaItems;
	}

	public void setRmaItems(List<RmaItems> rmaItems) {
		this.rmaItems = rmaItems;
	}

	public int getRmaItemID() {
		return rmaItemID;
	}

	public void setRmaItemID(int rmaItemID) {
		this.rmaItemID = rmaItemID;
	}

	public List<String> getDeletedItemIds() {
		return deletedItemIds;
	}

	public void setDeletedItemIds(List<String> deletedItemIds) {
		this.deletedItemIds = deletedItemIds;
	}

}
