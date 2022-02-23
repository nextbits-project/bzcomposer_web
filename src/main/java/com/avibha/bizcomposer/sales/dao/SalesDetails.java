/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.sales.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.util.LabelValueBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.accounting.dao.AccountingDAO;
import com.avibha.bizcomposer.employee.dao.Title;
import com.avibha.bizcomposer.purchase.dao.CreditCard;
import com.avibha.bizcomposer.purchase.dao.PayMethod;
import com.avibha.bizcomposer.purchase.dao.PurchaseInfo;
import com.avibha.bizcomposer.purchase.dao.PurchaseOrderInfo;
import com.avibha.bizcomposer.purchase.dao.Rep;
import com.avibha.bizcomposer.purchase.dao.Shipping;
import com.avibha.bizcomposer.purchase.dao.Term;
import com.avibha.bizcomposer.purchase.dao.VendorCategory;
import com.avibha.bizcomposer.purchase.forms.PurchaseOrderDto;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.bizcomposer.sales.forms.EstimationDto;
import com.avibha.bizcomposer.sales.forms.InvoiceDto;
import com.avibha.bizcomposer.sales.forms.ItemDto;
import com.avibha.bizcomposer.sales.forms.UpdateInvoiceDto;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.avibha.common.utility.DateInfo;
import com.nxsol.bizcomposer.reportcenter.eSales.EsalesPOJO;

@Service
public class SalesDetails {

	private EstimationInfo estimation;
	
	@Autowired
	public SalesDetails(EstimationInfo estimation) {
		super();
		this.estimation = estimation;
	}

	public void getdataManager(HttpServletRequest request, ActionForm form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		SalesInfo sales = new SalesInfo();
		ArrayList customerTitle = new ArrayList(); // to get customer title
		customerTitle = sales.getCustomerTitle(compId);
		request.setAttribute("customerTitle", customerTitle);

		ArrayList SalesRep = new ArrayList(); // to get sales rep
		SalesRep = sales.getSalesRep(compId);
		request.setAttribute("SalesRep", SalesRep);

		ArrayList salesTerms = new ArrayList(); // to get customer title
		salesTerms = sales.getTerms(compId);
		request.setAttribute("salesTerms", salesTerms);

		ArrayList SalesCatType = new ArrayList(); // to get customer title
		SalesCatType = sales.getCatType(compId);
		request.setAttribute("SalesCatType", SalesCatType);

		ArrayList SalesLocation = new ArrayList(); // to get customer title
		SalesLocation = sales.getLocation(compId);
		request.setAttribute("SalesLocation", SalesLocation);

		ArrayList SalesPaymentMethod = new ArrayList(); // to get customer title
		SalesPaymentMethod = sales.getPaymentType(compId);
		request.setAttribute("SalesPaymentMethod", SalesPaymentMethod);

		ArrayList SalesMessage = new ArrayList(); // to get customer title
		SalesMessage = sales.getMessage(compId);
		request.setAttribute("SalesMessage", SalesMessage);

		ArrayList CreditCardType = new ArrayList(); // to get customer title
		CreditCardType = sales.getCreditCard(compId);
		request.setAttribute("CreditCardType", CreditCardType);

		ArrayList SalesTax = new ArrayList(); // to get customer title
		SalesTax = sales.getTax(compId);
		request.setAttribute("SalesTax", SalesTax);

		/* Via Information */
		ArrayList via = new ArrayList();
		via = sales.getVia(compId);
		request.setAttribute("Via", via);

	}

