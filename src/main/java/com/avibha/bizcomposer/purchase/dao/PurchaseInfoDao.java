/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.purchase.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.purchase.forms.PrintLabelDto;
import com.avibha.bizcomposer.purchase.forms.PurchaseBoardDto;
import com.avibha.bizcomposer.purchase.forms.VendorDto;
import com.avibha.bizcomposer.sales.dao.CustomerInfo;
import com.avibha.bizcomposer.sales.forms.CreditCardDto;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.avibha.common.utility.DateInfo;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaBsaddress;
import com.nxsol.bzcomposer.company.domain.BcaCctype;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaClientvendorfinancecharges;
import com.nxsol.bzcomposer.company.domain.BcaClientvendorservice;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCvcreditcard;
import com.nxsol.bzcomposer.company.domain.BcaInvoicestyle;
import com.nxsol.bzcomposer.company.domain.BcaLabel;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.domain.BcaServicetype;
import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;
import com.nxsol.bzcomposer.company.domain.BcaTerm;
import com.nxsol.bzcomposer.company.repos.BcaBillingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaBsaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaCctypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorfinancechargesRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorserviceRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCreditcardtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaCvcreditcardRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoicestyleRepository;
import com.nxsol.bzcomposer.company.repos.BcaLabelRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaServicetypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;
import com.nxsol.bzcomposer.company.repos.BcaShippingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;
import com.nxsol.bzcomposer.company.utils.DateHelper;
import com.nxsol.bzcomposer.company.utils.JpaHelper;
import com.pritesh.bizcomposer.accounting.bean.TblBSAddress2;

/* 
 * 
 */

@Service
public class PurchaseInfoDao {

	@Autowired
	private BcaTermRepository bcaTermRepository;

	@Autowired
	private CountryState countryState;

	@Autowired
	private BcaClientvendorRepository bcaClientvendorRepository;

	@Autowired
	private BcaClientvendorserviceRepository bcaClientvendorserviceRepository;

	@Autowired
	private BcaServicetypeRepository bcaServicetypeRepository;

	@Autowired
	private BcaLabelRepository bcaLabelRepository;

	@Autowired
	private EntityManager entityManager;

	@Autowired
	private BcaBillingaddressRepository bcaBillingaddressRepository;

	@Autowired
	private BcaShippingaddressRepository bcaShippingaddressRepository;

	@Autowired
	private BcaInvoicestyleRepository bcaInvoicestyleRepository;
	@Autowired
	private BcaCvcreditcardRepository bcaCvcreditcardRepository;

	@Autowired
	private BcaCreditcardtypeRepository bcaCreditcardtypeRepository;

	@Autowired
	private CustomerInfo customerInfo;

	@Autowired
	private PurchaseInfo purchaseInfo;

	@Autowired
	private PurchaseInfoDao purchaseInfoDao;

	@Autowired
	private VendorCategory vendorCategory;

	@Autowired
	private BcaCompanyRepository bcaCompanyRepository;

	@Autowired
	private BcaSalesrepRepository bcaSalesrepRepository;

	@Autowired
	private BcaShipcarrierRepository bcaShipcarrierRepository;

	@Autowired
	private BcaPaymenttypeRepository bcaPaymenttypeRepository;

	@Autowired
	private BcaBsaddressRepository bcaBsaddressRepository;

	@Autowired
	private BcaClientvendorfinancechargesRepository bcaClientvendorfinancechargesRepository;

	@Autowired
	private BcaCctypeRepository bcaCctypeRepository;

	/*
	 * The method display all the list of vendors which is useful for the vendors
	 * tab in the purchase tab
	 */
	public ArrayList VendorInfo(String compId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt_clientSer = null;
		PreparedStatement pstmt_ser = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<VendorDto> objList = new ArrayList<VendorDto>();
		ArrayList<VendorDto> serviceList = new ArrayList<VendorDto>();
		ResultSet rs = null;
		ResultSet rs_clientSer = null;
		ResultSet rs_ser = null;
		con = db.getConnection();

		try {

			String sqlString = "select ClientVendorID,Name,FirstName,LastName,Phone,Fax,Email,Address1,Address2,City,State,Province,Country,"
					+ "ZipCode,Detail,date_format(DateAdded,'%m-%d-%Y') as DateAdded from bca_clientvendor where (CVTypeID=1 or CVTypeID=3 )and"
					+ " Status in ('N','U') and Deleted=0 and Active=1 and CompanyID=? order by Name";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, compId);
			// Loger.log(sqlString);
			rs = pstmt.executeQuery();
			CountryState cs = new CountryState();
			while (rs.next()) {
				VendorDto vendor = new VendorDto();
				vendor.setClientVendorID(rs.getString(1));
				vendor.setCname(rs.getString(2));
				vendor.setFirstName(rs.getString(3));
				vendor.setLastName(rs.getString(4));
				System.out.println(rs.getString(4));
				vendor.setPhone(rs.getString(5));
				vendor.setFax(rs.getString(6));
				vendor.setEmail(rs.getString(7));
				vendor.setAddress1(rs.getString(8));
				vendor.setAddress2(rs.getString(9));
				vendor.setCity(rs.getString(10));
				String Statename = cs.getStatesName(rs.getString(11));
				vendor.setStateName(Statename);
				vendor.setProvince(rs.getString(12));
				String conunrtyname = cs.getCountryName(rs.getString(13));
				vendor.setCountry(conunrtyname);
				vendor.setZipCode(rs.getString(14));
				vendor.setMemo(rs.getString(15));
				vendor.setDateAdded(rs.getString(16));
				String sqlServiceID = "select ServiceID from bca_clientvendorservice where ClientVendorID=?";
				pstmt_clientSer = con.prepareStatement(sqlServiceID);
				pstmt_clientSer.setString(1, vendor.getClientVendorID());
				rs_clientSer = pstmt_clientSer.executeQuery();
				String services = "select ServiceName from bca_servicetype where ServiceID=?";
				while (rs_clientSer.next()) {
					VendorDto vendorService = new VendorDto();
					pstmt_ser = con.prepareStatement(services);
					pstmt_ser.setInt(1, rs_clientSer.getInt("ServiceID"));
					rs_ser = pstmt_ser.executeQuery();
					if (rs_ser.next()) {
						vendorService.setClientVendorID(vendor.getClientVendorID());
						vendorService.setServiceName(rs_ser.getString("ServiceName"));
					}

					serviceList.add(vendorService);
				}
				objList.add(vendor);

			}

			// request.setAttribute("Services", serviceList);
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());
		} finally {

			if (rs != null) {
				db.close(rs);
			}
			if (rs_clientSer != null) {
				db.close(rs_clientSer);
			}
			if (rs_ser != null) {
				db.close(rs_ser);
			}
			if (pstmt != null) {
				db.close(pstmt);
			}
			if (pstmt_clientSer != null) {
				db.close(pstmt_clientSer);
			}
			if (pstmt_ser != null) {
				db.close(pstmt_ser);
			}
			if (con != null) {
				db.close(con);
			}

		}
		return objList;
	}

	/* vendor contact list */
	public ArrayList vendorContactList(String datesCombo, String fromDate, String toDate, String sortBy, String cId,
			HttpServletRequest request, PurchaseBoardDto form) {
		ArrayList<VendorDto> objList = new ArrayList<VendorDto>();
		ArrayList<VendorDto> serviceList = new ArrayList<VendorDto>();
		String dateBetween = "";
		ArrayList<Date> selectedRange = new ArrayList<>();
		DateInfo dInfo = new DateInfo();

		if (datesCombo != null && !datesCombo.equals("8")) {
			if (datesCombo != null && !datesCombo.equals("")) {
				selectedRange = dInfo.selectedIndex(Integer.parseInt(datesCombo));
				if (!selectedRange.isEmpty() && selectedRange != null) {
					form.setFromDate(customerInfo.date2String(selectedRange.get(0)));
					form.setToDate(customerInfo.date2String(selectedRange.get(1)));
				}
				if (selectedRange != null && !selectedRange.isEmpty()) {
					dateBetween = " AND bcv.dateAdded BETWEEN Timestamp ('"
							+ JProjectUtil.getDateFormaterCommon().format(selectedRange.get(0)) + "') AND Timestamp ('"
							+ JProjectUtil.getDateFormaterCommon().format(selectedRange.get(1)) + "')";
				}
			}
		} else if (datesCombo != null && datesCombo.equals("8")) {
			if (fromDate.equals("") && toDate.equals("")) {
				dateBetween = "";
			} else if (!fromDate.equals("") && toDate.equals("")) {
				dateBetween = " AND bcv.dateAdded  >= Timestamp ('"
						+ JProjectUtil.getDateFormaterCommon().format(customerInfo.string2date(fromDate) + "')");
			} else if (fromDate.equals("") && !toDate.equals("")) {
				dateBetween = " AND bcv.dateAdded  <= Timestamp ('"
						+ JProjectUtil.getDateFormaterCommon().format(customerInfo.string2date(toDate) + "')");
			} else {
				dateBetween = " AND bcv.dateAdded  BETWEEN Timestamp ('"
						+ JProjectUtil.getDateFormaterCommon().format(customerInfo.string2date(fromDate))
						+ "') AND Timestamp ('"
						+ JProjectUtil.getDateFormaterCommon().format(customerInfo.string2date(toDate)) + "')";
			}
		}

		try {
			String sqlString = "SELECT bcv from BcaClientvendor bcv where bcv.cvtypeId IN (1,3) and  bcv.status in ('N','U') "
					+ " and bcv.deleted =0 and bcv.active =1 and bcv.company.companyId = :companyId " + dateBetween
					+ "ORDER BY bcv.name";

			TypedQuery<BcaClientvendor> typedQuery = this.entityManager.createQuery(sqlString, BcaClientvendor.class);
			JpaHelper.addParameter(typedQuery, sqlString, "companyId", Long.parseLong(cId));
			List<BcaClientvendor> clientVendorList = typedQuery.getResultList();
			clientVendorList.stream().forEach(cv -> {
				VendorDto vendor = new VendorDto();
				vendor.setClientVendorID(String.valueOf(cv.getClientVendorId()));
				vendor.setCname(cv.getName());
				vendor.setFirstName(cv.getFirstName());
				vendor.setLastName(cv.getLastName());
				vendor.setPhone(cv.getPhone());
				vendor.setFax(cv.getFax());
				vendor.setEmail(cv.getEmail());
				vendor.setAddress1(cv.getAddress1());
				vendor.setAddress2(cv.getAddress2());
				vendor.setCity(cv.getCity());
				String Statename = countryState.getStatesName(cv.getState());
				vendor.setStateName(Statename);
				vendor.setProvince(cv.getProvince());
				String conunrtyname = countryState.getCountryName(cv.getCountry());
				vendor.setCountry(conunrtyname);
				vendor.setZipCode(cv.getZipCode());
				vendor.setMemo(cv.getDetail());
				vendor.setDateAdded(DateHelper.dateFormatter(cv.getDateAdded()));
				List<BcaClientvendorservice> cvService = bcaClientvendorserviceRepository
						.findByClientVendor_ClientVendorId(cv.getClientVendorId());
				for (BcaClientvendorservice clientvendorservice : cvService) {
					VendorDto vendorService = new VendorDto();
					Optional<BcaServicetype> serviceType = bcaServicetypeRepository
							.findById(clientvendorservice.getServiceId());
					if (serviceType.isPresent()) {
						vendorService.setClientVendorID(vendor.getClientVendorID());
						vendorService.setServiceName(serviceType.get().getServiceName());
					}
					serviceList.add(vendorService);
				}
				objList.add(vendor);

			});

			request.setAttribute("Services", serviceList);
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
		}
		return objList;
	}

