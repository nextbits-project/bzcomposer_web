/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.sales.actions;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.employee.dao.Label;
import com.avibha.bizcomposer.purchase.dao.PurchaseBoardDetails;
import com.avibha.bizcomposer.purchase.dao.PurchaseInfo;
import com.avibha.bizcomposer.purchase.forms.PurchaseBoardDto;
import com.avibha.bizcomposer.sales.dao.*;
import com.avibha.bizcomposer.sales.forms.*;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.avibha.common.utility.MyUtility;
import com.avibha.common.utility.Path;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.accounting.daoimpl.ReceivableListImpl;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.EmailSenderDto;
import com.nxsol.bizcomposer.common.TblCategory;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.nxsol.bizcompser.global.table.TblCategoryDtoLoader;
import com.nxsol.bzcomposer.company.ConfigurationDAO;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaLeadCategory;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadCategoryRepository;
import com.nxsol.bzcomposer.company.service.BcaClientvendorService;
import com.pritesh.bizcomposer.accounting.bean.ReceivableListBean;
import com.pritesh.bizcomposer.accounting.bean.ReceivableListDto;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class SalesController {
	@Autowired
	private BcaClientvendorService clientVendorService;

	@Autowired
	private ConfigurationInfo configInfo;

	@Autowired
	private CustomerInfo customerInfo;

	@Autowired
	private CustomerInfoDao customerInfoDao;

	@Autowired
	private SalesDetailsDao sd;

	@Autowired
	private ReceivableLIst rl;

	@Autowired
	private InvoiceInfo invoiceInfo;

	@Autowired
	private ConfigurationDAO dao;

	@Autowired
	private InvoiceInfoDao invoiceInfoDao;

	@Autowired
	private PurchaseInfo pinfo;

	@Autowired
	private CountryState cs;

	@Autowired
	private PurchaseBoardDetails purchaseBoardDetails;

	@Autowired
	private TblCategoryDtoLoader categoryDtoLoader;

	@RequestMapping(value = { "/Invoice", "/Customer", "/Item", "/SalesOrder", "/DataManager" }, method = {
			RequestMethod.GET, RequestMethod.POST })
	public String executeSalesController(CustomerDto customerDto, InvoiceDto invoiceDto, ItemDto itemDto,
			UpdateInvoiceDto updateInvoiceDto, EmailSenderDto emailSenderDto, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String IN_URI = request.getRequestURI();
		String CUSTOMER_URI = "/Customer";
		String ITEM_URI = "/Item";
		String INVOICE_URI = "/Invoice";
		String SALES_ORDER_URI = "/SalesOrder";

		String SALES_MANAGER_URI = "/DataManager";

//		ConfigurationInfo configInfo = new ConfigurationInfo();
		configInfo.setCurrentRequest(request);
		String forward = "sales/invoice";
		if (IN_URI.endsWith(CUSTOMER_URI)) {
			forward = "/sales/customerNew";
			model.addAttribute("customerDto", customerDto);
			model.addAttribute("emailSenderDto", emailSenderDto);
		} else if (IN_URI.endsWith(ITEM_URI)) {
			forward = "/sales/itemNew";
			model.addAttribute("itemDto", itemDto);
			model.addAttribute("emailSenderDto", emailSenderDto);
		} else if (IN_URI.endsWith(INVOICE_URI)) {
			forward = "/sales/invoice";
			model.addAttribute("invoiceDto", invoiceDto);
		} else if (IN_URI.endsWith(SALES_ORDER_URI)) {
			forward = "sales/salesorder";
			model.addAttribute("invoiceDto", invoiceDto);
		} else if (IN_URI.endsWith(SALES_MANAGER_URI)) {
			forward = "/sales/datamanager";
		}

		int ordernum = 0;
		String action = request.getParameter("tabid"); // action initialized on 14-06-2019
		// String companyID="1";
		HttpSession sess = request.getSession();
		String companyID = (String) sess.getAttribute("CID");
		String companyName = (String) sess.getAttribute("user");
		ConstValue.setCompanyName(companyName);
		String user = (String) sess.getAttribute("username"); // Added on 15-06-2019
		String userRole = (String) sess.getAttribute("userRole");
		System.out.println("User is:" + user);
		ConstValue c = new ConstValue();
		c.setCompanyId(Integer.parseInt(companyID));

		boolean readData;
		if (companyID.equals("2") || companyID.equals("3") || companyID.equals("4")) {
			if (userRole.equals("User")) {
				request.getSession().setAttribute("username", "user");
				request.setAttribute("readData", true);
				readData = true;
				System.out.println("readData is true");
			} else {
				request.getSession().setAttribute("username", user);
				request.setAttribute("readData", false);
				readData = false;
				System.out.println("readData is false");
			}
		}
		/*
		 * else if(userRole.equals("User")&&companyID.equals("1")){
		 * System.out.println("This is new condition added for readonly data.");
		 * request.getSession().setAttribute("username", user);
		 * request.setAttribute("readData", true); readData= true;
		 * System.out.println("readData is true"); } else{
		 * request.setAttribute("readData", false); readData = false;
		 * System.out.println("readData is false for other compaies"); }
		 */
		try {
			action = request.getParameter("tabid");
			if (action.equals("SetInfoForAccountReceiveble")) {
				ordernum = Integer.parseInt(request.getParameter("tabid"));
				action = request.getParameter("tabid");
			}
		} catch (Exception e) {
			action = request.getParameter("tabid");
			Loger.log(e.toString());
		}
		Path p = new Path();
		p.setPathvalue(request.getContextPath());
		request.getSession().setAttribute("path", p);
		request.getSession().setAttribute("CID", companyID);
		String vendorAction = request.getParameter("customerAction");
		String cvID = null;
		if (vendorAction != null && vendorAction.equalsIgnoreCase("DELETE")) {
			cvID = request.getParameter("cvID");
//			CustomerInfo ci = new CustomerInfo();
			if (customerInfo.deleteCustomer(cvID, companyID)) {
				Loger.log("\nCustomer DELETE succeeded, id=" + cvID);
				sess.setAttribute("actionMsg", "Customer DELETE successfully!");
			} else {
				Loger.log("\nCustomer DELETE failed, id=" + cvID);
			}
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("SelectedRID");
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getCustomerList(request);
			sd.searchSelectedCustomer(cvId, request, customerDto);
			sd.getAllList(request);

			forward = "/sales/invoice";
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "redirect:Customer?tabid=Customer";
			}
			return forward;
		} else if (vendorAction != null && vendorAction.equalsIgnoreCase("CONVERT")) {
			cvID = request.getParameter("cvID");
			String cvTypeId = request.getParameter("cvTypeId");
			String successMsg = "";
			int cvTypeID = Integer.valueOf(cvTypeId);
			if (customerInfo.convertClientVendor(cvID, companyID, cvTypeID)) {
				Loger.log("\nCustomer Convert succeeded, id=" + cvID);
				if (cvTypeID == 7) {
					successMsg = "Converted to Contact successfully!";
				} else {
					successMsg = "Converted to Customer successfully!";
				}
				sess.setAttribute("actionMsg", successMsg);
			} else {
				Loger.log("\nContact Convertion to Customer failed, id=" + cvID);
			}
		}

		if (action == null || action == "" || action.trim().length() < 1)
			action = "Load";
		Loger.log("Action -->-->" + action);

		if (action.equalsIgnoreCase("Load")) {
			Loger.log("nothing is called");
		}

		else if (action.equalsIgnoreCase("DataManager")) { // for DataManager tab
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getdataManager(request);
			if (IN_URI.endsWith(SALES_MANAGER_URI)) {
				forward = "sales/datamanager";
			} else {
				forward = "/sales/invoice";
			}
		}

		else if (action.equalsIgnoreCase("DM_Save")) { // save of DataManager tab
//			SalesDetailsDao sd = new SalesDetailsDao();
			String sTitleval = request.getParameter("sTitleval");
			String sNewval = request.getParameter("sNewval");
			sd.getdataManagerSave(request);
			sd.getdataManager(request);
			if (IN_URI.endsWith(SALES_MANAGER_URI)) {
				forward = "redirect:/DataManager?tabid=datamanager";
			} else {
				forward = "/sales/invoice";
			}
		}

		else if (action.equalsIgnoreCase("DM_Delete")) { // save of DataManager tab
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getdataManagerDelete(request);
			sd.getdataManager(request);
			if (IN_URI.endsWith(SALES_MANAGER_URI)) {
				forward = "redirect:/DataManager?tabid=datamanager";
			} else {
				forward = "/sales/invoice";
			}
		} else if (action.equalsIgnoreCase("Customer")) { // Show CustomerList page
//jpa starts
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("SelectedRID");
			String firstCvID = clientVendorService.getCustomerList(request);

//			SalesDetailsDao sd = new SalesDetailsDao();
//			String firstCvID = sd.getCustomerList(request);
			if (cvId == null) {
				cvId = firstCvID;
			}
//			clientVendorService.searchSelectedCustomer(cvId, request, customerDto);
			clientVendorService.getAllList(request);

			if (rowId != null) {
				customerDto.setSelectedRowID(rowId);
			} else {
				customerDto.setSelectedRowID("0");
			}
			if (cvId != null) {
				customerDto.setClientVendorID(cvId);
			} else {
				customerDto.setClientVendorID("0");
			}
			if (rowId != null) {
				request.setAttribute("VendorFrm", customerDto.getSelectedRowID());
			}
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/customerNew";
			} else {
				forward = "/sales/invoice";
			}
//jpa ends

//			String cvId = request.getParameter("cvId");
//			String rowId = request.getParameter("SelectedRID");
//			SalesDetailsDao sd = new SalesDetailsDao();
//			String firstCvID = sd.getCustomerList(request);
//			if (cvId == null) {
//				cvId = firstCvID;
//			}
//			sd.searchSelectedCustomer(cvId, request, customerDto);
//			sd.getAllList(request);
//
//			if (rowId != null) {
//				customerDto.setSelectedRowID(rowId);
//			} else {
//				customerDto.setSelectedRowID("0");
//			}
//			if (cvId != null) {
//				customerDto.setClientVendorID(cvId);
//			} else {
//				customerDto.setClientVendorID("0");
//			}
//			if (rowId != null) {
//				request.setAttribute("VendorFrm", customerDto.getSelectedRowID());
//			}
//			if (IN_URI.endsWith(CUSTOMER_URI)) {
//				forward = "/sales/customerNew";
//			} else {
//				forward = "/sales/invoice";
//			}
		} else if (action.equalsIgnoreCase("CustomerBoard")) { // Show CustomerBoard page
//			SalesDetailsDao sd = new SalesDetailsDao();
			String firstCvID = sd.getCustomerList(request);
			sd.getAllList(request);

//			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			customerDto.setPeriodFrom(MyUtility.getDateBeforeGivenMonths(12));
			customerDto.setPeriodTo(MyUtility.getCurrentDate());
			request.setAttribute("selectedCvID", request.getParameter("selectedCvID"));
			forward = "/sales/customerBoard";
		} else if (action.equalsIgnoreCase("ContactBoard")) { // Show ContactBoard page
//			SalesDetailsDao sd = new SalesDetailsDao();
			String firstCvID = sd.getCustomerList(request);
			sd.getAllList(request);
			forward = "/sales/customerContactBoard";
		}

		else if (action.equalsIgnoreCase("makeCustomerCardDefault")) { // set customer credit card as default, From
																		// Customer-Edit
			String cvId = request.getParameter("cvId");
			String cardID = request.getParameter("cardID");
			// String itemIndex = request.getParameter("itemIndex");
//			SalesDetailsDao sd = new SalesDetailsDao();
			boolean status = sd.makeCustomerCardDefault(cvId, cardID);
			// forward =
			// "redirect:Customer?tabid=editCustomer&cvId="+cvId+"&itemIndex="+itemIndex;
			forward = "redirect:Customer?tabid=editCustomer&cvId=" + cvId;
		} else if (action.equalsIgnoreCase("makeCustomerCardDefault2")) { // set customer credit card as default, From
																			// Vendor-Edit
			String cvId = request.getParameter("cvId");
			String cardID = request.getParameter("cardID");
//			SalesDetailsDao sd = new SalesDetailsDao();
			boolean status = sd.makeCustomerCardDefault(cvId, cardID);
			forward = "redirect:Customer?tabid=editCustomer&cvId=" + cvId;
		}

		else if (action.equalsIgnoreCase("openCustomer")) {
			String cvId = request.getParameter("cvId");
			// String rowId = request.getParameter("SelectedRID");
//			SalesDetailsDao sd = new SalesDetailsDao();
			String firstCvID = sd.getCustomerList(request);
			if (cvId == null) {
				cvId = firstCvID;
			}
			sd.searchSelectedCustomer(cvId, request, customerDto);
			sd.getAllList(request);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/customerNew";
			} else {
				forward = "/sales/invoice";
			}
		}

		else if (action.equalsIgnoreCase("viewCustomerDetails")) {
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("selectedRID");
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getCustomerList(request);
			sd.searchSelectedCustomer(cvId, request, customerDto);
			sd.getAllList(request);

			if (rowId != null)
				customerDto.setSelectedRowID(rowId);
			else
				customerDto.setSelectedRowID("0");
			if (cvId != null)
				customerDto.setClientVendorID(cvId);
			else
				customerDto.setClientVendorID("0");
			if (rowId != null) {
				request.setAttribute("VendorFrm", customerDto.getSelectedRowID());
			}
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/customerNew";
			} else {
				forward = "/sales/invoice";
			}
		} else if (action.equalsIgnoreCase("Banking")) {
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("SortByFirstName")) {
			int sortById = Integer.parseInt(request.getParameter("SortBy"));
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("SelectedRID");
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getCustomerSortByFirstName(request, customerDto);
			sd.searchSelectedCustomer(cvId, request, customerDto);
			sd.getAllList(request);

			if (rowId != null)
				customerDto.setSelectedRowID(rowId);
			else
				customerDto.setSelectedRowID("0");
			if (cvId != null)
				customerDto.setClientVendorID(cvId);
			else
				customerDto.setClientVendorID("0");
			if (rowId != null) {
				request.setAttribute("VendorFrm", customerDto.getSelectedRowID());
			}
			request.setAttribute("sortById", sortById);
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("sortInvoice")) {
			int sortById = Integer.parseInt(request.getParameter("SortBy"));
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("SelectedRID");
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getSortedCustomer(request, customerDto, sortById);
			sd.searchSelectedCustomer(cvId, request, customerDto);
			sd.getAllList(request);

			if (rowId != null)
				customerDto.setSelectedRowID(rowId);
			else
				customerDto.setSelectedRowID("0");
			if (cvId != null)
				customerDto.setClientVendorID(cvId);
			else
				customerDto.setClientVendorID("0");
			if (rowId != null) {
				request.setAttribute("VendorFrm", customerDto.getSelectedRowID());
			}
			request.setAttribute("sortById", sortById);
			System.out.println("SortBy:" + sortById);
			// sdetails.getSortedInvoiceInfo(request,request.getParameter("SortBy"));
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("SortByLastName")) {
			int sortById = Integer.parseInt(request.getParameter("SortBy"));
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("SelectedRID");
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getCustomerSortByLastName(request, customerDto);
			sd.searchSelectedCustomer(cvId, request, customerDto);
			sd.getAllList(request);

			if (rowId != null)
				customerDto.setSelectedRowID(rowId);
			else
				customerDto.setSelectedRowID("0");
			if (cvId != null)
				customerDto.setClientVendorID(cvId);
			else
				customerDto.setClientVendorID("0");
			if (rowId != null) {
				request.setAttribute("VendorFrm", customerDto.getSelectedRowID());
			}
			request.setAttribute("sortById", sortById);
			System.out.println("SortBy:" + sortById);
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("SortInvoice")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getSortedInvoiceInfo(request, request.getParameter("SortBy"));
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("saveUnitPrice")) {
			int itemId = Integer.parseInt(request.getParameter("itemID"));
			// float price = Float.parseFloat(request.getParameter("price"));
			double p1 = Double.parseDouble(request.getParameter("price"));
			String pageType = request.getParameter("pageType");
			if (pageType == null) {
				pageType = "";
			}
			System.out.println("method:saveUnitPrice\nitemId:" + itemId + "\nPrice:" + p1);
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.setUnitPrice(companyID, itemId, p1);
			sd.getInvoiceInfo(request);
			// forward = "/sales/invoice";
			if (pageType.equalsIgnoreCase("PO")) {
				forward = "redirect:PurchaseOrder?tabid=PurchaseOrder";
			} else if (pageType.equalsIgnoreCase("ES")) {
				forward = "redirect:Estimation?tabid=Estimation";
			} else if (pageType.equalsIgnoreCase("SO")) {
				forward = "redirect:SalesOrder?tabid=SalesOrder";
			} else {
				forward = "redirect:Invoice?tabid=Invoice";
			}
			// forward = "redirect:Invoice?tabid=Invoice";
		}

		else if (action.equalsIgnoreCase("saveItemName")) {
			int itemId = Integer.parseInt(request.getParameter("itemID"));
			String itemName = request.getParameter("itemName");
			String pageType = request.getParameter("pageType");
			if (pageType == null) {
				pageType = "";
			}
			System.out.println("method:saveUnitPrice\nitemId:" + itemId + "\nItemName:" + itemName);
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.setItemName(companyID, itemId, itemName);
			sd.getInvoiceInfo(request);
			// forward = "/sales/invoice";
			if (pageType.equalsIgnoreCase("PO")) {
				forward = "redirect:PurchaseOrder?tabid=PurchaseOrder";
			} else if (pageType.equalsIgnoreCase("ES")) {
				forward = "redirect:Estimation?tabid=Estimation";
			} else if (pageType.equalsIgnoreCase("SO")) {
				forward = "redirect:SalesOrder?tabid=SalesOrder";
			} else {
				forward = "redirect:Invoice?tabid=Invoice";
			}

		} else if (action.equalsIgnoreCase("getBillingAddress")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getBillingAddress(invoiceDto, request);
			String targetURL = "/Invoice";
			if (IN_URI.endsWith(SALES_ORDER_URI)) {
				targetURL = SALES_ORDER_URI;
			}
			if (request.getParameter("addressType").equalsIgnoreCase("bill")) {
				request.setAttribute("URL", targetURL + "?tabid=updateBillingAddress");
				request.setAttribute("addressType", "bill");
			} else {
				request.setAttribute("URL", targetURL + "?tabid=updateShippingAddress");
				request.setAttribute("addressType", "ship");
			}
			forward = "/sales/addressCustomer";
		} else if (action.equalsIgnoreCase("updateBillingAddress")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.updateBillingAddress(invoiceDto, request);
			String targetURL = "/Invoice";
			if (IN_URI.endsWith(SALES_ORDER_URI)) {
				targetURL = SALES_ORDER_URI;
			}
			forward = "redirect:" + targetURL + "?tabid=getBillingAddress&addressType=bill&cvID="
					+ invoiceDto.getClientVendorID() + "&addressID=" + invoiceDto.getAddressID();
		} else if (action.equalsIgnoreCase("updateShippingAddress")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.updateShippingAddress(invoiceDto, request);
			String targetURL = "/Invoice";
			if (IN_URI.endsWith(SALES_ORDER_URI)) {
				targetURL = SALES_ORDER_URI;
			}
			forward = "redirect:" + targetURL + "?tabid=getBillingAddress&addressType=ship&cvID="
					+ invoiceDto.getClientVendorID() + "&addressID=" + invoiceDto.getAddressID();
		}

		else if (action.equalsIgnoreCase("AccountReceiveble")) {
//			ReceivableLIst rl = new ReceivableListImpl();
			ArrayList<ReceivableListDto> ReceivableList = rl.getReceivableList(Integer.parseInt(companyID));
//			TblCategoryDtoLoader category = new TblCategoryDtoLoader();
			ArrayList<TblCategoryDto> categoryforcombo = categoryDtoLoader.getCategoryForCombo();
			ArrayList<ClientVendor> clientVendorForCombo = rl.getClientVendorForCombo();
			ArrayList<TblPaymentType> paymentType = rl.getPaymentType();
			ArrayList<TblAccount> account = rl.getAccount();
			request.setAttribute("AccountForCombo", account);
			request.setAttribute("PaymentTypeForCombo", paymentType);
			request.setAttribute("CategoryCombo", categoryforcombo);
			request.setAttribute("ReceivableList", ReceivableList);
			request.setAttribute("ClineVendorForCombo", clientVendorForCombo);
			forward = "/sales/invoice";
		} else if (action.equals("SetInfoForAccountReceiveble")) {
			request.setAttribute("OrderNum", ordernum);
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("PrintLabels")) { // for Vendor category
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getCustomerList(request); // to print lables
			Label lbl = new Label();
			ArrayList labelList = lbl.getLabelList();
			request.setAttribute("Labels", labelList);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/printLabels";
			} else {
				forward = "/sales/updateInvoice";
			}
		} else if (action.equalsIgnoreCase("UpdateLabel")) {
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.getLabel(request, customerDto);
			sd.getLabelType(request);
			request.setAttribute("Customer", "customer");
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/setUpLabel";
			} else {
				forward = "/sales/invoice";
			}
		}

		else if (action.equalsIgnoreCase("AddNewLabel")) {
			// tab
//			SalesDetailsDao sd = new SalesDetailsDao();
			request.setAttribute("Customer", "C");
			sd.addNewLabel(customerDto);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/addLabel";
			} else {
				forward = "/sales/printInvoice";
			}
		}

		else if (action.equalsIgnoreCase("SaveLabel")) {
//			SalesDetailsDao sd = new SalesDetailsDao();
			boolean result = sd.saveLabel(request, customerDto);
			String msg = "";
			request.setAttribute("Customer", "c");
			if (result) {
				sd.addNewLabel(customerDto);
				msg = "Label is saved successfully";
				if (IN_URI.endsWith(CUSTOMER_URI)) {
					forward = "/sales/addLabel";
				} else {
					forward = "/sales/printInvoice";
				}
			} else {
				sd.getLabelType(request);
				msg = "Label is updated successfully";
				if (IN_URI.endsWith(CUSTOMER_URI)) {
					forward = "/sales/setUpLabel";
				} else {
					forward = "/sales/invoice";
				}
			}
			request.setAttribute("Status", msg);
		}

		else if (action.equalsIgnoreCase("DeleteLabel")) {
			request.setAttribute("Customer", "c");
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.deleteLabel(request, customerDto);
			sd.getLabelType(request);
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("addTransactionHistory")) {
			String custID = request.getParameter("custId");
			String cond = request.getParameter("cond");
			String pfrom = request.getParameter("pfrom");
			String pto = request.getParameter("pto");
//			InvoiceInfo invoice = new InvoiceInfo();
			ArrayList lookDetails = invoiceInfo.searchHistory(request, cond, custID, pfrom, pto);
			request.setAttribute("LookupDetails", lookDetails);
			forward = "/sales/addTransactionHistory";
		}

		else if (action.equalsIgnoreCase("NewCustomer")) {
			String cvId = request.getParameter("CustomerID");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
//			InvoiceInfoDao invoice = new InvoiceInfoDao();

			invoiceInfoDao.set(cvId, request, updateInvoiceDto, companyID);
			invoiceInfoDao.getServices(request, companyID, cvId);
			sd.getInvoiceInfo(request);
			sd.getAllList(request);

			// sdetails.getCustomerList(request);

//			ConfigurationDAO dao = new ConfigurationDAO();
			request.setAttribute("membershipLevel", dao.getmembershipLevel(companyID, request));
			request.setAttribute("CustomerSize", dao.getNumberOfCustomer(Long.valueOf(companyID)));

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			request.setAttribute("defaultCongurationData", configDto);
			// to set deafult zipcode
			request.setAttribute("zipcode", "90004");
			customerDto.setCountry(configDto.getCustDefaultCountryID() + "");
			customerDto.setState(configDto.getSelectedStateId() + "");
			customerDto.setTaxAble(configDto.getCustTaxable());
			customerDto.setTerm(configDto.getSelectedTermId() + "");
			customerDto.setPaymentType(configDto.getSelectedPaymentId() + "");
			customerDto.setRep(configDto.getSelectedSalesRepId() + "");
			customerDto.setShipping(configDto.getCustomerShippingId() + "");
			customerDto.setAnnualIntrestRate(configDto.getAnnualInterestRate() + "");
			customerDto.setMinFCharges(configDto.getMinCharge() + "");
			customerDto.setGracePrd(configDto.getGracePeriod() + "");
			customerDto.setFsAssessFinanceCharge(configDto.getAssessFinanceCharge());
			customerDto.setFsMarkFinanceCharge(configDto.getMarkFinanceCharge());

//			PurchaseInfo pinfo = new PurchaseInfo();
			customerDto.setClientVendorID((pinfo.getLastClientVendorID() + 1) + "");
			customerDto.setDateAdded(invoiceInfo.setCurrentDate());
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/addNewCustomer";
			} else {
				forward = "/sales/payHistory";
			}
		} else if (action.equalsIgnoreCase("NewContact")) {
			String cvId = request.getParameter("CustomerID");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
//			InvoiceInfoDao invoice = new InvoiceInfoDao();

			invoiceInfoDao.set(cvId, request, updateInvoiceDto, companyID);
			invoiceInfoDao.getServices(request, companyID, cvId);
			sd.getInvoiceInfo(request);
			sd.getAllList(request);
			// sdetails.getCustomerList(request);

//			ConfigurationDAO dao = new ConfigurationDAO();
			request.setAttribute("membershipLevel", dao.getmembershipLevel(companyID, request));
			request.setAttribute("CustomerSize", dao.getNumberOfCustomer(Long.valueOf(companyID)));

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			request.setAttribute("defaultCongurationData", configDto);
			// to set deafult zipcode
			request.setAttribute("zipcode", "90004");
			customerDto.setCountry(configDto.getCustDefaultCountryID() + "");
			customerDto.setState(configDto.getSelectedStateId() + "");
			customerDto.setTaxAble(configDto.getCustTaxable());
			customerDto.setTerm(configDto.getSelectedTermId() + "");
			customerDto.setPaymentType(configDto.getSelectedPaymentId() + "");
			customerDto.setRep(configDto.getSelectedSalesRepId() + "");
			customerDto.setShipping(configDto.getCustomerShippingId() + "");
			customerDto.setAnnualIntrestRate(configDto.getAnnualInterestRate() + "");
			customerDto.setMinFCharges(configDto.getMinCharge() + "");
			customerDto.setGracePrd(configDto.getGracePeriod() + "");
			customerDto.setFsAssessFinanceCharge(configDto.getAssessFinanceCharge());
			customerDto.setFsMarkFinanceCharge(configDto.getMarkFinanceCharge());

//			PurchaseInfo pinfo = new PurchaseInfo();
			customerDto.setClientVendorID((pinfo.getLastClientVendorID() + 1) + "");
			customerDto.setDateAdded(invoiceInfo.setCurrentDate());
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/addNewContact";
			} else {
				forward = "/sales/payHistory";
			}
		} else if (action.equalsIgnoreCase("editCustomer")) { // Edit Customer Info
			String cvId = request.getParameter("cvId");
			request.getSession().setAttribute("editedCVID", cvId);
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getCustomerList(request);
			sd.getCustomerDetails(cvId, request, customerDto);
			sd.getInvoiceInfo(request);
			sd.getAllList(request);

//			ConfigurationDAO dao = new ConfigurationDAO();
			String membershipLevel = dao.getmembershipLevel(companyID, request);
			request.setAttribute("membershipLevel", membershipLevel);
			String CustomerSize = dao.getNumberOfCustomer(Long.valueOf(companyID));
			request.setAttribute("CustomerSize", CustomerSize);
			forward = "/sales/updateCustomer";
		} else if (action.equalsIgnoreCase("editContact")) { // Edit Customer Info
			String cvId = request.getParameter("cvId");
			request.getSession().setAttribute("editedCVID", cvId);
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getCustomerList(request);
			sd.getContactDetails(cvId, request, customerDto);
			sd.getInvoiceInfo(request);
			sd.getAllList(request);

//			ConfigurationDAO dao = new ConfigurationDAO();
			String membershipLevel = dao.getmembershipLevel(companyID, request);
			request.setAttribute("membershipLevel", membershipLevel);
			String CustomerSize = dao.getNumberOfCustomer(Long.valueOf(companyID));
			request.setAttribute("CustomerSize", CustomerSize);
			forward = "/sales/updateContact";
		} else if (action.equalsIgnoreCase("deleteCustomer")) { // Delete Customer Info
			String CustIDs = request.getParameter("CustIDs");
//			CustomerInfo ci = new CustomerInfo();
			for (String cvID1 : CustIDs.split(":")) {
				customerInfo.deleteCustomer(cvID1, companyID);
			}
			forward = "redirect:/Customer?tabid=ContactBoard";
		} else if (action.equalsIgnoreCase("SearchCustomer")) { // to update customer information.
			String cvId = request.getParameter("cvId");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.searchCustomer(cvId, request, customerDto);
			sd.getAllList(request);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/sales/addNewCustomer";
			} else {
				forward = "/sales/sendEMail";
			}
		}

		else if (action.equalsIgnoreCase("AddCustomer")) { // to add/Save Customer details
			String cvId = request.getParameter("CustId");
			// String itemIndex = request.getParameter("itemIndex");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			String contact = request.getParameter("contact");
			if (contact.equalsIgnoreCase("contact")) {
				contact = "NewContact";
			} else {
				contact = "NewCustomer";
			}
			sd.AddCustomer(request, customerDto);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "redirect:/Customer?tabid=" + contact;
			} else {
				forward = "/sales/payHistory";
			}
		} else if (action.equalsIgnoreCase("UpdateCustomer")) { // to update Vendor
			// String itemIndex = request.getParameter("itemIndex");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.UpdateCustomer(request, customerDto);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "redirect:/Customer?tabid=editCustomer&cvId=" + customerDto.getClientVendorID();
			} else {
				forward = "/sales/sendEMail";
			}
		}

		else if (action.equalsIgnoreCase("AdjustInventory")) { // for Vendor category
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.ItemsList(request, itemDto);
			forward = "/sales/adjustInventory";
		}

		else if (action.equalsIgnoreCase("ApplyInventory")) { // for Vendor category
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.AdjustInventory(request, itemDto);
			forward = "/sales/adjustInventory";
		} else if (action.equalsIgnoreCase("editInventory")) { // For get Received-Item-details
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getItemDetails(request);
			forward = "/sales/updateInventoryQty";
		} else if (action.equalsIgnoreCase("UpdateInventory")) { // for Update Inventory-details
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.UpdateInventory(request);
			forward = "redirect:Item?tabid=AdjustInventory";
		}

		else if (action.equalsIgnoreCase("SalesBoard")) { // get SalesBoard-page data
			SalesBoardDto salesForm = new SalesBoardDto();
			salesForm.setOrderDate1("");
			salesForm.setOrderDate2("");
			salesForm.setSaleDate1("");
			salesForm.setSaleDate2("");
			request.setAttribute("BlankValue", salesForm);
			forward = "/sales/sendEMail";
		}

		else if (action.equalsIgnoreCase("SBTS")) { // For Fname and lname listing
			SalesBoardDto salesForm = new SalesBoardDto();
			salesForm.setOrderDate1("");
			salesForm.setOrderDate2("");
			salesForm.setSaleDate1("");
			salesForm.setSaleDate2("");
			request.setAttribute("BlankValue", salesForm);
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("Item")) { // get items
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.FillCombo(request, itemDto);
			sd.ItemsList(request, itemDto);
			forward = "sales/itemNew";
		} else if (action.equalsIgnoreCase("SearchItemView")) { // get searched items
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.ItemsList(request, itemDto);
			sd.searchItem(request, itemDto);
			sd.FillCombo(request, itemDto);
			request.setAttribute("selectedRID", request.getParameter("selectedRID"));
			forward = "sales/itemNew";
		} else if (action.equalsIgnoreCase("ShowAdd")) { // to add new item
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// request.getSession().setAttribute("ItemType", "1");
			// request.setAttribute("ItemType","1");
			sd.FillCombo(request, itemDto);
			sd.getItemNameList(request, itemDto);
			sd.searchItem(request, itemDto);
			sd.ItemsList(request, itemDto);

//			ConfigurationDAO dao = new ConfigurationDAO();
			request.setAttribute("membershipLevel", dao.getmembershipLevel(companyID, request));
			request.setAttribute("itemSize", dao.getNumberOfItem(Long.valueOf(companyID)));

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			request.setAttribute("defaultCongurationData", configDto);
			itemDto.setAccountId(configDto.getProductCategoryID());
			itemDto.setLocationId(configDto.getLocationID());
			itemDto.setReorderPoint(configDto.getReorderPoint());
			itemDto.setCustomerType(configDto.getCustomerType());
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "sales/addItem";
			} else {
				forward = "sales/payHistory";
			}
		} else if (action.equalsIgnoreCase("AddItem")) { // to save Items
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.AddItem(request, itemDto);
			sd.FillCombo(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "redirect:Item?tabid=ShowAdd&ItemType=1";
			} else {
				forward = "/sales/payHistory";
			}
		} else if (action.equalsIgnoreCase("AddItemAsCategory")) { // to save Item-Category
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.insertItemAsCategory(companyID, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "redirect:Item?tabid=ShowAdd&ItemType=1";
			} else {
				forward = "/sales/payHistory";
			}
		}

		else if (action.equalsIgnoreCase("SearchItem")) { // get item details to update item
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.searchItem(request, itemDto);
			sd.FillCombo(request, itemDto);
			forward = "/sales/updateItemDetails"; // itemDetails
		} else if (action.equalsIgnoreCase("UpdateItem")) { // to update item
			String invId = request.getParameter("InvId");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.UpdateItem(request, itemDto);
			sd.searchItem(request, itemDto);
			sd.FillCombo(request, itemDto);
			forward = "/sales/invoice";
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "redirect:Item?tabid=SearchItem&InvId=" + invId;
			}
		} else if (action.equalsIgnoreCase("DeleteItem")) { // to delete item
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.DeleteItem(request);
			forward = "redirect:Item?tabid=Item";
		} else if (action.equalsIgnoreCase("Invoice") || action.equalsIgnoreCase("NewInvoice")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.newInvoice(request, invoiceDto);
			sd.getInvoiceInfo(request);

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			InvoiceDto invoice = new InvoiceDto();
			invoice.setSalesTaxID("1");
			invoice.setState("Tax " + configDto.getSaleTaxRate() + "%");
			invoice.setRate(configDto.getSaleTaxRate());
			List<InvoiceDto> taxRates = new ArrayList<>();
			taxRates.add(invoice);
			invoiceDto.setRep(configDto.getSelectedSalesRepId() + "");
			invoiceDto.setTerm(configDto.getSelectedTermId() + "");
			invoiceDto.setPayMethod(configDto.getSelectedPaymentId() + "");
			invoiceDto.setVia(configDto.getCustomerShippingId() + "");
			invoiceDto.setTemplateType(configDto.getInvoiceTemplateType());
			invoiceDto.setOrderNo(MyUtility.getOrderNumberByConfigData(invoiceDto.getOrderNo(),
					AppConstants.InvoiceType, configDto, false));
			request.setAttribute("TaxRates", taxRates);
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("FirstInvoice") || action.equalsIgnoreCase("LastInvoice")
				|| action.equalsIgnoreCase("NextInvoice") || action.equalsIgnoreCase("PreviousInvoice")) {
			// get-Invoice-Details-By-BtnName
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInvoiceInfo(request);
			sd.getInvoiceDetailsByBtnName(request, invoiceDto);
			sd.getAllList(request);

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			invoiceDto.setSalesTaxID("1");
			invoiceDto.setState("Tax " + configDto.getSaleTaxRate() + "%");
			invoiceDto.setRate(configDto.getSaleTaxRate());
			List<InvoiceDto> taxRates = new ArrayList<>();
			taxRates.add(invoiceDto);
			invoiceDto.setTemplateType(configDto.getInvoiceTemplateType());
			request.setAttribute("TaxRates", taxRates);
			invoiceDto.setOrderNo(MyUtility.getOrderNumberByConfigData(invoiceDto.getOrderNo(),
					AppConstants.InvoiceType, configDto, false));
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("addSupplier")) {// to add
			String addressStatus = request.getParameter("status");
			String addressName = request.getParameter("addName");
			String fName = request.getParameter("fName");
			String lName = request.getParameter("lName");
			String add1 = request.getParameter("add1");
			String add2 = request.getParameter("add2");

			// fatching old address data
			String addName = (String) sess.getAttribute("oldAddressName");
			String first = (String) sess.getAttribute("oldFname");
			String last = (String) sess.getAttribute("oldlName");
			String address1 = (String) sess.getAttribute("oldAddress1");
			String address2 = (String) sess.getAttribute("oldAddress2");
			String stat = (String) sess.getAttribute("oldStatus");

//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.addSupplierDetails(request);
			ArrayList serviceList = new ArrayList();
			serviceList = sd.addServices(companyID);
			request.setAttribute("serviceList", serviceList);

			// new address data
			request.setAttribute("addressStatus", addressStatus);
			request.setAttribute("addressName", addressName);
			request.setAttribute("fName", fName);
			request.setAttribute("lName", lName);
			request.setAttribute("add1", add1);
			request.setAttribute("add2", add2);

			// old address data
			request.setAttribute("newAddressName", addName);
			request.setAttribute("newfName", first);
			request.setAttribute("newlName", last);
			request.setAttribute("newAdd1", address1);
			request.setAttribute("newAdd2", address2);
			request.setAttribute("newAddressStatus", stat);
			forward = "/sales/addSupplier";
		}

		else if (action.equalsIgnoreCase("addNewSupplier")) {
			String addressStatus = request.getParameter("status");
			String addressName = request.getParameter("addName");
			String fName = request.getParameter("fName");
			String lName = request.getParameter("lName");
			String add1 = request.getParameter("add1");
			String add2 = request.getParameter("add2");

			// fatching old address data
			String addName = (String) sess.getAttribute("oldAddressName");
			String first = (String) sess.getAttribute("oldFname");
			String last = (String) sess.getAttribute("oldlName");
			String address1 = (String) sess.getAttribute("oldAddress1");
			String address2 = (String) sess.getAttribute("oldAddress2");
			String stat = (String) sess.getAttribute("oldStatus");

			System.out.println("New Supplier To be added:" + addressStatus + " " + addressName + " " + fName + " "
					+ lName + " " + add1 + " " + add2);

//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.addSupplierDetails(request);

			ArrayList serviceList = new ArrayList();
			serviceList = sd.addServices(companyID);
			request.setAttribute("serviceList", serviceList);

			CustomerDto frm1 = new CustomerDto();

			// new address data
			request.setAttribute("addressStatus", addressStatus);
			request.setAttribute("addressName", addressName);
			request.setAttribute("fName", fName);
			request.setAttribute("lName", lName);
			request.setAttribute("add1", add1);
			request.setAttribute("add2", add2);

			// old address data
			request.setAttribute("newAddressName", addName);
			request.setAttribute("newfName", first);
			request.setAttribute("newlName", last);
			request.setAttribute("newAdd1", address1);
			request.setAttribute("newAdd2", address2);
			request.setAttribute("newAddressStatus", stat);
			forward = "/sales/addSupplier";
		} else if (action.equalsIgnoreCase("addAddress")) {
			// country List
//			CountryState cs = new CountryState();
			request.setAttribute("cList", cs.getCountry());
			request.setAttribute("sList", cs.getStates(companyID));

			String chkStatus = request.getParameter("chkStatus");
			System.out.println("Status is:" + chkStatus);
			request.setAttribute("chkStatus", chkStatus);
			if (customerDto != null) {
				/*
				 * frm.setCname(frm.getCname()); frm.setFirstName(frm.getFirstName());
				 * frm.setLastName(frm.getLastName()); frm.setAddress1(frm.getAddress1());
				 * frm.setAddress2(frm.getAddress2()); frm.setProvince(frm.getProvince());
				 * frm.setCity(frm.getCity()); frm.setState(frm.getState());
				 * frm.setCountry(frm.getCountry()); frm.setZipCode(frm.getZipCode());
				 * frm.setPhone(frm.getPhone()); frm.setFax(frm.getFax());
				 */
				if (chkStatus.equals("Default")) {
					customerDto.setStatus(chkStatus);
				} else {
					customerDto.setStatus("");
				}
			}
			// Old Address Data..
			// HttpSession s = request.getSession();
			String addressName = request.getParameter("status");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String add1 = request.getParameter("address1");
			String add2 = request.getParameter("address2");
			String stat = request.getParameter("status");
			System.out.println("Old Address data:firstName:" + fname + "\nlastName:" + lname + "\nAddress1:" + add1
					+ "\nAddress2:" + add2 + "\nStatus:" + stat + "\nAddressName:" + addressName);

			// old address data...
			sess.setAttribute("oldAddressName", addressName);
			sess.setAttribute("oldFname", fname);
			sess.setAttribute("oldlName", lname);
			sess.setAttribute("oldAddress1", add1);
			sess.setAttribute("oldAddress2", add2);
			sess.setAttribute("oldStatus", stat);
			forward = "success22";
		}

		else if (action.equalsIgnoreCase("editAddress")) {
			String fname = request.getParameter("fName");
			String lname = request.getParameter("lName");
			String add1 = request.getParameter("add1");
			String add2 = request.getParameter("add2");
			String stat = request.getParameter("status");
			System.out.println("Received data:" + fname + " " + lname + " " + add1 + " " + add2 + " " + stat);

			// Removing old address data..
			sess.removeAttribute("oldAddressName");
			sess.removeAttribute("oldFname");
			sess.removeAttribute("oldlName");
			sess.removeAttribute("oldAddress1");
			sess.removeAttribute("oldAddress2");
			sess.removeAttribute("oldStatus");
			// country List
//			CountryState cs = new CountryState();
			request.setAttribute("cList", cs.getCountry());
			request.setAttribute("sList", cs.getStates(companyID));

			String chkStatus = request.getParameter("chkStatus");
			System.out.println("Status is:" + chkStatus);
			request.setAttribute("chkStatus", chkStatus);
			if (customerDto != null) {
				customerDto.setFirstName(fname);
				customerDto.setLastName(lname);
				customerDto.setAddress1(add1);
				customerDto.setAddress2(add2);
				if (chkStatus.equals("Default")) {
					// frm.setStatus(stat);
					customerDto.setStatus("Default");
				} else {
					customerDto.setStatus("Active");
				}
			}
			forward = "success22";
		} else if (action.equalsIgnoreCase("editExistingAddress")) {
			String status = request.getParameter("status1");
			// country List
//			CountryState cs = new CountryState();
			request.setAttribute("cList", cs.getCountry());
			request.setAttribute("sList", cs.getStates(companyID));

			String chkStatus = request.getParameter("chkStatus");
			System.out.println("Status is:" + chkStatus);
			request.setAttribute("chkStatus", chkStatus);
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.addSupplierDetails(request);

			ArrayList serviceList = new ArrayList();
			serviceList = sd.addServices(companyID);
			request.setAttribute("serviceList", serviceList);
			if (customerDto != null) {
				request.setAttribute("addressStatus", status);
				request.setAttribute("fName", customerDto.getFirstName());
				request.setAttribute("lName", customerDto.getLastName());
				request.setAttribute("addressName", customerDto.getTitle());
				request.setAttribute("add1", customerDto.getAddress1());
				request.setAttribute("add2", customerDto.getAddress2());
				request.setAttribute("addressStatus", customerDto.getStatus());
			}
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("addNewAddress")) {
			String status = request.getParameter("status");
//			CountryState cs = new CountryState();
			request.setAttribute("cList", cs.getCountry());
			request.setAttribute("sList", cs.getStates(companyID));

//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.addSupplierDetails(request);

			ArrayList serviceList = new ArrayList();
			serviceList = sd.addServices(companyID);
			request.setAttribute("serviceList", serviceList);

			String addName = (String) sess.getAttribute("oldAddressName");
			String first = (String) sess.getAttribute("oldFname");
			String last = (String) sess.getAttribute("oldlName");
			String add1 = (String) sess.getAttribute("oldAddress1");
			String add2 = (String) sess.getAttribute("oldAddress2");
			String stat = (String) sess.getAttribute("oldStatus");

			System.out.println("Old Address Data:\nAddressName:" + addName + "\nFirstName:" + first + "\nLastName:"
					+ last + "\nAddress1:" + add1 + "\nAddress2:" + add2 + "\nStatus:" + stat);

			/*
			 * if(form!=null) {
			 */
			// new address data....
			request.setAttribute("addressStatus", status);
			request.setAttribute("fName", customerDto.getFirstName());
			request.setAttribute("lName", customerDto.getLastName());
			request.setAttribute("addressName", customerDto.getTitle());
			request.setAttribute("add1", customerDto.getAddress1());
			request.setAttribute("add2", customerDto.getAddress2());
			request.setAttribute("companyAddressName", customerDto.getStatus());

			// old address data
			request.setAttribute("newAddressName", addName);
			request.setAttribute("newfName", first);
			request.setAttribute("newlName", last);
			request.setAttribute("newAdd1", add1);
			request.setAttribute("newAdd2", add2);
			request.setAttribute("newAddressStatus", stat);
			// }
			System.out.println("New Address Data:");
			System.out.println("addressStatus:" + status + "\nfirstName:" + customerDto.getFirstName() + "\nLastName:"
					+ customerDto.getLastName() + "\naddressName:" + customerDto.getTitle() + "\nAddress1:"
					+ customerDto.getAddress1() + "\nAddress2:" + customerDto.getAddress2());

			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("NewItem")) { // to add
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// request.getSession().setAttribute("ItemType", "1");
			// request.setAttribute("ItemType","1");
			sd.FillCombo(request, itemDto);
			forward = "/sales/invoice";
		}

		else if (action.equalsIgnoreCase("makeSelectedOrderAsInvoice")) {
			int invoiceID = Integer.parseInt(request.getParameter("invoiceID"));
			String reqType = request.getParameter("reqType");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.makeSelectedOrderAsInvoice(request, invoiceID);
			if (reqType.equalsIgnoreCase("EST")) {
				forward = "redirect:/EstimationBoard?tabid=ShowList";
			} else if (reqType.equalsIgnoreCase("SO")) {
				forward = "redirect:/SalesOrderBoard?tabid=ShowList";
			} else if (reqType.equalsIgnoreCase("PO")) {
				forward = "redirect:/PurchaseBoard?tabid=ShowList";
			} else {
				forward = "redirect:/Invoice?tabid=Invoice";
			}
		} else if (action.equalsIgnoreCase("SaveInvoice")) {
			String custID = request.getParameter("custID");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.saveInvoice(request, invoiceDto, custID);
			forward = "redirect:Invoice?tabid=Invoice";
		} else if (action.equalsIgnoreCase("DeleteInvoice")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			String customerID = request.getParameter("CustomerID");
			sd.deleteInvoice(request, invoiceDto, customerID);
			forward = "redirect:Invoice?tabid=Invoice";
		}

		else if (action.equalsIgnoreCase("ShowInvoiceUpdate")) {
			String cvId = request.getParameter("CustId");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getCustomerDetails(cvId, request, customerDto);
			sd.getInvoiceInfo(request);
			sd.getAllList(request);
			forward = "/sales/updateInvoice";

		} else if (action.equalsIgnoreCase("UpdateInvoice")) { // to add Vendor
			String cvId = request.getParameter("CustId");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.UpdateCustInfo(request, customerDto);
			sd.getCustomerDetails(cvId, request, customerDto);
			sd.getAllList(request);
			forward = "/sales/updateInvoice";
		} else if (action.equalsIgnoreCase("UpdateCustInfo")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.UpdateCustInfo(request, customerDto);

			sd.getAllList(request);
			System.out.println("Updated");
			forward = "/sales/updateInvoice";

		} else if (action.equalsIgnoreCase("PaymentHistory")) {
			String cvId = request.getParameter("CustId");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.payHistory(cvId, request);
			forward = "/sales/payHistory";

		} else if (action.equalsIgnoreCase("ShowEmail")) {
			String orderNo = request.getParameter("OrderNo");
			String orderType = request.getParameter("OrderType");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.sendEmailInfo(orderNo, request, orderType, invoiceDto);
			forward = "/sales/sendEMail";

		} else if (action.equalsIgnoreCase("SendMail")) {
			String orderNo = request.getParameter("OrderNo");
			if (null != orderNo) {
//				SalesDetailsDao sdetails = new SalesDetailsDao();
				sd.sendEmail(request, invoiceDto);
				sd.sendEmailInfo(orderNo, request, "invoice", invoiceDto);
				forward = "/sales/sendEMail";
			} else {
//				SalesDetailsDao sdetails = new SalesDetailsDao();
				sd.sendEmail(request, invoiceDto);
				forward = "redirect:/Customer?tabid=ContactBoard";
			}
		} else if (action.equalsIgnoreCase("ShowEmailOnCustomerBoard")) {
			String CustIDs = request.getParameter("CustIDs");
//			InvoiceInfoDao invoice = new InvoiceInfoDao();
			EmailSenderDto emsDto = invoiceInfoDao.getEmailSenderInfo(companyID);
//			CustomerInfoDao info = new CustomerInfoDao();
			ArrayList<CustomerDto> custList = customerInfoDao.customerDetails(companyID);
			String emails = "";
			for (String custID : CustIDs.split(":")) {
				for (CustomerDto cust : custList) {
					if (!custID.isEmpty() && custID.equals(cust.getClientVendorID())) {
						emails = emails + cust.getEmail() + ",";
						break;
					}
				}
			}
			emails = emails.substring(0, emails.length() - 1);
			emailSenderDto.setTo(emails);
			emailSenderDto.setFrom(emsDto.getMailSenderEmail());
			forward = "/sales/customerBoardSendEmail";
		} else if (action.equalsIgnoreCase("SendMailOnCustomerBoard")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.sendEmailOnCustomerBoard(request, emailSenderDto);
			forward = "/sales/sendEMail";
		} else if (action.equalsIgnoreCase("SBLU")) { // Action For Look up Button // From SalesBoard.jsp
			String orderNo = request.getParameter("order_no");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInvoiceInfo(request);
			sd.getInitialize(orderNo, request, invoiceDto);
			request.setAttribute("Enable", "true");

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			InvoiceDto invoice = new InvoiceDto();
			invoice.setSalesTaxID("1");
			invoice.setState("Tax " + configDto.getSaleTaxRate() + "%");
			invoice.setRate(configDto.getSaleTaxRate());
			List<InvoiceDto> taxRates = new ArrayList<>();
			taxRates.add(invoice);
			invoiceDto.setTemplateType(configDto.getInvoiceTemplateType());
			invoiceDto.setOrderNo(MyUtility.getOrderNumberByConfigData(invoiceDto.getOrderNo(),
					AppConstants.InvoiceType, configDto, false));
			request.setAttribute("TaxRates", taxRates);
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("IBLU")) { // Action Send to invoice it// From SalesBoard.jsp
			String orderNo = request.getParameter("order_no");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInvoiceInfo(request);
			sd.getInitialize(orderNo, request, invoiceDto);

//			InvoiceInfoDao invoice = new InvoiceInfoDao();
			invoiceInfoDao.invoiceIt(orderNo); // Action Sales Board InInvoice True
			request.setAttribute("Enable", "true");
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("CUSTLOOKUP")) {
			String cvId = request.getParameter("CustId");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getCustomerDetails(cvId, request, customerDto);
			sd.getAllList(request);
			sd.getCustLookup(cvId, request, customerDto);
			forward = "/sales/sendEMail";
		} else if (action.equalsIgnoreCase("ShowPrint")) {
			// String ordNo=request.getParameter("OrderNo");

			// SalesDetails sdetails=new SalesDetails();
			// sdetails.payHistory(cvId,request);
			forward = "/sales/printInvoice";
		} else if (action.equalsIgnoreCase("DropShipInvoice")) {
			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.dropShipInvoice(request, invoiceDto, configDto);
			sd.getInvoiceInfo(request);
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("accounting")) {
			String orderNo = request.getParameter("orderno");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInvoiceInfo(request);
			sd.getInitialize(orderNo, request, invoiceDto);
			request.setAttribute("Enable", "true");
			forward = "/accounting/test";
		} else if (action.equalsIgnoreCase("SalesOrder")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.newSalesOrder(request, invoiceDto);
			sd.getInvoiceInfo(request);

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			InvoiceDto invoice = new InvoiceDto();
			invoice.setSalesTaxID("1");
			invoice.setState("Tax " + configDto.getSaleTaxRate() + "%");
			invoice.setRate(configDto.getSaleTaxRate());
			List<InvoiceDto> taxRates = new ArrayList<>();
			taxRates.add(invoice);
			request.setAttribute("TaxRates", taxRates);
			invoiceDto.setRep(configDto.getSelectedSalesRepId() + "");
			invoiceDto.setTerm(configDto.getSelectedTermId() + "");
			invoiceDto.setPayMethod(configDto.getSelectedPaymentId() + "");
			invoiceDto.setVia(configDto.getCustomerShippingId() + "");
			invoiceDto.setTemplateType(configDto.getSoTemplateType());
			invoiceDto.setInvoiceStyle(configDto.getSoStyleID() + "");
			invoiceDto.setOrderNo(MyUtility.getOrderNumberByConfigData(invoiceDto.getOrderNo(), AppConstants.SOType,
					configDto, false));
			if (IN_URI.endsWith(SALES_ORDER_URI)) {
				forward = "/sales/salesorder";
			} else {
				forward = "/sales/invoice";
			}
		} else if (action.equalsIgnoreCase("FirstSalesOrder") || action.equalsIgnoreCase("LastSalesOrder")
				|| action.equalsIgnoreCase("NextSalesOrder") || action.equalsIgnoreCase("PreviousSalesOrder")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInvoiceInfo(request);
			sd.getSalesOrderDetailsByBtnName(request, invoiceDto);

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			invoiceDto.setSalesTaxID("1");
			invoiceDto.setState("Tax " + configDto.getSaleTaxRate() + "%");
			invoiceDto.setRate(configDto.getSaleTaxRate());
			List<InvoiceDto> taxRates = new ArrayList<>();
			taxRates.add(invoiceDto);
			request.setAttribute("TaxRates", taxRates);
			invoiceDto.setTemplateType(configDto.getSoTemplateType());
			invoiceDto.setOrderNo(MyUtility.getOrderNumberByConfigData(invoiceDto.getOrderNo(), AppConstants.SOType,
					configDto, false));
			if (IN_URI.endsWith(SALES_ORDER_URI)) {
				forward = "/sales/salesorder";
			} else {
				forward = "/sales/invoice";
			}
		} else if (action.equalsIgnoreCase("SortCustomerOfSalesOrder")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getSortedInvoiceInfo(request, request.getParameter("SortBy"));
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("saveUnitPriceForSalesOrder")) {
			int itemId = Integer.parseInt(request.getParameter("itemID"));
			// float price = Float.parseFloat(request.getParameter("price"));
			double p1 = Double.parseDouble(request.getParameter("price"));
			System.out.println("method:saveUnitPrice\nitemId:" + itemId + "\nPrice:" + p1);
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.setUnitPrice(companyID, itemId, p1);
			sd.getInvoiceInfo(request);
			forward = "successSalesOrder";
		} else if (action.equalsIgnoreCase("saveItemNameForSalesOrder")) {
			int itemId = Integer.parseInt(request.getParameter("itemID"));
			String itemName = request.getParameter("itemName");
			System.out.println("method:saveUnitPrice\nitemId:" + itemId + "\nItemName:" + itemName);
//			SalesDetailsDao sd = new SalesDetailsDao();
			sd.setItemName(companyID, itemId, itemName);
			sd.getInvoiceInfo(request);
			forward = "successSalesOrder";
		} else if (action.equalsIgnoreCase("SaveOrder")) { // save Sales Order
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.saveOrder(request, invoiceDto);
			forward = "redirect:SalesOrder?tabid=SalesOrder";
		} else if (action.equalsIgnoreCase("DeleteSalesOrder")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.deleteSalesOrder(request, invoiceDto);
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("SalesOrderBoard")) {
			SalesOrderBoardForm salesorderForm = new SalesOrderBoardForm();
			salesorderForm.setOrderDate1("");
			salesorderForm.setOrderDate2("");
			salesorderForm.setSaleDate1("");
			salesorderForm.setSaleDate2("");
			request.setAttribute("BlankValue", salesorderForm);
			forward = "/sales/invoice";
		} else if (action.equalsIgnoreCase("SOBLU")) { // Action For Look up Button // From SalesOrderBoard.jsp
			String orderNo = request.getParameter("order_no");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.newSalesOrder(request, invoiceDto);
			sd.getInvoiceInfo(request);
			sd.getSalesOrderInitialize(orderNo, request, invoiceDto);

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			InvoiceDto invoice = new InvoiceDto();
			invoice.setSalesTaxID("1");
			invoice.setState("Tax " + configDto.getSaleTaxRate() + "%");
			invoice.setRate(configDto.getSaleTaxRate());
			List<InvoiceDto> taxRates = new ArrayList<>();
			taxRates.add(invoice);
			request.setAttribute("TaxRates", taxRates);
			invoiceDto.setTemplateType(configDto.getSoTemplateType());
			invoiceDto.setOrderNo(MyUtility.getOrderNumberByConfigData(invoiceDto.getOrderNo(), AppConstants.SOType,
					configDto, false));
			request.setAttribute("Enable", "true");
			if (IN_URI.endsWith(SALES_ORDER_URI)) {
				forward = "/sales/salesorder";
			} else {
				forward = "/sales/invoice";
			}
		} else if (action.equalsIgnoreCase("InventoryList")) { // for Inventory List Report
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.ItemsList(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/inventoryList";
			} else {
				forward = "/sales/printInvoice";
			}
		} else if (action.equalsIgnoreCase("AdjustInventoryList")) { // for Adjust-Inventory List Report
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getAdjustInventoryListByDate(request);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/adjustInventoryList";
			} else {
				forward = "/sales/printInvoice";
			}
		} else if (action.equalsIgnoreCase("ReceivedItemList")) { // for Received-Item List Report
//			PurchaseBoardDetails pd = new PurchaseBoardDetails();
			purchaseBoardDetails.getPurchaseBoardDetails(request, new PurchaseBoardDto());
			forward = "/reports/receivedItemList";
		} else if (action.equalsIgnoreCase("ItemPriceList")) { // for ItemPriceList List Report
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.ItemsReportList(request, itemDto);
			forward = "/reports/itempricelist";
		} else if (action.equalsIgnoreCase("DiscontinuedList")) { // for DiscontinuedList List Report
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.ItemsDicontinuedList(request, itemDto);
			forward = "/reports/discontinuedReportList";
		} else if (action.equalsIgnoreCase("CustomerList")) { // for CustomerList Report
//			CustomerInfo cinfo = new CustomerInfo();
			ArrayList Customerlist = new ArrayList();
			Customerlist = customerInfo.customerDetails(companyID);
			model.addAttribute("customerlist", Customerlist);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "reports/CustomerListReport";
			} else {
				forward = "success9";
			}
		} else if (action.equalsIgnoreCase("CustomerPhoneList")) {
//			CustomerInfo cinfo = new CustomerInfo();
			ArrayList CustomerPhoneList = customerInfo.customerDetails(companyID);
			model.addAttribute("customerphonelist", CustomerPhoneList);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "reports/CustomerPhoneList";
			} else {
				forward = "success10";
			}
		} else if (action.equalsIgnoreCase("CustomerContactList")) {
//			CustomerInfo cinfo = new CustomerInfo();
			ArrayList customerContactList = customerInfo.customerDetails(companyID);
			model.addAttribute("customerContactList", customerContactList);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "reports/CustomerContactList";
			} else {
				forward = "success11";
			}
		} else if (action.equalsIgnoreCase("CustomerTransactionList")) {
//			CustomerInfoDao info = new CustomerInfoDao();
			String fromDate = customerDto.getFromDate();
			String toDate = customerDto.getToDate();
			String sortBy = customerDto.getSortBy();
			String datesCombo = customerDto.getDatesCombo();
			ArrayList transactionList = customerInfoDao.getTransactionList(datesCombo, fromDate, toDate, sortBy,
					companyID, request, customerDto);
			model.addAttribute("customerTransactionList", transactionList);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "reports/CustomerTransactionList";
			} else {
				forward = "success12";
			}
		} else if (action.equalsIgnoreCase("CustomerBalanceSummary")) {
//			CustomerInfoDao info = new CustomerInfoDao();
			String fromDate = customerDto.getFromDate();
			String toDate = customerDto.getToDate();
			String sortBy = customerDto.getSortBy();
			String datesCombo = customerDto.getDatesCombo();
			ArrayList balanceSummanyList = customerInfoDao.getBalanceSummaryList(datesCombo, fromDate, toDate, sortBy,
					companyID, request, customerDto);
			model.addAttribute("balanceSummanyList", balanceSummanyList);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "reports/CustBalSummary";
			} else {
				forward = "success13";
			}
		} else if (action.equalsIgnoreCase("CustomerBalDetail")) {
//			CustomerInfoDao info = new CustomerInfoDao();
			String fromDate = customerDto.getFromDate();
			String toDate = customerDto.getToDate();
			String sortBy = customerDto.getSortBy();
			String datesCombo = customerDto.getDatesCombo();
			ArrayList balanceDetail = customerInfoDao.getBalanceDetail(datesCombo, fromDate, toDate, sortBy, companyID,
					request, customerDto);
			model.addAttribute("balanceDetail", balanceDetail);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "reports/CustBalDetail";
			} else {
				forward = "success14";
			}
		} else if (action.equalsIgnoreCase("SalesByCustomerSummary")) {
//			CustomerInfoDao info = new CustomerInfoDao();
			String fromDate = customerDto.getFromDate();
			String toDate = customerDto.getToDate();
			String sortBy = customerDto.getSortBy();
			String datesCombo = customerDto.getDatesCombo();
			ArrayList getSalesCustomerSummary = customerInfoDao.getSalesByCustomerSummary(datesCombo, fromDate, toDate,
					sortBy, companyID, request, customerDto);
			model.addAttribute("getSalesCustomerSummary", getSalesCustomerSummary);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "reports/SalesByCustomerSummary";
			} else {
				forward = "success15";
			}
		} else if (action.equalsIgnoreCase("IncomeCustomerSummary")) {
//			CustomerInfoDao info = new CustomerInfoDao();
			String fromDate = customerDto.getFromDate();
			String toDate = customerDto.getToDate();
			String sortBy = customerDto.getSortBy();
			String datesCombo = customerDto.getDatesCombo();
			ArrayList incomeCustomerSummary = customerInfoDao.getIncomeByCustomerSymmary(datesCombo, fromDate, toDate,
					sortBy, companyID, request, customerDto);
			model.addAttribute("incomeCustomerSummary", incomeCustomerSummary);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "reports/IncomeCustomerSummary";
			} else {
				forward = "success16";
			}
		} else if (action.equalsIgnoreCase("DamagedInvList")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getDamagedInvenotyList(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/damagedInventoryList";
			} else {
				forward = "success9";
			}
		} else if (action.equalsIgnoreCase("MissingInventoryList")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getMissingInventoryList(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/missingInventoryList";
			} else {
				forward = "success15";
			}
		} else if (action.equalsIgnoreCase("ReturnInventoryList")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getReturnInventoryList(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/returnInventoryList";
			} else {
				forward = "success17";
			}
		} else if (action.equalsIgnoreCase("InventoryValSummary")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInventoryValuationSummary(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/inventoryValuationSummary";
			} else {
				forward = "success10";
			}
		} else if (action.equalsIgnoreCase("InvValDetail")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInventoryValuationDetail(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/inventoryValuationDetail";
			} else {
				forward = "success11";
			}
		} else if (action.equalsIgnoreCase("InvOrderReport")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInventoryOrderReport(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/inventoryOrderReport";
			} else {
				forward = "success12";
			}
		} else if (action.equalsIgnoreCase("InvStatistic")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getInventoryStatistics(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/inventoryStatisticReport";
			} else {
				forward = "success13";
			}
		} else if (action.equalsIgnoreCase("AccountPayable")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getAccountPayableReport(request, customerDto);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/reports/AccountPayableReport";
			} else {
				forward = "success17";
			}
		} else if (action.equalsIgnoreCase("ProfitLossDetail")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getProfitLossDetail(request, customerDto);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/reports/profitLossDetail";
			} else {
				forward = "success18";
			}
		} else if (action.equalsIgnoreCase("BudgetVsActual")) {
			System.out.println("ProfitLossDetail action called....");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getBudgetVsActual(request);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/reports/budgetVsActualReport";
				model.addAttribute("salesBoardDto", new SalesBoardDto());
			} else {
				forward = "success20";
			}
		} else if (action.equalsIgnoreCase("BudgetOverview")) {
			System.out.println("BudgetOverview action called....");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getBudgetOverview(request);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/reports/budgetOverviewReport";
				model.addAttribute("salesBoardDto", new SalesBoardDto());
			} else {
				forward = "success21";
			}
		} else if (action.equalsIgnoreCase("ProfitLossByItem")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getProfitLosByItem(request, itemDto);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/profitLossByItemReport";
			} else {
				forward = "success14";
			}
		} else if (action.equalsIgnoreCase("AccountPayableGraph")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.getAccountPayableGraph(request);
			if (IN_URI.endsWith(CUSTOMER_URI)) {
				forward = "/reports/accountPayableGraph";
			} else {
				forward = "success19";
			}
		} else if (action.equalsIgnoreCase("showDamageInventoryList")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getAccountPayableGraph(request, form);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/damageInventoryList";
			} else {
				forward = "success20";
			}
		} else if (action.equalsIgnoreCase("showUnknownInventoryList")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getAccountPayableGraph(request, form);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/showUnknownInventoryList";
			} else {
				forward = "success21";
			}
		} else if (action.equalsIgnoreCase("showReturnedInventoryList")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getAccountPayableGraph(request, form);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/showReturnedInventoryList";
			} else {
				forward = "success22";
			}
		} else if (action.equalsIgnoreCase("showDailyItemSummary")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getAccountPayableGraph(request, form);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/showDailyItemSummary";
			} else {
				forward = "success23";
			}
		} else if (action.equalsIgnoreCase("showDailySalesSummary")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getAccountPayableGraph(request, form);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/reports/showDailySalesSummary";
			} else {
				forward = "success24";
			}
		} else if (action.equalsIgnoreCase("ShowSalesTaxSummary")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			// sdetails.getAccountPayableGraph(request, form);
			forward = "success25";
		} else if (action.equalsIgnoreCase("UploadItem")) {
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/file/uploadItem";
			} else {
				forward = "success26";
			}
		} else if (action.equals("ExportItem")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			String type = request.getParameter("type");
			sd.exportFile(request, itemDto, type, response);
			if (IN_URI.endsWith(ITEM_URI)) {
				forward = "/file/exportItem";
			} else {
				forward = "success27";
			}
		} else if (action.equalsIgnoreCase("PrintInvoice") || action.equalsIgnoreCase("PrintPackingSlip")) {
			String compId = (String) request.getSession().getAttribute("CID");
			String custID = request.getParameter("custID");
			String orderNo = request.getParameter("orderNo");
			String templateType = request.getParameter("ttype");

//			SalesDetailsDao sdetails = new SalesDetailsDao();
			List<String> orderNums = sd.getCustomerInvoiceOrderNums(custID, compId);
			request.setAttribute("PrintOrderNums", orderNums);
			if ((orderNo == null || orderNo.isEmpty()) && !orderNums.isEmpty()) {
				orderNo = orderNums.get(0);
			}
			if (orderNo != null && !orderNo.trim().isEmpty()) {
				request.setAttribute("PrintOrderDetails", sd.getRecordForInvoice(compId, orderNo, invoiceDto, request));
			}
			request.setAttribute("custID", custID);
			request.setAttribute("templateType", templateType);
			request.setAttribute("baseURL", "/Invoice?tabid=" + action);
			if (action.equalsIgnoreCase("PrintInvoice")) {
				forward = "/templates/invoiceTemplate" + templateType;
			} else {
				forward = "/templates/invoicePackingSlip";
			}
		} else if (action.equalsIgnoreCase("PrintSO")) { // Action to Print-Sales-Order
			String compId = (String) request.getSession().getAttribute("CID");
			String custID = request.getParameter("custID");
			String orderNo = request.getParameter("orderNo");
			String templateType = request.getParameter("ttype");

//			SalesDetailsDao sdetails = new SalesDetailsDao();
			List<String> orderNums = sd.getCustomerSalesOrderNums(custID, compId);
			request.setAttribute("PrintOrderNums", orderNums);
			if ((orderNo == null || orderNo.isEmpty()) && !orderNums.isEmpty()) {
				orderNo = orderNums.get(0);
			}
			if (orderNo != null && !orderNo.trim().isEmpty()) {
				request.setAttribute("PrintOrderDetails",
						sd.getRecordForSalesOrder(compId, orderNo, invoiceDto, request));
			}
			request.setAttribute("custID", custID);
			request.setAttribute("templateType", templateType);
			request.setAttribute("baseURL", "/SalesOrder?tabid=PrintSO");
			forward = "/templates/invoiceTemplate" + templateType;
		}
		return forward;
	}

	@PostMapping("/ItemFileUpload")
	public String ItemFileUpload(ItemDto itemDto, HttpServletRequest request,
			@RequestParam("attachFile") MultipartFile attachFile) {
		String forward = "/include/dashboard";
		String action = request.getParameter("tabid");

		System.out.println("--------------SalesController-------ItemFileUpload------tabid: " + action);
		if (action.equalsIgnoreCase("UploadItemFile")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			if (!attachFile.isEmpty()) {
				sd.uploadItemFile(request, attachFile);
			}
			forward = "redirect:/Item?tabid=UploadItem";
		}
		return forward;
	}

	@ResponseBody
	@PostMapping("/ItemAjax")
	public Object ItemAjaxCall(ItemDto itemDto, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String action = request.getParameter("tabid");
		String status = "Success";
		System.out.println("------------ItemAjax-------------action: " + action);
		if (action.equalsIgnoreCase("sortItem")) {
			int sortById = Integer.parseInt(request.getParameter("SortBy"));
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("SelectedRID");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			ArrayList<ItemDto> itemData = sd.sortItemsList(request, itemDto, sortById);
			request.setAttribute("sortById", sortById);
			// sdetails.getSortedInvoiceInfo(request,request.getParameter("SortBy"));
			return itemData;
		} else if (action.equalsIgnoreCase("loadItemByTemplate")) { // load-Item-By-Template/ID
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			return sd.searchItem(request, itemDto);
		}
		return status;
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@PostMapping("/CustomerAjax")
	public Object CustomerAjaxCall(CustomerDto customerDto, InvoiceDto invoiceDto, HttpServletRequest request)
			throws Exception {
		String action = request.getParameter("tabid");
		String status = "Success";
		String companyID = (String) request.getSession().getAttribute("CID");
//		SalesDetailsDao sd = new SalesDetailsDao();
//		InvoiceInfo invoiceInfo = new InvoiceInfo();
//		InvoiceInfoDao invoiceInfoDao = new InvoiceInfoDao();
		System.out.println("------------CustomerAjax-------------action: " + action);
		if (action.equalsIgnoreCase("sortInvoice")) {
			int sortById = Integer.parseInt(request.getParameter("SortBy"));
			String cvId = request.getParameter("cvId");
			String rowId = request.getParameter("SelectedRID");
			ArrayList<CustomerDto> CustomerDetails = sd.getSortedCustomer(request, customerDto, sortById);
			sd.searchSelectedCustomer(cvId, request, customerDto);
			sd.getAllList(request);
			if (rowId != null)
				customerDto.setSelectedRowID(rowId);
			else
				customerDto.setSelectedRowID("0");
			if (cvId != null)
				customerDto.setClientVendorID(cvId);
			else
				customerDto.setClientVendorID("0");
			if (rowId != null) {
				request.setAttribute("VendorFrm", customerDto.getSelectedRowID());
			}
			request.setAttribute("sortById", sortById);
			// sdetails.getSortedInvoiceInfo(request,request.getParameter("SortBy"));
			return CustomerDetails;
		}
		if (action.equalsIgnoreCase("searchCustomers")) {
			return sd.getSearchedCustomers(request);
		} else if (action.equalsIgnoreCase("getCustomerDetails")) {
			String cvId = request.getParameter("cvId");
			sd.getCustomerDetails(cvId, request, customerDto);
			ArrayList<InvoiceDto> shipAddress = invoiceInfoDao.shipAddress(companyID, cvId);
			ArrayList<InvoiceDto> billAddress = invoiceInfoDao.billAddress(companyID, cvId);
			TrHistoryLookUp hlookup = invoiceInfo.getCustomerPaymentDetailsForCustomerBoardPage(cvId);
			customerDto.setLast3MonthAmt(hlookup.getLast3MonthAmt());
			customerDto.setLast1YearAmt(hlookup.getLast1YearAmt());
			customerDto.setTotalOverdueAmt(hlookup.getTotalOverdueAmt());
			customerDto.setLastOrderDate(hlookup.getLastOrderDate());
			for (InvoiceDto invoice : shipAddress) {
				System.out.println("_________________________________________________");
				System.out.println(invoice.getShipTo());
				String shipTo = invoice.getShipTo() != null ? invoice.getShipTo().replace("\n", "<br/>") : "";
				customerDto.setShipTo(shipTo);
				System.out.println("_________________________________________________");

			}
			for (InvoiceDto invoice : billAddress) {

				String billTo = invoice.getBillTo() != null ? invoice.getBillTo().replace("\n", "<br/>") : "";
				customerDto.setBillTo(billTo);
			}
			return customerDto;
		} else if (action.equalsIgnoreCase("zipcode")) {
			String zipcode = request.getParameter("zipcode");
//			CountryState cs = new CountryState();
			return cs.getAddressDetailsByZipcode(zipcode);
		} else if (action.equalsIgnoreCase("addPaymentMethod")) {
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.addCustomerCreditCard(customerDto, request);
			return "Success";
		}
		return status;
	}

}
