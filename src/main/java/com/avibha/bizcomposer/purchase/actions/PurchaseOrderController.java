/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.purchase.actions;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.purchase.dao.PurchaseDetails;
import com.avibha.bizcomposer.purchase.dao.PurchaseDetailsDao;
import com.avibha.bizcomposer.purchase.dao.PurchaseOrderDetailsDao;
import com.avibha.bizcomposer.purchase.forms.PurchaseBoardDto;
import com.avibha.bizcomposer.purchase.forms.PurchaseOrderDto;
import com.avibha.bizcomposer.purchase.forms.VendorDto;
import com.avibha.bizcomposer.sales.dao.InvoiceInfo;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.bizcomposer.sales.forms.UpdateInvoiceDto;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.utility.MyUtility;
import com.avibha.common.utility.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@Controller
public class PurchaseOrderController {

	@Autowired
	private PurchaseDetails purchaseDetails;

	@Autowired
	private PurchaseDetailsDao purchaseDetailsDao;

	@Autowired
	private InvoiceInfoDao invoiceInfoDao;
	@Autowired
	private InvoiceInfo invoiceInfo;

	@Autowired
	private PurchaseOrderDetailsDao purchaseOrderDetailsDao;

	@Autowired
	private ConfigurationInfo configInfo;

	@Autowired
	private SalesDetailsDao salesDetailsDao;

