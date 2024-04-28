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
import com.avibha.bizcomposer.purchase.dao.PurchaseInfo;
import com.avibha.bizcomposer.purchase.forms.VendorDto;
import com.avibha.bizcomposer.sales.dao.CustomerInfo;
import com.avibha.bizcomposer.sales.dao.InvoiceInfo;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.bizcomposer.sales.forms.UpdateInvoiceDto;
import com.avibha.common.utility.Path;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcompser.global.table.TblCategoryDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@Controller
public class PurchaseController {
	@Autowired
	private PurchaseDetailsDao purchaseDetailsDao ;
	
	@Autowired
	private InvoiceInfoDao invoiceInfoDao;
	
	@Autowired
	private ConfigurationInfo configInfo;
	
	@Autowired
	private CustomerInfo customerInfo;
	
	@Autowired
	private PurchaseInfo pinfo;

	
	@Autowired
	private ReceivableLIst rl;
	
	@RequestMapping(value = {"/Vendor"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String vendor(VendorDto vendorDto, UpdateInvoiceDto updateInvoiceDto, HttpServletRequest request) throws IOException, ServletException {
		String forward = "a";
		String action = request.getParameter("tabid");
		System.out.println("Action-->"+action);
		ArrayList<TblCategoryDto> categoryListForCombo = rl.getCategoryListForPayment();

		request.setAttribute("categoryListForCombo", categoryListForCombo);
		if (action == null) {
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("SelectedRID");

			//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
			purchaseDetailsDao.getVendors(request);
			purchaseDetailsDao.searchVendor(cvId, request,vendorDto);
			purchaseDetailsDao.getAllList(request);

			if (rowId != null)
				vendorDto.setSelectedRowID(rowId);
			else
				vendorDto.setSelectedRowID("0");
			if (cvId != null)
				vendorDto.setClientVendorID(cvId);
			else
				vendorDto.setClientVendorID("0");
			if (rowId != null) {
				request.setAttribute("VendorFrm", vendorDto.getSelectedRowID());
			}
			forward = "/purchase/vendorsNew";
		}

		else if (action.equalsIgnoreCase("VONODO")) { // for Vendor List
//			//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
			purchaseDetailsDao.getVendors(request);
			purchaseDetailsDao.getAllList(request);
			forward = "/purchase/vendorsNew";
		}

		else if (action.equalsIgnoreCase("AODOVO")) { // Goto Add-Vendor Page
			String compId = (String) request.getSession().getAttribute("CID");
			String cvId = request.getParameter("CustId");
//			InvoiceInfoDao invoice = new InvoiceInfoDao();

			//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
			purchaseDetailsDao.getAllList(request);
			invoiceInfoDao.set(cvId, request, updateInvoiceDto, compId);
			invoiceInfoDao.getServices(request, compId, cvId);

//			ConfigurationInfo configInfo = new ConfigurationInfo();
			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			request.setAttribute("defaultCongurationData", configDto);
			
			vendorDto.setAnnualIntrestRate(configDto.getAnnualInterestRate()+"");
			vendorDto.setMinFCharges(configDto.getMinCharge()+"");
			vendorDto.setGracePrd(configDto.getGracePeriod()+"");
			vendorDto.setFsAssessFinanceCharge(configDto.getAssessFinanceCharge());
			vendorDto.setFsMarkFinanceCharge(configDto.getMarkFinanceCharge());
			String cdate = invoiceInfoDao.setCurrentDate();
			vendorDto.setDateAdded(cdate);
			vendorDto.setClientVendorID((pinfo.getLastClientVendorID() + 1) + "");
			forward = "/purchase/addNewVendor";
		}
		else if (action.equalsIgnoreCase("addbillingcompany")) { // Goto Add-Vendor Page
			String compId = (String) request.getSession().getAttribute("CID");
			String cvId = request.getParameter("CustId");
//			InvoiceInfoDao invoice = new InvoiceInfoDao();

			//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
			purchaseDetailsDao.getAllList(request);
			invoiceInfoDao.set(cvId, request, updateInvoiceDto, compId);
			invoiceInfoDao.getServices(request, compId, cvId);

//			ConfigurationInfo configInfo = new ConfigurationInfo();
			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			request.setAttribute("defaultCongurationData", configDto);
			
			vendorDto.setAnnualIntrestRate(configDto.getAnnualInterestRate()+"");
			vendorDto.setMinFCharges(configDto.getMinCharge()+"");
			vendorDto.setGracePrd(configDto.getGracePeriod()+"");
			vendorDto.setFsAssessFinanceCharge(configDto.getAssessFinanceCharge());
			vendorDto.setFsMarkFinanceCharge(configDto.getMarkFinanceCharge());
			String cdate = invoiceInfoDao.setCurrentDate();
			vendorDto.setDateAdded(cdate);
			vendorDto.setClientVendorID((pinfo.getLastClientVendorID() + 1) + "");
			forward = "/accounting/addBillingCompany";
		}

		else if (action.equalsIgnoreCase("AOVODO")) { // to Add/Save Vendor details
			//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
			String compId = (String) request.getSession().getAttribute("CID");
			purchaseDetailsDao.AddVendor(request, vendorDto, compId);
			forward = "redirect:/Vendor?tabid=AODOVO";
		}
		else if (action.equalsIgnoreCase("billingcompany")) { // to Add/Save Vendor details
			//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
			String compId = (String) request.getSession().getAttribute("CID");
			purchaseDetailsDao.addBillingVendor(request, vendorDto, compId);
			forward = "redirect:/Vendor?tabid=addbillingcompany";
		}

		else if (action.equalsIgnoreCase("editVendor")) {	//Get Vendor details for EditVendor Page
			String cvId = request.getParameter("cvId");
			request.getSession().setAttribute("editedCVID", cvId);
			//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
			purchaseDetailsDao.searchVendor(cvId, request, vendorDto);
			purchaseDetailsDao.getAllList(request);
			forward = "/purchase/updateVendor";
		}
		else if(action.equalsIgnoreCase("updateVendor")){	//Update Vendor Details
			String cvId = (String) request.getSession().getAttribute("editedCVID");
			//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
			purchaseDetailsDao.UpdateVendor(request, vendorDto);
			forward = "redirect:Vendor?tabid=editVendor&cvId="+cvId;
		}
		else if (action.equalsIgnoreCase("DeleteVendor")) {	//Delete Vendor details
			String compId = (String) request.getSession().getAttribute("CID");
			String cvId = request.getParameter("cvId");
//			CustomerInfo custInfo = new CustomerInfo();
			if (customerInfo.deleteCustomer(cvId, compId)) {
				request.getSession().setAttribute("actionMsg", "Vendor DELETE successfully!");
			}
			forward = "redirect:Vendor?tabid=VONODO";
		}
		else if (action.equalsIgnoreCase("PurchaseOrder")) { // for purchase order
			forward = "success_purOrder";
		}
		request.setAttribute("zippcode", 90004);
		request.setAttribute("vendorDto", vendorDto);
		return forward;
	}

	@ResponseBody
	@PostMapping("/VendorAjax")
	public Object VendorAjaxCall(VendorDto vendorDto, HttpServletRequest request) throws Exception {
		String action = request.getParameter("tabid");
		String status = "Success";
		//  PurchaseDetailsDao purchaseDetailsDao = new PurchaseDetailsDao();
		if(action.equalsIgnoreCase("sortVendors")) {
			int sortById = Integer.parseInt(request.getParameter("SortBy"));
			request.setAttribute("sortById", sortById);
			return purchaseDetailsDao.getVendors(request);
		}
		else if(action.equalsIgnoreCase("searchVendors")) {
			return purchaseDetailsDao.searchVendors(request);
		}
		return status;
	}

}