	public void AddCustomer(HttpServletRequest request, CustomerDto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		String istaxable = request.getParameter("isTaxable");
		String isAlsoClient = request.getParameter("isAlsoClient");
		String UseIndividualFinanceCharges = request
				.getParameter("UseIndividualFinanceCharges");
		String AssessFinanceChk = request.getParameter("AssessFinanceChk");
		String FChargeInvoiceChk = request.getParameter("FChargeInvoiceChk");
		Loger.log("istaxable:" + istaxable);
		Loger.log("isAlsoClient:" + isAlsoClient);
		int istax = 0;
		int isclient = 2; // 2 for vendor in cvtype table
		int indCharge = 0;
		int aFCharge = 0;
		int fICharge = 0;

		if ("on".equalsIgnoreCase(istaxable))
			istax = 1;

		if ("on".equalsIgnoreCase(isAlsoClient))
			isclient = 1;

		if ("on".equalsIgnoreCase(UseIndividualFinanceCharges))
			indCharge = 1;

		if ("on".equalsIgnoreCase(AssessFinanceChk))
			aFCharge = 1;

		if ("on".equalsIgnoreCase(FChargeInvoiceChk))
			fICharge = 1;

		// ..............................................generating new cvId
		PurchaseInfo pinfo = new PurchaseInfo();
		int cvID = pinfo.getLastClientVendorID() + 1;
		// ............................................Id generation finished

		CustomerInfo customer = new CustomerInfo();
		CustomerDto cfrm = (CustomerDto) form;
		
		try{
			boolean addCust = customer.insertCustomer(cvID + "", cfrm, compId, istax, isclient,
				indCharge, aFCharge, fICharge, "N");
			if(addCust){
				request.setAttribute("SaveStatus",new ActionMessage("Customer Information is Successfully Added !."));
			}
		}catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("SaveStatus",new ActionMessage("Customer Information is Not Insert !."));
		}
	}

	public void getAllList(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String cid = (String) sess.getAttribute("CID");
		// Title List
		Title t = new Title();
		request.setAttribute("titleList", t.getTitleList(cid));

		// country List
		CountryState cs = new CountryState();
		request.setAttribute("cList", cs.getCountry());

		// Term List
		Term tr = new Term();
		request.setAttribute("TermList", tr.getTermList(cid));

		// Rep List
		Rep rap = new Rep();
		request.setAttribute("RepList", rap.getRepList(cid));

		// PayMethod List
		PayMethod pmethod = new PayMethod();
		request.setAttribute("PaymentList", pmethod.getPaymentTypeList(cid));

		// ShipCarrier List
		Shipping ship = new Shipping();
		request.setAttribute("ShipCarrierList", ship.getShipCarrierList(cid));

		// CreditCard List
		CreditCard cc = new CreditCard();
		request.setAttribute("CreditCardList", cc.getCCTypeList(cid));

		// VendorCategoryList List
		VendorCategory cv = new VendorCategory();
		request.setAttribute("VendorCategoryList",cv.getCVCategoryList(cid));

		/* Item List */

		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		ArrayList itemList = new ArrayList();
		itemList = invoice.getItemList(compId);
		request.setAttribute("ItemList", itemList);

		CustomerInfo customer = new CustomerInfo();
		customer.getServices(request, cid);
	}


	public void addSupplierDetails(HttpServletRequest request) 
	{
		HttpSession sess = request.getSession();
		String cid = (String) sess.getAttribute("CID");
		// Title List
		Title t = new Title();
		request.setAttribute("titleList", t.getTitleList(cid));

		// country List
		CountryState cs = new CountryState();
		request.setAttribute("cList", cs.getCountry());
		
		//state List
		CountryState cs1 = new CountryState();
		request.setAttribute("sList", cs1.getStates(cid));

		// Term List
		Term tr = new Term();
		request.setAttribute("TermList", tr.getTermList(cid));

		// Rep List
		Rep rap = new Rep();
		request.setAttribute("RepList", rap.getRepList(cid));

		// PayMethod List
		PayMethod pmethod = new PayMethod();
		request.setAttribute("PaymentList", pmethod.getPaymentTypeList(cid));

		// ShipCarrier List
		Shipping ship = new Shipping();
		request.setAttribute("ShipCarrierList", ship.getShipCarrierList(cid));

		// CreditCard List
		CreditCard cc = new CreditCard();
		request.setAttribute("CreditCardList", cc.getCCTypeList(cid));
		
		//CreditTerm List
		request.setAttribute("CreditTermList", cc.getCreditTermList(cid));
		
		ItemInfo item = new ItemInfo();
		ArrayList accountList = new ArrayList();
		accountList = item.fillAccountList(cid);
		sess.setAttribute("AccountList", accountList);

	}
	
	public ArrayList addServices(String companyID) 
	{
		ArrayList<LabelValueBean> arr = new ArrayList<LabelValueBean>();
		// boolean ret = false;
		Connection con = null ;
		PreparedStatement pstmt=null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		if (db == null)
			arr = null;
		con = db.getConnection();

		if (con == null)
			arr = null;

		try {
			String sqlString = "SELECT ServiceID,ServiceName,InvoiceStyleID,InventoryID FROM bca_servicetype WHERE CompanyID= ? ORDER BY ServiceName";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, companyID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				arr.add(new org.apache.struts.util.LabelValueBean(rs
						.getString("ServiceName"), rs.getString("ServiceID")));
			}
			pstmt.close();
			rs.close();
		} catch (SQLException ee) {
			Loger.log(2, "Error in  Class SalesDetail and  method -addServices "
					+ " " + ee.toString());
		} finally {
			db.close(con);

		}

		return arr;
	}
	public void getdataManagerSave(HttpServletRequest request, ActionForm form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		SalesInfo sales = new SalesInfo();
		String sTitleval = request.getParameter("sTitleval");
		String sOldval = request.getParameter("sOldval");
		String sNewval = request.getParameter("sNewval");
		String sNewvalID = request.getParameter("sNewvalID");
		String taxRateVal = "";
		if (request.getParameter("taxRateVal") != null)
			taxRateVal = request.getParameter("taxRateVal");

		sales.updateSalesData(sNewvalID, sTitleval, sOldval, sNewval,
				taxRateVal, compId);

	}
	
	public void getdataManagerDelete(HttpServletRequest request, ActionForm form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		SalesInfo sales = new SalesInfo();
		String sTitleval = request.getParameter("sTitleval");
		String sNewvalID = request.getParameter("sNewvalID");
		Loger.log("IDSS" + sNewvalID);
		sales.DeleteSalesData(sNewvalID, sTitleval, compId);

	}

	public void getCustomer(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		CustomerInfo customer = new CustomerInfo();
		ArrayList CustomerDetails = new ArrayList();
		CustomerDetails = customer.customerDetails(compId);
		request.setAttribute("CustomerDetails", CustomerDetails);
	}
	
	public ArrayList<CustomerDto> getCustomerSortByFirstName(HttpServletRequest request, CustomerDto frm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		CustomerInfo customer = new CustomerInfo();
		ArrayList<CustomerDto> CustomerDetails = new ArrayList<CustomerDto>();
		CustomerDetails = customer.customerDetailsSortByFirstName(compId);
		request.setAttribute("CustomerDetails", CustomerDetails);
		return CustomerDetails;
	}

	public ArrayList<CustomerDto> getCustomerSortByLastName(HttpServletRequest request, CustomerDto frm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		CustomerInfo customer = new CustomerInfo();
		ArrayList<CustomerDto> CustomerDetails = new ArrayList<CustomerDto>();
		CustomerDetails = customer.customerDetailsSortByLastName(compId);
		request.setAttribute("CustomerDetails", CustomerDetails);
		return CustomerDetails;
	}
	
	
	
	public void getLabelType(HttpServletRequest request)  {
		CustomerInfo customer = new CustomerInfo();
		ArrayList labelType = new ArrayList();
		labelType = customer.labelTypeDetails();
		request.setAttribute("LabelTypeList", labelType);
	}

	public void addNewLabel(CustomerDto form){
		CustomerDto cform = (CustomerDto)form ;
		cform.setLabelName("");
		cform.setTopMargin("0.0");
		cform.setLeftMargin("0.0");
		cform.setHorizon("0.0");
		cform.setVertical("0.0");
		cform.setLabelHeight("0.0");
		cform.setLabelWidth("0.0");
	}
	

	
	

	public void searchCustomer(String cvId, HttpServletRequest request,
			CustomerDto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		CustomerInfo customer = new CustomerInfo();
		ArrayList CustomerDetails = new ArrayList();
		sess.setAttribute("CustID", cvId);
		CustomerDetails = customer.SearchCustomer(compId, cvId, form);
		InvoiceInfo invoice = new InvoiceInfo();
		invoice.getServices(request, compId, cvId);
		request.setAttribute("CustomerDetails", CustomerDetails);
	}
	//search selected customer base on cvid
	public void searchSelectedCustomer(String cvId, HttpServletRequest request,
			ActionForm form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		//Loger.log("The Client vendor is from sales detail is " + cvId);
		invoice.SearchselectedCustomer(compId, cvId, request);
		invoice.getServices(request, compId, cvId);
	//	request.setAttribute("CustomerDetails", CustomerDetails);
	}
	public void UpdateCustomer(HttpServletRequest request, CustomerDto customerDto) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");

		CustomerInfo customer = new CustomerInfo();
		String cvId = (String) sess.getAttribute("editedCVID");
		customer.UpdateCustomer(compId, cvId);

		String istaxable = request.getParameter("isTaxable");
		String isAlsoClient = request.getParameter("isAlsoClient");
		Loger.log("ISC_________________________>>>>>>>>>>>>>>>>>>>>>>>>>>>>>              "+isAlsoClient);
		String UseIndividualFinanceCharges = request.getParameter("UseIndividualFinanceCharges");
		String AssessFinanceChk = request.getParameter("AssessFinanceChk");
		
		int istax = 0;
		int isclient = 2; // 2 for vendor in cvtype table
		int indCharge = 0;
		int aFCharge = 0;
		

		if (istaxable==null)
			istax = 0;
		else if ("on".equalsIgnoreCase(istaxable))
			istax = 1;
		else
			istax = 0;

		if (isAlsoClient==null)
			isclient = 2;
		else if ("on".equalsIgnoreCase(isAlsoClient))
			isclient = 1;
		else 
			isclient = 2;

		if(UseIndividualFinanceCharges==null)
			indCharge = 0;
		else if ("on".equalsIgnoreCase(UseIndividualFinanceCharges))
			indCharge = 1;
		else
			indCharge = 0;
		
		if(AssessFinanceChk == null)
			aFCharge = 0;
		else if ("on".equalsIgnoreCase(AssessFinanceChk))
			aFCharge = 1;
		else
			aFCharge = 0;

		customerDto.setAnnualIntrestRate(request.getParameter("AnualRate"));
		customerDto.setMinFCharges(request.getParameter("MinFinance"));
		customerDto.setGracePrd(request.getParameter("GracePeriod"));
		boolean updateCust = customer.updateInsertCustomer(cvId, customerDto, compId, istax, isclient, indCharge, aFCharge,"U");
		if(updateCust){
			request.setAttribute("SaveStatus","Customer updated successfully!");
		}
		if(customerDto.getDispay_info() !=null && customerDto.getDispay_info().equals("ShowAll")){
			request.setAttribute("RadioVal","1");
		}
		else
			request.setAttribute("RadioVal","2");
			
		if(request.getParameter("Flag").equals("1")){
			request.setAttribute("ClientID",cvId);
			/*request.setAttribute("FromDate",cfrm.getPeriodFrom());
			request.setAttribute("ToDate",cfrm.getPeriodTo());*/
		}
	}

	public void UpdateCustInfo(HttpServletRequest request, UpdateInvoiceDto uform) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		CustomerInfo customer = new CustomerInfo();
		InvoiceInfo customer1 = new InvoiceInfo();
		// String cvId=(String)sess.getAttribute("CustID");
		String cvId = uform.getCustId();
		customer.UpdateCustomer(compId, cvId);

		String istaxable = uform.getTaxAble();
		Loger.log("The value of taxable is " + uform.getTaxAble());
		String isAlsoClient = uform.getIsclient();
		Loger.log("The Value of isAlsoClient is " + uform.getIsclient());
		String UseIndividualFinanceCharges = request
				.getParameter("UseIndividualFinanceCharges");

		String AssessFinanceChk = request.getParameter("AssessFinance");
		String FChargeInvoiceChk = request.getParameter("MarkFinanace");
		Loger.log("istaxable:" + istaxable);
		Loger.log("isAlsoClient:" + isAlsoClient);
		int istax = 0;
		int isclient = 2; // 2 for vendor in cvtype table
		int indCharge = 0;
		int aFCharge = 0;
		int fICharge = 0;

		Loger.log("ACCESS_______________________________" + AssessFinanceChk);
		Loger.log("MARK FINANCE_________________________________"
				+ FChargeInvoiceChk);
		if ("on".equalsIgnoreCase(istaxable))
			istax = 1;

		if ("on".equalsIgnoreCase(isAlsoClient))
			isclient = 1;

		if (UseIndividualFinanceCharges == null) {
			indCharge = 0;
			Loger.log("HHH");
		} else if (("on").equalsIgnoreCase(UseIndividualFinanceCharges)) {
			indCharge = 1;
			Loger.log("TTTTTTTTTTTTTTTTTTTTT");
		}

		if (AssessFinanceChk == null) {
			aFCharge = 0;
		} else if (("off").equalsIgnoreCase(AssessFinanceChk))
			aFCharge = 1;

		if (FChargeInvoiceChk == null) {
			fICharge = 0;
		} else if (("off").equalsIgnoreCase(FChargeInvoiceChk))
			fICharge = 1;

		// UpdateInvoiceDto cfrm= new UpdateInvoiceDto();
		customer1.insertCustomer(cvId, uform, compId, istax, isclient,
				indCharge, aFCharge, fICharge, "U");
		updateInvoice(cvId, request);
	}

	
	
	public void DeleteItem(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		ItemInfo item = new ItemInfo();
		String invId = request.getParameter("InvId");
		item.deleteItem(compId, invId);
	}
	
	public void AddItem(HttpServletRequest request, ItemDto itemFrm) {
		HttpSession sess = request.getSession();
		String sale_service = null;
		String compId = (String) sess.getAttribute("CID");
		ItemInfo item = new ItemInfo();
		String itemType = request.getParameter("ItemType");
		//Loger.log("FILE PHOTO  _______________________          "+itemFrm.getPhotoName().getFileName());
		if (itemType.equals("2")) {
			itemFrm.setItemCode(itemFrm.getItemCodeDis());
			itemFrm.setInvTitle(itemFrm.getInvTitleDis());
			itemFrm.setItemCodeDis("");
			itemFrm.setInvTitleDis("");

		}

		if (itemType.equals("3")) {
			itemFrm.setItemCode(itemFrm.getItemCodeSub());
			itemFrm.setItemName(itemFrm.getItemNameSub());
			itemFrm.setItemCodeSub("");
			itemFrm.setItemNameSub("");
		}

		if (itemType.equals("4")) {
			itemFrm.setItemCode(itemFrm.getItemCodeSer());
			itemFrm.setItemName(itemFrm.getItemNameSer());
			itemFrm.setTectcmd(itemFrm.getTectcmdSer());
			itemFrm.setInvTitle(itemFrm.getInvTitleSer());

			itemFrm.setTaxable(itemFrm.getTaxableSer());

			itemFrm.setItemCodeSer("");
			itemFrm.setItemNameSer("");
			itemFrm.setTectcmdSer(0);
			itemFrm.setInvTitleSer("");
			Loger.log("CAT_______________________________________"+request.getParameter("iscat"));
			itemFrm.setIscategory(request.getParameter("iscat"));
			
		}
		String str="";
		if(itemFrm.getPhotoName().getFileName()==null || itemFrm.getPhotoName().getFileName().equals("")){
			str="";
			
		}
		else{
			Loger.log("FILE______________________________DJDJD__");
			ItemInfo itmInfo = new ItemInfo();
			itmInfo.uploadImage(itemFrm, request);
			str=itemFrm.getPhotoName().getFileName();
			Loger.log("FILE UPLOADED******");
		}
		
		
		try {
			if (itemFrm.getItemType().equals("1")) {
				sale_service = itemFrm.getSalePrice();
			}

			if (itemFrm.getItemType().equals("4")) {
				sale_service = itemFrm.getServiceRate();

			}
					
			item.insertItem(compId, itemFrm.getItemName(), itemFrm
					.getItemCode(), sale_service, itemFrm.getPurchasePrice(),
					itemFrm.getQty(), itemFrm.getWeight(), itemFrm
							.getLocation(), itemFrm.getTaxable(), itemFrm
							.getSerialNum(), itemFrm.getIscategory(), itemFrm
							.getInvTitle(), itemFrm.getBarcode(), itemFrm
							.getItemType(), itemFrm.getTectcmd(), str,itemFrm.getDiscontinued());
			itemFrm.setItemCode("");
			itemFrm.setTectcmd(0);
			itemFrm.setDiscountAmt("");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Loger.log("item added successfully");

	}

	public void AdjustInventory(HttpServletRequest request, ActionForm form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		ArrayList Inventory = new ArrayList();
		Inventory = (ArrayList) sess.getAttribute("ItemDetails");
		int invSize = Inventory.size();

		String[][] oldInventory = new String[invSize][3];

		for (int i = 0; i < invSize; i++) {
			ItemDto ItemDto = (ItemDto) Inventory.get(i);
			String invId = ItemDto.getInventoryId();
			oldInventory[i][0] = invId;
			if (request.getParameter("newQty" + invId) != null) {
				if (request.getParameter("newQty" + invId).trim().length() > 0)
					oldInventory[i][1] = request.getParameter("newQty" + invId);
				else
					oldInventory[i][1] = ItemDto.getQty();
				if (request.getParameter("newValue" + invId).trim().length() > 0) {
					oldInventory[i][2] = request.getParameter("newValue"
							+ invId);
				} else {
					oldInventory[i][2] = ItemDto.getSalePrice();
				}
			}
		}
		ItemInfo item = new ItemInfo();
		item.adjustInventory(compId, oldInventory, invSize);
		ArrayList ItemDetails = new ArrayList();
		ItemDetails = item.getItemList(compId);
		sess.removeAttribute("ItemDetails");
		sess.setAttribute("ItemDetails", ItemDetails);
		Loger.log("list Size:" + ItemDetails.size());

	}
	
	public void updateBillingAddress(InvoiceDto frm, String cId, String billAddressId) 
	{
		InvoiceInfo invoice = new InvoiceInfo();
		invoice.updateBillingAddress(frm, cId,billAddressId);
	}
	
	public void updateShippingAddress(InvoiceDto frm, String cId, String billAddressId) {
		InvoiceInfo invoice = new InvoiceInfo();
		invoice.updateShippingAddress(frm, cId,billAddressId);
	}

	/* Method for getting Invoice information */
	public void getInvoiceInfo(HttpServletRequest request) throws SQLException {
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		ItemInfo item = new ItemInfo();
		ArrayList ClientDetails = new ArrayList();
		ClientDetails = invoice.customerDetails(compId, request);
		request.setAttribute("CDetails", ClientDetails);

		ArrayList shAddr = new ArrayList();
		String companyName = (String) request.getSession().getAttribute("user");
		//System.out.println("CompanyName:"+companyName);
		shAddr = invoice.shipAddress(companyName);
		request.setAttribute("ShAddr", shAddr);

		ArrayList billAddr = new ArrayList();
		billAddr = invoice.billAddress(Integer.parseInt(compId),companyName);
		request.getSession().setAttribute("BillAddr", billAddr);

		/* Invoice Style */
		ArrayList InvoiceStyle = new ArrayList();
		InvoiceStyle = invoice.getInvoiceStyle();
		request.setAttribute("InvoiceStyle", InvoiceStyle);

		/* Via Information */
		ArrayList via = new ArrayList();
		via = invoice.getVia(compId);
		request.setAttribute("Via", via);

		/* Rep Information */
		ArrayList rep = new ArrayList();
		rep = invoice.getRep(compId);
		request.getSession().setAttribute("Rep", rep);

		/* Term Information */
		ArrayList term = new ArrayList();
		term = invoice.getTerm(compId);
		request.setAttribute("Term", term);

		/* Term Information */
		ArrayList payMethod = new ArrayList();
		payMethod = invoice.getPayMethod(compId);
		request.setAttribute("PayMethod", payMethod);

		/* Messages */
		ArrayList message = new ArrayList();
		message = invoice.getMessage(compId);
		request.setAttribute("Message", message);

		/* Tax */
		ArrayList tax = new ArrayList();
		tax = invoice.getTaxes(compId);
		request.setAttribute("Tax", tax);

		/* Item List */
		ArrayList itemList = new ArrayList();
		itemList = invoice.getItemList(compId);
		request.setAttribute("ItemList", itemList);
		

		ArrayList itemDetails = new ArrayList();
		itemDetails = item.getItemList(compId);
		request.setAttribute("ItemDetails", itemList);
	}
	
	public void getSortedInvoiceInfo(HttpServletRequest request, String sort) throws SQLException {
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		ArrayList ClientDetails = new ArrayList();
		if(sort.equals("Name"))
		{
			ClientDetails = invoice.customerDetails(compId, request);
			System.out.println("Calling sortByName method and getting data:"+ClientDetails.toString());
		}
		else
		{
			ClientDetails = invoice.sortedcustomerDetails(compId, request,sort);
			System.out.println("Calling sortByLastName method and getting data:"+ClientDetails.toString());
		}
		request.setAttribute("CDetails", ClientDetails);
		
		ArrayList shAddr = new ArrayList();
		String companyName = (String) request.getSession().getAttribute("user");
		//System.out.println("CompanyName:"+companyName);
		shAddr = invoice.shipAddress(companyName);
		request.setAttribute("ShAddr", shAddr);

		ArrayList billAddr = new ArrayList();
		billAddr = invoice.billAddress(Integer.parseInt(compId),companyName);
		request.getSession().setAttribute("BillAddr", billAddr);

		/* Invoice Style */
		ArrayList InvoiceStyle = new ArrayList();
		InvoiceStyle = invoice.getInvoiceStyle();
		request.setAttribute("InvoiceStyle", InvoiceStyle);

		/* Via Information */
		ArrayList via = new ArrayList();
		via = invoice.getVia(compId);
		request.setAttribute("Via", via);

		/* Rep Information */
		ArrayList rep = new ArrayList();
		rep = invoice.getRep(compId);
		request.getSession().setAttribute("Rep", rep);

		/* Term Information */
		ArrayList term = new ArrayList();
		term = invoice.getTerm(compId);
		request.setAttribute("Term", term);

		/* Term Information */
		ArrayList payMethod = new ArrayList();
		payMethod = invoice.getPayMethod(compId);
		request.setAttribute("PayMethod", payMethod);

		/* Messages */
		ArrayList message = new ArrayList();
		message = invoice.getMessage(compId);
		request.setAttribute("Message", message);

		/* Tax */
		ArrayList tax = new ArrayList();
		tax = invoice.getTaxes(compId);
		request.setAttribute("Tax", tax);

		/* Item List */
		ArrayList itemList = new ArrayList();
		itemList = invoice.getItemList(compId);
		request.setAttribute("ItemList", itemList);
	}

	
	public void getInitialize(String ordNo, HttpServletRequest request, InvoiceDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		long orderNo = Long.parseLong(ordNo);
		InvoiceInfo invoice = new InvoiceInfo();
		invoice.getRecord(request, form, compId, orderNo);
	}

	public void getSalesOrderInitialize(String salesOrderNo, HttpServletRequest request, InvoiceDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		long soNo = Long.parseLong(salesOrderNo); // Sales Order Num SO Num
		InvoiceInfo invoice = new InvoiceInfo();
		invoice.getSalesOrderRecord(request, form, compId, soNo);
	}

	public void getInitializeEstimation(String estNo, HttpServletRequest request, EstimationDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		long estimationNo = Long.parseLong(estNo);
		//EstimationInfo estimation = new EstimationInfo();
 		estimation.getRecord(request, form, compId, estimationNo);
	}

	public void getInitializePurchase(String poNo, HttpServletRequest request, PurchaseOrderDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		long purchaseNo = Long.parseLong(poNo);
		PurchaseOrderInfo purchase = new PurchaseOrderInfo();
		purchase.getRecord(request, form, compId, purchaseNo);
	}

	
	public void updateInvoice(String cvId, HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		Loger.log("The Client vendor is from sales detail is " + cvId);
		
		invoice.SearchCustomer(compId, cvId, request);
		invoice.getServices(request, compId, cvId);
		//request.setAttribute("CustomerDetails",CustomerDetails);
	}


	

	
	
	
	
	public void payHistory(String cvId, HttpServletRequest request) {
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		invoice.paymentHistory(cvId, compId, request);

	}

	public boolean sendEmailInfo(String ordNo, HttpServletRequest request,
			String status) {
		boolean result = false;
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		long invoiceID = 0;
		invoiceID = invoice.getInvoiceID(compId, ordNo, status);

		invoice.emailInfo(request, invoiceID, compId,ordNo);
		return result;
	}

	public void sendEmail(HttpServletRequest request, InvoiceDto invoiceDto) {
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		boolean isSent = invoice.send(compId, invoiceDto);
		String msg = "";
		if (isSent)
			msg = "Mail send Successfully";
		else
			msg = "Error occurred during sending email";
		request.setAttribute("Result", msg);
	}

	public void getLookup(String cvId, HttpServletRequest request, CustomerDto customerDto) {

		// HttpSession sess = request.getSession();
		// String compId = (String) sess.getAttribute("CID");
		String cond = null;
		// int flag = 0;
		InvoiceInfo invoice = new InvoiceInfo();
		ArrayList lookDetails = new ArrayList();

		cond = customerDto.getDispay_info();
		Loger.log("The Show all" + customerDto.getDispay_info());
		Loger.log("The Client Vendor Id is" + cvId);
		/*
		 * if(cond.equalsIgnoreCase("ShowAll")) { flag=1; } else { flag=0; }
		 */
		String periodFrom = customerDto.getPeriodFrom();
		String periodTo = customerDto.getPeriodTo();
		Loger.log("The From Date is________ " + customerDto.getPeriodFrom());
		Loger.log("The To date is*******______________ " + customerDto.getPeriodTo());
		Loger.log("****************cond  "+cond);
		lookDetails = invoice.searchHistory(request, cond, cvId, periodFrom,
				periodTo);
		request.setAttribute("LookupDetails", lookDetails);

	}

	

	public void newEstimation(HttpServletRequest request, EstimationDto estimationDto) throws SQLException {
		//EstimationInfo estimation = new EstimationInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		String estNum = estimation.getNewEstimationNo(compId);
		estimationDto.setPoNum(estNum);
		InvoiceInfo invoice = new InvoiceInfo();
		estimationDto.setOrderNo(estNum);
		DateInfo date = new DateInfo();
		int month = date.getMonth();
		int day = date.getDay();
		
		String da = "",  d= "", m = "";
		if(month >=1 && month <= 9){
			m = "0" + month;
		}
		else
			m = ""+month;
		if(day>=1 && day <= 9){
			d = "0" + day;
		}
		else
			d = ""+day;
		da = m +"-"+ d + "-"+(date.getYear()) ;

		estimationDto.setOrderDate(da);
	
		estimationDto.setCustID("0");
		estimationDto.setInvoiceStyle(invoice.getDefaultInvoiceStyleNo(compId));
		estimationDto.setVia("0");
		estimationDto.setTerm("0");
		estimationDto.setRep("0");
		estimationDto.setPayMethod("0");
		estimationDto.setItemID("0");
		estimationDto.setMessage("0");
		estimationDto.setTaxID("0");
		

		estimationDto.setWeight(0.0);
		estimationDto.setAdjustedtotal(0.0);
		estimationDto.setSubtotal(0.0);
		estimationDto.setShipping(0.0);
		estimationDto.setTotal(0.0);
		estimationDto.setMemo("");

		estimationDto.setCompany("false");
		estimationDto.setTaxable("false");

		estimationDto.setBillTo("");
		estimationDto.setShipTo("");
		estimationDto.setShipDate(da);
		estimationDto.setTax(0.0);
		estimationDto.setItemID("0");
		getInvoiceInfo(request);
		Loger.log("COMPID ==>"+compId);
	}

	public void saveEstimation(HttpServletRequest request, EstimationDto estimationDto) throws SQLException {
		//EstimationInfo invoice = new EstimationInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		if(estimationDto.getOrderNo().contains("-")){
			String orderNo = estimationDto.getOrderNo();
			estimationDto.setOrderNo(orderNo.substring(orderNo.indexOf("-")+1));
		}
		boolean exist = estimation.estimationExist(compId, estimationDto.getOrderNo());
		if (exist == true) {
			boolean saveStatus = estimation.Update(compId, estimationDto);
			request.getSession().setAttribute("SaveStatus", saveStatus?"Estimation is updated successfully.":"Estimation is not updated successfully.");
		} else {
			boolean saveStatus = estimation.Save(compId, estimationDto);
			request.getSession().setAttribute("SaveStatus", saveStatus?"Estimation is saved successfully.":"Estimation is not saved successfully.");
		}
	}

	public EstimationDto getEstimationDetailsByBtnName(HttpServletRequest request, EstimationDto estimationDto) throws SQLException {
		//EstimationInfo estimation = new EstimationInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		Long estNo = estimation.getEstimationNumberByBtnName(compId, request);
		ArrayList<EstimationDto> list = estimation.getRecord(request, estimationDto, compId, estNo);
		if(!list.isEmpty()) {
			estimationDto = list.get(0);
			request.setAttribute("Enable", "true");
			request.setAttribute("Status", "");
		} else {
			request.setAttribute("Status", "There is no Estimation.");
		}
		return estimationDto;
	}

	public boolean deleteEstimation(HttpServletRequest request, EstimationDto estimationDto) throws SQLException {
		boolean val = false;
		//EstimationInfo invoice = new EstimationInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		getInvoiceInfo(request);

		String estNo = estimationDto.getOrderNo();
		boolean exist = estimation.estimationExist(compId, estNo);
		if (exist == true) {
			try {
				estimation.Delete(compId, estNo);
				newEstimation(request, estimationDto);
				request.setAttribute("SaveStatus",
						"Estimation is successfully deleted.");
				val = true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("SaveStatus",
					"This invoice is not yet saved.");
			val = false;
			newEstimation(request, estimationDto);

		}
		return val;

	}

	
	
	
	public void getAccountPayableGraph(HttpServletRequest request,ActionForm form)
	{
		HttpSession sess = request.getSession();
		ArrayList<EsalesPOJO> graphDetail = new ArrayList<>();
		String compId = (String) sess.getAttribute("CID");
		//AccountForm aForm = (AccountForm)form;
		AccountingDAO acd = new AccountingDAO();
		
		graphDetail = acd.getAccountPayableGraph(compId,request);
	}

	public void getBudgetVsActual(HttpServletRequest request, ActionForm form) {
		int year = Calendar.getInstance().get(Calendar.YEAR) + 1;
		System.out.println("Current Year for budget vs actual is:"+year);
		request.setAttribute("Year", year);
	}

	public void getBudgetOverview(HttpServletRequest request, ActionForm form) {
		int year = Calendar.getInstance().get(Calendar.YEAR) + 1;
		System.out.println("Current Year for budget overview is:"+year);
		String month[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
		for(int i=0;i<month.length;i++)
		{
			System.out.println("Budget Year:"+month[i]+year);
		}
		request.setAttribute("Year", year);
	}

	public ArrayList<CustomerDto> getSortedCustomer(HttpServletRequest request, CustomerDto frm, int sortById) 
	{
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		CustomerInfo customer = new CustomerInfo();
		ArrayList<CustomerDto> CustomerDetails = new ArrayList<CustomerDto>();
		if(sortById==1)
		{
			CustomerDetails = customer.customerDetailsSort(compId,"Name");
		}
		else if(sortById==2)
		{
			CustomerDetails = customer.customerDetailsSort(compId,"FirstName");
		}
		else if(sortById == 3)
		{
			CustomerDetails = customer.customerDetailsSort(compId,"LastName");
		}
		request.setAttribute("CustomerDetails", CustomerDetails);
		return CustomerDetails;
	}

	public void setUnitPrice(String companyID, int itemId, double price) 
	{
		CustomerInfo customer = new CustomerInfo();
		customer.setNewUnitPrice(companyID,itemId,price);
	}

	public void setItemName(String companyID, int itemId, String itemName) {
		CustomerInfo customer = new CustomerInfo();
		customer.setNewitemName(companyID,itemId,itemName);
	}

	public void setUnitPriceEstimation(String companyID, int itemId, double price) {
		CustomerInfo customer = new CustomerInfo();
		customer.setUnitPriceEstimation(companyID,itemId,price);
	}
	
	public void setItemNameEstimation(String companyID, int itemId, String itemName) {
		CustomerInfo customer = new CustomerInfo();
		customer.setNewitemNameEstimation(companyID,itemId,itemName);
	}
	
	public void getSortedEstimationInfo(HttpServletRequest request, String sort) throws SQLException {
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfo invoice = new InvoiceInfo();
		ItemInfo item =new ItemInfo();
		ArrayList ClientDetails = new ArrayList();
		if(sort.equals("Name"))
		{
			ClientDetails = invoice.customerDetails(compId, request);
			System.out.println("Calling sortByName method and getting data:"+ClientDetails.toString());
		}
		else
		{
			ClientDetails = invoice.sortedcustomerDetails(compId, request,sort);
			System.out.println("Calling sortByLastName method and getting data:"+ClientDetails.toString());
		}
		request.setAttribute("CDetails", ClientDetails);
		
		ArrayList shAddr = new ArrayList();
		String companyName = (String) request.getSession().getAttribute("user");
		//System.out.println("CompanyName:"+companyName);
		shAddr = invoice.shipAddress(companyName);
		request.setAttribute("ShAddr", shAddr);

		ArrayList billAddr = new ArrayList();
		billAddr = invoice.billAddress(Integer.parseInt(compId),companyName);
		request.getSession().setAttribute("BillAddr", billAddr);

		/* Invoice Style */
		ArrayList InvoiceStyle = new ArrayList();
		InvoiceStyle = invoice.getInvoiceStyle();
		request.setAttribute("InvoiceStyle", InvoiceStyle);

		/* Via Information */
		ArrayList via = new ArrayList();
		via = invoice.getVia(compId);
		request.setAttribute("Via", via);

		/* Rep Information */
		ArrayList rep = new ArrayList();
		rep = invoice.getRep(compId);
		request.getSession().setAttribute("Rep", rep);

		/* Term Information */
		ArrayList term = new ArrayList();
		term = invoice.getTerm(compId);
		request.setAttribute("Term", term);

		/* Term Information */
		ArrayList payMethod = new ArrayList();
		payMethod = invoice.getPayMethod(compId);
		request.setAttribute("PayMethod", payMethod);

		/* Messages */
		ArrayList message = new ArrayList();
		message = invoice.getMessage(compId);
		request.setAttribute("Message", message);

		/* Tax */
		ArrayList tax = new ArrayList();
		tax = invoice.getTaxes(compId);
		request.setAttribute("Tax", tax);

		/* Item List */
		ArrayList itemList = new ArrayList();
		itemList = invoice.getItemList(compId);
		request.setAttribute("ItemList", itemList);
		
	}
}