	@GetMapping("/PurchaseOrder")
	public String purchaseOrder(VendorDto vendorDto, UpdateInvoiceDto updateInvoiceDto,
			PurchaseOrderDto purchaseOrderDto, HttpServletRequest request, Model model)
			throws IOException, ServletException, Throwable {
		String forward = "/purchase/purchase";

		String action = request.getParameter("tabid");
		String companyID = (String) request.getSession().getAttribute("CID");
		Path p = new Path();
		p.setPathvalue(request.getContextPath());
		request.getSession().setAttribute("path", p);
		request.getSession().setAttribute("CID", companyID);

		if (request.getSession().isNew() || ((String) request.getSession().getAttribute("CID")) == null
				|| ((Path) request.getSession().getAttribute("path")) == null) {
			// forward = "Expired";
		} else {
			if (action == null) {
//				PurchaseDetails pdetails = new PurchaseDetails();
//				pdetails.getAllList(request);
				purchaseDetails.getAllList(request);
//				InvoiceInfoDao invoice = new InvoiceInfoDao();

				String cvId = request.getParameter("CustId");
//				invoice.set(cvId, request, updateInvoiceDto, companyID);
//				invoice.getServices(request, companyID, cvId);
				invoiceInfoDao.set(cvId, request, updateInvoiceDto, companyID);
				invoiceInfoDao.getServices(request, companyID, cvId);
				forward = "/purchase/addNewUser";
			} else if (action.equalsIgnoreCase("PurchaseOrder")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
//				pdetails.newPurchaseOrder(request, purchaseOrderDto);
				String compId = (String) request.getSession().getAttribute("CID");

				purchaseOrderDetailsDao.newPurchaseOrder(request, purchaseOrderDto);
//				ConfigurationInfo configInfo = new ConfigurationInfo();
				ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();

//				InvoiceInfo info = new InvoiceInfo();
//				request.setAttribute("Invoicestyleid", info.getDefaultInvoiceStyleNo(companyID));
				
				request.setAttribute("ShAddr", invoiceInfoDao.shipAddress(compId, null));
				request.setAttribute("BillAddr", invoiceInfoDao.billAddress(compId, null));
				//SalesDetailsDao sd = new SalesDetailsDao();
				salesDetailsDao.setUpdatPurchaseAddress(purchaseOrderDto, request);

				request.setAttribute("Invoicestyleid", invoiceInfo.getDefaultInvoiceStyleNo(companyID));
				purchaseOrderDto.setInvoiceStyle(configDto.getVendorInvoiceStyleId() + "");
				purchaseOrderDto.setTerm(configDto.getSelectedTermId() + "");
				purchaseOrderDto.setPayMethod(configDto.getSelectedPaymentId() + "");
				purchaseOrderDto.setVia(configDto.getCustomerShippingId() + "");
				purchaseOrderDto.setTemplateType(configDto.getPoTemplateType());
				purchaseOrderDto.setOrderNo(MyUtility.getOrderNumberByConfigData(purchaseOrderDto.getOrderNo(),
						AppConstants.POType, configDto, false));

				forward = "/purchase/purchase";
			} else if (action.equalsIgnoreCase("FirstPurchaseOrder") || action.equalsIgnoreCase("LastPurchaseOrder")
					|| action.equalsIgnoreCase("NextPurchaseOrder")
					|| action.equalsIgnoreCase("PreviousPurchaseOrder")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
//				pdetails.getPurchaseOrderDetailsByBtnName(request, purchaseOrderDto);

				purchaseOrderDetailsDao.getPurchaseOrderDetailsByBtnName(request, purchaseOrderDto);
//				ConfigurationInfo configInfo = new ConfigurationInfo();
				ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();

//				InvoiceInfo info = new InvoiceInfo();
				request.setAttribute("Invoicestyleid", invoiceInfo.getDefaultInvoiceStyleNo(companyID));
				purchaseOrderDto.setInvoiceStyle(configDto.getVendorInvoiceStyleId() + "");
				purchaseOrderDto.setTerm(configDto.getSelectedTermId() + "");
				purchaseOrderDto.setPayMethod(configDto.getSelectedPaymentId() + "");
				purchaseOrderDto.setVia(configDto.getCustomerShippingId() + "");
				purchaseOrderDto.setTemplateType(configDto.getPoTemplateType());
				purchaseOrderDto.setOrderNo(MyUtility.getOrderNumberByConfigData(purchaseOrderDto.getOrderNo(),
						AppConstants.POType, configDto, false));
				forward = "/purchase/purchase";
			} else if (action.equalsIgnoreCase("SavePurchaseOrder")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
//				pdetails.savePurchaseOrder(request, purchaseOrderDto);
				purchaseOrderDetailsDao.savePurchaseOrder(request, purchaseOrderDto);
				forward = "redirect:PurchaseOrder?tabid=PurchaseOrder";
			} else if (action.equalsIgnoreCase("DeletePurchaseOrder")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
				boolean isDeleted = purchaseOrderDetailsDao.deletePurchaseOrder(request, purchaseOrderDto);
				if (!isDeleted) {
					request.getSession().setAttribute("SaveStatus", "Purchase Order is yet not saved.");
				}
				forward = "redirect:PurchaseOrder?tabid=PurchaseOrder";
			} else if (action.equalsIgnoreCase("ShowUser")) {
//				PurchaseDetails pdetails = new PurchaseDetails();
				purchaseDetails.getAllList(request);
				String compId = (String) request.getSession().getAttribute("CID");
//				InvoiceInfoDao invoice = new InvoiceInfoDao();

				String cvId = request.getParameter("CustId");
				invoiceInfoDao.set(cvId, request, updateInvoiceDto, compId);
				invoiceInfoDao.getServices(request, compId, cvId);
				forward = "/purchase/addNewUser";

			} else if (action.equalsIgnoreCase("AddNewUser")) {
//				PurchaseDetailsDao pdetails = new PurchaseDetailsDao();
				String compId = (String) request.getSession().getAttribute("CID");
				String cvId = request.getParameter("CustId");
//				InvoiceInfoDao invoice = new InvoiceInfoDao();
				purchaseDetailsDao.AddVendor(request, vendorDto, compId);
				invoiceInfoDao.getServices(request, compId, cvId);
				purchaseDetailsDao.getAllList(request);
				forward = "/purchase/addNewUser";
			} else if (action.equalsIgnoreCase("AddressConfirm")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
				String cType = request.getParameter("CType");
				vendorDto.setBsAddressID(request.getParameter("addressID"));
				vendorDto.setClientVendorID(request.getParameter("custID"));
				purchaseOrderDetailsDao.getConfirmAddress(request, vendorDto, cType);
				request.setAttribute("ConfirmType", cType);
				request.setAttribute("addressType", cType.equalsIgnoreCase("bill") ? 1 : 0);
				forward = "/purchase/addressConfirm";
			} else if (action.equalsIgnoreCase("Confirm")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
				String cType = request.getParameter("CType");
				purchaseOrderDetailsDao.addConfirmAddress(request, vendorDto);
				forward = "redirect:/PurchaseOrder?tabid=AddressConfirm&CType=" + cType + "&addressID="
						+ vendorDto.getBsAddressID() + "&custID=" + vendorDto.getClientVendorID();
			} else if (action.equalsIgnoreCase("IsPoNumExist")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
				purchaseOrderDetailsDao.isPoNumExist(request, purchaseOrderDto);
				forward = "/purchase/purchase";
			} else if (action.equalsIgnoreCase("InvoiceData")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
				purchaseOrderDetailsDao.getPurchaseOrder(request, purchaseOrderDto);
				request.setAttribute("Flag", "true");
				forward = "/purchase/purchase";
			} else if (action.equalsIgnoreCase("NotExist")) {
//				PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
				purchaseOrderDetailsDao.notExistPurchaseOrder(request, purchaseOrderDto);
				request.setAttribute("Flag", "true");
				forward = "/purchase/purchase";
			} else if (action.equalsIgnoreCase("PurchaseBoard")) { // to add Purchase
				PurchaseBoardDto purchaseBoardForm = new PurchaseBoardDto();
				purchaseBoardForm.setOrderDate1("");
				purchaseBoardForm.setOrderDate2("");
				purchaseBoardForm.setSaleDate1("");
				purchaseBoardForm.setSaleDate2("");
				request.setAttribute("BlankValue", purchaseBoardForm);
				forward = "/purchase/poboard";
			} else if (action.equalsIgnoreCase("PBLU")) { // Action For Look up Button From poboard.jsp
				String poNo = request.getParameter("po_no");
//				SalesDetailsDao sdetails = new SalesDetailsDao();
//			    PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
				purchaseOrderDetailsDao.newPurchaseOrder(request, purchaseOrderDto);
				salesDetailsDao.getInitializePurchase(poNo, request, purchaseOrderDto);

//				ConfigurationInfo configInfo = new ConfigurationInfo();
				ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();

//				InvoiceInfo info = new InvoiceInfo();
				request.setAttribute("Invoicestyleid", invoiceInfo.getDefaultInvoiceStyleNo(companyID));
				purchaseOrderDto.setInvoiceStyle(configDto.getVendorInvoiceStyleId() + "");
				purchaseOrderDto.setTerm(configDto.getSelectedTermId() + "");
				purchaseOrderDto.setPayMethod(configDto.getSelectedPaymentId() + "");
				purchaseOrderDto.setVia(configDto.getCustomerShippingId() + "");
				purchaseOrderDto.setTemplateType(configDto.getPoTemplateType());
				purchaseOrderDto.setOrderNo(MyUtility.getOrderNumberByConfigData(purchaseOrderDto.getOrderNo(),
						AppConstants.POType, configDto, false));
				request.setAttribute("Enable", "true");
				forward = "/purchase/purchase";
			}
//			else if (action.equalsIgnoreCase("CheckPO")) { // to add Purchase
//				PurchaseBoardForm purchaseBoardForm = new PurchaseBoardForm();
//				purchaseBoardForm.setOrderDate1("");
//				purchaseBoardForm.setOrderDate2("");
//				purchaseBoardForm.setSaleDate1("");
//				purchaseBoardForm.setSaleDate2("");
//				request.setAttribute("BlankValue", purchaseBoardForm);
//				forward = "/purchase/checkPO";
//			}
			else if (action.equalsIgnoreCase("PrintPO")) { // Action to Print-Purchase-Order
				String compId = (String) request.getSession().getAttribute("CID");
				String custID = request.getParameter("custID");
				String orderNo = request.getParameter("orderNo");
				String templateType = request.getParameter("ttype");

//				SalesDetailsDao sdetails = new SalesDetailsDao();
				List<String> orderNums = salesDetailsDao.getCustomerPONums(custID, compId);
				request.setAttribute("PrintOrderNums", orderNums);
				if ((orderNo == null || orderNo.isEmpty()) && !orderNums.isEmpty()) {
					orderNo = orderNums.get(0);
				}
				if (orderNo != null && !orderNo.trim().isEmpty()) {

					request.setAttribute("PrintOrderDetails",
							salesDetailsDao.getRecordForPO(compId, orderNo, purchaseOrderDto, request));
				}
				request.setAttribute("custID", custID);
				request.setAttribute("templateType", templateType);
				request.setAttribute("baseURL", "/PurchaseOrder?tabid=PrintPO");
				forward = "/templates/invoiceTemplate" + templateType;
			}
		}
		model.addAttribute("vendorDto", vendorDto);
		model.addAttribute("purchaseOrderDto", purchaseOrderDto);

		return forward;
	}