//	public ArrayList vendorContactList(String datesCombo, String fromDate, String toDate, String sortBy, String cId,
//			HttpServletRequest request, PurchaseBoardDto form) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		PreparedStatement pstmt_clientSer = null;
//		PreparedStatement pstmt_ser = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<VendorDto> objList = new ArrayList<VendorDto>();
//		ArrayList<VendorDto> serviceList = new ArrayList<VendorDto>();
//		ResultSet rs = null;
//		ResultSet rs_clientSer = null;
//		ResultSet rs_ser = null;
//		con = db.getConnection();
//		String dateBetween = "";
//		ArrayList<Date> selectedRange = new ArrayList<>();
//		CustomerInfo cInfo = new CustomerInfo();
//		DateInfo dInfo = new DateInfo();
//
//		if (datesCombo != null && !datesCombo.equals("8")) {
//			if (datesCombo != null && !datesCombo.equals("")) {
//				selectedRange = dInfo.selectedIndex(Integer.parseInt(datesCombo));
//				if (!selectedRange.isEmpty() && selectedRange != null) {
//					form.setFromDate(cInfo.date2String(selectedRange.get(0)));
//					form.setToDate(cInfo.date2String(selectedRange.get(1)));
//				}
//				if (selectedRange != null && !selectedRange.isEmpty()) {
//					dateBetween = " AND DateAdded BETWEEN Timestamp ('"
//							+ JProjectUtil.getDateFormaterCommon().format(selectedRange.get(0)) + "') AND Timestamp ('"
//							+ JProjectUtil.getDateFormaterCommon().format(selectedRange.get(1)) + "')";
//				}
//			}
//		} else if (datesCombo != null && datesCombo.equals("8")) {
//			if (fromDate.equals("") && toDate.equals("")) {
//				dateBetween = "";
//			} else if (!fromDate.equals("") && toDate.equals("")) {
//				dateBetween = " AND DateAdded >= Timestamp ('"
//						+ JProjectUtil.getDateFormaterCommon().format(cInfo.string2date(fromDate) + "')");
//			} else if (fromDate.equals("") && !toDate.equals("")) {
//				dateBetween = " AND DateAdded <= Timestamp ('"
//						+ JProjectUtil.getDateFormaterCommon().format(cInfo.string2date(toDate) + "')");
//			} else {
//				dateBetween = " AND DateAdded BETWEEN Timestamp ('"
//						+ JProjectUtil.getDateFormaterCommon().format(cInfo.string2date(fromDate))
//						+ "') AND Timestamp ('" + JProjectUtil.getDateFormaterCommon().format(cInfo.string2date(toDate))
//						+ "')";
//			}
//		}
//
//		try {
//
//			String sqlString = "select ClientVendorID,Name,FirstName,LastName,Phone,Fax,Email,Address1,Address2,City,State,Province,Country,"
//					+ "ZipCode,Detail,date_format(DateAdded,'%m-%d-%Y') as DateAdded from bca_clientvendor where (CVTypeID=1 or CVTypeID=3 )and"
//					+ " Status in ('N','U') and Deleted=0 and Active=1 and CompanyID=? " + dateBetween
//					+ " order by Name";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, cId);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			CountryState cs = new CountryState();
//			while (rs.next()) {
//
//				VendorDto vendor = new VendorDto();
//				vendor.setClientVendorID(rs.getString(1));
//				vendor.setCname(rs.getString(2));
//				vendor.setFirstName(rs.getString(3));
//				vendor.setLastName(rs.getString(4));
//				vendor.setPhone(rs.getString(5));
//				vendor.setFax(rs.getString(6));
//				vendor.setEmail(rs.getString(7));
//				vendor.setAddress1(rs.getString(8));
//				vendor.setAddress2(rs.getString(9));
//				vendor.setCity(rs.getString(10));
//				String Statename = cs.getStatesName(rs.getString(11));
//				vendor.setStateName(Statename);
//				vendor.setProvince(rs.getString(12));
//				String conunrtyname = cs.getCountryName(rs.getString(13));
//				vendor.setCountry(conunrtyname);
//				vendor.setZipCode(rs.getString(14));
//				vendor.setMemo(rs.getString(15));
//				vendor.setDateAdded(rs.getString(16));
//				String sqlServiceID = "select ServiceID from bca_clientvendorservice where ClientVendorID=?";
//				pstmt_clientSer = con.prepareStatement(sqlServiceID);
//				pstmt_clientSer.setString(1, vendor.getClientVendorID());
//				rs_clientSer = pstmt_clientSer.executeQuery();
//				String services = "select ServiceName from bca_servicetype where ServiceID=?";
//				while (rs_clientSer.next()) {
//					VendorDto vendorService = new VendorDto();
//					pstmt_ser = con.prepareStatement(services);
//					pstmt_ser.setInt(1, rs_clientSer.getInt("ServiceID"));
//					rs_ser = pstmt_ser.executeQuery();
//					if (rs_ser.next()) {
//						vendorService.setClientVendorID(vendor.getClientVendorID());
//						vendorService.setServiceName(rs_ser.getString("ServiceName"));
//					}
//					serviceList.add(vendorService);
//				}
//				objList.add(vendor);
//			}
//			request.setAttribute("Services", serviceList);
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (rs_clientSer != null) {
//					db.close(rs_clientSer);
//				}
//				if (rs_ser != null) {
//					db.close(rs_ser);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (pstmt_clientSer != null) {
//					db.close(pstmt_clientSer);
//				}
//				if (pstmt_ser != null) {
//					db.close(pstmt_ser);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}
	/**/

	/*
	 * The method insert the new vendor. It insert all the information related to
	 * that vendor such as finance charges,services,bsaaddress,etc.
	 */

	public boolean insertVendor(VendorDto c, String compID) {
		boolean ret = false;
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		PreparedStatement pstmt_services = null;

		try {
			String oBal = "0";
			String exCredit = "0";
			// generating new cvId

			int cvID = purchaseInfo.getLastClientVendorID() + 1;

			if (c.getOpeningUB() != null && c.getOpeningUB().trim().length() > 0)
				oBal = c.getOpeningUB();
			if (c.getExtCredit() != null && c.getExtCredit().trim().length() > 0)
				exCredit = c.getExtCredit();

			String vcName = vendorCategory.CVCategory(c.getType());
			if (vcName == null) {
				vcName = "";
			}

			BcaClientvendor bcv = new BcaClientvendor();
			bcv.setClientVendorId(null);
			bcv.setName(c.getCname());
			bcv.setDateAdded((c.getDateAdded() == null || c.getDateAdded().equals(""))
					? DateHelper.convertDateToOffsetDateTime(customerInfo.string2date(" now() "))
					: DateHelper.convertDateToOffsetDateTime(customerInfo.string2date(c.getDateAdded())));

			bcv.setCustomerTitle(c.getTitle());
			bcv.setFirstName(c.getFirstName());
			bcv.setLastName(c.getLastName());
			bcv.setAddress1(c.getAddress1());
			bcv.setAddress2(c.getAddress2());
			bcv.setCity(c.getCity().toString());

			bcv.setState(c.getState());
			bcv.setProvince(c.getProvince());
			bcv.setCountry(c.getCountry());
			bcv.setZipCode(c.getZipCode());
			bcv.setPhone(c.getPhone());
			bcv.setCellPhone(c.getCellPhone());
			bcv.setFax(c.getFax());
			bcv.setHomePage(c.getHomePage());
			bcv.setEmail(c.getEmail());
			Optional<BcaCompany> company = bcaCompanyRepository.findById(Long.parseLong(compID));
			if (company.isPresent())
				bcv.setCompany(company.get());
			bcv.setResellerTaxId(c.getTexID());
			bcv.setVendorOpenDebit(Double.parseDouble(oBal));
			bcv.setVendorAllowedCredit(Double.parseDouble(exCredit));

			bcv.setDetail(c.getMemo());
			bcv.setTaxable(Long.parseLong(c.getTaxAble()));
			bcv.setCvtypeId(Integer.parseInt(c.getIsclient()));
			bcv.setCvcategoryId(Integer.parseInt(c.getType()));
			bcv.setCvcategoryName(vcName);
			bcv.setActive(1);
			bcv.setDeleted(0);
			bcv.setStatus("N");
			bcv.setMiddleName(c.getMiddleName());
			Date dateInput = c.getDateInput() == null || c.getDateInput().trim().equals("") ? null
					: customerInfo.string2date(c.getDateInput());
			bcv.setDateInput(DateHelper.convertDateToOffsetDateTime(dateInput));
			Date dateTerminated = (c.getTerminatedDate() == null || c.getTerminatedDate().trim().equals("")) ? null
					: customerInfo.string2date(c.getTerminatedDate());
			bcv.setDateTerminated(DateHelper.convertDateToOffsetDateTime(dateTerminated));
			bcv.setIsTerminated(c.isTerminated());
			bcv.setDbaname(c.getDbaName());
			Optional<BcaTerm> term = bcaTermRepository.findById(Integer.parseInt(c.getTerm()));
			if (term.isPresent())
				bcv.setTerm(term.get());
			BcaSalesrep salesRep = bcaSalesrepRepository.findBySalesRepId(Integer.parseInt(c.getRep()));
			if (null != salesRep)
				bcv.setSalesRep(salesRep);
			Optional<BcaShipcarrier> shipCarrier = bcaShipcarrierRepository.findById(Integer.parseInt(c.getShipping()));
			if (shipCarrier.isPresent())
				bcv.setShipCarrier(shipCarrier.get());
			Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository
					.findById(Integer.parseInt(c.getPaymentType()));
			if (paymentType.isPresent())
				bcv.setPaymentType(paymentType.get());
			bcv.setCctypeId((c.getCcType() == "" ? 0 : Integer.valueOf(c.getCcType())));
			BcaClientvendor clientVendor = bcaClientvendorRepository.save(bcv);
			if (null != clientVendor) {
				ret = true;
			}

			purchaseInfoDao.insertVendorCreditCard(c.getCcType(), cvID, c.getCardNo(), c.getExpDate(), c.getCw2(),
					c.getCardHolderName(), c.getCardBillAddress(), c.getCardZip());

			int bsAddID = purchaseInfoDao.getLastBsAdd() + 1;
			TblBSAddress2 address = new TblBSAddress2();
			if ("0".equals(c.getSetdefaultbs())) {
				purchaseInfoDao.insertVendorBSAddress(cvID, bsAddID, c.getBscname(), c.getBsdbaName(),
						c.getBsfirstName(), c.getBslastName(), c.getBsaddress1(), c.getBsaddress2(), c.getBscity(),
						c.getBsstate(), c.getBsprovince(), c.getBscountry(), c.getBszipCode(), "1");

				purchaseInfoDao.insertVendorBSAddress(cvID, bsAddID, c.getShcname(), c.getShdbaName(),
						c.getShfirstName(), c.getShlastName(), c.getShaddress1(), c.getShaddress2(), c.getShcity(),
						c.getShstate(), c.getShprovince(), c.getShcountry(), c.getShzipCode(), "0");
				address.setAddressWithVendorDtoBilling(c, cvID);
				purchaseInfo.insertBillingShippingAddress(address, 1, true);
				address.setAddressWithVendorDtoShipping(c, cvID);
				purchaseInfo.insertBillingShippingAddress(address, 0, true);
			} else {
				purchaseInfoDao.insertVendorBSAddress(cvID, bsAddID, c.getCname(), c.getDbaName(), c.getFirstName(),
						c.getLastName(), c.getAddress1(), c.getAddress2(), c.getCity(), c.getState(), c.getProvince(),
						c.getCountry(), c.getZipCode(), "1");

				purchaseInfoDao.insertVendorBSAddress(cvID, bsAddID, c.getCname(), c.getDbaName(), c.getFirstName(),
						c.getLastName(), c.getAddress1(), c.getAddress2(), c.getCity(), c.getState(), c.getProvince(),
						c.getCountry(), c.getZipCode(), "0");
				address.setAddressWithVendorDto(c, cvID);
				purchaseInfo.insertBillingShippingAddress(address, 1, true);
				purchaseInfo.insertBillingShippingAddress(address, 0, true);
			}

			int useIndividual = "1".equals(c.getFsUseIndividual()) ? 1 : 0;
			int assFCharge = "1".equals(c.getFsAssessFinanceCharge()) ? 1 : 0;
			int markFCharge = "1".equals(c.getFsMarkFinanceCharge()) ? 1 : 0;
			purchaseInfoDao.insertVFCharge(cvID, useIndividual, c.getAnnualIntrestRate(), c.getMinFCharges(),
					c.getGracePrd(), assFCharge, markFCharge);

			// code to save services START
			int i;
			String sql;
			String serviceID = c.getTable_serID();
			String serviceBal = c.getTable_bal();
			String defaultser = c.getTable_defaultVal();
			String invStyleID = c.getTable_invId();

			String temp[] = null, temp2[] = null, temp3[] = null;
			if ((serviceID != "" && serviceID != null)
					&& (invStyleID != "" && invStyleID != null) & (serviceBal != "" && serviceBal != null)) {
				temp = serviceID.split(";"); // serviceID is in form like
				temp2 = invStyleID.split(";");
				temp3 = serviceBal.split(";");
			}

			if ((temp != null) || (temp2 != null) || (temp3 != null)) {
				java.sql.Date d = new java.sql.Date(new Date().getTime());

				for (i = 0; i < temp.length; i++) {

					// it confusing which column data it sets
					sql = "insert into bca_clientvendorservice values (?,?,?,?,?,?,?)";
					pstmt_services = con.prepareStatement(sql);
					pstmt_services.setInt(1, cvID);
					pstmt_services.setDate(2, d);
					pstmt_services.setInt(3, Integer.parseInt(compID));
					pstmt_services.setInt(4, Integer.parseInt(temp2[i]));
					pstmt_services.setFloat(5, Float.parseFloat(temp3[i]));
					if (Integer.parseInt(temp[i]) == Integer.parseInt(defaultser))
						pstmt_services.setInt(6, 1);
					else
						pstmt_services.setInt(6, 0);
					pstmt_services.setInt(7, Integer.parseInt(temp[i]));

					pstmt_services.executeUpdate();
				}
			}
			// code to save services END

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, "SQLException in Class PurchaseInfo,  method -insertVendor & exception 1st" + ee.toString());

		}
		return ret;
	}

