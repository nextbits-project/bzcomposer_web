package com.nxsol.bzcomposer.company.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.util.LabelValueBean;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.employee.dao.Title;
import com.avibha.bizcomposer.purchase.dao.CreditCard;
import com.avibha.bizcomposer.purchase.dao.PayMethod;
import com.avibha.bizcomposer.purchase.dao.Rep;
import com.avibha.bizcomposer.purchase.dao.Shipping;
import com.avibha.bizcomposer.purchase.dao.Term;
import com.avibha.bizcomposer.purchase.dao.VendorCategory;
import com.avibha.bizcomposer.sales.dao.CustomerInfoDao;
import com.avibha.bizcomposer.sales.dao.InvoiceInfo;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dao.TrHistoryLookUp;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaTitle;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaTitleRepository;

@Service
public class BcaClientvendorService {

	@Autowired
	BcaClientvendorRepository clientVendorRepo;

	@Autowired
	BcaCompanyRepository bcaCompanyRepo;

	@Autowired
	private BcaTitleRepository titleRepository;

	@Autowired
	private CountryState countryState;

	@Autowired
	private InvoiceInfoDao invoiceInfoDao;

	@PersistenceContext
	private EntityManager em;

	@Autowired
	private Title title;
	@Autowired
	private Term term;
	@Autowired
	private PayMethod payMethod;
	@Autowired
	private Shipping shipping;
	@Autowired
	private Rep rep;
	@Autowired
	private CreditCard creditCard;
	@Autowired
	private VendorCategory vendorCategory;

	@Autowired
	private CustomerInfoDao customerInfoDao;

	@Autowired
	private CountryState cs;

	@Cacheable(value = "customerDetailsCache", key = "#compId")
	public ArrayList<CustomerDto> customerDetails(String compId) {
		BcaCompany company = bcaCompanyRepo.getOne(Long.parseLong(compId));
		List<Object[]> clientVendors = clientVendorRepo.fetchClientVendorDetails(company);

		// Transform entities to DTOs
		ArrayList<CustomerDto> customerDtos = transformToDtos(clientVendors);
		return customerDtos;
	}

	public ArrayList<CustomerDto> transformToDtos(List<Object[]> clientVendorList) {
		ArrayList<CustomerDto> cusDtoList = new ArrayList<>();

		for (Object[] clientVendors : clientVendorList) {
			CustomerDto dto = transformToDto(clientVendors);
			cusDtoList.add(dto);
		}

		return cusDtoList;
	}

	private CustomerDto transformToDto(Object[] clientVendors) {
		CustomerDto cusDto = new CustomerDto();

		// clientVendors[0] is clientVendorId, clientVendors[1] is name, etc.
		if(clientVendors[0] != null)
			cusDto.setClientVendorID(clientVendors[0].toString());
		
		if(clientVendors[1] != null)
			cusDto.setCompanyName(clientVendors[1].toString());
		
		if(clientVendors[2] != null)
			cusDto.setTitle(clientVendors[2].toString());
		
		if(clientVendors[3] != null)
			cusDto.setFirstName(clientVendors[3].toString());
		
		if(clientVendors[4] != null)
			cusDto.setLastName(clientVendors[4].toString());
		
		if(clientVendors[5] != null)
			cusDto.setAddress1(clientVendors[5].toString());
		
		if(clientVendors[6] != null)
			cusDto.setAddress2(clientVendors[6].toString());
		
		if(clientVendors[10] != null)
			cusDto.setEmail(clientVendors[10].toString());
		
		if(clientVendors[11] != null)
			cusDto.setPhone(clientVendors[11].toString());
		
		if(clientVendors[12] != null)
			cusDto.setCellPhone(clientVendors[12].toString());
		
		if(clientVendors[13] != null)
			cusDto.setFax(clientVendors[13].toString());
		
		if(clientVendors[14] != null)
			cusDto.setDateAdded(clientVendors[14].toString());

		if(clientVendors[15] != null)
			cusDto.setPaymentUnpaid(Boolean.valueOf(clientVendors[15] != null ? clientVendors[15].toString() : ""));
//		cusDto.setType(clientVendors[16].toString());
		
		if(clientVendors[16] != null)
			cusDto.setType(clientVendors[16] != null ? clientVendors[16].toString() : "");

		if(clientVendors[17] != null)
			cusDto.setZipCode(clientVendors[17].toString());
		
		if(clientVendors[18] != null)
			cusDto.setCity(clientVendors[18].toString());
		
		if(clientVendors[19] != null)
			cusDto.setStateName(clientVendors[19].toString());
		
		if(clientVendors[20] != null)
			cusDto.setCountry(clientVendors[20].toString());

		if(clientVendors[21] != null)
			cusDto.setDbaName(clientVendors[21].toString());
		
		if(clientVendors[22] != null)
			cusDto.setLastOrderDate(clientVendors[22] != null ? clientVendors[22].toString() : "");

		cusDto.setActive(true);

		return cusDto;
	}