	@PostMapping("/PurchaseOrderPost")
	public String purchaseOrderpost(VendorDto vendorDto, PurchaseOrderDto purchaseOrderDto, HttpServletRequest request,
			Model model) throws IOException, ServletException, SQLException {
		String forward = "/purchase/purchase";
		String action = request.getParameter("tabid");
		String companyID = (String) request.getSession().getAttribute("CID");
		request.getSession().setAttribute("CID", companyID);

		if (request.getSession().isNew() || ((String) request.getSession().getAttribute("CID")) == null
				|| ((Path) request.getSession().getAttribute("path")) == null) {
			// forward = "Expired";
		} else if (action.equalsIgnoreCase("PurchaseOrder")) {
//			PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
			purchaseOrderDetailsDao.newPurchaseOrder(request, purchaseOrderDto);
//			InvoiceInfo info = new InvoiceInfo();
			String Invoicestyleid = invoiceInfo.getDefaultInvoiceStyleNo(companyID);

			request.setAttribute("Invoicestyleid", Invoicestyleid);
			forward = "/purchase/purchase";
		} else if (action.equalsIgnoreCase("PBLU")) {
			String poNo = request.getParameter("po_no");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getInvoiceInfo(request);
//			PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
			purchaseOrderDetailsDao.getInvoiceInfo(request);
			salesDetailsDao.getInitializePurchase(poNo, request, purchaseOrderDto);
			request.setAttribute("Enable", "true");
			forward = "/purchase/purchase"; // Purchases order
		} else if (action.equalsIgnoreCase("SavePurchaseOrder")) {
//			PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
			purchaseOrderDetailsDao.savePurchaseOrder(request, purchaseOrderDto);
			purchaseOrderDetailsDao.removeSessionAddressData(request);
			
			
			forward = "redirect:PurchaseOrder?tabid=PurchaseOrder";
		} else if (action.equalsIgnoreCase("Confirm")) {
//            PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
			String cType = request.getParameter("CType");
			purchaseOrderDetailsDao.addConfirmAddress(request, vendorDto);
			forward = "redirect:/PurchaseOrder?tabid=AddressConfirm&CType=" + cType + "&addressID="
					+ vendorDto.getBsAddressID() + "&custID=" + vendorDto.getClientVendorID();
		}
		model.addAttribute("vendorDto", vendorDto);
		model.addAttribute("purchaseOrderDto", purchaseOrderDto);

		return forward;
	}

}
