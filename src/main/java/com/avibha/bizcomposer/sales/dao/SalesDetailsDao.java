/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.sales.dao;

import com.avibha.bizcomposer.File.actions.DataImportExportUtils;
import com.avibha.bizcomposer.accounting.dao.AccountingDAO;
import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.employee.dao.Title;
import com.avibha.bizcomposer.purchase.dao.*;
import com.avibha.bizcomposer.purchase.forms.PurchaseOrderDto;
import com.avibha.bizcomposer.sales.forms.*;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.mail.MailSend;
import com.avibha.common.utility.CountryState;
import com.avibha.common.utility.DateInfo;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.EmailSenderDto;
import com.nxsol.bizcomposer.reportcenter.eSales.EsalesPOJO;
import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaBillingstatements;
import com.nxsol.bzcomposer.company.domain.BcaCities;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.BcaOpportunity;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;
import com.nxsol.bzcomposer.company.domain.BcaStates;
import com.nxsol.bzcomposer.company.domain.SmdCvinfo;
import com.nxsol.bzcomposer.company.repos.BcaBillingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaShippingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaCitiesRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCountriesRepository;
import com.nxsol.bzcomposer.company.repos.BcaCvtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoiceRepository;
import com.nxsol.bzcomposer.company.repos.BcaOpportunityRepository;
import com.nxsol.bzcomposer.company.repos.BcaStatesRepository;
import com.nxsol.bzcomposer.company.repos.SmdCvinfoRepository;
import com.nxsol.bzcomposer.company.utils.DateHelper;
import com.pritesh.bizcomposer.accounting.bean.TblBSAddress2;
import com.avibha.bizcomposer.opportunity.form.OpportunityDto;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.util.LabelValueBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import com.avibha.bizcomposer.opportunity.form.OpportunityDto;

import java.time.format.DateTimeFormatter;

@Service
public class SalesDetailsDao {

	@Autowired
	private SalesInfo sales;

	@Autowired
	private CustomerInfoDao customerInfoDao;

	@Autowired
	private InvoiceInfoDao invoiceInfoDao;

	@Autowired
	private CountryState countryState;
	@Autowired
	private BcaClientvendorRepository bcaClientvendorRepository;

	@Autowired
	private ItemInfoDao itemInfoDao;

	@Autowired
	private EstimationInfoDao estimationInfoDao;

	@Autowired
	private EstimationInfo estimationInfo;

	@Autowired
	private InvoiceInfo invoiceInfo;

	@Autowired
	private PurchaseInfo purchaseInfo;

	

	@Autowired
	private SmdCvinfoRepository smdCvinfoRepository;
	@Autowired
	private BcaCountriesRepository countriesRepository;

	@Autowired
	private BcaStatesRepository stateRepository;
	@Autowired
	private BcaCitiesRepository cityRepository;
	
	@Autowired
	private BcaOpportunityRepository bcaOpportunityRepository;

	@Autowired
	private Title t;

	@Autowired
	private Term tr;

	@Autowired
	private Rep rap;

	@Autowired
	private PayMethod pmethod;

	@Autowired
	private Shipping ship;

	@Autowired
	private CreditCard cc;

	@Autowired
	private VendorCategory cv;

	@Autowired
	InvoiceInfoDao invoice;

	@Autowired
	private BcaInvoiceRepository bcaInvoiceRepository;
	@Autowired
	private PurchaseOrderInfoDao purchaseOrderInfoDao;
	@Autowired
	private BcaCompanyRepository bcaCompanyRepository;

	@Autowired
	private BcaShippingaddressRepository bcaShippingaddressRepository;

	@Autowired
	private BcaBillingaddressRepository bcaBillingaddressRepository;
	
	@Autowired
	private BcaCvtypeRepository bcaCvtypeRepository;
	
	public void getdataManager(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		Long compId = Long.valueOf(sess.getAttribute("CID").toString());
		// SalesInfo sales = new SalesInfo();
		request.setAttribute("customerTitle", sales.getCustomerTitle(compId)); // to get customer title
		request.setAttribute("SalesRep", sales.getSalesRep(compId)); // to get sales rep
		request.setAttribute("salesTerms", sales.getTerms(compId)); // to get customer title
		request.setAttribute("SalesCatType", sales.getCatType(compId)); // to get customer title
		request.setAttribute("SalesLocation", sales.getLocation(compId)); // to get customer title
		request.setAttribute("SalesPaymentMethod", sales.getPaymentType(compId)); // to get getPaymentType
		request.setAttribute("SalesReceivedType", sales.getReceivedType(compId)); // to get customer title
		request.setAttribute("SalesMessage", sales.getMessage(compId)); // to get customer title
		request.setAttribute("CreditCardType", sales.getCreditCard(compId)); // to get customer title
		request.setAttribute("SalesTax", sales.getTax(compId)); // to get customer title
		request.setAttribute("Via", sales.getVia(compId));
		request.setAttribute("LeadSource", sales.getLeadSource(compId));// LEAD SOURCE
		request.setAttribute("LeadCategory", sales.getLeadCategory(compId));// LEAD CATEGORY
	}

	public void AddCustomer(HttpServletRequest request, CustomerDto customerDto) {
		String compId = (String) request.getSession().getAttribute("CID");
//		CustomerInfoDao customer = new CustomerInfoDao();

		customerDto.setTaxAble("on".equalsIgnoreCase(request.getParameter("isTaxable")) ? "1" : "0");
		customerDto.setIsclient("on".equalsIgnoreCase(request.getParameter("isAlsoClient")) ? "1" : "2"); // 1:
																											// Customer+Vendor,
																											// 2:
																											// Customer,
																											// 3: Vendor
		customerDto.setCvTypeID("on".equalsIgnoreCase(request.getParameter("isAlsoClient")) ? 1 : 2); // 1:
																										// Customer+Vendor,
																										// 2: Customer,
																										// 3: Vendor
		String contact = request.getParameter("contact");
		if (contact.equalsIgnoreCase("contact")) {
			Integer typeIDList = bcaCvtypeRepository.findByName("Contact");
			if (typeIDList > 0)
				customerDto.setCvTypeID(typeIDList);
		}
		customerDto.setFsUseIndividual(
				"on".equalsIgnoreCase(request.getParameter("UseIndividualFinanceCharges")) ? "1" : "0");
		customerDto
				.setFsAssessFinanceCharge("on".equalsIgnoreCase(request.getParameter("AssessFinanceChk")) ? "1" : "0");
		customerDto
				.setFsMarkFinanceCharge("on".equalsIgnoreCase(request.getParameter("FChargeInvoiceChk")) ? "1" : "0");
//		customerDto.setAnnualIntrestRate(request.getParameter("annualIntrestRate"));
//		customerDto.setMinFCharges(request.getParameter("minFCharges"));
//		customerDto.setGracePrd(request.getParameter("gracePrd"));
		try {
			boolean addCust = customerInfoDao.insertNewCustomer(customerDto, compId);
			if (addCust && contact.equalsIgnoreCase("contact")) {
				request.setAttribute("SaveStatus", new ActionMessage("Contact Information is Successfully Added!"));
				request.getSession().setAttribute("actionMsg", "Contact Information is Successfully Added!");
			} else if (addCust) {
 				request.setAttribute("SaveStatus", new ActionMessage("Customer Information is Successfully Added!"));
 				request.getSession().setAttribute("actionMsg", "Customer Information is Successfully Added!");
 			}
		} catch (Exception e) {
			request.setAttribute("SaveStatus", new ActionMessage("Customer Information is Not Insert !."));
			request.getSession().setAttribute("actionMsg", "Customer Information is Not Insert!");
			Loger.log(e.toString());
		}
	}
	
	public void removeSessionAddressUpdateData(HttpServletRequest request)
	{	
		 request.getSession().removeAttribute("BillingAddress");
		 request.getSession().removeAttribute("ShippingAddress");
		 request.getSession().removeAttribute("lastLineoFSAddress");  
		 request.getSession().removeAttribute("lastLineoFBAddress");
	}
	public void getAllOpportunityList(HttpServletRequest request)
	{
	HttpSession sess = request.getSession();
	Long compId = Long.valueOf(sess.getAttribute("CID").toString());
	 System.out.println("bca compny resp DAO ........"+bcaCompanyRepository);
	  BcaCompany company = bcaCompanyRepository.findById(Long.parseLong(""+compId)).orElse(null);
	  System.out.println("bca opp resp DAO ........"+bcaOpportunityRepository);
	List<BcaOpportunity> opportunityList=bcaOpportunityRepository.findByCompanyAndActive(company,true);
	
	
		List<OpportunityDto> ObjList=new  ArrayList<>();
		for(BcaOpportunity bcaOpportunity:opportunityList)
		{
		 OpportunityDto op=new OpportunityDto();
		 op.setOpportunityID(""+bcaOpportunity.getOpportunityId());
		 op.setOpportunityName(bcaOpportunity.getName());
		 op.setStage(bcaOpportunity.getStage());
		 DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		if(bcaOpportunity.getCloseDate()!=null)
		 op.setClosedDate(outputFormat.format(bcaOpportunity.getCloseDate()));
		 op.setStartDate(outputFormat.format(bcaOpportunity.getStartDate()));
		 op.setAmount(bcaOpportunity.getAmount());
		 if(bcaOpportunity.getOpportunityOwner().equals("0")==false&&bcaOpportunity.getOpportunityOwner()!=null)
		 {
			 
			 //System.out.println("opportunityOwer............."+bcaOpportunity.getOpportunityOwner());
		 op.setOpportunityOwner(bcaOpportunity.getOpportunityOwner());
		 }
		 if(bcaOpportunity.getSourceID()!=null)
		 op.setSourceID(bcaOpportunity.getSourceID().getName());
		 op.setActive(bcaOpportunity.getActive());	
		 
		 ObjList.add(op);
		}
		request.setAttribute("opportunityList", ObjList);	
	 //request.setAttribute("opportunityList", opportunityList);
		
		
		
		
		
	}
	

	public void getAllList(HttpServletRequest request) {
//		CountryState cs = new CountryState();
		HttpSession sess = request.getSession();
		String cid = (String) sess.getAttribute("CID");
		String countryID = "";
		String stateID = "";
		String cityID = "";

		if (request.getAttribute("selectedCountryId") != null
				&& !request.getAttribute("selectedCountryId").toString().isEmpty())
			countryID = request.getAttribute("selectedCountryId").toString();
		else
			countryID = ConstValue.countryID;

		if (request.getAttribute("selectedStateId") != null
				&& !request.getAttribute("selectedStateId").toString().isEmpty())
			stateID = request.getAttribute("selectedStateId").toString();
		else
			stateID = ConstValue.stateID;

		if (request.getAttribute("selectedCityId") != null
				&& !request.getAttribute("selectedCityId").toString().isEmpty())
			cityID = request.getAttribute("selectedCityId").toString();
		else
			cityID = ConstValue.cityID;

		String action = ConstValue.hateNull(request.getParameter("tabid"));
		if (action.equalsIgnoreCase("editCustomer") || action.equalsIgnoreCase("editContact")) {
			CustomerDto customer = (CustomerDto) request.getAttribute("CustomerDetails");
			if (customer != null) {
				// countryID = customer.getCountry();
				// stateID = customer.getState();
				if (customer.getBscountry() != null)
					request.setAttribute("stateList2", countryState.getStateList(customer.getBscountry()));

				if (customer.getBsstate() != null)
					request.setAttribute("cityList2", countryState.getCityList(customer.getBsstate()));

				if (customer.getShcountry() != null)
					request.setAttribute("stateList3", countryState.getStateList(customer.getShcountry()));

				if (customer.getShstate() != null)
					request.setAttribute("cityList3", countryState.getCityList(customer.getShstate()));
			}
		}
		// country List
		request.setAttribute("cList", countryState.getCountry());
		request.setAttribute("countryList", countryState.getCountryList());
		request.setAttribute("stateList", countryState.getStateList(countryID));
		request.setAttribute("cityList", countryState.getCityList(stateID));

		// Title List
//		Title t = new Title();
		request.setAttribute("titleList", t.getTitleList(cid));

		// Term List
//		Term tr = new Term();
		request.setAttribute("TermList", tr.getTermList(cid));

		// Rep List
//		Rep rap = new Rep();
		request.setAttribute("RepList", rap.getRepList(cid));

		// PayMethod List
//		PayMethod pmethod = new PayMethod();
		request.setAttribute("PaymentList", pmethod.getPaymentTypeList(cid));

		// ShipCarrier List
//		Shipping ship = new Shipping();
		request.setAttribute("ShipCarrierList", ship.getShipCarrierList(cid));

		// CreditCard List
//		CreditCard cc = new CreditCard();
		request.setAttribute("CreditCardList", cc.getCCTypeList(cid));

		// VendorCategoryList List
//		VendorCategory cv = new VendorCategory();
		request.setAttribute("VendorCategoryList", cv.getCVCategoryList(cid));

		// customerGroupList List
		request.setAttribute("customerGroupList", cv.getCustomerGroupList());

		/* Item List */
		String compId = (String) request.getSession().getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		ArrayList itemList = new ArrayList();
		itemList = invoiceInfoDao.getItemList(compId);
		request.setAttribute("ItemList", itemList);

//		CustomerInfoDao customer = new CustomerInfoDao();
		customerInfoDao.getServices(request, cid);
	}

	public void addSupplierDetails(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String cid = (String) sess.getAttribute("CID");
		// Title List
//		Title t = new Title();
		request.setAttribute("titleList", t.getTitleList(cid));

		// country List
//		CountryState cs = new CountryState();
		request.setAttribute("cList", countryState.getCountry());

		// state List
//		CountryState cs1 = new CountryState();
		request.setAttribute("sList", countryState.getStates(cid));

		// Term List
//		Term tr = new Term();
		request.setAttribute("TermList", tr.getTermList(cid));

		// Rep List
//		Rep rap = new Rep();
		request.setAttribute("RepList", rap.getRepList(cid));

		// PayMethod List
//		PayMethod pmethod = new PayMethod();
		request.setAttribute("PaymentList", pmethod.getPaymentTypeList(cid));

		// ShipCarrier List
//		Shipping ship = new Shipping();
		request.setAttribute("ShipCarrierList", ship.getShipCarrierList(cid));

		// CreditCard List
//		CreditCard cc = new CreditCard();
		request.setAttribute("CreditCardList", cc.getCCTypeList(cid));

		// CreditTerm List
		request.setAttribute("CreditTermList", cc.getCreditTermList(cid));

//		ItemInfoDao item = new ItemInfoDao();
		ArrayList accountList = new ArrayList();
		accountList = itemInfoDao.fillAccountList(cid);
		sess.setAttribute("AccountList", accountList);

	}