//	public boolean insertVendor(VendorDto c, String compID) {
//		boolean ret = false;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null, pstmt_services = null;
//		CustomerInfo cinfo = new CustomerInfo();
//		try {
//			String oBal = "0";
//			String exCredit = "0";
//			// generating new cvId
//			PurchaseInfoDao pinfo = new PurchaseInfoDao();
//			PurchaseInfo purchaseInfo = new PurchaseInfo();
//			int cvID = purchaseInfo.getLastClientVendorID() + 1;
//
//			if (c.getOpeningUB() != null && c.getOpeningUB().trim().length() > 0)
//				oBal = c.getOpeningUB();
//			if (c.getExtCredit() != null && c.getExtCredit().trim().length() > 0)
//				exCredit = c.getExtCredit();
//
//			VendorCategory vc = new VendorCategory();
//			String vcName = vc.CVCategory(c.getType());
//			if (vcName == null) {
//				vcName = "";
//			}
//			java.sql.Date nullDate = null;
//			String sqlString = "insert into bca_clientvendor(ClientVendorID, Name,DateAdded, CustomerTitle, FirstName, LastName, Address1, Address2,"
//					+ " City, State, Province, Country, ZipCode, Phone, CellPhone,Fax,HomePage, Email, CompanyID,ResellerTaxID,VendorOpenDebit,"
//					+ " VendorAllowedCredit,Detail,Taxable,CVTypeID,CVCategoryID,CVCategoryName,Active,Deleted,Status,"
//					+ " MiddleName,DateInput,DateTerminated,isTerminated,DBAName, TermID,SalesRepID,ShipCarrierID,PaymentTypeID,CCTypeID) "
//					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )";
//
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setInt(1, cvID);
//
//			pstmt.setString(2, c.getCname());
//			pstmt.setDate(3, (c.getDateAdded() == null || c.getDateAdded().equals("")) ? cinfo.string2date(" now() ")
//					: cinfo.string2date(c.getDateAdded()));
//			pstmt.setString(4, c.getTitle());
//			pstmt.setString(5, c.getFirstName());
//			pstmt.setString(6, c.getLastName());
//			pstmt.setString(7, c.getAddress1());
//			pstmt.setString(8, c.getAddress2());
//			pstmt.setString(9, c.getCity().toString());
//			pstmt.setString(10, c.getState());
//			pstmt.setString(11, c.getProvince());
//			pstmt.setString(12, c.getCountry());
//			pstmt.setString(13, c.getZipCode());
//			pstmt.setString(14, c.getPhone());
//			pstmt.setString(15, c.getCellPhone());
//			pstmt.setString(16, c.getFax());
//			pstmt.setString(17, c.getHomePage());
//			pstmt.setString(18, c.getEmail());
//			pstmt.setString(19, compID);
//			pstmt.setString(20, c.getTexID());
//			pstmt.setString(21, oBal);
//			pstmt.setString(22, exCredit);
//			pstmt.setString(23, c.getMemo());
//			pstmt.setString(24, c.getTaxAble());
//			pstmt.setString(25, c.getIsclient());
//			pstmt.setString(26, c.getType());
//			pstmt.setString(27, vcName);
//			pstmt.setString(28, "1");
//			pstmt.setString(29, "0");
//			pstmt.setString(30, "N");
//			// pstmt.setBoolean(31, c.isIsMobilePhoneNumber()); //delete
//			pstmt.setString(31, c.getMiddleName());
//			/*
//			 * if (c.getDateInput() == null || c.getDateInput().trim().equals("")) {
//			 * pstmt.setNull(32, Types.TIMESTAMP); //pstmt.setDate(32,
//			 * cinfo.string2date(" now() ")); } else { pstmt.setDate(32,
//			 * cinfo.string2date(c.getDateInput())); } if (c.getTerminatedDate() == null ||
//			 * c.getTerminatedDate().trim().equals("")) { pstmt.setNull(33,
//			 * Types.TIMESTAMP); //pstmt.setDate(33, cinfo.string2date(" now() ")); } else {
//			 * pstmt.setDate(33, cinfo.string2date(c.getTerminatedDate())); }
//			 */
//			pstmt.setDate(32, (c.getDateInput() == null || c.getDateInput().trim().equals("")) ? null
//					: cinfo.string2date(c.getDateInput()));
//			pstmt.setDate(33, (c.getTerminatedDate() == null || c.getTerminatedDate().trim().equals("")) ? null
//					: cinfo.string2date(c.getTerminatedDate()));
//			pstmt.setBoolean(34, c.isTerminated());
//			pstmt.setString(35, c.getDbaName());
//			pstmt.setString(36, c.getTerm());
//			pstmt.setString(37, c.getRep());
//			pstmt.setString(38, c.getShipping());
//			pstmt.setString(39, c.getPaymentType());
//			pstmt.setInt(40, (c.getCcType() == "" ? 0 : Integer.valueOf(c.getCcType())));
//
//			Loger.log(sqlString);
//			int num = pstmt.executeUpdate();
//			if (num > 0) {
//				ret = true;
//			}
//
//			pinfo.insertVendorCreditCard(c.getCcType(), cvID, c.getCardNo(), c.getExpDate(), c.getCw2(),
//					c.getCardHolderName(), c.getCardBillAddress(), c.getCardZip());
//
//			int bsAddID = pinfo.getLastBsAdd() + 1;
//			TblBSAddress2 address = new TblBSAddress2();
//			if ("0".equals(c.getSetdefaultbs())) {
//				pinfo.insertVendorBSAddress(cvID, bsAddID, c.getBscname(), c.getBsdbaName(), c.getBsfirstName(),
//						c.getBslastName(), c.getBsaddress1(), c.getBsaddress2(), c.getBscity(), c.getBsstate(),
//						c.getBsprovince(), c.getBscountry(), c.getBszipCode(), "1");
//
//				pinfo.insertVendorBSAddress(cvID, bsAddID, c.getShcname(), c.getShdbaName(), c.getShfirstName(),
//						c.getShlastName(), c.getShaddress1(), c.getShaddress2(), c.getShcity(), c.getShstate(),
//						c.getShprovince(), c.getShcountry(), c.getShzipCode(), "0");
//				address.setAddressWithVendorDtoBilling(c, cvID);
//				purchaseInfo.insertBillingShippingAddress(address, 1, true);
//				address.setAddressWithVendorDtoShipping(c, cvID);
//				purchaseInfo.insertBillingShippingAddress(address, 0, true);
//			} else {
//				pinfo.insertVendorBSAddress(cvID, bsAddID, c.getCname(), c.getDbaName(), c.getFirstName(),
//						c.getLastName(), c.getAddress1(), c.getAddress2(), c.getCity(), c.getState(), c.getProvince(),
//						c.getCountry(), c.getZipCode(), "1");
//
//				pinfo.insertVendorBSAddress(cvID, bsAddID, c.getCname(), c.getDbaName(), c.getFirstName(),
//						c.getLastName(), c.getAddress1(), c.getAddress2(), c.getCity(), c.getState(), c.getProvince(),
//						c.getCountry(), c.getZipCode(), "0");
//				address.setAddressWithVendorDto(c, cvID);
//				purchaseInfo.insertBillingShippingAddress(address, 1, true);
//				purchaseInfo.insertBillingShippingAddress(address, 0, true);
//			}
//
//			int useIndividual = "1".equals(c.getFsUseIndividual()) ? 1 : 0;
//			int assFCharge = "1".equals(c.getFsAssessFinanceCharge()) ? 1 : 0;
//			int markFCharge = "1".equals(c.getFsMarkFinanceCharge()) ? 1 : 0;
//			pinfo.insertVFCharge(cvID, useIndividual, c.getAnnualIntrestRate(), c.getMinFCharges(), c.getGracePrd(),
//					assFCharge, markFCharge);
//
//			// code to save services START
//			int i;
//			String sql;
//			String serviceID = c.getTable_serID();
//			String serviceBal = c.getTable_bal();
//			String defaultser = c.getTable_defaultVal();
//			String invStyleID = c.getTable_invId();
//
//			String temp[] = null, temp2[] = null, temp3[] = null;
//			if ((serviceID != "" && serviceID != null)
//					&& (invStyleID != "" && invStyleID != null) & (serviceBal != "" && serviceBal != null)) {
//				temp = serviceID.split(";"); // serviceID is in form like
//				temp2 = invStyleID.split(";");
//				temp3 = serviceBal.split(";");
//			}
//
//			if ((temp != null) || (temp2 != null) || (temp3 != null)) {
//				java.sql.Date d = new java.sql.Date(new Date().getTime());
//
//				for (i = 0; i < temp.length; i++) {
//					sql = "insert into bca_clientvendorservice values (?,?,?,?,?,?,?)";
//					pstmt_services = con.prepareStatement(sql);
//					pstmt_services.setInt(1, cvID);
//					pstmt_services.setDate(2, d);
//					pstmt_services.setInt(3, Integer.parseInt(compID));
//					pstmt_services.setInt(4, Integer.parseInt(temp2[i]));
//					pstmt_services.setFloat(5, Float.parseFloat(temp3[i]));
//					if (Integer.parseInt(temp[i]) == Integer.parseInt(defaultser))
//						pstmt_services.setInt(6, 1);
//					else
//						pstmt_services.setInt(6, 0);
//					pstmt_services.setInt(7, Integer.parseInt(temp[i]));
//
//					pstmt_services.executeUpdate();
//				}
//			}
//			// code to save services END
//
//		} catch (SQLException ee) {
//			Loger.log(2, "SQLException in Class PurchaseInfo,  method -insertVendor & exception 1st" + ee.toString());
//
//		} finally {
//			try {
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (pstmt_services != null) {
//					db.close(pstmt_services);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return ret;
//	}

	/*
	 * The method is useful is insertion of all the information of vendor related to
	 * credit card
	 */

	public boolean insertVendorCreditCard(String cardType, int cvID, String ccNo, String expDate, String cw2,
			String cHoldername, String bsAddress, String zip) {
		boolean ret = false;
		String month = "0";
		String year = "0";

		if (cardType == null)
			cardType = "0";
		else if (cardType.equals(""))
			cardType = "0";
		if (expDate == null || expDate.equals("")) {
			month = "0";
			year = "0";
		} else if (!(expDate.equals(""))) {
			String temp = "";
			temp = expDate;
			int indx = temp.indexOf("/");
			Loger.log("index is " + indx);

			month = temp.substring(0, indx);
			temp = temp.substring(indx + 1);
			year = temp;

			Loger.log("The moth is " + month);
			Loger.log("The Year is " + year);
		}

		try {
			int ccID = getLastCCID() + 1;
			bcaCvcreditcardRepository.updateActiveByClientvendorIdAndActive(cvID, 1);

			BcaCvcreditcard cvcreditcard = new BcaCvcreditcard();
//			if(null != cvcreditcard.getCctype())
//				cvcreditcard.setCctype(String.valueOf(cvcard.getCctype().getcCTypeID()));
			BcaCctype cctype = bcaCctypeRepository.findById(Integer.parseInt(cardType)).orElse(null);
			if (null != cctype)
				cvcreditcard.setCctype(cctype);
			cvcreditcard.setCreditCardId(ccID);
			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(cvID);
			if (clientVendor.isPresent())
				cvcreditcard.setClientVendor(clientVendor.get());

			cvcreditcard.setCardNumber(ccNo);
			cvcreditcard.setCardExpMonth(month);
			cvcreditcard.setCardExpYear(year);
			cvcreditcard.setCardCw2(cw2);
			cvcreditcard.setCardHolderName(cHoldername);
			cvcreditcard.setCardBillingAddress(bsAddress);
			cvcreditcard.setCardBillingZipCode(zip);
			cvcreditcard.setActive(1);
			// Get the current date and time in the default time zone
			LocalDateTime currentDateTime = LocalDateTime.now();

			// Create an OffsetDateTime using the current date and time and a specified time
			// zone offset
			OffsetDateTime offsetDateTime = OffsetDateTime.of(currentDateTime, ZoneOffset.UTC);

			cvcreditcard.setDateAdded(offsetDateTime);
			BcaCvcreditcard card = bcaCvcreditcardRepository.save(cvcreditcard);
			if (null != card) {
				ret = true;
			}

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class Employee and  method -insertEmployee " + " " + ee.toString());
		}
		return ret;
	}

//	public boolean insertVendorCreditCard(String cardType, int cvID, String ccNo, String expDate, String cw2,
//			String cHoldername, String bsAddress, String zip) {
//		boolean ret = false;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		PreparedStatement pstmtUpdate = null;
//		String month = "0";
//		String year = "0";
//		SQLExecutor db = new SQLExecutor();
//
//		if (db == null)
//			return ret;
//		con = db.getConnection();
//		if (con == null)
//			return ret;
//		Loger.log("The expDate is ___________________" + expDate);
//
//		if (cardType == null)
//			cardType = "0";
//		else if (cardType.equals(""))
//			cardType = "0";
//		if (expDate == null || expDate.equals("")) {
//			month = "0";
//			year = "0";
//		} else if (!(expDate.equals(""))) {
//			String temp = "";
//			temp = expDate;
//			int indx = temp.indexOf("/");
//			Loger.log("index is " + indx);
//
//			month = temp.substring(0, indx);
//			temp = temp.substring(indx + 1);
//			year = temp;
//
//			Loger.log("The moth is " + month);
//			Loger.log("The Year is " + year);
//		}
//
//		try {
//			int ccID = getLastCCID() + 1;
//			pstmtUpdate = con
//					.prepareStatement("update bca_cvcreditcard set Active=0 where ClientVendorID=? and Active=1");
//			pstmtUpdate.setInt(1, cvID);
//			pstmtUpdate.executeUpdate();
//
//			String sqlString = "insert into bca_cvcreditcard(CCTypeID,CreditCardID,ClientVendorID, CardNumber, CardExpMonth,CardExpYear,"
//					+ " CardCW2, CardHolderName, CardBillingAddress,CardBillingZipCode,Active,DateAdded ) "
//					+ " values(?,?,?,?,?,?,?,?,?,?,?,?)";
//			java.sql.Date d = new java.sql.Date(new Date().getTime());
//
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, cardType);
//			pstmt.setInt(2, ccID);
//			pstmt.setInt(3, cvID);
//			pstmt.setString(4, ccNo);
//			pstmt.setString(5, month);
//			pstmt.setString(6, year);
//			pstmt.setString(7, cw2);
//			pstmt.setString(8, cHoldername);
//			pstmt.setString(9, bsAddress);
//			pstmt.setString(10, zip);
//			pstmt.setString(11, "1");
//			pstmt.setDate(12, d);
//
//			Loger.log("CrediCard Query-------------->" + sqlString);
//
//			int num = pstmt.executeUpdate();
//
//			if (num > 0) {
//				ret = true;
//				Loger.log("num:" + num);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class Employee and  method -insertEmployee " + " " + ee.toString());
//		} finally {
//			try {
//				if (pstmtUpdate != null) {
//					db.close(pstmtUpdate);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return ret;
//	}

	/*
	 * The method inserts the BSA address(bill to,ship to address) of the vendor in
	 * the table.
	 */

	public boolean insertVendorBSAddress(int cvID, int bsID, String cname, String dbaName, String fname, String lname,
			String add1, String add2, String city, String state, String province, String country, String zip,
			String addressType) {
		boolean ret = false;

		if (country == null)
			country = "";

		if (state == null)
			state = "";
		try {
			BcaBsaddress bcaBsaddress = new BcaBsaddress();
			bcaBsaddress.setBsaddressId(bsID);
			bcaBsaddress.setClientVendorId(cvID);
			bcaBsaddress.setName(cname);
			bcaBsaddress.setFirstName(fname);
			bcaBsaddress.setLastName(lname);

			bcaBsaddress.setAddress1(add1);
			bcaBsaddress.setAddress2(add2);
			bcaBsaddress.setCity(city);
			bcaBsaddress.setZipCode(zip);
			bcaBsaddress.setCountry(country);
			bcaBsaddress.setState(state);
			bcaBsaddress.setProvince(province);
			bcaBsaddress.setAddressType(addressType);
			bcaBsaddress.setDateAdded(LocalDate.now());
			bcaBsaddress.setStatus("N");
			bcaBsaddress.setDbaname(dbaName);
			BcaBsaddress bsaddress = bcaBsaddressRepository.save(bcaBsaddress);
			if (null != bsaddress) {
				ret = true;
			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -insertVendorBSAddress " + ee.toString());
		}
		return ret;
	}

//	public boolean insertVendorBSAddress(int cvID, int bsID, String cname, String dbaName, String fname, String lname,
//			String add1, String add2, String city, String state, String province, String country, String zip,
//			String addressType) {
//		boolean ret = false;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//
//		if (db == null)
//			return ret;
//		con = db.getConnection();
//		if (con == null)
//			return ret;
//
//		if (country == null)
//			country = "";
//
//		if (state == null)
//			state = "";
//		try {
//
//			// insert query
//			String sqlString = "insert into bca_bsaddress(BSAddressID,ClientVendorID, Name,FirstName,LastName,Address1,"
//					+ " Address2, City,ZipCode,Country,State,Province,AddressType,DateAdded,Status,DBAName) "
//					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)";
//
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setInt(1, bsID);
//			pstmt.setInt(2, cvID);
//			pstmt.setString(3, cname);
//			pstmt.setString(4, fname);
//			pstmt.setString(5, lname);
//			pstmt.setString(6, add1);
//			pstmt.setString(7, add2);
//			pstmt.setString(8, city);
//			pstmt.setString(9, zip);
//			pstmt.setString(10, country);
//			pstmt.setString(11, state);
//			pstmt.setString(12, province);
//			pstmt.setString(13, addressType);
//			pstmt.setString(14, "N");
//			pstmt.setString(15, dbaName);
//			Loger.log("BSAddress Query-------------->" + sqlString);
//			int num = pstmt.executeUpdate();
//			if (num > 0) {
//				ret = true;
//				Loger.log("Record inserted:" + num);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -insertVendorBSAddress " + ee.toString());
//		} finally {
//			try {
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return ret;
//	}

	/*
	 * The method inserts the information of the vendor about finance charges.
	 */

	public boolean insertVFCharge(int cvID, int useIndividual, String aIRate, String mFCharge, String gPeriod,
			int assFCharge, int markFCharge) {
		boolean ret = false;
		try {
			// delete old record
			bcaClientvendorfinancechargesRepository.deleteByClientVendorId(cvID);

			// ...............delete old record finished
			BcaClientvendorfinancecharges cvfc = new BcaClientvendorfinancecharges();
			cvfc.setClientVendor(null);
			cvfc.setUseIndividual(useIndividual > 0 ? true : false);
			if (aIRate == null || aIRate.trim().equals(""))
				aIRate = "0";
			if (mFCharge == null || mFCharge.trim().equals(""))
				mFCharge = "0";
			if (gPeriod == null || gPeriod.trim().equals(""))
				gPeriod = "0";
			cvfc.setAnnualInterestRate(Double.parseDouble(aIRate));
			cvfc.setMinimumFinanceCharge(Double.parseDouble(mFCharge));
			cvfc.setGracePeriod(Integer.parseInt(gPeriod));
			cvfc.setAssessFinanceCharge(assFCharge > 0 ? true : false);
			cvfc.setMarkFinanceCharge(markFCharge > 0 ? true : false);
			BcaClientvendorfinancecharges vendorFinanceCharges = bcaClientvendorfinancechargesRepository.save(cvfc);

			if (null != vendorFinanceCharges) {
				ret = true;
			}

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -insertVFCharge" + "" + ee.toString());
		}
		return ret;
	}

//	public boolean insertVFCharge(int cvID, int useIndividual, String aIRate, String mFCharge, String gPeriod,
//			int assFCharge, int markFCharge) {
//		boolean ret = false;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		String sqlString = "";
//
//		if (db == null)
//			return ret;
//		con = db.getConnection();
//		if (con == null)
//			return ret;
//
//		try {
//			// delete old record
//			
//			
//			sqlString = "delete from bca_clientvendorfinancecharges where ClientVendorID=?";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setInt(1, cvID);
//			Loger.log("delete:" + sqlString);
//			pstmt.executeUpdate();
//			pstmt.close();
//			sqlString = "";
//			// ...............delete old record finished
//
//			
//			sqlString = "insert into bca_clientvendorfinancecharges(ClientVendorID,UseIndividual, AnnualInterestRate, "
//					+ " MinimumFinanceCharge,GracePeriod, AssessFinanceCharge,MarkFinanceCharge) values (?,?,?,?,?,?,?)";
//
//			Loger.log(sqlString);
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setInt(1, cvID);
//			pstmt.setInt(2, useIndividual);
//			if (aIRate == null || aIRate.trim().equals(""))
//				aIRate = "0";
//			if (mFCharge == null || mFCharge.trim().equals(""))
//				mFCharge = "0";
//			if (gPeriod == null || gPeriod.trim().equals(""))
//				gPeriod = "0";
//			pstmt.setDouble(3, Double.parseDouble(aIRate));
//			pstmt.setDouble(4, Double.parseDouble(mFCharge));
//			pstmt.setInt(5, Integer.parseInt(gPeriod));
//			pstmt.setInt(6, assFCharge);
//			pstmt.setInt(7, markFCharge);
//
//			int num = pstmt.executeUpdate();
//
//			if (num > 0) {
//				ret = true;
//				Loger.log("insertVFCharge Record inserted:" + num);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -insertVFCharge" + "" + ee.toString());
//		} finally {
//			try {
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return ret;
//	}

	/*
	 * The method updates the information of vendor related to credit card.
	 */

	public boolean updateVendorCreditCard(int cvID, String cctype, String ccNo, String expDate, String cw2,
			String cHoldername, String bsAddress, String zip) {
		boolean ret = false;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		SQLExecutor db = new SQLExecutor();

		int ccID = 0;

		if (db == null)
			return ret;
		con = db.getConnection();
		if (con == null)
			return ret;

		try {

			ps = con.prepareStatement(
					"select CreditCardID from bca_cvcreditcard where clientvendorid=" + cvID + " and active=1");
			rs = ps.executeQuery();
			if (rs.next()) {
				ccID = rs.getInt(1);
			} else {
				ccID = getLastCCID() + 1;
			}
			rs.close();
			ps.close();

			String month = "";
			String year = "";

			if (expDate == null) {
				month = "0";
				year = "0";
			} else if (!(expDate.equals(""))) {
				String temp = "";
				temp = expDate;
				int indx = temp.indexOf("/");
				Loger.log("index is " + indx);

				month = temp.substring(0, indx);
				temp = temp.substring(indx + 1);
				year = temp;
			}
			String sqlString = "update  bca_cvcreditcard set "
					+ " CardNumber=?, CardExpMonth=?, CardExpYear=?,CardCW2= ?, CardHolderName=?"
					+ ", CardBillingAddress=?, CardBillingZipCode=?, Active=1, DateAdded=?,CCTypeID=?"
					+ " where CreditCardID=? and clientvendorid= ?";

			Loger.log("Update CrediCard Query-------------->" + sqlString);
			ps = con.prepareStatement(sqlString);
			ps.setString(1, ccNo);
			ps.setString(2, month);
			ps.setString(3, year);
			ps.setString(4, cw2);
			ps.setString(5, cHoldername);
			ps.setString(6, bsAddress);
			ps.setString(7, zip);
			ps.setDate(8, new java.sql.Date(new Date().getTime())); // set
			// current;
			ps.setInt(9, Integer.parseInt(cctype)); // date;
			ps.setInt(10, ccID);
			ps.setInt(11, cvID);

			int num = ps.executeUpdate();

			Loger.log("update  bca_cvcreditcard (no. of recs):" + num);

			if (num > 0) {
				ret = true;
				// Loger.log("update bca_cvcreditcard (no. of recs):"+num);
			}
		} catch (SQLException ee) {
			Loger.log(2, "SQLException....PurchaseInfo.updateVendorCreditCard()" + " " + ee.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (ps != null) {
					db.close(ps);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return ret;
	}

	/*
	 * Get the ID of last client or vendor
	 * 
	 */

	public int getLastClientVendorID() {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		int CVID = 0;
		ResultSet rs = null;
		con = db.getConnection();

		try {

			String sqlString = "select ClientVendorID from bca_clientvendor order by ClientVendorID desc ";
			pstmt = con.prepareStatement(sqlString);
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				CVID = rs.getInt(1);

			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
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
		return CVID;
	}

	/*
	 * Get the Id of last credit card.
	 * 
	 */
	public int getLastCCID() {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		int ID = 0;
		ResultSet rs = null;
		con = db.getConnection();

		try {

			String sqlString = "select CreditCardID from bca_cvcreditcard order by CreditCardID desc ";
			pstmt = con.prepareStatement(sqlString);
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ID = rs.getInt(1);

			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class VendorInfo and  method -getLastCCID " + " " + ee.toString());
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
		return ID;
	}

	/*
	 * Get the ID of last bill to address(BSA address).
	 * 
	 */

	public int getLastBsAdd() {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		int ID = 0;
		ResultSet rs = null;
		con = db.getConnection();

		try {

			String sqlString = "select BSAddressID from bca_bsaddress order by BSAddressID desc ";
			pstmt = con.prepareStatement(sqlString);
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ID = rs.getInt(1);
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class VendorInfo and  method -getLastBsAdd " + " " + ee.toString());
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
		return ID;
	}

	/*
	 * Get the ID of last ship to address(BSA address).
	 * 
	 */

	public int getLastShAdd() {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		int ID = 0;
		ResultSet rs = null;
		con = db.getConnection();

		try {

			String sqlString = "select ShipCarrierID from bca_shipcarrier order by ShipCarrierID desc ";
			pstmt = con.prepareStatement(sqlString);
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ID = rs.getInt(1);
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class VendorInfo and  method -getLastShAdd " + " " + ee.toString());
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
		return ID;
	}

	/*
	 * Method provides the date in sql formate
	 * 
	 */

	public java.sql.Date getdate(String d) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		Date d1 = null;
		try {

			d1 = sdf.parse(d);

		} catch (ParseException e) {
			Loger.log(2, "ParseException" + e.getMessage());
		}

		return (d1 != null ? new java.sql.Date(d1.getTime()) : new java.sql.Date(new Date().getTime()));

	}

	/*
	 * Updates the client/Vendor
	 * 
	 */

	public boolean updateClientVendor(String fieldname, String fieldvalue, int CVID) {

		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		Statement stmt = null;
		boolean valid = false;
		// ResultSet rs = null;
		con = db.getConnection();

		try {
			stmt = con.createStatement();
			String sqlString = "update bca_clientvendor set  ";
			sqlString += fieldname + " ='" + fieldvalue + "' where ClientVendorID ='" + CVID + "' ";
			Loger.log(sqlString);

			int count = stmt.executeUpdate(sqlString);
			if (count > 0) {
				valid = true;
				Loger.log("updated successfully");
			}
			stmt.close();
			Loger.log("The update Client vendor query is " + sqlString);
		} catch (SQLException ee) {
			Loger.log(2, "Error in updateClientVendor() " + ee);
		} finally {
			try {
				if (stmt != null) {
					db.close(stmt);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return valid;

	}

	/*
	 * Searches the vendor details
	 */

//	public ArrayList SearchVendor(String compId, String cvId, HttpServletRequest request, VendorDto customer) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null, rs1 = null, rs2 = null, rs3 = null, rs12 = null, rs13 = null, rs22 = null;
//		PreparedStatement pstmt = null, pstmt1 = null, pstmt2 = null, pstmt3 = null, pstmt4 = null, pstmt12 = null,
//				pstmt13 = null;
//		ArrayList<VendorDto> vendorList = new ArrayList<>();
//		try {
////			StringBuffer query=new StringBuffer("select distinct  bcv.clientVendorId,bcv.name,bcv.firstName,bcv.lastName, bcv.address1, bcv.address2 , bcv.city,bcv.state, bcv.province,"
////					+ " bcv.country , bcv.zipCode, bcv.phone,bcv.cellPhone,bcv.fax ,bcv.email, bcv.homePage ,");
//			String sqlString = "SELECT distinct cv.ClientVendorID,cv.Name,cv.FirstName, cv.LastName, cv.Address1, cv.Address2,"
//					+ "cv.City,cv.State, cv.Province, cv.Country,cv.ZipCode, cv.Phone, cv.CellPhone,cv.Fax, cv.Email,cv.HomePage,"
//					+ "cv.CustomerTitle,cv.ResellerTaxID,cv.VendorOpenDebit,cv.VendorAllowedCredit,cv.Detail,cv.Taxable,"
//					+ "cv.CVTypeID, cv.cvcategoryid, date_format(cv.DateAdded,'%m-%d-%Y'),"
//					+ "cc.CardNumber ,cc.CardExpMonth,cc.CardExpYear, cc.CardCW2 ,cc.CardHolderName,cc.CardBillingAddress,cc.CardBillingZipCode,"
//					+ "ad.Name,ad.FirstName,ad.LastName,ad.Address1,ad.Address2,ad.City,ad.ZipCode,ad.Country,ad.State,ad.Province,ad.AddressType,"
//					+ "vfc.UseIndividual ,vfc.AnnualInterestRate ,vfc.MinimumFinanceCharge,vfc.GracePeriod ,vfc.AssessFinanceCharge,"
//					/* + "vfc.GracePeriod ,vfc.AssessFinanceCharge ,vfc.MarkFinanceCharge," */
//					+ "cv.MiddleName,date_format(cv.DateInput,'%m-%d-%Y') As DateInput, date_format(cv.DateTerminated,'%m-%d-%Y') As DateTerminated, cv.isTerminated,"
//					// + "cv.isMobilePhoneNumber,cv.DBAName "
//					+ "cv.DBAName "
//					+ "FROM  bca_clientvendor AS cv left join ( bca_cvcreditcard AS cc, bca_bsaddress AS ad, bca_clientvendorfinancecharges AS vfc )"
//					+ " on (cc.ClientVendorID= cv.ClientVendorID and ad.ClientVendorID = cv.ClientVendorID and vfc.ClientVendorID= cv.ClientVendorID) "
//					+ "WHERE CompanyID=" + compId
//					+ " AND cv.CVTypeID IN (1, 3) AND cv.Status IN ('N','U') AND cv.Deleted='0' AND cv.Active=1 ";
//			if (cvId != null) {
//				sqlString = sqlString + " AND cv.ClientVendorID =" + cvId;
//			}
//			sqlString = sqlString + " group by ( cv.ClientVendorID ) order by cv.ClientVendorID ";
//
//			pstmt = con.prepareStatement(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				/* General */
//				if (!vendorList.isEmpty()) {
//					customer = new VendorDto();
//				}
//				customer.setClientVendorID(rs.getString(1));
//				customer.setCname(rs.getString(2));
//				customer.setFirstName(rs.getString(3));
//				customer.setLastName(rs.getString(4));
//				customer.setAddress1(rs.getString(5));
//				customer.setAddress2(rs.getString(6));
//				customer.setCity(rs.getString(7));
//				customer.setState(rs.getString(8));
//
//				request.setAttribute("state_gen", rs.getString(8));
//
//				customer.setProvince(rs.getString(9));
//				customer.setCountry(rs.getString(10));
//				customer.setZipCode(rs.getString(11));
//				customer.setPhone(rs.getString(12));
//				customer.setCellPhone(rs.getString(13));
//				customer.setFax(rs.getString(14));
//				customer.setEmail(rs.getString(15));
//				customer.setHomePage(rs.getString(16));
//				customer.setTitle(rs.getString(17));
//				customer.setTexID(rs.getString(18));
//				customer.setOpeningUB(rs.getString(19));
//
//				customer.setExtCredit(rs.getString(20));
//				customer.setMemo(rs.getString(21));
//				customer.setTaxAble(rs.getString(22));
//
//				customer.setIsclient(rs.getString(23)); // cvtypeid
//				customer.setType(rs.getString(24));
//				customer.setDateAdded(rs.getString(25));
//
//				/* Account */
//				customer.setCardNo(rs.getString(26));
//				customer.setExpDate(rs.getString(27) + "/" + rs.getString(28));
//
//				customer.setCw2(rs.getString(29));
//				customer.setCardHolderName(rs.getString(30));
//				customer.setCardBillAddress(rs.getString(31));
//				customer.setCardZip(rs.getString(32));
//
//				/* Finance */
//				customer.setFsUseIndividual(rs.getString(44));
//				customer.setAnnualIntrestRate(rs.getString(45));
//				customer.setMinFCharges(rs.getString(46));
//				customer.setGracePrd(rs.getString(47));
//
//				String str1 = rs.getString(48);
//				// String str2 = rs.getString(49);
//				customer.setFsAssessFinanceCharge(str1);
//
//				customer.setMiddleName(rs.getString(49));
//				customer.setDateInput(rs.getString(50));
//				customer.setTerminatedDate(rs.getString(51));
//				customer.setTerminated(rs.getBoolean(52));
//				// customer.setIsMobilePhoneNumber(rs.getBoolean(53));
//				customer.setDbaName(rs.getString(53));
//
//				String sqlString1 = "SELECT Name,FirstName,LastName,Address1,Address2,City,ZipCode,Country,State,Province,DBAName "
//						+ " FROM bca_billingaddress WHERE ClientVendorID='" + cvId + "' and Status in ('N')";
//				pstmt1 = con.prepareStatement(sqlString1);
//				rs1 = pstmt1.executeQuery();
//				if (rs1.next()) {
//					customer.setBscname(rs1.getString(1));
//					customer.setBsfirstName(rs1.getString(2));
//					customer.setBslastName(rs1.getString(3));
//					customer.setBsaddress1(rs1.getString(4));
//					customer.setBsaddress2(rs1.getString(5));
//					customer.setBscity(rs1.getString(6));
//					customer.setBszipCode(rs1.getString(7));
//					customer.setBscountry(rs1.getString(8));
//					customer.setBsstate(rs1.getString(9));
//					customer.setBsprovince(rs1.getString(10));
//					customer.setBsdbaName(rs1.getString(11));
//					request.setAttribute("state_bt", customer.getBsstate());
//				}
//
//				String sqlString2 = "SELECT Name,FirstName,LastName,Address1,Address2,City,ZipCode,Country,State,Province,DBAName "
//						+ "FROM bca_shippingaddress WHERE ClientVendorID='" + cvId + "' and Status in ('N')";
//				pstmt3 = con.prepareStatement(sqlString2);
//				rs2 = pstmt3.executeQuery();
//				if (rs2.next()) {
//					customer.setShcname(rs2.getString(1));
//					customer.setShfirstName(rs2.getString(2));
//					customer.setShlastName(rs2.getString(3));
//					customer.setShaddress1(rs2.getString(4));
//					customer.setShaddress2(rs2.getString(5));
//					customer.setShcity(rs2.getString(6));
//					customer.setShzipCode(rs2.getString(7));
//					customer.setShcountry(rs2.getString(8));
//					customer.setShstate(rs2.getString(9));
//					customer.setShprovince(rs2.getString(10));
//					customer.setShdbaName(rs2.getString(11));
//					request.setAttribute("state_st", customer.getShstate());
//				}
//
//				/* for Account tab */
//				pstmt4 = con.prepareStatement(
//						"select SalesRepID,TermID,PaymentTypeID,ShipCarrierID from bca_clientvendor where CompanyID=? and ClientVendorID=?");
//				pstmt4.setString(1, compId);
//				pstmt4.setString(2, cvId);
//				rs3 = pstmt4.executeQuery();
//				if (rs3.next()) {
//					customer.setRep(rs3.getString(1));
//					customer.setTerm(rs3.getString(2));
//					customer.setPaymentType(rs3.getString(3));
//					customer.setShipping(rs3.getString(4));
//				}
//				pstmt4.close();
//				rs3.close();
//
//				// ---start---------------------------------------------------------------------code
//				List<CreditCardDto> creditCards = new ArrayList<>();
//				pstmt4 = con.prepareStatement(
//						"select DISTINCT c.*,t.Name AS CardTypeName from bca_cvcreditcard AS c INNER JOIN bca_creditcardtype AS t ON t.CCTypeID=c.CCTypeID where c.clientvendorid=? and c.active=1");
//				pstmt4.setString(1, cvId);
//				rs3 = pstmt4.executeQuery();
//				while (rs3.next()) {
//					CreditCardDto card = new CreditCardDto();
//					card.setCardID(rs3.getInt("CreditCardID"));
//					card.setClientVendorID(rs3.getInt("ClientVendorID"));
//					card.setCcType(rs3.getString("CCTypeID"));
//					card.setCardNo(rs3.getString("CardNumber"));
//					card.setExpDate(rs3.getString("CardExpMonth") + " / " + rs3.getString("CardExpYear"));
//					card.setCw2(rs3.getString("CardCW2"));
//					card.setCardHolderName(rs3.getString("CardHolderName"));
//					card.setCardBillAddress(rs3.getString("CardBillingAddress"));
//					card.setCardZip(rs3.getString("CardBillingZipCode"));
//					card.setCardDefault(rs3.getBoolean("DEFAULTCard"));
//					if (card.getCardNo() != null && card.getCardNo().length() > 4) {
//						String ccTypeName = rs3.getString("CardTypeName") + "...."
//								+ card.getCardNo().substring(card.getCardNo().length() - 4);
//						card.setCcTypeName(ccTypeName);
//					}
//					creditCards.add(card);
//				}
//				customer.setCustomerCards(creditCards);
//
////				============================ Services ============================
//				String sqlString11 = "select ClientVendorID,ServiceID,DateAdded,InvoiceStyleID,ServiceBalance,DefaultService from bca_clientvendorservice where CompanyID = ? and ClientVendorID = ?";
//				pstmt2 = con.prepareStatement(sqlString11);
//				pstmt2.setString(1, compId);
//				pstmt2.setString(2, cvId);
//				rs22 = pstmt2.executeQuery();
//				String default_ser = "";
//				ArrayList<VendorDto> serviceinfo = new ArrayList<>();
//				while (rs22.next()) {
//					VendorDto uform1 = new VendorDto();
//					uform1.setServiceBalance((rs22.getDouble("ServiceBalance")));
//					uform1.setDefaultService(rs22.getInt("DefaultService"));
//
//					int svID = rs22.getInt("ServiceID");
//					uform1.setServiceID(svID);
//					if (uform1.getDefaultService() == 1) {
//						default_ser = String.valueOf(svID);
//					}
//
//					String sqlString12 = "select  Name from bca_invoicestyle where Active=1 and InvoiceStyleID=?";
//					pstmt12 = con.prepareStatement(sqlString12);
//					pstmt12.setString(1, rs22.getString("InvoiceStyleID"));
//					rs12 = pstmt12.executeQuery();
//					while (rs12.next()) {
//						uform1.setInvoiceStyle(rs12.getString(1));
//					}
//
//					String sqlString13 = "select ServiceName from bca_servicetype where ServiceID=? ";
//					pstmt13 = con.prepareStatement(sqlString13);
//					pstmt13.setString(1, String.valueOf(svID));
//					rs13 = pstmt13.executeQuery();
//					while (rs13.next()) {
//						uform1.setServiceName(rs13.getString(1));
//					}
//					serviceinfo.add(uform1);
//				}
//				request.setAttribute("ServiceInfo", serviceinfo);
//				if (!(default_ser.equals(""))) {
//					request.setAttribute("DefaultService", default_ser);
//				} else {
//					default_ser = "0";
//					request.setAttribute("DefaultService", default_ser);
//				}
//				vendorList.add(customer);
//			}
//			request.setAttribute("vendorDetails1", customer);
//			// System.out.println("vendorDetails1:"+customer.toString());
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());
//
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (rs3 != null) {
//					db.close(rs3);
//				}
//				if (rs1 != null) {
//					db.close(rs1);
//				}
//				if (rs2 != null) {
//					db.close(rs2);
//				}
//				if (rs22 != null) {
//					db.close(rs22);
//				}
//				if (rs12 != null) {
//					db.close(rs12);
//				}
//				if (rs13 != null) {
//					db.close(rs13);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (pstmt1 != null) {
//					db.close(pstmt1);
//				}
//				if (pstmt2 != null) {
//					db.close(pstmt2);
//				}
//				if (pstmt3 != null) {
//					db.close(pstmt3);
//				}
//				if (pstmt4 != null) {
//					db.close(pstmt4);
//				}
//				if (pstmt12 != null) {
//					db.close(pstmt12);
//				}
//				if (pstmt13 != null) {
//					db.close(pstmt13);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return vendorList;
//	}

	public ArrayList SearchVendor(String compId, String cvId, HttpServletRequest request, VendorDto customer) {

		ArrayList<VendorDto> vendorList = new ArrayList<>();
		try {

			StringBuffer query = new StringBuffer(
					"SELECT DISTINCT bcv FROM BcaClientvendor bcv " + " LEFT JOIN bcv.clientVendorBcaCvcreditcards cc "
							+ " LEFT JOIN bcv.clientVendorBcaClientvendorfinancechargess vfc "
							+ " LEFT JOIN bcv.clientVendorBcaBillingaddresss ba "

							+ " WHERE bcv.company.companyId = :companyId " + "AND bcv.cvtypeId IN :cvtypeId "
							+ " AND bcv.status IN :status " + "AND bcv.deleted = :deleted " + "AND bcv.active = :active"
							+ (cvId != null ? " AND bcv.clientVendorId = :clientVendorId " : " ")
							+ " GROUP BY bcv.clientVendorId order by bcv.clientVendorId");

			TypedQuery<BcaClientvendor> typedQuery = this.entityManager.createQuery(query.toString(),
					BcaClientvendor.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.parseLong(compId));
			JpaHelper.addParameter(typedQuery, query.toString(), "clientVendorId", Integer.parseInt(cvId));
			JpaHelper.addParameter(typedQuery, query.toString(), "cvtypeId", Arrays.asList(1, 3));
			JpaHelper.addParameter(typedQuery, query.toString(), "status", Arrays.asList("N", "U"));
			JpaHelper.addParameter(typedQuery, query.toString(), "deleted", 0);
			JpaHelper.addParameter(typedQuery, query.toString(), "active", 1);
			List<BcaClientvendor> clientvendors = typedQuery.getResultList();
			for (BcaClientvendor vendor : clientvendors) {
				if (!vendorList.isEmpty()) {
					customer = new VendorDto();
				}

				customer.setClientVendorID(String.valueOf(vendor.getClientVendorId()));
				customer.setCname(vendor.getName());
				customer.setFirstName(vendor.getFirstName());
				customer.setLastName(vendor.getLastName());
				customer.setAddress1(vendor.getAddress1());
				customer.setAddress2(vendor.getAddress2());
				customer.setCity(vendor.getCity());
				customer.setState(vendor.getState());

				request.setAttribute("state_gen", vendor.getState());

				customer.setProvince(vendor.getProvince());
				customer.setCountry(vendor.getCountry());
				customer.setZipCode(vendor.getZipCode());
				customer.setPhone(vendor.getPhone());
				customer.setCellPhone(vendor.getCellPhone());
				customer.setFax(vendor.getFax());
				customer.setEmail(vendor.getEmail());
				customer.setHomePage(vendor.getHomePage());
				customer.setTitle(vendor.getCustomerTitle());
				customer.setTexID(vendor.getResellerTaxId());
				customer.setOpeningUB(String.valueOf(vendor.getVendorOpenDebit()));

				customer.setExtCredit(String.valueOf(vendor.getVendorAllowedCredit()));
				customer.setMemo(vendor.getDetail());
				customer.setTaxAble(String.valueOf(vendor.getTaxable()));

				customer.setIsclient(String.valueOf(vendor.getCvtypeId())); // cvtypeid
				customer.setType(String.valueOf(vendor.getCvcategoryId()));
				customer.setDateAdded(DateHelper.dateFormatter(vendor.getDateAdded()));

				/* Account */

				Set<BcaCvcreditcard> creditCardDetails = vendor.getClientVendorBcaCvcreditcards();

				for (BcaCvcreditcard card : creditCardDetails) {
					customer.setCardNo(card.getCardNumber());
					customer.setExpDate(card.getCardExpMonth() + "/" + card.getCardExpYear());
					customer.setCw2(card.getCardCw2());
					customer.setCardHolderName(card.getCardHolderName());
					customer.setCardBillAddress(card.getCardBillingAddress());
					customer.setCardZip(card.getCardBillingZipCode());
				}

				/* Finance */
				Set<BcaClientvendorfinancecharges> finance = vendor.getClientVendorBcaClientvendorfinancechargess();
				for (BcaClientvendorfinancecharges fin : finance) {
					customer.setFsUseIndividual(String.valueOf(fin.getUseIndividual()));
					customer.setAnnualIntrestRate(String.valueOf(fin.getAnnualInterestRate()));
					customer.setMinFCharges(String.valueOf(fin.getMarkFinanceCharge()));
					customer.setGracePrd(String.valueOf(fin.getGracePeriod()));
					customer.setFsAssessFinanceCharge(String.valueOf(fin.getAssessFinanceCharge()));
				}
				customer.setMiddleName(vendor.getMiddleName());
				if (null != vendor.getDateInput())
					customer.setDateInput(DateHelper.dateFormatter(vendor.getDateInput()));
				if (null != vendor.getDateTerminated())
				customer.setTerminatedDate(DateHelper.dateFormatter(vendor.getDateTerminated()));
				customer.setTerminated(vendor.getIsTerminated());
				customer.setDbaName(vendor.getDbaname());
				BcaBillingaddress bcaBillingaddress = bcaBillingaddressRepository
						.findByClientVendorIdAndStatus(Integer.parseInt(cvId), "N");
				if (bcaBillingaddress != null) {
					customer.setBscname(bcaBillingaddress.getName());
					customer.setBsfirstName(bcaBillingaddress.getFirstName());
					customer.setBslastName(bcaBillingaddress.getLastName());
					customer.setBsaddress1(bcaBillingaddress.getAddress1());
					customer.setBsaddress2(bcaBillingaddress.getAddress2());
					customer.setBscity(bcaBillingaddress.getCity());
					customer.setBszipCode(bcaBillingaddress.getZipCode());
					customer.setBscountry(bcaBillingaddress.getCountry());
					customer.setBsstate(bcaBillingaddress.getState());
					customer.setBsprovince(bcaBillingaddress.getProvince());
					if (bcaBillingaddress.getDbaname() != null)
						customer.setBsdbaName(bcaBillingaddress.getDbaname());
					request.setAttribute("state_bt", customer.getBsstate());
				}

				BcaShippingaddress shippingAddress = bcaShippingaddressRepository
						.findByClientVendorIdAndStatus(Integer.parseInt(cvId), "N");
				if (null != shippingAddress) {
					customer.setShcname(shippingAddress.getName());
					customer.setShfirstName(shippingAddress.getFirstName());
					customer.setShlastName(shippingAddress.getLastName());
					customer.setShaddress1(shippingAddress.getAddress1());
					customer.setShaddress2(shippingAddress.getAddress2());
					customer.setShcity(shippingAddress.getCity());
					customer.setShzipCode(shippingAddress.getZipCode());
					customer.setShcountry(shippingAddress.getCountry());
					customer.setShstate(shippingAddress.getState());
					customer.setShprovince(shippingAddress.getProvince());
					if (null != shippingAddress.getDbaname())
						customer.setShdbaName(shippingAddress.getDbaname());
					request.setAttribute("state_st", customer.getShstate());
				}
				/* for Account tab */
				BcaClientvendor clientVendor = bcaClientvendorRepository
						.findByCompanyIdAndClientvendorId(Long.parseLong(compId), Integer.parseInt(cvId));
				if (null != clientVendor) {
					if (null != clientVendor.getSalesRep())
						customer.setRep(String.valueOf(clientVendor.getSalesRep().getSalesRepId()));
					if (null != clientVendor.getTerm())
						customer.setTerm(String.valueOf(clientVendor.getTerm().getTermId()));
					if (null != clientVendor.getPaymentType())
						customer.setPaymentType(String.valueOf(clientVendor.getPaymentType().getPaymentTypeId()));
					if (null != clientVendor.getShipCarrier())
						customer.setShipping(String.valueOf(clientVendor.getShipCarrier().getShipCarrierId()));

				}

				// ---start---------------------------------------------------------------------code
				List<CreditCardDto> creditCards = new ArrayList<>();

				List<Object[]> cvCreditCard = bcaCvcreditcardRepository
						.findDistinctByClientVendorIdAndActive(Integer.parseInt(cvId), 1);
				try {
					for (Object obj[] : cvCreditCard) {

						BcaCvcreditcard cvcard = (BcaCvcreditcard) obj[0];
						String cardTypeName = (String) obj[1];

						CreditCardDto card = new CreditCardDto();
						card.setCardID(cvcard.getCreditCardId());
						if (null != cvcard.getClientVendor())
							card.setClientVendorID(cvcard.getClientVendor().getClientVendorId());
						if (null != cvcard.getCctype())
							card.setCcType(String.valueOf(cvcard.getCctype().getcCTypeID()));
						card.setCardNo(cvcard.getCardNumber());
						card.setExpDate(cvcard.getCardExpMonth() + " / " + cvcard.getCardExpYear());
						card.setCw2(cvcard.getCardCw2());
						card.setCardHolderName(cvcard.getCardHolderName());
						card.setCardBillAddress(cvcard.getCardBillingAddress());
						card.setCardZip(cvcard.getCardBillingZipCode());
						card.setCardDefault(cvcard.getDefaultCard());
						if (card.getCardNo() != null && card.getCardNo().length() > 4) {

							String ccTypeName = cardTypeName + "...."
									+ card.getCardNo().substring(card.getCardNo().length() - 4);
							card.setCcTypeName(ccTypeName);
						}
						creditCards.add(card);
					}

					customer.setCustomerCards(creditCards);
				} catch (ArrayIndexOutOfBoundsException | ClassCastException ex) {
					Loger.log(2, " SQL Error in Class Purchasenfo and  method -searchVendor " + ex.toString());
					ex.printStackTrace();
				}
//				============================ Services ============================
				List<BcaClientvendorservice> clientVendorService = bcaClientvendorserviceRepository
						.findByCompanyIdAndClientVendorId(Long.parseLong(compId), Integer.parseInt(cvId));
				String default_ser = "";
				ArrayList<VendorDto> serviceinfo = new ArrayList<>();
				for (BcaClientvendorservice cvs : clientVendorService) {
					VendorDto uform1 = new VendorDto();
					uform1.setServiceBalance(cvs.getServiceBalance());
					uform1.setDefaultService(cvs.getDefaultService() ? 1 : 0);

					int svID = cvs.getServiceId();
					uform1.setServiceID(svID);
					if (uform1.getDefaultService() == 1) {
						default_ser = String.valueOf(svID);
					}
					BcaInvoicestyle invoiceStyle = bcaInvoicestyleRepository
							.findByInvoiceStyleIdAndActive(cvs.getInvoiceStyleId(), 1);
					if (null != invoiceStyle) {
						uform1.setInvoiceStyle(invoiceStyle.getName());
					}

					Optional<BcaServicetype> serviceType = bcaServicetypeRepository.findById(svID);
					if (serviceType.isPresent()) {
						uform1.setServiceName(serviceType.get().getServiceName());
					}

					serviceinfo.add(uform1);
				}

				request.setAttribute("ServiceInfo", serviceinfo);
				if (!(default_ser.equals(""))) {
					request.setAttribute("DefaultService", default_ser);
				} else {
					default_ser = "0";
					request.setAttribute("DefaultService", default_ser);
				}
				vendorList.add(customer);

			}
			request.setAttribute("vendorDetails1", customer);
			// System.out.println("vendorDetails1:"+customer.toString());
		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());

		}
		return vendorList;
	}

	/*
	 * Provides the servises of the purticular vendor
	 * 
	 */

//	public void getServices(HttpServletRequest request, String compId, String cvId) {
//		// TODO Auto-generated method stub
//		ArrayList<VendorDto> serviceList = new ArrayList<VendorDto>();
//		ArrayList<VendorDto> invoiceName = new ArrayList<VendorDto>();
//		ArrayList<VendorDto> balenceDetails = new ArrayList<VendorDto>();
//		ResultSet rs = null, rs1 = null, rs2 = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null, pstmt1 = null, pstmt2 = null;
//		con = db.getConnection();
//		// Loger.log("@@@@@@@@The Client Vendor Id is @@@@@@@@" + cvId);
//		String sqlString = "select * from bca_servicetype";
//		String sqlString1 = "select  * from bca_invoicestyle where Active=1";
//		String sqlString2 = "select * from bca_clientvendorservice where CompanyID=? and ClientVendorID=?";
//		try {
//			pstmt = con.prepareStatement(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				VendorDto uform = new VendorDto();
//				uform.setServiceID(rs.getInt(1));
//				uform.setServiceName(rs.getString(2));
//				uform.setInvoiceStyleId(rs.getInt(3));
//				serviceList.add(uform);
//			}
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		request.setAttribute("ServiceList", serviceList);
//
//		try {
//			pstmt1 = con.prepareStatement(sqlString1);
//			rs1 = pstmt1.executeQuery();
//			while (rs1.next()) {
//				VendorDto uform = new VendorDto();
//				// Loger.log("The Incoice style id is " + rs1.getString(1));
//				uform.setInvoiceStyleId(rs1.getInt(1));
//				// Loger.log("The Invoice Style name is " + rs1.getString(2));
//				uform.setInvoiceStyle(rs1.getString(2));
//				invoiceName.add(uform);
//			}
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			Loger.log(e.toString());
//		} finally {
//			try {
//
//				if (rs1 != null) {
//					db.close(rs1);
//				}
//				if (pstmt1 != null) {
//					db.close(pstmt1);
//				}
//
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		request.setAttribute("InvoiceName", invoiceName);
//
//		try {
//			pstmt2 = con.prepareStatement(sqlString2);
//			pstmt2.setString(1, compId);
//			pstmt2.setString(2, cvId);
//
//			rs2 = pstmt2.executeQuery();
//			while (rs2.next()) {
//				VendorDto uform = new VendorDto();
//
//				uform.setClientVendorID(String.valueOf(rs2.getInt("ClientVendorID")));
//				uform.setServiceBalance(rs2.getDouble("ServiceBalance"));
//				// Loger.log("The Service Balence is "+ uform.getServiceBalance());
//				// uform.setInvoiceStyleId(rs1.getInt(1));
//
//				uform.setDefaultService(rs2.getInt("DefaultService"));
//				// Loger.log("The Default Service is "+ uform.getDefaultService());
//
//				uform.setServiceID(rs2.getInt("ServiceID"));
//				// Loger.log("The ServiceID is " + uform.getServiceID());
//				// uform.setInvoiceStyle(rs1.getString(2));
//
//				// uform.setServiceId(rs.getInt(1));
//				// uform.setServiceName(rs.getString(2));
//				// uform.setInvoiceStyleId(rs.getInt(3));
//				balenceDetails.add(uform);
//			}
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs2 != null) {
//					db.close(rs2);
//				}
//				if (pstmt2 != null) {
//					db.close(pstmt2);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		request.setAttribute("BalenceDetails", balenceDetails);
//
//	}
	public void getServices(HttpServletRequest request, String compId, String cvId) {
		// TODO Auto-generated method stub
		ArrayList<VendorDto> serviceList = new ArrayList<VendorDto>();
		ArrayList<VendorDto> invoiceName = new ArrayList<VendorDto>();
		ArrayList<VendorDto> balenceDetails = new ArrayList<VendorDto>();

		try {
			List<BcaServicetype> bcaServiceType = bcaServicetypeRepository.findAll();
			for (BcaServicetype servicetype : bcaServiceType) {
				VendorDto uform = new VendorDto();
				uform.setServiceID(servicetype.getServiceId());
				uform.setServiceName(servicetype.getServiceName());
				if (null != servicetype.getInvoiceStyle())
					uform.setInvoiceStyleId(servicetype.getInvoiceStyle().getInvoiceStyleId());
				serviceList.add(uform);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			Loger.log(e.toString());
		}
		request.setAttribute("ServiceList", serviceList);

		try {
			List<BcaInvoicestyle> bcaInvoiceStyle = bcaInvoicestyleRepository.findByActive(1);
			for (BcaInvoicestyle invoicestyle : bcaInvoiceStyle) {
				VendorDto uform = new VendorDto();

				uform.setInvoiceStyleId(invoicestyle.getInvoiceStyleId());

				uform.setInvoiceStyle(invoicestyle.getName());
				invoiceName.add(uform);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			Loger.log(e.toString());
		}
		request.setAttribute("InvoiceName", invoiceName);

		try {
			List<BcaClientvendorservice> clientVendorService = bcaClientvendorserviceRepository
					.findByCompanyIdAndClientVendorId(Long.parseLong(compId), Integer.parseInt(cvId));
			for (BcaClientvendorservice bcvs : clientVendorService) {
				VendorDto uform = new VendorDto();
				if (null != bcvs.getClientVendor())
					uform.setClientVendorID(String.valueOf(bcvs.getClientVendor().getClientVendorId()));
				uform.setServiceBalance(bcvs.getServiceBalance());

				uform.setDefaultService(bcvs.getDefaultService() ? 1 : 0);
				uform.setServiceID(bcvs.getServiceId());

				balenceDetails.add(uform);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			Loger.log(e.toString());
		}
		request.setAttribute("BalenceDetails", balenceDetails);

	}

	/*
	 * Method updates the vendor & his related information
	 * 
	 */

	public boolean updateInsertVendor(String cvId, VendorDto c, String compID, int istaxable, int isAlsoClient,
			int useIndividualFinanceCharges, int AssessFinanceChk, String status) {
		boolean ret = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement ps = null;
		SQLExecutor db = new SQLExecutor();
		CustomerInfo cinfo = new CustomerInfo();
		if (db == null)
			return ret;
		con = db.getConnection();
		if (con == null)
			return ret;

		try {
			String oBal = "0";
			String exCredit = "0";

			int cvID = Integer.parseInt(cvId);
			if (c.getOpeningUB() != null && c.getOpeningUB().trim().length() > 0)
				oBal = c.getOpeningUB();

			if (c.getExtCredit() != null && c.getExtCredit().trim().length() > 0)
				exCredit = c.getExtCredit();

			if (c.getType() == null || c.getType().equals(""))
				c.setType("0");

			VendorCategory vc = new VendorCategory();
			String vcName = vc.CVCategory(c.getType());

			/*
			 * String sqlString =
			 * "insert into bca_clientvendor(ClientVendorID, Name,DateAdded, CustomerTitle, "
			 * + " FirstName, LastName, Address1, Address2," +
			 * " City, State, Province, Country, ZipCode, Phone, CellPhone,Fax,HomePage, Email, CompanyID,"
			 * +
			 * " ResellerTaxID,VendorOpenDebit,VendorAllowedCredit,Detail,Taxable,CVTypeID, "
			 * + "CVCategoryID, CVCategoryName,Active,Deleted,Status,CCTypeID) " +
			 * " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,0,?,? )";
			 */ // total=31

			String sqlString1 = "update bca_clientvendor set Name=?,DateAdded=?,CustomerTitle=?,FirstName=?,"
					+ "LastName=?,Address1=?,Address2=?,City=?,State=?,Province=?,Country=?,ZipCode=?,"
					+ "Phone=?,CellPhone=?,Fax=?,HomePage=?,Email=?,CompanyID=?,ResellerTaxID=?,"
					+ "VendorOpenDebit=?,VendorAllowedCredit=?,Detail=?,Taxable=?,CVTypeID=?,"
					+ "CVCategoryID=?,CVCategoryName=?,Active=1,Deleted=0,Status=?,CCTypeID=?,DBAName=? "
					+ "where ClientVendorID=" + cvID;

			pstmt = con.prepareStatement(sqlString1);
			pstmt.setString(1, c.getCname());
			pstmt.setDate(2, ((c.getDateAdded() == null || c.getDateAdded().equals("")) ? cinfo.string2date("now()")
					: cinfo.string2date(c.getDateAdded())));
			pstmt.setString(3, c.getTitle());
			pstmt.setString(4, c.getFirstName());
			pstmt.setString(5, c.getLastName());
			pstmt.setString(6, c.getAddress1());
			pstmt.setString(7, c.getAddress2());
			pstmt.setString(8, c.getCity());
			pstmt.setString(9, c.getState());
			pstmt.setString(10, c.getProvince());
			pstmt.setString(11, c.getCountry());
			pstmt.setString(12, c.getZipCode());
			pstmt.setString(13, c.getPhone());
			pstmt.setString(14, c.getCellPhone());
			pstmt.setString(15, c.getFax());
			pstmt.setString(16, c.getHomePage());
			pstmt.setString(17, c.getEmail());
			pstmt.setString(18, compID);
			pstmt.setString(19, c.getTexID());
			pstmt.setString(20, oBal);
			pstmt.setString(21, exCredit);
			pstmt.setString(22, c.getMemo()); // detail
			pstmt.setInt(23, istaxable); // taxable
			pstmt.setInt(24, isAlsoClient); // cvtypeid
			pstmt.setInt(25, Integer.parseInt(c.getType())); // cvcategoryid
			pstmt.setString(26, vcName); // CVCategoryName
			pstmt.setString(27, status); // may be {N, U, 0(zero)}
			int cct = (c.getCcType() == null || c.getCcType().equals("") ? 0 : Integer.parseInt(c.getCcType()));
			pstmt.setInt(28, cct); // credit card type
			pstmt.setString(29, c.getDbaName());
			// pstmt.setInt(29, cvID);

			Loger.log(sqlString1);
			int num = pstmt.executeUpdate();

			if (num > 0) {
				ret = true;
			}
			if (c.getShipping() != null && c.getShipping().trim().length() > 0)
				updateClientVendor("ShipCarrierID", c.getShipping(), cvID);

			if (c.getPaymentType() != null && c.getPaymentType().trim().length() > 0)
				updateClientVendor("PaymentTypeID", c.getPaymentType(), cvID);

			if (c.getRep() != null && c.getRep().trim().length() > 0)
				updateClientVendor("SalesRepID", c.getRep(), cvID);

			if (c.getTerm() != null && c.getTerm().trim().length() > 0)
				updateClientVendor("TermID", c.getTerm(), cvID);

			// Update credit card details
			updateVendorCreditCard(cvID, c.getCcType(), c.getCardNo(), c.getExpDate(), c.getCw2(),
					c.getCardHolderName(), c.getCardBillAddress(), c.getCardZip());

			// change status of old record...........
			pstmt = con.prepareStatement(
					"update bca_bsaddress set status='0' where clientvendorid=? and status in ('N','U')");
			pstmt.setInt(1, cvID);
			pstmt.executeUpdate();
			// ......................status change finished.........

			int bsAddID = getLastBsAdd() + 1;

			System.out.println("c.getSetdefaultbs():" + c.getSetdefaultbs());

			insertVendorBSAddress(cvID, bsAddID, c.getBscname(), c.getBsdbaName(), c.getBsfirstName(),
					c.getBslastName(), c.getBsaddress1(), c.getBsaddress2(), c.getBscity(), c.getBsstate(),
					c.getBsprovince(), c.getBscountry(), c.getBszipCode(), "1");

			insertVendorBSAddress(cvID, bsAddID, c.getShcname(), c.getShdbaName(), c.getShfirstName(),
					c.getShlastName(), c.getShaddress1(), c.getShaddress2(), c.getShcity(), c.getShstate(),
					c.getShprovince(), c.getShcountry(), c.getShzipCode(), "0");

			insertVFCharge(cvID, useIndividualFinanceCharges, c.getAnnualIntrestRate(), c.getMinFCharges(),
					c.getGracePrd(), AssessFinanceChk, 0);

			// --------code to save services--------------------------START---
			int i = 0;
			String sql;
			String serviceID = c.getTable_serID();

			String serviceBal = c.getTable_bal();
			String defaultser = c.getTable_defaultVal();
			String invStyleID = c.getTable_invId();

			sql = "delete from bca_clientvendorservice where ClientVendorID = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, cvID);
			ps.executeUpdate();

			if (!(serviceID.equals("") || invStyleID.equals("") || serviceBal.equals(""))) {

				String temp[] = null, temp2[] = null, temp3[] = null;
				if ((serviceID != "" && serviceID != null)
						&& (invStyleID != "" && invStyleID != null) & (serviceBal != "" && serviceBal != null)) {
					temp = serviceID.split(";"); // serviceID is in form like

					temp2 = invStyleID.split(";");
					temp3 = serviceBal.split(";");
				}
				java.sql.Date d = new java.sql.Date(new Date().getTime());

				System.out.println("Length of temp:" + temp.length);

				for (i = 0; i < temp.length; i++) {
					sql = "insert into bca_clientvendorservice "
							+ "(ClientVendorID,DateAdded,CompanyID,InvoiceStyleID,ServiceBalance,DEFAULTService) "
							+ "values (?,?,?,?,?,?)";

					/* sql = "insert into bca_clientvendorservice values (?,?,?,?,?,?,?)"; */
					ps = con.prepareStatement(sql);
					ps.setInt(1, cvID);
					ps.setDate(2, d);
					ps.setInt(3, Integer.parseInt(compID));
					ps.setInt(4, Integer.parseInt(temp2[i]));
					ps.setFloat(5, Float.parseFloat(temp3[i]));
					if (Integer.parseInt(temp[i]) == Integer.parseInt(defaultser)) {
						ps.setInt(6, 1);
						// Loger.log("EQUAL-------------------->>");
					} else
						ps.setInt(6, 0);
					/* ps.setInt(7, Integer.parseInt(temp[i])); */
					System.out.println("temp[i]:" + temp[i]);

					ps.executeUpdate();
				}
			}
			// --------------------------code to save services
			// -------------------------------------END-------

		} catch (SQLException ee) {
			Loger.log(2, "SQLException in Class PurchaseInfo,  method -updateInsertVendor " + ee.toString());
		} finally {
			try {

				if (pstmt != null) {
					db.close(pstmt);
				}
				if (ps != null) {
					db.close(ps);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return ret;
	}

	/*
	 * Provides the information such as vendor name,id,address1,etc. & also provides
	 * the services related to these vendors with their ids.
	 */
	public ArrayList getPrintLabelInfo(HttpServletRequest request, String compId, int startValue, int limit) {
		ArrayList<VendorDto> labelInfo = new ArrayList<>();
		ArrayList<VendorDto> serviceList = new ArrayList<>();
		int start = ((startValue - 1) * limit);
		try {
			Pageable pageable = PageRequest.of(start, limit);
			List<BcaClientvendor> clientVendor = bcaClientvendorRepository
					.findByCompanyIdAndActiveAndDeletedAndCvTypeIdInAndStatusInOrderByName(Long.parseLong(compId), 1, 0,
							Arrays.asList(1, 3), Arrays.asList("N", "U"), pageable);

			for (BcaClientvendor bcv : clientVendor) {
				VendorDto vendor = new VendorDto();
				vendor.setClientVendorID(String.valueOf(bcv.getClientVendorId()));
				vendor.setCname(bcv.getName());
				vendor.setFirstName(bcv.getFirstName());
				vendor.setLastName(bcv.getLastName());
				vendor.setFullName(bcv.getFirstName() + " " + bcv.getLastName());
				vendor.setAddress1(bcv.getAddress1());
				vendor.setAddress2(bcv.getAddress2());
				vendor.setCity(bcv.getCity());
				vendor.setState(countryState.getStatesName(bcv.getState()));
				vendor.setZipCode(bcv.getZipCode());
				vendor.setCellPhone(bcv.getCellPhone());
				vendor.setFax(bcv.getFax());
				vendor.setEmail(bcv.getEmail());
				vendor.setDateAdded(DateHelper.dateFormatter(bcv.getDateAdded()));
				List<BcaClientvendorservice> cvs = bcaClientvendorserviceRepository
						.findByClientVendor_ClientVendorId(bcv.getClientVendorId());
				for (BcaClientvendorservice clientVendorService : cvs) {
					VendorDto vendorService = new VendorDto();
					Optional<BcaServicetype> serviceType = bcaServicetypeRepository
							.findById(clientVendorService.getServiceId());
					if (serviceType.isPresent()) {
						vendorService.setClientVendorID(vendor.getClientVendorID());
						vendorService.setServiceName(serviceType.get().getServiceName());
					}
					serviceList.add(vendorService);
				}
				labelInfo.add(vendor);
			}
			request.setAttribute("Services", serviceList);

		} catch (Exception ee) {
			Loger.log(2, "SQL Error in Class PurchaseInfo and  method -getPrintLabelInfo " + ee.toString());
		}
		return labelInfo;
	}

//	public ArrayList getPrintLabelInfo(HttpServletRequest request, String compId, int startValue, int limit) {
//		Connection con = null;
//		ArrayList<VendorDto> labelInfo = new ArrayList<>();
//		CountryState conState = new CountryState();
//		PreparedStatement pstmt_client = null;
//		PreparedStatement pstmt_clientSer = null;
//		PreparedStatement pstmt_ser = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<VendorDto> serviceList = new ArrayList<>();
//		ResultSet rs_client = null;
//		ResultSet rs_clientSer = null;
//		ResultSet rs_ser = null;
//		con = db.getConnection();
//		int start = ((startValue - 1) * limit);
//		try {
//			
//			
//			String sqlString = "select ClientVendorID,Name,FirstName,LastName,Address1,Address2,"
//					+ " City,State,ZipCode,CellPhone,Fax,Email,date_format(DateAdded,'%m-%d-%Y') as DateAdded"
//					+ " from bca_clientvendor where (CVTypeID=1 or CVTypeID=3 )and Status in ('N','U') "
//					+ " and Deleted=0 and Active=1 and CompanyID=? order by Name limit ?,?";
//
//			pstmt_client = con.prepareStatement(sqlString);
//			pstmt_client.setString(1, compId);
//			pstmt_client.setInt(2, start);
//			pstmt_client.setInt(3, limit);
//			rs_client = pstmt_client.executeQuery();
//			while (rs_client.next()) {
//				VendorDto vendor = new VendorDto();
//				vendor.setClientVendorID(rs_client.getString("ClientVendorID"));
//				vendor.setCname(rs_client.getString("Name"));
//				vendor.setFirstName(rs_client.getString("FirstName"));
//				vendor.setLastName(rs_client.getString("LastName"));
//				vendor.setFullName(rs_client.getString("FirstName") + " " + rs_client.getString("LastName"));
//				vendor.setAddress1(rs_client.getString("Address1"));
//				vendor.setAddress2(rs_client.getString("Address2"));
//				vendor.setCity(rs_client.getString("City"));
//				vendor.setState(conState.getStatesName(rs_client.getString("State")));
//				vendor.setZipCode(rs_client.getString("ZipCode"));
//				vendor.setCellPhone(rs_client.getString("CellPhone"));
//				vendor.setFax(rs_client.getString("Fax"));
//				vendor.setEmail(rs_client.getString("Email"));
//				vendor.setDateAdded(rs_client.getString("DateAdded"));
//
//				String sqlServiceID = "select ServiceID from bca_clientvendorservice where ClientVendorID=?";
//				pstmt_clientSer = con.prepareStatement(sqlServiceID);
//				pstmt_clientSer.setString(1, vendor.getClientVendorID());
//				rs_clientSer = pstmt_clientSer.executeQuery();
//				String services = "select ServiceName from bca_servicetype where ServiceID=?";
//				while (rs_clientSer.next()) {
//					VendorDto vendorService = new VendorDto();
//					pstmt_ser = con.prepareStatement(services);
//					pstmt_ser.setInt(1, rs_clientSer.getInt("ServiceID"));
//					rs_ser = pstmt_ser.executeQuery();
//					if (rs_ser.next()) {
//						vendorService.setClientVendorID(vendor.getClientVendorID());
//						vendorService.setServiceName(rs_ser.getString("ServiceName"));
//					}
//					serviceList.add(vendorService);
//				}
//
//				labelInfo.add(vendor);
//			}
//			request.setAttribute("Services", serviceList);
//
//		} catch (SQLException ee) {
//			Loger.log(2, "SQL Error in Class PurchaseInfo and  method -getPrintLabelInfo " + ee.toString());
//		} finally {
//			try {
//				if (rs_client != null) {
//					db.close(rs_client);
//				}
//				if (rs_clientSer != null) {
//					db.close(rs_clientSer);
//				}
//				if (rs_ser != null) {
//					db.close(rs_ser);
//				}
//				if (pstmt_client != null) {
//					db.close(pstmt_client);
//				}
//				if (pstmt_clientSer != null) {
//					db.close(pstmt_clientSer);
//				}
//				if (pstmt_ser != null) {
//					db.close(pstmt_ser);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return labelInfo;
//	}

	/*
	 * Invoke the information such as label name width,height,top margin,etc. from
	 * its label id.
	 */
//	public void getLabel(int lblId, PrintLabelDto label) {
//		Connection con = null;
//		PreparedStatement pstmt_lbl = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//
//		try {
//			pstmt_lbl = con.prepareStatement(
//					"select ID,LabelType,Mar_Top,Mar_Left,Size_Width,Size_Height,Spacing_Hor,Spacing_Vert from bca_label where ID=?");
//			pstmt_lbl.setInt(1, lblId);
//			rs = pstmt_lbl.executeQuery();
//			if (rs.next()) {
//
//				label.setLabelType(rs.getInt("ID"));
//				label.setLabelName(rs.getString("LabelType"));
//				label.setTopMargin(rs.getString("Mar_Top"));
//				label.setLeftMargin(rs.getString("Mar_Left"));
//				label.setLabelWidth(rs.getString("Size_Width"));
//				label.setLabelHeight(rs.getString("Size_Height"));
//				label.setVertical(rs.getString("Spacing_Vert"));
//				label.setHorizon(rs.getString("Spacing_Hor"));
//			}
//
//		} catch (SQLException ee) {
//			Loger.log(2, "SQL Error in Class PurchaseInfo and method -getLabel " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt_lbl != null) {
//					db.close(pstmt_lbl);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//	}

	public void getLabel(int lblId, PrintLabelDto label) {
		try {
			Optional<BcaLabel> bcaLabel = bcaLabelRepository.findById(lblId);
			if (bcaLabel.isPresent()) {
				BcaLabel rs = bcaLabel.get();

				label.setLabelType(rs.getId());
				label.setLabelName(rs.getLabelType());
				label.setTopMargin(String.valueOf(rs.getMarTop()));
				label.setLeftMargin(String.valueOf(rs.getMarLeft()));
				label.setLabelWidth(String.valueOf(rs.getSizeWidth()));
				label.setLabelHeight(String.valueOf(rs.getSizeHeight()));
				label.setVertical(String.valueOf(rs.getSpacingVert()));
				label.setHorizon(String.valueOf(rs.getSpacingHor()));
			}

		} catch (Exception ee) {
			Loger.log(2, "SQL Error in Class PurchaseInfo and method -getLabel " + ee.toString());
		}
	}

	/*
	 * Saves the new label to the database with its related information.
	 */
//	public void saveLabel(PrintLabelDto form) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		PreparedStatement pstmt1 = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//
//		try {
//			int labelID = 0;
//			pstmt1 = con.prepareStatement("select max(ID)+1 from bca_label");
//			rs = pstmt1.executeQuery();
//			if (rs.next()) {
//				labelID = rs.getInt(1);
//			}
//			pstmt = con.prepareStatement("insert into bca_label values(?,\"" + form.getLabelName() + "\",?,?,?,?,?,?)");
//			pstmt.setInt(1, labelID);
//			pstmt.setString(2, form.getTopMargin());
//			pstmt.setString(3, form.getLeftMargin());
//			pstmt.setString(4, form.getLabelWidth());
//			pstmt.setString(5, form.getLabelHeight());
//			pstmt.setString(6, form.getHorizon());
//			pstmt.setString(7, form.getVertical());
//			pstmt.executeUpdate();
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -saveLabel" + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (pstmt1 != null) {
//					db.close(pstmt1);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//	}
	public void saveLabel(PrintLabelDto form) {
		try {
			BcaLabel bcaLabel = new BcaLabel();
			bcaLabel.setMarTop(Double.parseDouble(form.getTopMargin()));
			bcaLabel.setMarLeft(Double.parseDouble(form.getLeftMargin()));
			bcaLabel.setSizeHeight(Double.parseDouble(form.getLabelHeight()));
			bcaLabel.setSizeWidth(Double.parseDouble(form.getLabelWidth()));
			bcaLabel.setSpacingHor(Double.parseDouble(form.getHorizon()));
			bcaLabel.setSpacingVert(Double.parseDouble(form.getVertical()));

			bcaLabelRepository.save(bcaLabel);

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -saveLabel" + ee.toString());
		}

	}

	/*
	 * Delete the label selected by user from existing labels. It delete the labels
	 * according to their ids.
	 */
//	public void deleteLabel(int lblId, PrintLabelDto form) {
//		Connection con = null;
//		PreparedStatement pstmt_delete = null, pstmt_id = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs_id = null;
//		try {
//			pstmt_delete = con.prepareStatement("delete from bca_label where ID=?");
//			pstmt_delete.setInt(1, lblId);
//			int del = pstmt_delete.executeUpdate();
//			if (del > 0) {
//				pstmt_id = con.prepareStatement("select ID from bca_label where ID >? order by ID asc");
//				pstmt_id.setInt(1, lblId);
//				rs_id = pstmt_id.executeQuery();
//				if (rs_id.next())
//					getLabel(rs_id.getInt("ID"), form);
//				else {
//					pstmt_id = con.prepareStatement("select ID from bca_label");
//					rs_id = pstmt_id.executeQuery();
//					if (rs_id.next()) {
//						getLabel(rs_id.getInt("ID"), form);
//					}
//
//				}
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, "  SQL Error in Class CustomerInfo and  method -deleteLabel" + " " + ee.toString());
//		} finally {
//			try {
//				if (rs_id != null) {
//					db.close(rs_id);
//				}
//				if (pstmt_delete != null) {
//					db.close(pstmt_delete);
//				}
//				if (pstmt_id != null) {
//					db.close(pstmt_id);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(2, " SQL Error in Class CustomerInfo and  method -deleteLabel and in finally " + " "
//						+ e.toString());
//			}
//		}
//	}

	public void deleteLabel(int lblId, PrintLabelDto form) {

		try {
			bcaLabelRepository.deleteById(lblId);
			List<BcaLabel> bcalabel = bcaLabelRepository.findByIdGreaterThanOrderByIdAsc(lblId);
			if (!bcalabel.isEmpty()) {
				getLabel(bcalabel.get(0).getId(), form);
			} else {
				List<BcaLabel> labelList = bcaLabelRepository.findAll();
				if (!labelList.isEmpty()) {
					getLabel(labelList.get(0).getId(), form);
				}
			}

		} catch (Exception ee) {
			Loger.log(2, "  SQL Error in Class CustomerInfo and  method -deleteLabel" + " " + ee.toString());
		}
	}

	/*
	 * Updates the label selected by user from existing labels. It updates the label
	 * & its related information by its id.
	 */
	public void updateLabel(int labelID, PrintLabelDto form) {
		try {
			if (form.getTopMargin().equals("")) {
				form.setTopMargin("0");
			}
			if (form.getLeftMargin().equals("")) {
				form.setLeftMargin("0");
			}
			if (form.getLabelWidth().equals("")) {
				form.setLabelWidth("0");
			}
			if (form.getLabelHeight().equals("")) {
				form.setLabelHeight("0");
			}
			if (form.getHorizon().equals("")) {
				form.setHorizon("0");
			}
			if (form.getVertical().equals("")) {
				form.setTopMargin("0");
			}

			Optional<BcaLabel> bcalabel = bcaLabelRepository.findById(labelID);
			if (bcalabel.isPresent()) {
				BcaLabel label = bcalabel.get();

				label.setLabelType(form.getLabelName());
				label.setMarLeft(Double.parseDouble(form.getLeftMargin()));
				label.setMarTop(Double.parseDouble(form.getTopMargin()));
				label.setSizeHeight(Double.parseDouble(form.getLabelHeight()));
				label.setSizeWidth(Double.parseDouble(form.getLabelWidth()));
				label.setSpacingHor(Double.parseDouble(form.getHorizon()));
				label.setSpacingVert(Double.parseDouble(form.getVertical()));
				bcaLabelRepository.save(label);
			}

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
		}

	}

//	public void updateLabel(int labelID, PrintLabelDto form) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//
//		try {
//			if (form.getTopMargin().equals("")) {
//				form.setTopMargin("0");
//			}
//			if (form.getLeftMargin().equals("")) {
//				form.setLeftMargin("0");
//			}
//			if (form.getLabelWidth().equals("")) {
//				form.setLabelWidth("0");
//			}
//			if (form.getLabelHeight().equals("")) {
//				form.setLabelHeight("0");
//			}
//			if (form.getHorizon().equals("")) {
//				form.setHorizon("0");
//			}
//			if (form.getVertical().equals("")) {
//				form.setTopMargin("0");
//			}
//			pstmt = con.prepareStatement("update bca_label set LabelType=\"" + form.getLabelName()
//					+ "\",Mar_Top=?,Mar_Left=?,Size_Width=?,Size_Height=?,Spacing_Hor=?,Spacing_Vert=? where ID=?");
//			pstmt.setString(1, form.getTopMargin());
//			pstmt.setString(2, form.getLeftMargin());
//			pstmt.setString(3, form.getLabelWidth());
//			pstmt.setString(4, form.getLabelHeight());
//			pstmt.setString(5, form.getHorizon());
//			pstmt.setString(6, form.getVertical());
//			pstmt.setInt(7, labelID);
//			pstmt.executeUpdate();
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
//		} finally {
//			try {
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//	}

}