	public ArrayList<CustomerDto> customerDetailsOld(String compId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<CustomerDto> objList = new ArrayList<>();
		ResultSet rs = null;
		// CountryState cs = new CountryState();
		Title title = new Title();
		try {
			con = db.getConnection();
			ArrayList<LabelValueBean> titleList = title.getTitleList(compId);

			String sqlString = "SELECT distinct c.ClientVendorID,c.Name,c.CustomerTitle,c.FirstName,c.LastName,c.Address1,c.Address2,c.City,c.State,c.ZipCode,c.Country,"
					+ "c.Email,c.Phone,c.CellPhone,c.Fax,date_format(c.DateAdded,'%m-%d-%Y') as DateAdded,i.IsPaymentCompleted,c.CVCategoryName,"
					+ "ct.Name AS CityName, st.Name AS StateName, cn.Name AS CountryName, c.DBAName "
					+ "FROM bca_clientvendor AS c LEFT JOIN bca_countries as cn ON cn.ID=c.Country LEFT JOIN bca_states as st ON st.ID=c.State LEFT JOIN bca_cities as ct ON ct.ID=c.City "
					+ "LEFT JOIN bca_invoice as i ON i.ClientVendorID=c.ClientVendorID AND NOT (i.invoiceStatus=1) AND i.IsPaymentCompleted = 0 AND i.InvoiceTypeID IN (1,13,17) "
					+ "WHERE c.CompanyID = " + compId
					+ " AND CVTypeID IN (1, 2) AND c.Status IN ('U', 'N') AND c.Deleted = 0 AND c.Active=1 ORDER BY c.Name";
			pstmt = con.prepareStatement(sqlString);
			// Loger.log(sqlString);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CustomerDto customer = new CustomerDto();
				customer.setClientVendorID(rs.getString("ClientVendorID"));
				customer.setCompanyName(rs.getString("Name"));
				customer.setCname(
						rs.getString("Name") + "(" + rs.getString("FirstName") + " " + rs.getString("LastName") + ")");
				customer.setTitle(rs.getString("CustomerTitle"));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setLastName(rs.getString("LastName"));
				customer.setAddress1(rs.getString("Address1"));
				customer.setAddress2(rs.getString("Address2"));
				customer.setZipCode(rs.getString("ZipCode"));
				customer.setCity(rs.getString("CityName") != null ? rs.getString("CityName") : rs.getString("City"));
				customer.setStateName(
						rs.getString("StateName") != null ? rs.getString("StateName") : rs.getString("State"));
				String countryName = rs.getString("CountryName") != null ? rs.getString("CountryName")
						: rs.getString("Country");
				if (countryName != null && countryName.contains("United States")) {
					countryName = "USA";
				}
				customer.setCountry(countryName);
				customer.setEmail(rs.getString("Email"));
				customer.setPhone(rs.getString("Phone"));
				customer.setCellPhone(rs.getString("CellPhone"));
				customer.setFax(rs.getString("Fax"));
				customer.setDateAdded(rs.getString("DateAdded"));

				customer.setFullName(rs.getString("FirstName") + " " + rs.getString("LastName"));
				customer.setBillTo(rs.getString("FirstName") + rs.getString("LastName"));
				boolean paymentUnpaid = (rs.getString("IsPaymentCompleted") != null
						&& rs.getString("IsPaymentCompleted").equals("0")) ? true : false;
				customer.setPaymentUnpaid(paymentUnpaid);
				customer.setType(rs.getString("CVCategoryName"));
				customer.setDbaName(rs.getString("DBAName"));
				for (LabelValueBean lvBean : titleList) {
					if (lvBean.getValue().equalsIgnoreCase(customer.getTitle())) {
						customer.setTitle(lvBean.getLabel());
						break;
					}
				}
				objList.add(customer);
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class CustomerInfo and  method -customerDetails " + " " + ee.toString());

		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (pstmt != null) {
					db.close(pstmt);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return objList;
	}

	public String getCustomerList(HttpServletRequest request) {
		String compId = (String) request.getSession().getAttribute("CID");
//		String action = ConstValue.hateNull(request.getParameter("tabid"));
//		CustomerInfoDao customer = new CustomerInfoDao();
//		InvoiceInfo invoiceInfo = new InvoiceInfo();
		List<CustomerDto> customerList = this.customerDetails(compId);
//		if (action.equalsIgnoreCase("Customer") || action.equalsIgnoreCase("ContactBoard")) {
//			List<TrHistoryLookUp> hlookupList = invoiceInfo.searchHistory(request, "ShowAll", "", null, null);
//			for (CustomerDto cust : customerList) {
//				double balance = 0.0;
//				long invoiceID = 0;
//				for (TrHistoryLookUp hlookup : hlookupList) {
//					if (cust.getClientVendorID().equals(hlookup.getClientVendorID())) {
//						balance = balance + Double.parseDouble(hlookup.getBalance());
//						if (invoiceID == 0 || invoiceID < Integer.parseInt(hlookup.getInvoiceId())) {
//							cust.setLastOrderDate(hlookup.getDateAdded());
//						}
//						invoiceID = Integer.parseInt(hlookup.getInvoiceId());
//					}
//				}
//				cust.setTotalOverdueAmt(balance);
//			}
//		}
		request.setAttribute("CustomerDetails", customerList);
		request.setAttribute("customerList", customerList);
		String firstCvID = null;
		if (!customerList.isEmpty()) {
			firstCvID = String.valueOf(customerList.get(0).getClientVendorID());
		}
		return firstCvID;
	}

	@Autowired
	private InvoiceInfoDao invoice;

	public void searchSelectedCustomer(String cvId, HttpServletRequest request, CustomerDto form) {
		HttpSession sess = request.getSession();
		String compId = (String) sess.getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		// Loger.log("The Client vendor is from sales detail is " + cvId);
		invoice.searchSelectedCustomer(compId, cvId, request);
		invoice.getServices(request, compId, cvId);
//		 request.setAttribute("CustomerDetails", CustomerDetails);
	}

	public void getAllList(HttpServletRequest request) {
		HttpSession sess = request.getSession();
		String cid = (String) sess.getAttribute("CID");
		String countryID = ConstValue.countryID;
		String stateID = ConstValue.stateID;
		String action = ConstValue.hateNull(request.getParameter("tabid"));
		if (action.equalsIgnoreCase("editCustomer")) {
			CustomerDto customer = (CustomerDto) request.getAttribute("CustomerDetails");
			countryID = customer.getCountry();
			stateID = customer.getState();
			request.setAttribute("stateList2", countryState.getStateList(customer.getBscountry()));
			request.setAttribute("cityList2", countryState.getCityList(customer.getBsstate()));
			request.setAttribute("stateList3", countryState.getStateList(customer.getShcountry()));
			request.setAttribute("cityList3", countryState.getCityList(customer.getShstate()));
		}
		// country List
		request.setAttribute("cList", countryState.getCountry());
		request.setAttribute("countryList", countryState.getCountryList());
		request.setAttribute("stateList", countryState.getStateList(countryID));
		request.setAttribute("cityList", countryState.getCityList(stateID));

		// Title List
//		Title t = new Title();
		request.setAttribute("titleList", title.getTitleList(cid));

		// Term List
//		Term tr = new Term();
		request.setAttribute("TermList", term.getTermList(cid));

		// Rep List
//		Rep rap = new Rep();
		request.setAttribute("RepList", rep.getRepList(cid));

		// PayMethod List
//		PayMethod pmethod = new PayMethod();
		request.setAttribute("PaymentList", payMethod.getPaymentTypeList(cid));

		// ShipCarrier List
//		Shipping ship = new Shipping();
		request.setAttribute("ShipCarrierList", shipping.getShipCarrierList(cid));

		// CreditCard List
//		CreditCard cc = new CreditCard();
		request.setAttribute("CreditCardList", creditCard.getCCTypeList(cid));

		// VendorCategoryList List
//		VendorCategory cv = new VendorCategory();
		request.setAttribute("VendorCategoryList", vendorCategory.getCVCategoryList(cid));

		// customerGroupList List
		request.setAttribute("customerGroupList", vendorCategory.getCustomerGroupList());

		/* Item List */
		String compId = (String) request.getSession().getAttribute("CID");
//		InvoiceInfoDao invoice = new InvoiceInfoDao();
		ArrayList itemList = new ArrayList();
		itemList = invoiceInfoDao.getItemList(compId);
		request.setAttribute("ItemList", itemList);

//		CustomerInfoDao customer = new CustomerInfoDao();
		customerInfoDao.getServices(request, cid);
	}

}