	public ArrayList addServices(String companyID) {
		ArrayList<LabelValueBean> arr = new ArrayList<LabelValueBean>();
		// boolean ret = false;
		Connection con = null;
		PreparedStatement pstmt = null;
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
				arr.add(new LabelValueBean(rs.getString("ServiceName"), rs.getString("ServiceID")));
			}
			pstmt.close();
			rs.close();
		} catch (SQLException ee) {
			Loger.log(2, "Error in  Class SalesDetail and  method -addServices " + " " + ee.toString());
		} finally {
			db.close(con);

		}

		return arr;
	}

	public void DataManager_SaveDefaultValues(ConfigurationDto configDto) {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			if (configDto.getCustTitleID() > 0) {
				stmt.addBatch("UPDATE bca_title SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch("UPDATE bca_title SET IsDefault=1 WHERE TitleID=" + configDto.getCustTitleID());
			}
			if (configDto.getShippingViaID() > 0) {
				stmt.addBatch("UPDATE bca_shipcarrier SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch(
						"UPDATE bca_shipcarrier SET IsDefault=1 WHERE ShipCarrierID=" + configDto.getShippingViaID());
			}
			if (configDto.getSalesRepId() > 0) {
				stmt.addBatch("UPDATE bca_salesrep SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch("UPDATE bca_salesrep SET IsDefault=1 WHERE SalesRepID=" + configDto.getSalesRepId());
			}
			if (configDto.getSelectedTermId() > 0) {
				stmt.addBatch("UPDATE bca_term SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch("UPDATE bca_term SET IsDefault=1 WHERE TermID=" + configDto.getSelectedTermId());
			}
			if (configDto.getBusinessTypeId() > 0) {
				stmt.addBatch("UPDATE bca_clientcategory SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch("UPDATE bca_clientcategory SET IsDefault=1 WHERE CVCategoryID="
						+ configDto.getBusinessTypeId());
			}
			if (configDto.getPaymentTypeId() > 0) {
				stmt.addBatch("UPDATE bca_paymenttype SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch(
						"UPDATE bca_paymenttype SET IsDefault=1 WHERE PaymentTypeID=" + configDto.getPaymentTypeId());
			}
			if (configDto.getReceivedTypeId() > 0) {
				stmt.addBatch("UPDATE bca_receicedtype SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch(
						"UPDATE bca_receicedtype SET IsDefault=1 WHERE PaymentTypeID=" + configDto.getReceivedTypeId());
			}
			if (configDto.getCreditCardTypeId() > 0) {
				stmt.addBatch("UPDATE bca_cctype SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch("UPDATE bca_cctype SET IsDefault=1 WHERE CCTypeID=" + configDto.getCreditCardTypeId());
			}
			if (configDto.getMessageId() > 0) {
				stmt.addBatch("UPDATE bca_message SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch("UPDATE bca_message SET IsDefault=1 WHERE MessageID=" + configDto.getMessageId());
			}
			if (configDto.getLocationID() > 0) {
				stmt.addBatch("UPDATE bca_location SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch("UPDATE bca_location SET IsDefault=1 WHERE LocationID=" + configDto.getLocationID());
			}
			if (configDto.getLeadSourceID() > 0) {
				stmt.addBatch("UPDATE bca_lead_source SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch(
						"UPDATE bca_lead_source SET IsDefault=1 WHERE LeadSourceID=" + configDto.getLeadSourceID());
			}
			if (configDto.getLeadCatID() > 0) {
				stmt.addBatch("UPDATE bca_lead_category SET IsDefault=0 WHERE IsDefault=1");
				stmt.addBatch(
						"UPDATE bca_lead_category SET IsDefault=1 WHERE LeadCategoryID=" + configDto.getLeadCatID());
			}
			stmt.executeBatch();
		} catch (SQLException ee) {
			Loger.log(2, "Error in  Class DataManager_SaveDefaultValues: " + ee.toString());

		} finally {
			if (stmt != null) {
				db.close(stmt);
			}
			if (con != null) {
				db.close(con);
			}
		}
	}

	public void getdataManagerSave(HttpServletRequest request) {
		HttpSession sess = request.getSession();
//		String compId = (String) sess.getAttribute("CID");
		Long compId = Long.valueOf(sess.getAttribute("CID").toString());
//		SalesInfo sales = new SalesInfo();
		String sTitleval = request.getParameter("sTitleval");
		String sOldval = request.getParameter("sOldval");
		String sNewval = request.getParameter("sNewval");
		String sNewvalID = request.getParameter("sNewvalID");
		String taxRateVal = "";
		if (request.getParameter("taxRateVal") != null) {
			taxRateVal = request.getParameter("taxRateVal");
		}
		if (sNewvalID != null && !sNewvalID.trim().isEmpty()) {
			getdataManagerUpdate(request);
		} else {
			sales.insertSalesData(sNewvalID, sTitleval, sOldval, sNewval, taxRateVal, compId);
		}
	}

	public void getdataManagerUpdate(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		// SalesInfo sales = new SalesInfo();
		String sTitleval = request.getParameter("sTitleval");
		String sOldval = request.getParameter("sOldval");
		String sNewval = request.getParameter("sNewval");
		String sNewvalID = request.getParameter("sNewvalID");
		String taxRateVal = "";
		if (request.getParameter("taxRateVal") != null) {
			taxRateVal = request.getParameter("taxRateVal");
		}
		sales.updateSalesData(sNewvalID, sTitleval, sOldval, sNewval, taxRateVal, compId);
	}

	public void uploadItemFile(HttpServletRequest request, MultipartFile attachFile) {
		DataImportExportUtils importExportUtils = new DataImportExportUtils();
		boolean b = importExportUtils.uploadItemFile(attachFile, request);
		if (b == true) {
			request.getSession().setAttribute("ItemUploaded", "successfully");
		}
	}

	public void exportFile(HttpServletRequest request, ItemDto itemDto, String type, HttpServletResponse response) {
		String compId = (String) request.getSession().getAttribute("CID");
		ItemInfoDao itemInfoDao = new ItemInfoDao();
		if (type != null && (type.equals("xls") || type.equals("csv"))) {
			DataImportExportUtils importExportUtils = new DataImportExportUtils();
			ArrayList<ItemDto> itemList = itemInfoDao.SearchItem(compId, null, itemDto, request);
			Collections.sort(itemList, Comparator.comparing(ItemDto::getParentID));
			for (ItemDto item1 : itemList) {
				for (ItemDto item2 : itemList) {
					if (item1.getParentID().equals(item2.getInventoryId())) {
						item1.setCategoryName(item2.getItemCode());
						break;
					}
				}
			}
			boolean b = importExportUtils.exportItemList(itemList, type, response);
			if (b == true) {
				if (type.equals("xls")) {
					request.setAttribute("success", "BzComposer.exportitem.itemlistinxlsdownloaded");
				} else {
					request.setAttribute("success", "BzComposer.exportitem.itemlistincsvdownloaded");
				}
			}
		}
	}

	public void getdataManagerDelete(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		// SalesInfo sales = new SalesInfo();
		String sTitleval = request.getParameter("sTitleval");
		String sNewvalID = request.getParameter("sNewvalID");
		Loger.log("IDSS" + sNewvalID);
		sales.DeleteSalesData(sNewvalID, sTitleval, compId);

	}

	public boolean makeCustomerCardDefault(String cvId, String cardID) {
//		CustomerInfoDao customer = new CustomerInfoDao();
		boolean status = customerInfoDao.makeCustomerCardDefault(cvId, cardID);
		return status;
	}

	public String getCustomerList(HttpServletRequest request) {
		String compId = (String) request.getSession().getAttribute("CID");
		String action = ConstValue.hateNull(request.getParameter("tabid"));
//		CustomerInfoDao customer = new CustomerInfoDao();
//		InvoiceInfo invoiceInfo = new InvoiceInfo();
		ArrayList<CustomerDto> customerList;
		if (action.equalsIgnoreCase("ContactBoard")) {
			customerList = customerInfoDao.contactDetails(compId);
		} else if (action.equalsIgnoreCase("billingCompaniesBoard")) {
			customerList = customerInfoDao.customerDetailsBilling(compId);
		} else {
			customerList = customerInfoDao.customerDetails(compId);
		}
		if (action.equalsIgnoreCase("Customer") || action.equalsIgnoreCase("ContactBoard")) {

			@SuppressWarnings("unchecked")
			List<TrHistoryLookUp> hlookupList = invoiceInfo.searchHistory(request, "ShowAll", "", null, null);
			for (CustomerDto cust : customerList) {
				double balance = 0.0;
				long invoiceID = 0;
				for (TrHistoryLookUp hlookup : hlookupList) {
					if (cust.getClientVendorID().equals(hlookup.getClientVendorID())) {
						balance = balance + Double.parseDouble(hlookup.getBalance());
						if (invoiceID == 0 || invoiceID < Integer.parseInt(hlookup.getInvoiceId())) {
							cust.setLastOrderDate(hlookup.getDateAdded());
						}
						invoiceID = Integer.parseInt(hlookup.getInvoiceId());
					}
				}
				// Convert the double value to BigDecimal and round it
				// BigDecimal roundedBalance = new BigDecimal(balance).setScale(2,
				// RoundingMode.HALF_UP);
				BigDecimal roundedBalance = formatToTwoDecimalPlaces(balance);
				// If you need it back as a double
				double roundedBalanceValue = roundedBalance.doubleValue();

				cust.setTotalOverdueAmt(roundedBalanceValue);
			}
		}
		request.setAttribute("CustomerDetails", customerList);
		request.setAttribute("customerList", customerList);
		String firstCvID = null;
		if (!customerList.isEmpty()) {
			firstCvID = customerList.get(0).getClientVendorID();
		}
		return firstCvID;
	}

	public static BigDecimal formatToTwoDecimalPlaces(double value) {
		return new BigDecimal(String.valueOf(value)).setScale(2, RoundingMode.HALF_UP);
	}

	public ArrayList<CustomerDto> getCustomerSortByFirstName(HttpServletRequest request, CustomerDto frm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		CustomerInfoDao customer = new CustomerInfoDao();
		ArrayList<CustomerDto> CustomerDetails = customerInfoDao.customerDetailsSortByFirstName(compId);
		request.setAttribute("CustomerDetails", CustomerDetails);
		return CustomerDetails;
	}

	public ArrayList<CustomerDto> getCustomerSortByLastName(HttpServletRequest request, CustomerDto frm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		CustomerInfoDao customer = new CustomerInfoDao();
		ArrayList<CustomerDto> CustomerDetails = customerInfoDao.customerDetailsSortByLastName(compId);
		request.setAttribute("CustomerDetails", CustomerDetails);
		return CustomerDetails;
	}

	public void getLabel(HttpServletRequest request, CustomerDto cform) {
//		CustomerInfoDao customer = new CustomerInfoDao();
		int labelId = Integer.parseInt(request.getParameter("lblId"));
		customerInfoDao.getLabel(labelId, cform);
	}

	public void getLabelType(HttpServletRequest request) {
//		CustomerInfoDao customer = new CustomerInfoDao();
		ArrayList labelType = new ArrayList();
		labelType = customerInfoDao.labelTypeDetails();
		request.setAttribute("LabelTypeList", labelType);
	}

	public void addNewLabel(CustomerDto cform) {
		cform.setLabelName("");
		cform.setTopMargin("0.0");
		cform.setLeftMargin("0.0");
		cform.setHorizon("0.0");
		cform.setVertical("0.0");
		cform.setLabelHeight("0.0");
		cform.setLabelWidth("0.0");
	}

	public boolean saveLabel(HttpServletRequest request, CustomerDto cfrm) {
		boolean result = false;
//		CustomerInfoDao customer = new CustomerInfoDao();
		int labelID = Integer.parseInt(request.getParameter("LabelID"));
		if (labelID == 0) {
			customerInfoDao.saveLabel(cfrm);
			result = true;
		} else {
			customerInfoDao.updateLabel(labelID, cfrm);
			result = false;
		}
		return result;
	}

	public void deleteLabel(HttpServletRequest request, CustomerDto cfrm) {
//		CustomerInfoDao customer = new CustomerInfoDao();
		int labelID = Integer.parseInt(request.getParameter("LabelID"));
		Loger.log("LABEL   " + labelID);
		customerInfoDao.deleteLabel(labelID, cfrm);
	}

	public void searchCustomer(String cvId, HttpServletRequest request, CustomerDto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		sess.setAttribute("CustID", cvId);
//		CustomerInfoDao customer = new CustomerInfoDao();
		ArrayList CustomerDetails = customerInfoDao.SearchCustomer(compId, cvId, form);
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		invoiceInfoDao.getServices(request, compId, cvId);
		request.setAttribute("CustomerDetails", CustomerDetails);
	}

	// search selected customer base on cvid
	public void searchSelectedCustomer(String cvId, HttpServletRequest request, CustomerDto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		// Loger.log("The Client vendor is from sales detail is " + cvId);
		invoiceInfoDao.searchSelectedCustomer(compId, cvId, request);
		invoiceInfoDao.getServices(request, compId, cvId);
		// request.setAttribute("CustomerDetails", CustomerDetails);
	}

	public void UpdateCustomer(HttpServletRequest request, CustomerDto cfrm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		CustomerInfoDao customer = new CustomerInfoDao();
		String cvId = (String) sess.getAttribute("editedCVID");
		customerInfoDao.UpdateCustomer(compId, cvId);

		String istaxable = request.getParameter("isTaxable");
		String isAlsoClient = request.getParameter("isAlsoClient");
		String UseIndividualFinanceCharges = request.getParameter("UseIndividualFinanceCharges");
		String AssessFinanceChk = request.getParameter("AssessFinanceChk");

		int istax = 0;
		int isclient = 2; // 1: Customer+Vendor, 2: Customer, 3: Vendor
		int indCharge = 0;
		int aFCharge = 0;
		if ("on".equalsIgnoreCase(istaxable))
			istax = 1;

		if ("on".equalsIgnoreCase(isAlsoClient))
			isclient = 1;

		if ("on".equalsIgnoreCase(UseIndividualFinanceCharges))
			indCharge = 1;

		if ("on".equalsIgnoreCase(AssessFinanceChk))
			aFCharge = 1;

		cfrm.setAnnualIntrestRate(request.getParameter("AnualRate"));
		cfrm.setMinFCharges(request.getParameter("MinFinance"));
		cfrm.setGracePrd(request.getParameter("GracePeriod"));
		boolean updateCust = customerInfoDao.updateInsertCustomer(cvId, cfrm, compId, istax, isclient, indCharge,
				aFCharge, "U");
		if (updateCust) {
			request.setAttribute("SaveStatus", "Customer updated successfully!");
			sess.setAttribute("actionMsg", "Customer information updated successfully!");
		} else {
			sess.setAttribute("actionMsg", "Customer information not updated successfully!");
		}
		if (cfrm.getDispay_info() != null && cfrm.getDispay_info().equals("ShowAll")) {
			request.setAttribute("RadioVal", "1");
		} else {
			request.setAttribute("RadioVal", "2");
		}
		if (request.getParameter("Flag").equals("1")) {
			request.setAttribute("ClientID", cvId);
			/*
			 * request.setAttribute("FromDate",cfrm.getPeriodFrom());
			 * request.setAttribute("ToDate",cfrm.getPeriodTo());
			 */
		}
	}

	public void UpdateCustInfo(HttpServletRequest request, CustomerDto uform) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		CustomerInfoDao customer = new CustomerInfoDao();
//		InvoiceInfoDao customer1 = new InvoiceInfoDao();
		// String cvId=(String)sess.getAttribute("CustID");
		String cvId = uform.getCustId();
		customerInfoDao.UpdateCustomer(compId, cvId);

		String istaxable = uform.getTaxAble();
		Loger.log("The value of taxable is " + uform.getTaxAble());
		String isAlsoClient = uform.getIsclient();
		Loger.log("The Value of isAlsoClient is " + uform.getIsclient());
		String UseIndividualFinanceCharges = request.getParameter("UseIndividualFinanceCharges");

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
		Loger.log("MARK FINANCE_________________________________" + FChargeInvoiceChk);
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
		} else if (("off").equalsIgnoreCase(AssessFinanceChk)) {
			aFCharge = 1;
		}
		if (FChargeInvoiceChk == null) {
			fICharge = 0;
		} else if (("off").equalsIgnoreCase(FChargeInvoiceChk)) {
			fICharge = 1;
		}
		// UpdateInvoiceForm cfrm= new UpdateInvoiceForm();
		invoiceInfoDao.insertCustomer(cvId, uform, compId, istax, isclient, indCharge, aFCharge, fICharge, "U");
		getCustomerDetails(cvId, request, uform);
	}

	public ArrayList<ItemDto> sortItemsList(HttpServletRequest request, ItemDto form, int sortById) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList ItemDetails = new ArrayList();
		if (sortById == 1) {
			ItemDetails = itemInfoDao.sortItemList(compId, "inventoryName");
		} else if (sortById == 2) {
			ItemDetails = itemInfoDao.sortItemList(compId, "InventoryCode");
		}
		sess.setAttribute("ItemDetails", ItemDetails);
		Loger.log("list Size:" + ItemDetails.size());
		return ItemDetails;
	}

	public void getItemDetails(HttpServletRequest request) {
		String compId = (String) request.getSession().getAttribute("CID");
		String inventoryID = request.getParameter("InvId");
//		ItemInfoDao item = new ItemInfoDao();
		request.setAttribute("ItemDetails", itemInfoDao.getItemDetails(compId, inventoryID));
	}

	public void getItemNameList(HttpServletRequest request, ItemDto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList ItemNameList = itemInfoDao.getItemNameList(compId);
		sess.setAttribute("ItemNameList", ItemNameList);
		Loger.log("ItemsList Size:" + ItemNameList.size());
	}

	public ArrayList ItemsList(HttpServletRequest request, ItemDto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		List<Item> itemCategory = itemInfoDao.getItemCategory(compId);
		String category = request.getParameter("category");
		String categorySession = (String) sess.getAttribute("category");
		if (category != null && !category.isEmpty() && category.equalsIgnoreCase("ALL")) {
			sess.setAttribute("category", category);
			category = "";
		} else if (category != null && !category.isEmpty()) {
			sess.setAttribute("category", category);
		} else if (categorySession != null && !categorySession.isEmpty()) {
			category = categorySession;
		}

		ArrayList<ItemDto> itemList = itemInfoDao.getItemList(compId, category);
		sess.setAttribute("ItemDetails", itemList);
		sess.setAttribute("ItemCategory", itemCategory);
		Loger.log("ItemsList Size:" + itemList.size());
		return itemList;
	}

	public void ItemsDicontinuedList(HttpServletRequest request, ItemDto itemForm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList ItemDetails = new ArrayList();
		String datesCombo = itemForm.getDatesCombo();
		String fromDate = itemForm.getFromDate();
		String toDate = itemForm.getToDate();
		String sortBy = itemForm.getSortBy();
		ItemDetails = itemInfoDao.getDicontinuedItemList(datesCombo, fromDate, toDate, sortBy, compId, request,
				itemForm);
		sess.setAttribute("ItemDetails", ItemDetails);
		Loger.log("list Size:" + ItemDetails.size());
	}

	public void ItemsReportList(HttpServletRequest request, ItemDto itemForm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList ItemDetails = new ArrayList();
		String datesCombo = itemForm.getDatesCombo();
		String fromDate = itemForm.getFromDate();
		String toDate = itemForm.getToDate();
		String sortBy = itemForm.getSortBy();
		ItemDetails = itemInfoDao.getReportItemList(datesCombo, fromDate, toDate, sortBy, compId, request, itemForm);
		sess.setAttribute("ItemDetails", ItemDetails);
		Loger.log("list Size:" + ItemDetails.size());
	}

	public ItemDto searchItem(HttpServletRequest request, ItemDto itemDto) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		String invId = request.getParameter("InvId");
		// String itemIndex = request.getParameter("itemIndex");
		ArrayList<ItemDto> ItemDetails = itemInfoDao.SearchItem(compId, invId, itemDto, request);
		itemDto = ItemDetails.isEmpty() ? itemDto : ItemDetails.get(0);
		sess.setAttribute("ItemDetails1", ItemDetails);
		request.setAttribute("itemDto", itemDto);
		// request.setAttribute("itemIndex", itemIndex);
		Loger.log("list Size:" + ItemDetails.size());
		return itemDto;
	}

	public void DeleteItem(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		String invId = request.getParameter("InvId");
		boolean isChildExists = itemInfoDao.isChildItemExists(invId);
		if (isChildExists) {
			sess.setAttribute("actionMsg", "Selected item has child items!");
		} else {
			boolean isDeleted = itemInfoDao.deleteItem(compId, invId);
			if (isDeleted) {
				sess.setAttribute("actionMsg", "Selected item has deleted successfully!");
			}
		}
	}

	public void getDamagedInvenotyList(HttpServletRequest request, ItemDto itemForm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList ItemDetails = new ArrayList();
		String datesCombo = itemForm.getDatesCombo();
		String fromDate = itemForm.getFromDate();
		String toDate = itemForm.getToDate();
		String sortBy = itemForm.getSortBy();
		ArrayList damagesItemList = new ArrayList();
		damagesItemList = itemInfoDao.getDamagedInvList(datesCombo, fromDate, toDate, sortBy, compId, request,
				itemForm);
		request.setAttribute("damagesItemList", damagesItemList);

	}

	public void getMissingInventoryList(HttpServletRequest request, ItemDto itemForm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList ItemDetails = new ArrayList();
		String datesCombo = itemForm.getDatesCombo();
		String fromDate = itemForm.getFromDate();
		String toDate = itemForm.getToDate();
		String sortBy = itemForm.getSortBy();
		ArrayList missingInventoryList = new ArrayList();
		missingInventoryList = itemInfoDao.getMissingInventoryList(datesCombo, fromDate, toDate, sortBy, compId,
				request, itemForm);
		request.setAttribute("missingInventoryList", missingInventoryList);

	}

	public void getReturnInventoryList(HttpServletRequest request, ItemDto itemForm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList ItemDetails = new ArrayList();

		String datesCombo = itemForm.getDatesCombo();
		String fromDate = itemForm.getFromDate();
		String toDate = itemForm.getToDate();
		String sortBy = itemForm.getSortBy();

		ArrayList returnInventoryList = new ArrayList();
		returnInventoryList = itemInfoDao.getReturnInventoryList(datesCombo, fromDate, toDate, sortBy, compId, request,
				itemForm);
		request.setAttribute("returnInventoryList", returnInventoryList);

	}

	public void getInventoryValuationSummary(HttpServletRequest request, ItemDto form1) {
		HttpSession ss = request.getSession();
		String compId = (String) ss.getAttribute("CID");
//		ItemInfoDao info = new ItemInfoDao();

		String orderDate1 = form1.getOrderDate1();
		String orderDate2 = form1.getOrderDate2();

		String datesCombo = form1.getDatesCombo();
		String fromDate = form1.getFromDate();
		String toDate = form1.getToDate();
		String sortBy = form1.getSortBy();

		ArrayList invValSummaryList = new ArrayList();
		invValSummaryList = itemInfoDao.getInventoryValSummary(datesCombo, fromDate, toDate, sortBy, compId, request,
				form1);
		request.setAttribute("invValSummaryList", invValSummaryList);
	}

	public void getInventoryValuationDetail(HttpServletRequest request, ItemDto form1) {
		HttpSession ss = request.getSession();
		String compId = (String) ss.getAttribute("CID");
//		ItemInfoDao info = new ItemInfoDao();

		String orderDate1 = form1.getOrderDate1();
		String orderDate2 = form1.getOrderDate2();

		String datesCombo = form1.getDatesCombo();
		String fromDate = form1.getFromDate();
		String toDate = form1.getToDate();
		String sortBy = form1.getSortBy();

		ArrayList getInvValDetail = new ArrayList<>();
		getInvValDetail = itemInfoDao.getInvValDetail(datesCombo, fromDate, toDate, sortBy, compId, request, form1);
		request.setAttribute("getInvValDetail", getInvValDetail);
	}

	public void getInventoryOrderReport(HttpServletRequest request, ItemDto form1) {
		HttpSession ss = request.getSession();
		String compId = (String) ss.getAttribute("CID");
//		ItemInfoDao info = new ItemInfoDao();

		String sortByDay = form1.getSortByDay();
		String orderDate1 = form1.getOrderDate1();
		String orderDate2 = form1.getOrderDate2();

		String datesCombo = form1.getDatesCombo();
		String fromDate = form1.getFromDate();
		String toDate = form1.getToDate();
		String sortBy = form1.getSortBy();

		ArrayList invOrderReport = new ArrayList<>();
		invOrderReport = itemInfoDao.getInvOrderReport(datesCombo, fromDate, toDate, sortBy, compId, request, form1);
		request.setAttribute("invOrderReport", invOrderReport);
	}

	public void getInventoryStatistics(HttpServletRequest request, ItemDto form1) {
		HttpSession ss = request.getSession();
		String compId = (String) ss.getAttribute("CID");
//		ItemInfoDao info = new ItemInfoDao();

		String sortByDay = form1.getSortByDay();
		String orderDate1 = form1.getOrderDate1();
		String orderDate2 = form1.getOrderDate2();

		String datesCombo = form1.getDatesCombo();
		String fromDate = form1.getFromDate();
		String toDate = form1.getToDate();
		String sortBy = form1.getSortBy();

		ArrayList invStatistics = new ArrayList<>();
		invStatistics = itemInfoDao.getInvStatisticReport(datesCombo, fromDate, toDate, sortBy, compId, request, form1);
		request.setAttribute("invStatistics", invStatistics);

	}

	public void getAccountPayableReport(HttpServletRequest request, CustomerDto cform) {
		HttpSession ss = request.getSession();
		String compId = (String) ss.getAttribute("CID");
//		CustomerInfoDao info = new CustomerInfoDao();
		String sortByDay = cform.getSortBy();
		String orderDate1 = cform.getFromDate();
		String orderDate2 = cform.getToDate();
		String datesCombo = cform.getDatesCombo();
		String fromDate = cform.getFromDate();
		String toDate = cform.getToDate();
		String sortBy = cform.getSortBy();

		ArrayList<CustomerDto> cList = customerInfoDao.getAccountPayableReport(compId, request, datesCombo, fromDate,
				toDate, sortBy, cform);
		request.setAttribute("acPayList", cList);
	}

	public void UpdateItem(HttpServletRequest request, ItemDto itemFrm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		itemInfoDao.fillCombo(compId);
		String invId = request.getParameter("InvId");
		if (invId != null && !invId.isEmpty()) {
			itemFrm.setInventoryId(invId);
		}
		Loger.log("The Item Code is" + itemFrm.getItemCode());
		Loger.log("The Itemsale price is" + itemFrm.getSalePrice());
		Loger.log("ISCATEGORY____________________________________" + itemFrm.getIscategory());

		boolean status = itemInfoDao.updateItem(compId, itemFrm);
		if (status) {
			request.setAttribute("SaveStatus", "Item updated successfully");
			request.getSession().setAttribute("SaveStatus", "Item updated successfully");
		}
		Loger.log("ITEM Type-----+" + itemFrm.getItemType());
	}

	public void AddItem(HttpServletRequest request, ItemDto itemFrm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		String itemType = request.getParameter("ItemType");
		if (itemType == null) {
			itemType = itemFrm.getItemType();
		}
		if (itemType.equals("1")) {
			itemFrm.setItemCode(itemFrm.getItemCodeDis());
			itemFrm.setInvTitle(itemFrm.getInvTitleDis());
			itemFrm.setItemCodeDis("");
			itemFrm.setInvTitleDis("");
		} else if (itemType.equals("2")) {
			itemFrm.setItemCode(itemFrm.getItemCodeDis());
			itemFrm.setInvTitle(itemFrm.getInvTitleDis());
			itemFrm.setItemCodeDis("");
			itemFrm.setInvTitleDis("");
		} else if (itemType.equals("3")) {
			itemFrm.setItemCode(itemFrm.getItemCodeSub());
			itemFrm.setItemName(itemFrm.getItemNameSub());
			itemFrm.setItemCodeSub("");
			itemFrm.setItemNameSub("");
		} else if (itemType.equals("4")) {
			itemFrm.setItemCode(itemFrm.getItemCodeSer());
			itemFrm.setItemName(itemFrm.getItemNameSer());
			itemFrm.setTectcmd(itemFrm.getTectcmdSer());
			itemFrm.setInvTitle(itemFrm.getInvTitleSer());
			itemFrm.setTaxable(itemFrm.getTaxableSer());

			itemFrm.setItemCodeSer("");
			itemFrm.setItemNameSer("");
			itemFrm.setTectcmdSer(0);
			itemFrm.setInvTitleSer("");
			Loger.log("CAT_______________________________________" + request.getParameter("iscat"));
			itemFrm.setIscategory(request.getParameter("iscat"));
		}
		String str = "";
		if (itemFrm.getPhotoName() != null) {
			if (itemFrm.getPhotoName().getFileName() == null || itemFrm.getPhotoName().getFileName().equals("")) {
				str = "";
			} else {
				Loger.log("FILE______________________________DJDJD__");
				ItemInfo itmInfo = new ItemInfo();
				itmInfo.uploadImage(itemFrm, request);
				str = itemFrm.getPhotoName().getFileName();
				Loger.log("FILE UPLOADED******");
			}
		}
		try {
			boolean status = itemInfoDao.insertItem(compId, str, itemFrm); // Insert new Item
			itemFrm.setItemCode("");
			itemFrm.setTectcmd(0);
			itemFrm.setDiscountAmt("");
			if (status) {
				request.setAttribute("SaveStatus", "Item saved successfully");
				request.getSession().setAttribute("SaveStatus", "Item saved successfully");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		Loger.log("item added successfully");
	}

	public void AdjustInventory(HttpServletRequest request, ItemDto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		ArrayList Inventory = new ArrayList();
		Inventory = (ArrayList) sess.getAttribute("ItemDetails");
		int invSize = Inventory.size();

		String[][] oldInventory = new String[invSize][3];

		for (int i = 0; i < invSize; i++) {
			ItemDto itemForm = (ItemDto) Inventory.get(i);
			String invId = itemForm.getInventoryId();
			oldInventory[i][0] = invId;
			if (request.getParameter("newQty" + invId) != null) {
				if (request.getParameter("newQty" + invId).trim().length() > 0)
					oldInventory[i][1] = request.getParameter("newQty" + invId);
				else
					oldInventory[i][1] = itemForm.getQty();
				if (request.getParameter("newValue" + invId).trim().length() > 0) {
					oldInventory[i][2] = request.getParameter("newValue" + invId);
				} else {
					oldInventory[i][2] = itemForm.getSalePrice();
				}
			}
		}
//		ItemInfoDao item = new ItemInfoDao();
		itemInfoDao.adjustInventory(compId, oldInventory, invSize);
		ArrayList ItemDetails = new ArrayList();
		ItemDetails = itemInfoDao.getItemList(compId, "");
		sess.removeAttribute("ItemDetails");
		sess.setAttribute("ItemDetails", ItemDetails);
		Loger.log("list Size:" + ItemDetails.size());

	}

	public void insertItemAsCategory(String compId, ItemDto itemDto) {
//		ItemInfoDao item = new ItemInfoDao();
		boolean status = itemInfoDao.insertItemAsCategory(compId, itemDto);
	}

	public void getAdjustInventoryList(HttpServletRequest request) {
		String compId = (String) request.getSession().getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList<ItemDto> ItemList = itemInfoDao.getAdjustInventoryList(compId);
		request.setAttribute("AdjustInventoryList", ItemList);
	}

	public void getAdjustInventoryListByDate(HttpServletRequest request) {
		String invID = request.getParameter("invID");
		String compId = (String) request.getSession().getAttribute("CID");
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList<ItemDto> ItemList = itemInfoDao.getAdjustInventoryListByDate(invID, compId);
		request.setAttribute("AdjustInventoryList", ItemList);
	}

	public void UpdateInventory(HttpServletRequest request) {
//		ItemInfoDao item = new ItemInfoDao();
		// if(request.getParameter("createReportFlag").equalsIgnoreCase("true")){
		// item.AddAdjustInventory(request);
		// }
		itemInfoDao.UpdateInventory(request);
	}

	public void getBillingAddress(InvoiceDto form, HttpServletRequest request) {
//		CountryState cs = new CountryState();
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		form.setClientVendorID(request.getParameter("cvID"));
		form.setAddressID(request.getParameter("addressID"));
		invoiceInfoDao.getBillingAddress(form, request.getParameter("addressType"));

		request.setAttribute("countryList", countryState.getCountryList());
		request.setAttribute("stateList", countryState.getStateList(form.getCountry()));
		request.setAttribute("cityList", countryState.getCityList(form.getState()));
	}

	public void updateBillingAddress(InvoiceDto invoiceDto, HttpServletRequest request) {
		String cvId = request.getParameter("customerID");
		String addressID = request.getParameter("billAddressId");
		if (addressID != null) {
			String strArray[] = request.getParameter("billingAddress").split(",");
			if (strArray.length == 1 || null != strArray[0])
				invoiceDto.setFullName(strArray[0]);
			if (strArray.length == 2 || null != strArray[1])
				invoiceDto.setCompanyName(strArray[1]);
			if (strArray.length == 3 || null != strArray[2])
				invoiceDto.setAddress1(strArray[2]);
			if (strArray.length == 4 || null != strArray[3])
				invoiceDto.setAddress2(strArray[3]);
			if (strArray.length == 5 || null != strArray[4])
				invoiceDto.setCity(strArray[4]);
			if (strArray.length == 6 || null != strArray[5])
				invoiceDto.setZipcode(strArray[5]);
			if (strArray.length == 7 && null != strArray[6])
				invoiceDto.setState(strArray[6]);
			if (strArray.length == 8 && null != strArray[7])
				invoiceDto.setCountry(strArray[7]);
			String strName[] = strArray[0].split(" ");
			if (null != strName[0])
				invoiceDto.setFirstName(strName[0]);
			if (null != strName[1])
				invoiceDto.setLastName(strName[1]);
		} else {
			cvId = invoiceDto.getClientVendorID();
			addressID = invoiceDto.getAddressID();
		}
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		boolean status = invoiceInfoDao.updateBillingAddress(invoiceDto, cvId, addressID);
		if (status) {
			request.getSession().setAttribute("actionMsg", "BzComposer.common.recordUpdated");
		} else {
			request.getSession().setAttribute("actionMsg", "BzComposer.common.recordNotUpdated");
		}
	}

	// --------------------------- below code new code
	// 9-05-2024------------------------------
	public int updateNewbillAddress(InvoiceDto invoiceDto, HttpServletRequest request) throws SQLException {

		try {

			boolean status = false;
			String isDefaultAddress = request.getParameter("isDefaultAddress");
			String addressID = request.getParameter("addressID");

			BcaBillingaddress bcaBillingaddress = new BcaBillingaddress();

			String compId = (String) request.getSession().getAttribute("CID");

			Optional<BcaCompany> company = bcaCompanyRepository.findById(Long.parseLong(compId));

			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository
					.findById(Integer.parseInt(invoiceDto.getClientVendorID()));

			if (isDefaultAddress != null && isDefaultAddress.equalsIgnoreCase("on")) {

				Optional<BcaBillingaddress> defaultBillingaddress = bcaBillingaddressRepository
						.findByClientVendorAndIsDefaultAndActive(clientVendor.get(), 1, 1);

				BcaBillingaddress oldDefaultBillingAdrdress = defaultBillingaddress.get();
//						= bcaBillingaddressRepository
//						.findByClientVendorIdAndAddressId(Integer.parseInt(invoiceDto.getClientVendorID()),
//								Integer.parseInt(addressID));
				oldDefaultBillingAdrdress.setAddressName("");
				oldDefaultBillingAdrdress.setIsDefault(0);
				oldDefaultBillingAdrdress.setStatus("U");
				bcaBillingaddressRepository.save(oldDefaultBillingAdrdress);

				bcaBillingaddress.setAddressName("Default");
				bcaBillingaddress.setIsDefault(1);
			} else {
				bcaBillingaddress.setAddressName("");
				bcaBillingaddress.setIsDefault(0);

			}
			bcaBillingaddress.setClientVendor(clientVendor.get());
			bcaBillingaddress.setName(ConstValue.hateNull(company.get().getName()).replaceAll("'", "''"));
			bcaBillingaddress.setFirstName(ConstValue.hateNull(invoiceDto.getFirstName()).replaceAll("'", "''"));
			bcaBillingaddress.setLastName(ConstValue.hateNull(invoiceDto.getLastName()).replaceAll("'", "''"));
			bcaBillingaddress.setAddress1(ConstValue.hateNull(invoiceDto.getAddress1()).replaceAll("'", "''"));
			bcaBillingaddress.setAddress2(ConstValue.hateNull(invoiceDto.getAddress2()).replaceAll("'", "''"));
			bcaBillingaddress.setCity(ConstValue.hateNull(invoiceDto.getCity()).replaceAll("'", "''"));
			bcaBillingaddress.setState(ConstValue.hateNull(invoiceDto.getState()).replaceAll("'", "''"));
			bcaBillingaddress.setProvince(ConstValue.hateNull(clientVendor.get().getProvince()).replaceAll("'", "''"));
			bcaBillingaddress.setCountry(ConstValue.hateNull(invoiceDto.getCountry()).replaceAll("'", "''"));
			bcaBillingaddress.setZipCode(ConstValue.hateNull(invoiceDto.getZipcode()).replaceAll("'", "''"));
			bcaBillingaddress.setStatus("N");

			bcaBillingaddress.setDateAdded(OffsetDateTime.now());
			bcaBillingaddress.setPhone(ConstValue.hateNull(clientVendor.get().getPhone()).replaceAll("'", "''"));

			bcaBillingaddress.setActive(1);
			bcaBillingaddress.setCompany(company.get());
			bcaBillingaddress = bcaBillingaddressRepository.save(bcaBillingaddress);

			if (bcaBillingaddress != null) {
				request.getSession().setAttribute("actionMsg", "BzComposer.common.recordUpdated");
				invoiceDto.setAddressID("" + bcaBillingaddress.getAddressId());

				request.getSession().setAttribute("BillingAddress", bcaBillingaddress);

				Optional<BcaStates> state = stateRepository.findById(Integer.valueOf(bcaBillingaddress.getState()));
				Optional<BcaCities> city = cityRepository.findById(Integer.valueOf(bcaBillingaddress.getCity()));
//							
				request.getSession().setAttribute("lastLineoFBAddress",
						city.get().getName() + ", " + state.get().getName() + " " + bcaBillingaddress.getZipCode());

			} else {
				request.getSession().setAttribute("actionMsg", "BzComposer.common.recordNotUpdated");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("" + e);
		}
		return 0;

	}

	public int updateNewShippingAddress(InvoiceDto invoiceDto, HttpServletRequest request) throws SQLException {
		try {

			boolean status = false;
			String isDefaultAddress = request.getParameter("isDefaultAddress");
			String addressID = request.getParameter("addressID");

			BcaShippingaddress bcaShippingaddress = new BcaShippingaddress();

			String compId = (String) request.getSession().getAttribute("CID");

			Optional<BcaCompany> company = bcaCompanyRepository.findById(Long.parseLong(compId));

			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository
					.findById(Integer.parseInt(invoiceDto.getClientVendorID()));
			if (isDefaultAddress != null && isDefaultAddress.equalsIgnoreCase("on")) {

				Optional<BcaShippingaddress> defaultShippingaddress = bcaShippingaddressRepository
						.findByClientVendorAndIsDefaultAndActive(clientVendor.get(), 1, 1);

				BcaShippingaddress oldDefaultshippingAdrdress = defaultShippingaddress.get();

//				BcaShippingaddress oldDefaultshippingAdrdress = bcaShippingaddressRepository
//						.findByClientVendorIdAndAddressId(Integer.parseInt(invoiceDto.getClientVendorID()),
//								Integer.parseInt(addressID));
				oldDefaultshippingAdrdress.setAddressName("");
				oldDefaultshippingAdrdress.setIsDefault(0);
				oldDefaultshippingAdrdress.setStatus("U");

				bcaShippingaddressRepository.save(oldDefaultshippingAdrdress);
				bcaShippingaddress.setAddressName("Default");
				bcaShippingaddress.setIsDefault(1);
			} else {
				bcaShippingaddress.setAddressName("");
				bcaShippingaddress.setIsDefault(0);

			}
			bcaShippingaddress.setClientVendor(clientVendor.get());
			bcaShippingaddress.setName(ConstValue.hateNull(company.get().getName()).replaceAll("'", "''"));
			bcaShippingaddress.setFirstName(ConstValue.hateNull(invoiceDto.getFirstName()).replaceAll("'", "''"));
			bcaShippingaddress.setLastName(ConstValue.hateNull(invoiceDto.getLastName()).replaceAll("'", "''"));
			bcaShippingaddress.setAddress1(ConstValue.hateNull(invoiceDto.getAddress1()).replaceAll("'", "''"));
			bcaShippingaddress.setAddress2(ConstValue.hateNull(invoiceDto.getAddress2()).replaceAll("'", "''"));
			bcaShippingaddress.setCity(ConstValue.hateNull(invoiceDto.getCity()).replaceAll("'", "''"));
			bcaShippingaddress.setState(ConstValue.hateNull(invoiceDto.getState()).replaceAll("'", "''"));
			bcaShippingaddress.setProvince(ConstValue.hateNull(clientVendor.get().getProvince()).replaceAll("'", "''"));
			bcaShippingaddress.setCountry(ConstValue.hateNull(invoiceDto.getCountry()).replaceAll("'", "''"));
			bcaShippingaddress.setZipCode(ConstValue.hateNull(invoiceDto.getZipcode()).replaceAll("'", "''"));
			bcaShippingaddress.setStatus("N");

			bcaShippingaddress.setDateAdded(OffsetDateTime.now());
			bcaShippingaddress.setPhone(ConstValue.hateNull(clientVendor.get().getPhone()).replaceAll("'", "''"));

			bcaShippingaddress.setActive(1);
			bcaShippingaddress.setCompany(company.get());
			bcaShippingaddress = bcaShippingaddressRepository.save(bcaShippingaddress);

			System.out.println("bcaShippingaddress..............Zipcode=" + bcaShippingaddress.getZipCode());

			if (bcaShippingaddress != null) {
				request.getSession().setAttribute("actionMsg", "BzComposer.common.recordUpdated");
				invoiceDto.setAddressID("" + bcaShippingaddress.getAddressId());
				invoiceDto.setShAddressID("" + bcaShippingaddress.getAddressId());

				request.getSession().setAttribute("ShippingAddress", bcaShippingaddress);

				Optional<BcaStates> state = stateRepository.findById(Integer.valueOf(bcaShippingaddress.getState()));
				Optional<BcaCities> city = cityRepository.findById(Integer.valueOf(bcaShippingaddress.getCity()));
//								
				request.getSession().setAttribute("lastLineoFSAddress",
						city.get().getName() + ", " + state.get().getName() + " " + bcaShippingaddress.getZipCode());
			} else {
				request.getSession().setAttribute("actionMsg", "BzComposer.common.recordNotUpdated");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("" + e);
		}
		return 0;

	}

	public void setUpdatPurchaseAddress(PurchaseOrderDto purchaseOrderDto, HttpServletRequest request)
			throws SQLException {
		BcaBillingaddress bcaBillingaddress = (BcaBillingaddress) request.getSession().getAttribute("BillingAddress");
		BcaShippingaddress bcaShippingaddress = (BcaShippingaddress) request.getSession()
				.getAttribute("ShippingAddress");

		BcaClientvendor clientVendor = null;

		if (bcaShippingaddress != null)
			clientVendor = bcaShippingaddress.getClientVendor();
		if (bcaBillingaddress != null)
			clientVendor = bcaBillingaddress.getClientVendor();

		if (clientVendor != null) {
			if (bcaShippingaddress != null) {
				String lastLine = (String) request.getSession().getAttribute("lastLineoFSAddress");
				purchaseOrderDto.setCompanyID("" + bcaShippingaddress.getCompany().getCompanyId());
				purchaseOrderDto.setCustID("" + (bcaShippingaddress.getClientVendor()).getClientVendorId());
				purchaseOrderDto.setClientVendorID("" + (bcaShippingaddress.getClientVendor()).getClientVendorId());
				purchaseOrderDto.setShAddressID("" + bcaShippingaddress.getAddressId());
				String shippingAddress = bcaShippingaddress.getFirstName() + " " + bcaShippingaddress.getLastName()
						+ "\n" + bcaShippingaddress.getName() + "\n" + bcaShippingaddress.getAddress1() + " "
						+ bcaShippingaddress.getAddress2() + "\n" + lastLine;
				purchaseOrderDto.setShipTo(shippingAddress);
			} else {

				System.out.println("SRP........................................" + bcaShippingaddressRepository);
				if (bcaShippingaddressRepository != null) {
					Optional<BcaShippingaddress> defaultShippingaddress = bcaShippingaddressRepository
							.findByClientVendorAndIsDefaultAndActive(clientVendor, 1, 1);

					Optional<BcaStates> state = stateRepository
							.findById(Integer.valueOf(defaultShippingaddress.get().getState()));
					Optional<BcaCities> city = cityRepository
							.findById(Integer.valueOf(defaultShippingaddress.get().getCity()));

					purchaseOrderDto.setCustID("" + clientVendor.getClientVendorId());
					purchaseOrderDto.setClientVendorID("" + clientVendor.getClientVendorId());
					purchaseOrderDto.setShAddressID("" + defaultShippingaddress.get().getAddressId());
					purchaseOrderDto.setCompanyID("" + defaultShippingaddress.get().getCompany().getCompanyId());
					String Shippingaddress = defaultShippingaddress.get().getFirstName() + " "
							+ defaultShippingaddress.get().getLastName() + "\n" + defaultShippingaddress.get().getName()
							+ "\n" + defaultShippingaddress.get().getAddress1() + " "
							+ defaultShippingaddress.get().getAddress2() + "\n" + state.get().getName() + ","
							+ city.get().getName() + " " + defaultShippingaddress.get().getZipCode();
					purchaseOrderDto.setShipTo(Shippingaddress);

				}
			}

			if (bcaBillingaddress != null) {
				String lastLine = (String) request.getSession().getAttribute("lastLineoFBAddress");

				purchaseOrderDto.setCustID("" + (bcaBillingaddress.getClientVendor()).getClientVendorId());
				purchaseOrderDto.setClientVendorID("" + (bcaBillingaddress.getClientVendor()).getClientVendorId());
				purchaseOrderDto.setBsAddressID("" + bcaBillingaddress.getAddressId());
				String Billingaddress = bcaBillingaddress.getFirstName() + " " + bcaBillingaddress.getLastName() + "\n"
						+ bcaBillingaddress.getName() + "\n" + bcaBillingaddress.getAddress1() + " "
						+ bcaBillingaddress.getAddress2() + "\n" + lastLine;
				purchaseOrderDto.setBillTo(Billingaddress);
				purchaseOrderDto.setBillAddrValue(Billingaddress);
			} else {
				System.out.println("BRP.........................." + bcaBillingaddressRepository);
				if (bcaBillingaddressRepository != null) {
					Optional<BcaBillingaddress> defaultBillingaddress = bcaBillingaddressRepository
							.findByClientVendorAndIsDefaultAndActive(clientVendor, 1, 1);

					Optional<BcaStates> state = stateRepository
							.findById(Integer.valueOf(defaultBillingaddress.get().getState()));
					Optional<BcaCities> city = cityRepository
							.findById(Integer.valueOf(defaultBillingaddress.get().getCity()));

					purchaseOrderDto.setCustID("" + clientVendor.getClientVendorId());
					purchaseOrderDto.setClientVendorID("" + clientVendor.getClientVendorId());
					purchaseOrderDto.setBsAddressID("" + defaultBillingaddress.get().getAddressId());
					String Billingaddress = defaultBillingaddress.get().getFirstName() + " "
							+ defaultBillingaddress.get().getLastName() + "\n" + defaultBillingaddress.get().getName()
							+ "\n" + defaultBillingaddress.get().getAddress1() + " "
							+ defaultBillingaddress.get().getAddress2() + "\n" + state.get().getName() + ","
							+ city.get().getName() + " " + defaultBillingaddress.get().getZipCode();
					purchaseOrderDto.setBillTo(Billingaddress);

				}
			}
		}

	}

	public void setUpdatEstimationAddress(EstimationDto estimationDto, HttpServletRequest request) throws SQLException {
		BcaBillingaddress bcaBillingaddress = (BcaBillingaddress) request.getSession().getAttribute("BillingAddress");
		BcaShippingaddress bcaShippingaddress = (BcaShippingaddress) request.getSession()
				.getAttribute("ShippingAddress");

		BcaClientvendor clientVendor = null;

		if (bcaShippingaddress != null)
			clientVendor = bcaShippingaddress.getClientVendor();
		if (bcaBillingaddress != null)
			clientVendor = bcaBillingaddress.getClientVendor();

		if (clientVendor != null) {
			if (bcaShippingaddress != null) {
				String lastLine = (String) request.getSession().getAttribute("lastLineoFSAddress");
				estimationDto.setCustID("" + (bcaShippingaddress.getClientVendor()).getClientVendorId());
				estimationDto.setClientVendorID("" + (bcaShippingaddress.getClientVendor()).getClientVendorId());
				estimationDto.setShAddressID("" + bcaShippingaddress.getAddressId());
				String shippingAddress = bcaShippingaddress.getFirstName() + " " + bcaShippingaddress.getLastName()
						+ "\n" + bcaShippingaddress.getName() + "\n" + bcaShippingaddress.getAddress1() + " "
						+ bcaShippingaddress.getAddress2() + "\n" + lastLine;
				estimationDto.setShipTo(shippingAddress);

			} else {
				System.out.println("shipRpos...................="+bcaShippingaddressRepository);
				if (bcaShippingaddressRepository != null) {
					Optional<BcaShippingaddress> defaultShippingaddress = bcaShippingaddressRepository
							.findByClientVendorAndIsDefaultAndActive(clientVendor, 1, 1);

					Optional<BcaStates> state = stateRepository
							.findById(Integer.valueOf(defaultShippingaddress.get().getState()));
					Optional<BcaCities> city = cityRepository
							.findById(Integer.valueOf(defaultShippingaddress.get().getCity()));

					estimationDto.setCustID("" + clientVendor.getClientVendorId());
					estimationDto.setShAddressID("" + defaultShippingaddress.get().getAddressId());
					String Shippingaddress = defaultShippingaddress.get().getFirstName() + " "
							+ defaultShippingaddress.get().getLastName() + "\n" + defaultShippingaddress.get().getName()
							+ "\n" + defaultShippingaddress.get().getAddress1() + " "
							+ defaultShippingaddress.get().getAddress2() + "\n" + state.get().getName() + ","
							+ city.get().getName() + " " + defaultShippingaddress.get().getZipCode();
					estimationDto.setShipTo(Shippingaddress);
				}
			}

			if (bcaBillingaddress != null) {
				String lastLine = (String) request.getSession().getAttribute("lastLineoFBAddress");
				estimationDto.setCustID("" + (bcaBillingaddress.getClientVendor()).getClientVendorId());
				estimationDto.setClientVendorID("" + (bcaBillingaddress.getClientVendor()).getClientVendorId());
				estimationDto.setBsAddressID("" + bcaBillingaddress.getAddressId());
				String Billingaddress = bcaBillingaddress.getFirstName() + " " + bcaBillingaddress.getLastName() + "\n"
						+ bcaBillingaddress.getName() + "\n" + bcaBillingaddress.getAddress1() + " "
						+ bcaBillingaddress.getAddress2() + "\n" + lastLine;
				estimationDto.setBillTo(Billingaddress);
			} else {
				///
				System.out.println("biiRpos...................=" + bcaBillingaddressRepository);
				if (bcaBillingaddressRepository != null) {
					Optional<BcaBillingaddress> defaultBillingaddress = bcaBillingaddressRepository
							.findByClientVendorAndIsDefaultAndActive(clientVendor, 1, 1);

					Optional<BcaStates> state = stateRepository
							.findById(Integer.valueOf(defaultBillingaddress.get().getState()));
					Optional<BcaCities> city = cityRepository
							.findById(Integer.valueOf(defaultBillingaddress.get().getCity()));

					estimationDto.setCustID("" + clientVendor.getClientVendorId());
					estimationDto.setBsAddressID("" + defaultBillingaddress.get().getAddressId());
					String Billingaddress = defaultBillingaddress.get().getFirstName() + " "
							+ defaultBillingaddress.get().getLastName() + "\n" + defaultBillingaddress.get().getName()
							+ "\n" + defaultBillingaddress.get().getAddress1() + " "
							+ defaultBillingaddress.get().getAddress2() + "\n" + state.get().getName() + ","
							+ city.get().getName() + " " + defaultBillingaddress.get().getZipCode();
					estimationDto.setBillTo(Billingaddress);
				}
			}
		}

	}

	public void setUpdatedInvoiceAddress(InvoiceDto invoiceDto, HttpServletRequest request) throws SQLException {
		BcaBillingaddress bcaBillingaddress = (BcaBillingaddress) request.getSession().getAttribute("BillingAddress");
		BcaShippingaddress bcaShippingaddress = (BcaShippingaddress) request.getSession()
				.getAttribute("ShippingAddress");

		System.out.println("bcaBillingaddress ->>>>>>>>>>>>>"+bcaBillingaddress);
		System.out.println("ShippingAddress ->>>>>>>>>>>>>"+bcaShippingaddress);
		
		BcaClientvendor clientVendor = null;
		if (bcaShippingaddress != null)
			clientVendor = bcaShippingaddress.getClientVendor();
		if (bcaBillingaddress != null)
			clientVendor = bcaBillingaddress.getClientVendor();

		if (clientVendor != null)
		{
			if (bcaShippingaddress != null)
			{
				String lastLine = (String) request.getSession().getAttribute("lastLineoFSAddress");
				invoiceDto.setCustID("" + (bcaShippingaddress.getClientVendor()).getClientVendorId());
				invoiceDto.setShAddressID("" + bcaShippingaddress.getAddressId());
				String shippingAddress = bcaShippingaddress.getFirstName() + " " + bcaShippingaddress.getLastName()
						+ "\n" + bcaShippingaddress.getName() + "\n" + bcaShippingaddress.getAddress1() + " "
						+ bcaShippingaddress.getAddress2() + "\n" + lastLine;
				invoiceDto.setShipTo(shippingAddress);

			}
			else 
			{
				Optional<BcaShippingaddress> defaultShippingaddress = bcaShippingaddressRepository
						.findByClientVendorAndIsDefaultAndActive(clientVendor, 1, 1);
				Optional<BcaStates> state = stateRepository
						.findById(Integer.valueOf(defaultShippingaddress.get().getState()));
				Optional<BcaCities> city = cityRepository
						.findById(Integer.valueOf(defaultShippingaddress.get().getCity()));

				invoiceDto.setCustID("" + clientVendor.getClientVendorId());
				invoiceDto.setShAddressID("" + defaultShippingaddress.get().getAddressId());
				String Shippingaddress = defaultShippingaddress.get().getFirstName() + " "
						+ defaultShippingaddress.get().getLastName() + "\n" + defaultShippingaddress.get().getName()
						+ "\n" + defaultShippingaddress.get().getAddress1() + " "
						+ defaultShippingaddress.get().getAddress2() + "\n" + state.get().getName() + ","
						+ city.get().getName() + " " + defaultShippingaddress.get().getZipCode();
				invoiceDto.setShipTo(Shippingaddress);
			}

			if (bcaBillingaddress != null) {
				String lastLine = (String) request.getSession().getAttribute("lastLineoFBAddress");
				invoiceDto.setCustID("" + (bcaBillingaddress.getClientVendor()).getClientVendorId());
				invoiceDto.setBsAddressID("" + bcaBillingaddress.getAddressId());
				String Billingaddress = bcaBillingaddress.getFirstName() + " " + bcaBillingaddress.getLastName() + "\n"
						+ bcaBillingaddress.getName() + "\n" + bcaBillingaddress.getAddress1() + " "
						+ bcaBillingaddress.getAddress2() + "\n" + lastLine;
				invoiceDto.setBillTo(Billingaddress);
			} else {
				Optional<BcaBillingaddress> defaultBillingaddress = bcaBillingaddressRepository
						.findByClientVendorAndIsDefaultAndActive(clientVendor, 1, 1);
				Optional<BcaStates> state = stateRepository
						.findById(Integer.valueOf(defaultBillingaddress.get().getState()));
				Optional<BcaCities> city = cityRepository
						.findById(Integer.valueOf(defaultBillingaddress.get().getCity()));

				invoiceDto.setCustID("" + clientVendor.getClientVendorId());
				invoiceDto.setBsAddressID("" + defaultBillingaddress.get().getAddressId());
				String Billingaddress = defaultBillingaddress.get().getFirstName() + " "
						+ defaultBillingaddress.get().getLastName() + "\n" + defaultBillingaddress.get().getName()
						+ "\n" + defaultBillingaddress.get().getAddress1() + " "
						+ defaultBillingaddress.get().getAddress2() + "\n" + state.get().getName() + ","
						+ city.get().getName() + " " + defaultBillingaddress.get().getZipCode();
				invoiceDto.setBillTo(Billingaddress);
			}

		}

	}

	// --------------------------- above code new code
	// ------------------------------
	public void updateShippingAddress(InvoiceDto invoiceDto, HttpServletRequest request) {
		String cvId = request.getParameter("customerID");
		String addressID = request.getParameter("shipAddressId");
		if (addressID != null) {
			String address = request.getParameter("shippingAddress");
			String strArray[] = address.split(",");

			if (strArray.length == 1 || null != strArray[0])
				invoiceDto.setFullName(strArray[0]);
			if (strArray.length == 2 || null != strArray[1])
				invoiceDto.setCompanyName(strArray[1]);
			if (strArray.length == 3 || null != strArray[2])
				invoiceDto.setAddress1(strArray[2]);
			if (strArray.length == 4 || null != strArray[3])
				invoiceDto.setAddress2(strArray[3]);
			if (strArray.length == 5 || null != strArray[4])
				invoiceDto.setCity(strArray[4]);
			if (strArray.length == 6 || null != strArray[5])
				invoiceDto.setZipcode(strArray[5]);
			if (strArray.length == 7 && null != strArray[6])
				invoiceDto.setState(strArray[6]);
			if (strArray.length == 8 && null != strArray[7])
				invoiceDto.setCountry(strArray[7]);
			String strName[] = strArray[0].split(" ");
			if (null != strName[0])
				invoiceDto.setFirstName(strName[0]);
			if (null != strName[1])
				invoiceDto.setLastName(strName[1]);
		} else {
			cvId = invoiceDto.getClientVendorID();
			addressID = invoiceDto.getAddressID();
		}
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		boolean status = invoiceInfoDao.updateShippingAddress(invoiceDto, cvId, addressID);
		if (status) {
			request.getSession().setAttribute("actionMsg", "BzComposer.common.recordUpdated");
		} else {
			request.getSession().setAttribute("actionMsg", "BzComposer.common.recordNotUpdated");
		}
	}

	/* Method for getting Invoice information */
	public void getInvoiceInfo(HttpServletRequest request) throws SQLException {
		String compId = (String) request.getSession().getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
//		ItemInfoDao item = new ItemInfoDao();
		ArrayList ClientDetails = invoiceInfoDao.customerDetails(compId, request); // Get-Customer-List
		request.setAttribute("CDetails", ClientDetails);

		String companyName = (String) request.getSession().getAttribute("user");

		/* Billing & Shipping Address */
		request.setAttribute("ShAddr", invoiceInfoDao.shipAddress(compId, null));
		request.setAttribute("BillAddr", invoiceInfoDao.billAddress(compId, null));
		// request.getSession().setAttribute("BillAddr", invoice.billAddress(compId,
		// null));
		/* Invoice Style */
		request.setAttribute("InvoiceStyle", invoiceInfoDao.getInvoiceStyle());
		/* Via Information */
		request.setAttribute("Via", invoiceInfoDao.getVia(compId));
		/* Rep Information */
		request.getSession().setAttribute("Rep", invoiceInfoDao.getRep(compId));
		/* Term Information */
		request.setAttribute("Term", invoiceInfoDao.getTerm(compId));
		/* Term Information */
		request.setAttribute("PayMethod", invoiceInfoDao.getPayMethod(compId));

		/* Messages */
		ArrayList message = invoiceInfoDao.getMessage(compId);
		request.setAttribute("Message", message);

		/* Tax */
		ArrayList tax = invoiceInfoDao.getTaxes(compId);
		request.setAttribute("Tax", tax);

		/* Item List */
		ArrayList itemList = invoiceInfoDao.getItemList(compId);
		request.setAttribute("ItemList", itemList);

		ArrayList itemDetails = itemInfoDao.getItemList(compId, "");
		request.setAttribute("ItemDetails", itemList);
	}

	public void getSortedInvoiceInfo(HttpServletRequest request, String sort) throws SQLException {
		String compId = (String) request.getSession().getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		ArrayList ClientDetails = new ArrayList();
		if (sort.equals("Name")) {
			ClientDetails = invoiceInfoDao.customerDetails(compId, request);
			System.out.println("Calling sortByName method and getting data:" + ClientDetails.toString());
		} else {
			ClientDetails = invoiceInfoDao.sortedcustomerDetails(compId, request, sort);
			System.out.println("Calling sortByLastName method and getting data:" + ClientDetails.toString());
		}
		request.setAttribute("CDetails", ClientDetails);

		String companyName = (String) request.getSession().getAttribute("user");
		ArrayList shAddr = invoiceInfoDao.shipAddress(compId, null);
		request.setAttribute("ShAddr", shAddr);

		ArrayList billAddr = invoiceInfoDao.billAddress(compId, null);
		request.getSession().setAttribute("BillAddr", billAddr);

		/* Invoice Style */
		ArrayList InvoiceStyle = new ArrayList();
		InvoiceStyle = invoiceInfoDao.getInvoiceStyle();
		request.setAttribute("InvoiceStyle", InvoiceStyle);

		/* Via Information */
		ArrayList via = new ArrayList();
		via = invoiceInfoDao.getVia(compId);
		request.setAttribute("Via", via);

		/* Rep Information */
		ArrayList rep = new ArrayList();
		rep = invoiceInfoDao.getRep(compId);
		request.getSession().setAttribute("Rep", rep);

		/* Term Information */
		ArrayList term = new ArrayList();
		term = invoiceInfoDao.getTerm(compId);
		request.setAttribute("Term", term);

		/* Term Information */
		ArrayList payMethod = new ArrayList();
		payMethod = invoiceInfoDao.getPayMethod(compId);
		request.setAttribute("PayMethod", payMethod);

		/* Messages */
		ArrayList message = new ArrayList();
		message = invoiceInfoDao.getMessage(compId);
		request.setAttribute("Message", message);

		/* Tax */
		ArrayList tax = new ArrayList();
		tax = invoiceInfoDao.getTaxes(compId);
		request.setAttribute("Tax", tax);

		/* Item List */
		ArrayList itemList = new ArrayList();
		itemList = invoiceInfoDao.getItemList(compId);
		request.setAttribute("ItemList", itemList);
	}

	public void FillCombo(HttpServletRequest request, ItemDto itemForm) {
		// TODO Auto-generated method stub
		String compId = (String) request.getSession().getAttribute("CID");
		HttpSession sess = request.getSession();

		ItemInfoDao item = new ItemInfoDao();
		sess.setAttribute("fillList", item.fillCombo(compId));
		sess.setAttribute("itemCategory", item.fillItemCategory(compId));
		sess.setAttribute("itemSubCategory", item.fillItemSubCategory(compId));
		sess.setAttribute("AccountList", item.fillAccountList(compId));

		sess.setAttribute("weightList", item.fillWeight(compId));
		sess.setAttribute("storeList", item.filleStoreList(compId, itemForm));
		sess.setAttribute("eSalesChannelList", item.filleSalesChannel(itemForm));
		sess.setAttribute("measurementList", item.getMeasurementList(compId));
		sess.setAttribute("unitMeasurementList", item.getUnitMeasurementList(compId));

		ArrayList priceLevelList = item.setPriceLevel(compId, itemForm);
		sess.setAttribute("priceLevelList", priceLevelList);
		sess.setAttribute("priceLevelSize", priceLevelList.size());

		ArrayList eBayProductList = item.eBayProductList(compId, itemForm);
		sess.setAttribute("eBayProductList", eBayProductList);
		sess.setAttribute("eBayProductListSize", eBayProductList.size());

		sess.setAttribute("locationList", item.getExistingLocation(compId, request, itemForm));
		sess.setAttribute("itemStoreList", item.getStoreList(compId));
		sess.setAttribute("productList", item.getActiveProductList(compId));
		request.setAttribute("vendorList", item.getVendorDetails(compId, request));
	}

	public void getInitialize(String ordNo, HttpServletRequest request, InvoiceDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		invoiceInfoDao.getRecord(request, form, compId, Long.parseLong(ordNo));
	}

	public void getSalesOrderInitialize(String salesOrderNo, HttpServletRequest request, InvoiceDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		long soNo = Long.parseLong(salesOrderNo); // Sales Order Num SO Num
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		invoice.getSalesOrderRecord(request, form, compId, soNo);
	}
	
	public void getLayawaysInitialize(String salesOrderNo, HttpServletRequest request, InvoiceDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		long soNo = Long.parseLong(salesOrderNo); // Sales Order Num SO Num
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		invoice.getLayawaysRecord(request, form, compId, soNo);
	}

	public void getInitializeEstimation(String estNo, HttpServletRequest request, EstimationDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		long estimationNo = Long.parseLong(estNo);
		EstimationInfoDao estimation = new EstimationInfoDao();
		estimation.getRecord(request, form, compId, estimationNo);
	}

	public void getInitializePurchase(String poNo, HttpServletRequest request, PurchaseOrderDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		long purchaseNo = Long.parseLong(poNo);
//		PurchaseOrderInfoDao purchase = new PurchaseOrderInfoDao();
		purchaseOrderInfoDao.getRecord(request, form, compId, purchaseNo);
	}

	public List<String> getCustomerInvoiceOrderNums(String custID, String compId) {
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		return invoice.getCustomerInvoiceOrderNums(custID, compId);
	}

	public InvoiceDto getRecordForInvoice(String compId, String orderNum, InvoiceDto form, HttpServletRequest request) {
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		return invoice.getRecordForInvoice(compId, orderNum, form, request);
	}

	public List<String> getCustomerEstimationNums(String custID, String compId) {
		EstimationInfoDao estimation = new EstimationInfoDao();
		return estimation.getCustomerEstimationNums(custID, compId);
	}

	public EstimationDto getRecordForEstimation(String compId, String orderNum, EstimationDto form,
			HttpServletRequest request) {
		EstimationInfoDao estimation = new EstimationInfoDao();
		return estimation.getRecordForEstimation(compId, orderNum, form, request);
	}

	public List<String> getCustomerSalesOrderNums(String custID, String compId) {
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		return invoice.getCustomerSalesOrderNums(custID, compId);
	}

	public InvoiceDto getRecordForSalesOrder(String compId, String orderNum, InvoiceDto form,
			HttpServletRequest request) {
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		return invoiceInfoDao.getRecordForSalesOrder(compId, orderNum, form, request);
	}

	public List<String> getCustomerPONums(String custID, String compId) {
//		PurchaseOrderInfoDao poInfoDao = new PurchaseOrderInfoDao();
		return purchaseOrderInfoDao.getCustomerPONums(custID, compId);
	}

	public PurchaseOrderDto getRecordForPO(String compId, String orderNum, PurchaseOrderDto form,
			HttpServletRequest request) throws Throwable {
//		PurchaseOrderInfoDao poInfoDao = new PurchaseOrderInfoDao();
		return purchaseOrderInfoDao.getRecordForPO(compId, orderNum, form, request);
	}

	public void newSalesOrder(HttpServletRequest request, InvoiceDto form) { // New Sales Order
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		form.setOrderNo(invoiceInfoDao.getNewSalesOrderNo(compId));
		form.setPoNum("0");
		DateInfo date = new DateInfo();
		int month = date.getMonth();
		int day = date.getDay();

		String da = "", d = "", m = "";
		if (month >= 1 && month <= 9) {
			m = "0" + month;
		} else
			m = "" + month;
		if (day >= 1 && day <= 9) {
			d = "0" + day;
		} else
			d = "" + day;
		da = m + "-" + d + "-" + (date.getYear());

		form.setOrderDate(da);

		// form.setPoNum("0");
		form.setCustID("0");
		form.setInvoiceStyle("1");
		form.setVia("0");
		form.setTerm("0");
		form.setRep("0");
		form.setPayMethod("0");
		form.setItemID("0");
		form.setMessage("0");
		form.setTaxID("0");
		form.setIsPending("false");
		form.setBalance(0.00);
		form.setWeight(0.00);
		form.setDiscount(0.00);
		form.setAdjustedtotal(0.00);
		form.setSubtotal(0.00);
		form.setShipping(0.00);
		form.setTotal(0.00);
		form.setItemShipped("false");
		form.setTaxable("false");
		form.setIsPending("false");
		form.setPaid("false");
		form.setBillTo("");
		form.setShipTo("");
		form.setMemo("");
		form.setShipDate(da);
		form.setTax(0.00);
		form.setItemID("0");

		request.setAttribute("IsDisplay", "false");
	}

	public void newInvoice(HttpServletRequest request, InvoiceDto form) {
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		form.setOrderNo(invoiceInfoDao.getNewOrderNo(compId));
		form.setPoNum("0");
		DateInfo date = new DateInfo();
		int month = date.getMonth();
		int day = date.getDay();

		String da = "", d = "", m = "";
		if (month >= 1 && month <= 9) {
			m = "0" + month;
		} else
			m = "" + month;
		if (day >= 1 && day <= 9) {
			d = "0" + day;
		} else
			d = "" + day;
		da = m + "-" + d + "-" + (date.getYear());

		form.setOrderDate(da);
		// form.setPoNum("0");
		form.setCustID("0");
		form.setInvoiceStyle(invoiceInfoDao.getDefaultInvoiceStyleNo(compId));
		form.setVia("0");
		form.setTerm("0");
		form.setRep("0");
		form.setPayMethod("0");
		form.setItemID("0");
		form.setMessage("0");
		form.setTaxID("0");
		form.setIsPending("false");
		form.setBalance(0.0);
		form.setWeight(0.0);
		form.setAdjustedtotal(0.0);
		form.setSubtotal(0.0);
		form.setShipping(0.0);
		form.setTotal(0.0);
		form.setItemShipped("");
		form.setTaxable("");
		form.setIsPending("");
		form.setPaid("");
		form.setBillTo("");
		form.setShipTo("");
		form.setMemo("");
		form.setShipDate(da);
		form.setTax(0.0);
		form.setItemID("0");
		request.setAttribute("IsDisplay", "false");
	}

	public void dropShipInvoice(HttpServletRequest request, InvoiceDto form, ConfigurationDto configDto) {
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		form.setOrderNo(invoice.getNewOrderNo(compId));
		DateInfo date = new DateInfo();
		int month = date.getMonth();
		int day = date.getDay();
		String d1 = "", d2 = "", d = "";

		if (month >= 1 && month <= 9)
			d = "0" + month;
		else
			d = "" + month;

		if (day >= 1 && day <= 9)
			d2 = "-0" + day;
		else
			d2 = "-" + day;

		d1 = d + d2 + "-" + (date.getYear());

		form.setPoNum((String) request.getParameter("DShipValue"));
		form.setOrderDate(d1);
		form.setCustID("0");
		form.setInvoiceStyle("0");
		form.setVia("0");
		form.setTerm("0");
		form.setRep("0");
		form.setPayMethod("0");
		form.setItemID("0");
		form.setMessage("0");
		form.setTaxID("0");
		form.setIsPending("false");
		form.setBalance(0.0);
		form.setWeight(0.0);
		form.setAdjustedtotal(0.0);
		form.setSubtotal(0.0);
		form.setShipping(0.0);
		form.setTotal(0.0);
		form.setItemShipped("false");
		form.setTaxable("false");
		form.setIsPending("false");
		form.setPaid("false");
		form.setBillTo("");
		form.setShipTo("");
		form.setShipDate("");
		form.setTax(0.0);
		form.setItemID("0");
	}

	public void makeSelectedOrderAsInvoice(HttpServletRequest request, int invoiceID) {
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		int orderNo = Integer.parseInt(invoice.getNewOrderNo(compId));
		boolean updateStatus = invoice.makeSelectedOrderAsInvoice(invoiceID, orderNo);
		if (updateStatus) {
			request.getSession().setAttribute("SaveStatus", "Selected record has become Invoice successfully.");
		} else {
			request.getSession().setAttribute("SaveStatus", "Selected record has not become Invoice successfully.");
		}
	}

	public void saveInvoice(HttpServletRequest request, InvoiceDto form, String custID) {
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		System.out.println("CustomerId is:" + custID);
		if (form.getOrderNo().contains("-")) {
			String orderNo = form.getOrderNo();
			form.setOrderNo(orderNo.substring(orderNo.indexOf("-") + 1));
		}
		boolean exist = invoiceInfoDao.invoiceExist(compId, form.getOrderNo());
		// int invoiceTypeId = 1; //INVOICE TYPE ID "INVOICE"
		if (exist == true) {
			int invoiceID = invoiceInfoDao.getInvoiceNo(compId, form.getOrderNo());
			boolean updateStatus = invoiceInfoDao.Update(compId, form, invoiceID, custID);
			request.getSession().setAttribute("SaveStatus",
					updateStatus ? "Invoice is updated successfully." : "Invoice is not updated successfully.");
		} else {
			boolean saveStatus = invoiceInfoDao.Save(compId, form, custID);
			request.getSession().setAttribute("SaveStatus",
					saveStatus ? "Invoice is saved successfully." : "Invoice is not saved successfully.");
		}
	}
	
	

	public void saveTranformInvoice(HttpServletRequest request, InvoiceDto form, String custID) {
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		System.out.println("CustomerId is:" + custID);
		String orderNum = String.valueOf(bcaInvoiceRepository.findMaxValueOfOrderNum());
		form.setOrderNo(orderNum + 1);
//		if (form.getOrderNo().contains("-")) {
//			String orderNo = form.getOrderNo();
//			form.setOrderNo(orderNo.substring(orderNo.indexOf("-") + 1));
//		}
//		boolean exist = invoiceInfoDao.invoiceExist(compId, form.getOrderNo());
//		// int invoiceTypeId = 1; //INVOICE TYPE ID "INVOICE"
//		if (exist == true) {
//			int invoiceID = invoiceInfoDao.getInvoiceNo(compId, form.getOrderNo());
//			boolean updateStatus = invoiceInfoDao.Update(compId, form, invoiceID, custID);
//			request.getSession().setAttribute("SaveStatus",
//					updateStatus ? "Invoice is updated successfully." : "Invoice is not updated successfully.");
//		} else {
		boolean saveStatus = invoiceInfoDao.Save(compId, form, custID);
		request.getSession().setAttribute("SaveStatus",
				saveStatus ? "Invoice is saved successfully." : "Invoice is not saved successfully.");
//		}
	}

	public void saveOrder(HttpServletRequest request, InvoiceDto form) throws SQLException {
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		if (form.getOrderNo().contains("-")) {
			String orderNo = form.getOrderNo();
			form.setOrderNo(orderNo.substring(orderNo.indexOf("-") + 1));
		}
		boolean exist = invoice.SalesOrderExist(compId, form.getOrderNo());
		int salesOrderType = 7;
		if (exist == true) {
			int invoiceID = invoice.getSalesInvoiceNo(compId, form.getOrderNo());
			boolean saveStatus = invoice.SalesUpdate(compId, form, salesOrderType, invoiceID);
			request.getSession().setAttribute("SaveStatus",
					saveStatus ? "Sales Order is updated successfully." : "Sales Order is not updated successfully.");
		} else {
			boolean saveStatus = invoice.SaveSalesOrder(compId, form, salesOrderType);
			request.getSession().setAttribute("SaveStatus",
					saveStatus ? "Sales Order is saved successfully." : "Sales Order is not saved successfully.");
		}
	}
	
	public void saveLayaways(HttpServletRequest request, InvoiceDto form) throws SQLException {
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		if (form.getOrderNo().contains("-")) {
			String orderNo = form.getOrderNo();
			form.setOrderNo(orderNo.substring(orderNo.indexOf("-") + 1));
		}
		boolean exist = invoice.SalesOrderExist(compId, form.getOrderNo());
		int layawaysType = 18;
		if (exist == true) {
			int invoiceID = invoice.getSalesInvoiceNo(compId, form.getOrderNo());
			boolean saveStatus = invoice.SalesUpdate(compId, form, layawaysType, invoiceID);
			request.getSession().setAttribute("SaveStatus",
					saveStatus ? "Layaways is updated successfully." : "Layaways is not updated successfully.");
		} else {
			boolean saveStatus = invoice.SaveSalesOrder(compId, form, layawaysType);
			request.getSession().setAttribute("SaveStatus",
					saveStatus ? "Layaways is saved successfully." : "Layaways is not saved successfully.");
		}
	}

	public boolean deleteInvoice(HttpServletRequest request, InvoiceDto form, String custID) throws SQLException {
		boolean val = false;
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		getInvoiceInfo(request);
		String orderNo = form.getOrderNo();
		boolean exist = invoice.invoiceExist(compId, orderNo);
		if (exist == true) {
			try {
				invoice.Delete(compId, orderNo);
				request.setAttribute("SaveStatus", "Invoice is successfully deleted.");
				val = true;
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		} else {
			request.setAttribute("SaveStatus", "Invoice is not found.");
			val = false;
		}
		return val;

	}

	public boolean deleteSalesOrder(HttpServletRequest request, InvoiceDto form) throws SQLException {
		boolean val = false;
		// boolean exist=invoice.invoiceExist(compId,form.getOrderNo());
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		String orderNo = form.getOrderNo();
		boolean exist = invoice.SalesOrderExist(compId, orderNo);
		if (exist == true) {
			try {
				invoice.DeleteOrder(compId, orderNo);
				request.setAttribute("SaveStatus", "Sales Order is successfully deleted.");
				val = true;
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		} else {
			request.setAttribute("SaveStatus", "Sales Order is not yet saved.");
			val = false;
		}
		return val;
	}

	public void getCustomerDetails(String cvId, HttpServletRequest request, CustomerDto customerDto) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
//		invoiceInfoDao.SearchCustomer(compId, cvId, request, customerDto);

//		bellow part is commented a conflict
//		ArrayList<CustomerDto> customerList =   invoiceInfoDao.SearchCustomer(compId, cvId, request, customerDto);
//		
//		System.err.println("customerList"+customerList.size());
//		if(customerList.size()>0)
//		{
//		CustomerDto customerDto2 = customerList.get(0);
//		String cityId = customerDto2.getCity();
//		String stateId = customerDto2.getState();
//		request.setAttribute("selectedCityId", cityId);
//		request.setAttribute("selectedStateId", stateId);

		ArrayList<CustomerDto> customerList = invoiceInfoDao.SearchCustomer(compId, cvId, request, customerDto);
		if (!customerList.isEmpty()) {
			CustomerDto customerDto2 = customerList.get(0);
			String cityId = customerDto2.getCityID();
			String stateId = customerDto2.getStateID();
			String countryId = customerDto2.getCountryID();
			String typeID = customerDto2.getCvCategoryTypeID();
			request.setAttribute("selectedCityId", cityId);
			request.setAttribute("selectedStateId", stateId);
			request.setAttribute("selectedCountryId", countryId);
			request.setAttribute("selectedTypeID", typeID);

		}

		invoiceInfoDao.getServices(request, compId, cvId);
		// String itemIndex = request.getParameter("itemIndex");
		// request.setAttribute("itemIndex", itemIndex);
	}

	public void getContactDetails(String cvId, HttpServletRequest request, CustomerDto customerDto) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
//		invoiceInfoDao.SearchCustomer(compId, cvId, request, customerDto);
		ArrayList<CustomerDto> customerList = invoiceInfoDao.searchContact(compId, cvId, request, customerDto);
		CustomerDto customerDto2 = customerList.get(0);
		String cityId = customerDto2.getCity();
		String stateId = customerDto2.getState();
		String countryId = customerDto2.getCountry();
		request.setAttribute("selectedCityId", cityId);
		request.setAttribute("selectedStateId", stateId);
		request.setAttribute("selectedCountryId", countryId);

		invoiceInfoDao.getServices(request, compId, cvId);
		// String itemIndex = request.getParameter("itemIndex");
		// request.setAttribute("itemIndex", itemIndex);
	}

	public void addCustomerCreditCard(CustomerDto c, HttpServletRequest request) {
//		PurchaseInfo pinfo = new PurchaseInfo();
		int cvID = Integer.parseInt(c.getCustId());
		purchaseInfo.insertVendorCreditCard(cvID, c.getCcType(), c.getCardNo(), c.getExpDate(), c.getCw2(),
				c.getCardHolderName(), c.getCardBillAddress(), c.getCardZip());
	}

	public InvoiceDto getInvoiceDetailsByBtnName(HttpServletRequest request, InvoiceDto invoiceDto) {
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		Long orderNo = invoiceInfoDao.getInvoiceOrderNumberByBtnName(compId, request);
		ArrayList<InvoiceDto> list = invoiceInfoDao.getRecord(request, invoiceDto, compId, orderNo);
		if (!list.isEmpty()) {
			invoiceDto = list.get(0);
			request.setAttribute("Enable", "true");
			request.setAttribute("Status", "");
		} else {
			request.setAttribute("Status", "There is no invoice.");
		}
		return invoiceDto;
	}

	public InvoiceDto transformSoToInvoice(HttpServletRequest request, InvoiceDto invoiceDto) {
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
//		Long orderNo = invoiceInfoDao.getInvoiceOrderNumberByBtnName(compId, request);
		int orderNo = invoiceInfoDao.getSalesOrderNumberByTransformBtnName(compId, request);
//		String custId=String.valueOf(orderNo);
//		saveTranformInvoice(request, invoiceDto, custId);
		ArrayList<InvoiceDto> list = invoiceInfoDao.getRecord(request, invoiceDto, compId, orderNo);
		if (!list.isEmpty()) {
			invoiceDto = list.get(0);
			request.setAttribute("Enable", "true");
			request.setAttribute("Status", "");
		} else {
			request.setAttribute("Status", "There is no invoice.");
		}
		return invoiceDto;
	}

	public InvoiceDto getSalesOrderDetailsByBtnName(HttpServletRequest request, InvoiceDto invoiceDto)
			throws SQLException {
//		InvoiceInfoDao invoiceInfoDao = new InvoiceInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		Long orderNo = invoiceInfoDao.getSalesOrderNumberByBtnName(compId, request);
		invoiceDto.setTabid("IBLU");

		ArrayList<InvoiceDto> list = invoiceInfoDao.getRecord(request, invoiceDto, compId, orderNo);
		if (!list.isEmpty()) {
			invoiceDto = list.get(0);
			request.setAttribute("Enable", "true");
			request.setAttribute("Status", "");
		} else {
			request.setAttribute("Status", "There is no SalesOrder.");
		}
		return invoiceDto;
	}

	public void payHistory(String cvId, HttpServletRequest request) {
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		invoice.paymentHistory(cvId, compId, request);
	}

	public boolean sendEmailInfo(String ordNo, HttpServletRequest request, String orderType, InvoiceDto invoiceDto) {
		boolean result = false;
		String compId = (String) request.getSession().getAttribute("CID");

		long invoiceID = invoice.getInvoiceID(compId, ordNo, orderType);

		invoice.emailInfo(request, invoiceID, compId, ordNo, invoiceDto);
		return result;
	}

	public void sendEmail(HttpServletRequest request, InvoiceDto form) {
		String compId = (String) request.getSession().getAttribute("CID");
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		boolean isSent = invoice.send(compId, form);
		String msg = "";
		if (isSent)
			msg = "Mail send Successfully";
		else
			msg = "Error occurred during sending email";
		request.setAttribute("Result", msg);
	}

	public void sendEmailOnCustomerBoard(HttpServletRequest request, EmailSenderDto form) {
		MailSend mailSend = new MailSend();
		boolean isSend = mailSend.sendMail(form.getTo(), form.getSubject(), form.getMessage(), form.getFrom());
	}

	public void getLookup(String cvId, HttpServletRequest request, CustomerDto uform) {

		// HttpSession sess = request.getSession();
		// String compId = (String) sess.getAttribute("CID");
		String cond = null;
		// int flag = 0;
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		ArrayList lookDetails = new ArrayList();
		cond = uform.getDispay_info();
		Loger.log("The Show all" + uform.getDispay_info());
		Loger.log("The Client Vendor Id is" + cvId);
		/*
		 * if(cond.equalsIgnoreCase("ShowAll")) { flag=1; } else { flag=0; }
		 */
		String periodFrom = uform.getPeriodFrom();
		String periodTo = uform.getPeriodTo();
		Loger.log("The From Date is________ " + uform.getPeriodFrom());
		Loger.log("The To date is*******______________ " + uform.getPeriodTo());
		Loger.log("****************cond  " + cond);
		lookDetails = invoice.searchHistory(request, cond, cvId, periodFrom, periodTo);
		request.setAttribute("LookupDetails", lookDetails);

	}

	public void getCustLookup(String cvId, HttpServletRequest request, CustomerDto uform) {

		// HttpSession sess = request.getSession();
		// String compId = (String) sess.getAttribute("CID");
		String cond = null;
		// int flag = 0;
		InvoiceInfoDao invoice = new InvoiceInfoDao();
		ArrayList lookDetails = new ArrayList();

		cond = uform.getDispay_info();
		Loger.log("The Show all" + uform.getDispay_info());
		Loger.log("The Client Vendor Id is" + cvId);
		/*
		 * if(cond.equalsIgnoreCase("ShowAll")) { flag=1; } else { flag=0; }
		 */
		String periodFrom = uform.getPeriodFrom();
		String periodTo = uform.getPeriodTo();
		Loger.log("The From Date is " + uform.getPeriodFrom());
		Loger.log("The To date is " + uform.getPeriodTo());
		lookDetails = invoice.searchHistory(request, cond, cvId, periodFrom, periodTo);
		request.setAttribute("LookupDetails", lookDetails);
	}

	public void newEstimation(HttpServletRequest request, EstimationDto estimationDto) throws SQLException {
//		EstimationInfoDao estimation = new EstimationInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		String estNum = estimationInfoDao.getNewEstimationNo(compId);
		estimationDto.setPoNum("0");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		estimationDto.setOrderNo(estNum);
		DateInfo date = new DateInfo();
		int month = date.getMonth();
		int day = date.getDay();

		String da = "", d = "", m = "";
		if (month >= 1 && month <= 9) {
			m = "0" + month;
		} else
			m = "" + month;
		if (day >= 1 && day <= 9) {
			d = "0" + day;
		} else
			d = "" + day;
		da = m + "-" + d + "-" + (date.getYear());

		estimationDto.setOrderDate(da);

		estimationDto.setCustID("0");
		estimationDto.setInvoiceStyle("1");
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
		Loger.log("COMPID ==>" + compId);
	}

	public void saveEstimation(HttpServletRequest request, EstimationDto estimationDto) throws SQLException {
		EstimationInfo invoice = new EstimationInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		getInvoiceInfo(request);
		boolean exist = invoice.estimationExist(compId, estimationDto.getOrderNo());
		if (exist == true) {
			try {
				invoice.Update(compId, estimationDto);
				newEstimation(request, estimationDto);
				request.setAttribute("SaveStatus", "Estimation is successfully updated.");
			} catch (Exception e) {
				Loger.log(e.toString());
				request.setAttribute("SaveStatus", "Estimation is not updated.");
			}
		} else {
			try {
				invoice.Save(compId, estimationDto);
				newEstimation(request, estimationDto);
				request.setAttribute("SaveStatus", "Estimation is successfully saved.");
			} catch (Exception e) {
				Loger.log(e.toString());
				request.setAttribute("SaveStatus", "Estimation is not saved.");
			}
		}

	}

	public EstimationDto getEstimationDetailsByBtnName(HttpServletRequest request, EstimationDto estimationDto)
			throws SQLException {
//		EstimationInfo estInfo = new EstimationInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		Long estNo = estimationInfo.getEstimationNumberByBtnName(compId, request);
		ArrayList<EstimationDto> list = estimationInfo.getRecord(request, estimationDto, compId, estNo);
		if (!list.isEmpty()) {
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
		EstimationInfo invoice = new EstimationInfo();
		String compId = (String) request.getSession().getAttribute("CID");
		getInvoiceInfo(request);

		String estNo = estimationDto.getOrderNo();
		boolean exist = invoice.estimationExist(compId, estNo);
		if (exist == true) {
			try {
				invoice.Delete(compId, estNo);
				newEstimation(request, estimationDto);
				request.setAttribute("SaveStatus", "Estimation is successfully deleted.");
				val = true;
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		} else {
			request.setAttribute("SaveStatus", "This invoice is not yet saved.");
			val = false;
			newEstimation(request, estimationDto);

		}
		return val;

	}

	public void getProfitLossDetail(HttpServletRequest request, CustomerDto cForm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		CustomerInfoDao customer = new CustomerInfoDao();
		String fromDate = cForm.getFromDate();
		String toDate = cForm.getToDate();
		String sortBy = cForm.getSortBy();
		String datesCombo = cForm.getDatesCombo();
		customer.getProfitLossDetailReport(datesCombo, fromDate, toDate, sortBy, compId, request, cForm);

	}

	public void getProfitLosByItem(HttpServletRequest request, ItemDto iForm) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		ItemInfoDao itemInfo = new ItemInfoDao();
		String fromDate = iForm.getFromDate();
		String toDate = iForm.getToDate();
		String sortBy = iForm.getSortBy();
		String datesCombo = iForm.getDatesCombo();
		ArrayList<ItemDto> profitLossByItem = itemInfo.getProfitLossReportByItem(datesCombo, fromDate, toDate, sortBy,
				compId, request, iForm);
		request.setAttribute("profitLossByItem", profitLossByItem);
	}

	public void getAccountPayableGraph(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		ArrayList<EsalesPOJO> graphDetail = new ArrayList<>();
		String compId = (String) sess.getAttribute("CID");
		// AccountForm aForm = (AccountForm)form;
		AccountingDAO acd = new AccountingDAO();

		graphDetail = acd.getAccountPayableGraph(compId, request);
	}

	public void getBudgetVsActual(HttpServletRequest request) {
		int year = Calendar.getInstance().get(Calendar.YEAR) + 1;
		System.out.println("Current Year for budget vs actual is:" + year);
		request.setAttribute("Year", year);
	}

	public void getBudgetOverview(HttpServletRequest request) {
		int year = Calendar.getInstance().get(Calendar.YEAR) + 1;
		System.out.println("Current Year for budget overview is:" + year);
		String month[] = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
		for (int i = 0; i < month.length; i++) {
			System.out.println("Budget Year:" + month[i] + year);
		}
		request.setAttribute("Year", year);
	}

	public ArrayList<CustomerDto> getSortedCustomer(HttpServletRequest request, CustomerDto frm, int sortById) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
		CustomerInfoDao customer = new CustomerInfoDao();
		ArrayList<CustomerDto> CustomerDetails = new ArrayList<>();
		if (sortById == 1) {
			CustomerDetails = customer.customerDetailsSort(compId, "Name");
		} else if (sortById == 2) {
			CustomerDetails = customer.customerDetailsSort(compId, "FirstName");
		} else if (sortById == 3) {
			CustomerDetails = customer.customerDetailsSort(compId, "LastName");
		}
		request.setAttribute("CustomerDetails", CustomerDetails);
		return CustomerDetails;
	}

	public ArrayList<CustomerDto> getSearchedCustomers(HttpServletRequest request) {
		String compId = (String) request.getSession().getAttribute("CID");
		String venderText = request.getParameter("venderText");
		CustomerInfoDao customer = new CustomerInfoDao();
		ArrayList<CustomerDto> CustomerDetails = customer.searchCustomers(compId, venderText);
		request.setAttribute("CustomerDetails", CustomerDetails);
		return CustomerDetails;
	}

	public void setUnitPrice(String companyID, int itemId, double price) {
//		CustomerInfoDao customer = new CustomerInfoDao();
		customerInfoDao.setNewUnitPrice(companyID, itemId, price);
	}

	public void setItemName(String companyID, int itemId, String itemName) {
//		CustomerInfoDao customer = new CustomerInfoDao();
		customerInfoDao.setNewitemName(companyID, itemId, itemName);
	}

	public void setUnitPriceEstimation(String companyID, int itemId, double price) {
		CustomerInfoDao customer = new CustomerInfoDao();
		customer.setUnitPriceEstimation(companyID, itemId, price);
	}

	public void setItemNameEstimation(String companyID, int itemId, String itemName) {
		CustomerInfoDao customer = new CustomerInfoDao();
		customer.setNewitemNameEstimation(companyID, itemId, itemName);
	}

	public void getSortedEstimationInfo(HttpServletRequest request, String sort) throws SQLException {
		String compId = (String) request.getSession().getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
//		ItemInfo item = new ItemInfo();
		ArrayList ClientDetails = new ArrayList();
		if (sort.equals("Name")) {
			ClientDetails = invoiceInfoDao.customerDetails(compId, request);
			System.out.println("Calling sortByName method and getting data:" + ClientDetails.toString());
		} else {
			ClientDetails = invoiceInfoDao.sortedcustomerDetails(compId, request, sort);
			System.out.println("Calling sortByLastName method and getting data:" + ClientDetails.toString());
		}
		request.setAttribute("CDetails", ClientDetails);

		String companyName = (String) request.getSession().getAttribute("user");
		ArrayList shAddr = invoiceInfoDao.shipAddress(compId, null);
		request.setAttribute("ShAddr", shAddr);

		ArrayList billAddr = invoiceInfoDao.billAddress(compId, null);
		request.getSession().setAttribute("BillAddr", billAddr);

		/* Invoice Style */
		ArrayList InvoiceStyle = new ArrayList();
		InvoiceStyle = invoiceInfoDao.getInvoiceStyle();
		request.setAttribute("InvoiceStyle", InvoiceStyle);

		/* Via Information */
		ArrayList via = new ArrayList();
		via = invoiceInfoDao.getVia(compId);
		request.setAttribute("Via", via);

		/* Rep Information */
		ArrayList rep = new ArrayList();
		rep = invoiceInfoDao.getRep(compId);
		request.getSession().setAttribute("Rep", rep);

		/* Term Information */
		ArrayList term = new ArrayList();
		term = invoiceInfoDao.getTerm(compId);
		request.setAttribute("Term", term);

		/* Term Information */
		ArrayList payMethod = new ArrayList();
		payMethod = invoiceInfoDao.getPayMethod(compId);
		request.setAttribute("PayMethod", payMethod);

		/* Messages */
		ArrayList message = new ArrayList();
		message = invoiceInfoDao.getMessage(compId);
		request.setAttribute("Message", message);

		/* Tax */
		ArrayList tax = new ArrayList();
		tax = invoiceInfoDao.getTaxes(compId);
		request.setAttribute("Tax", tax);

		/* Item List */
		ArrayList itemList = new ArrayList();
		itemList = invoiceInfoDao.getItemList(compId);
		request.setAttribute("ItemList", itemList);

	}

	private boolean isInvoiceCustomerIdExists(String custID, HttpServletRequest request) {
		boolean isFound = false;
		List<LabelValueBean> customerList = (List<LabelValueBean>) request.getAttribute("CDetails");
		for (LabelValueBean item : customerList) {
			if (custID.equals(item.getValue())) {
				isFound = true;
				break;
			}
		}
		return isFound;
	}

	public boolean deleteInvoiceById(HttpServletRequest request, List<Integer> invoiceids) throws SQLException {
		boolean val = false;
		String compId = (String) request.getSession().getAttribute("CID");
		try {
			Long cId = Long.valueOf(compId);
			int status = bcaInvoiceRepository.updateBcaInvoiceByInvoiceIds(cId, invoiceids);
			request.setAttribute("SaveStatus", "Sales Order is successfully deleted.");
			val = true;
		} catch (Exception e) {
			Loger.log(e.toString());
			request.setAttribute("SaveStatus", "Sales Order is not yet deleted.");
			val = false;
		}
		return val;
	}

}
