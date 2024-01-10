/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.purchase.dao;

import java.lang.reflect.InvocationTargetException;
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
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.purchase.forms.PrintLabelDto;
import com.avibha.bizcomposer.purchase.forms.PurchaseBoardDto;
import com.avibha.bizcomposer.purchase.forms.VendorDto;
import com.avibha.bizcomposer.sales.dao.CustomerInfo;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.avibha.common.utility.DateInfo;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaBsaddress;
import com.nxsol.bzcomposer.company.domain.BcaCctype;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaClientvendorfinancecharges;
import com.nxsol.bzcomposer.company.domain.BcaClientvendorservice;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCvcreditcard;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.domain.BcaServicetype;
import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;
import com.nxsol.bzcomposer.company.domain.BcaTerm;
import com.nxsol.bzcomposer.company.domain.SmdCvinfo;
import com.nxsol.bzcomposer.company.domain.StorageBillingaddress;
import com.nxsol.bzcomposer.company.domain.StorageShippingaddress;
import com.nxsol.bzcomposer.company.repos.BcaBillingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaBsaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaCctypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorfinancechargesRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorserviceRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCvcreditcardRepository;
import com.nxsol.bzcomposer.company.repos.BcaShippingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaServicetypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;
import com.nxsol.bzcomposer.company.repos.SmdCvinfoRepository;
import com.nxsol.bzcomposer.company.repos.StorageBillingaddressRepository;
import com.nxsol.bzcomposer.company.repos.StorageShippingaddressRepository;
import com.nxsol.bzcomposer.company.utils.DateHelper;
import com.nxsol.bzcomposer.company.utils.JpaHelper;
import com.pritesh.bizcomposer.accounting.bean.TblBSAddress2;

/* 
 * 
 */
@Service
public class PurchaseInfo {

	/*
	 * The method display all the list of vendors which is useful for the vendors
	 * tab in the purchase tab
	 */

	@Autowired
	private BcaBsaddressRepository bcaBsaddressRepository;

	@Autowired
	private BcaClientvendorfinancechargesRepository bcaClientvendorfinancechargesRepository;

	@Autowired
	private BcaClientvendorRepository bcaClientvendorRepository;

	@Autowired
	private BcaBillingaddressRepository bcaBillingaddressRepository;

	@Autowired
	private BcaShippingaddressRepository bcaShippingaddressRepository;

	@Autowired
	private CountryState countryState;

	@Autowired
	private EntityManager entityManager;

	@Autowired
	private BcaClientvendorserviceRepository bcaClientvendorserviceRepository;

	@Autowired
	private BcaServicetypeRepository bcaServicetypeRepository;

	@Autowired
	private BcaCompanyRepository bcaCompanyRepository;

	@Autowired
	private VendorCategory vendorCategory;

	@Autowired
	private CustomerInfo customerInfo;

	@Autowired
	private BcaShipcarrierRepository bcaShipcarrierRepository;

	@Autowired
	private BcaTermRepository bcaTermRepository;

	@Autowired
	private BcaSalesrepRepository bcaSalesrepRepository;

	@Autowired
	private BcaPaymenttypeRepository bcaPaymenttypeRepository;
	@Autowired
	private SmdCvinfoRepository smdCvinfoRepository;

	@Autowired
	private StorageBillingaddressRepository storageBillingaddressRepository;

	@Autowired
	private StorageShippingaddressRepository storageShippingaddressRepository;

	public List<VendorDto> getVendorsBySort(String compId, String sortBy) {
		List<VendorDto> objList = new ArrayList<>();
		List<VendorDto> serviceList = new ArrayList<>();

		List<String> vendorIDs = new ArrayList<>();

		try {
			StringBuffer query = new StringBuffer("select distinct  "
					+ "  c.clientVendorId , c.name ,c.customerTitle, c.firstName , c.lastName , c.address1, c.address2, c.city, c.state , c.zipCode , c.country ,"
					+ " c.email , c.phone , c.cellPhone , c.fax ,date_format(c.dateAdded , '%m-%d-%Y') as dateAdded , i.isPaymentCompleted , c.cvcategoryName, ct.name as cityName , st.name as stateName , cn.name as countryName"
					+ " , c.dbaname, c.detail  from BcaClientvendor as c left join BcaCountries as cn on cn.id =c.country left join BcaStates as st on st.id =c.state left join BcaCities as ct on ct.id = c.city "
					+ " left join BcaInvoice as i on i.clientVendor.clientVendorId = c.clientVendorId and not (i.invoiceStatus =1) and i.isPaymentCompleted = 0 and i.invoiceType.invoiceTypeId in (1,13,17)"
					+ " where c.company.companyId =  :companyId and c.cvtypeId in :cvtypeId and c.status in :status and c.deleted = :deleted and c.active = :active order by  c.clientVendorId");

			TypedQuery<Object[]> typedQuery = this.entityManager.createQuery(query.toString(), Object[].class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.parseLong(compId));
			JpaHelper.addParameter(typedQuery, query.toString(), "cvtypeId", Arrays.asList(1, 3));
			JpaHelper.addParameter(typedQuery, query.toString(), "status", Arrays.asList("U", "N"));
			JpaHelper.addParameter(typedQuery, query.toString(), "deleted", 0);
			JpaHelper.addParameter(typedQuery, query.toString(), "active", 1);

			List<Object[]> obj = typedQuery.getResultList();
			List<VendorDto> vendorDtos = mapResultsToObject(obj);
			for (VendorDto dto : vendorDtos) {
				if (vendorIDs.contains(dto.getClientVendorID()))
					continue;
				else
					vendorIDs.add(dto.getClientVendorID());
				dto.setCity(dto.getCityName() != null ? dto.getCityName() : dto.getCity());
				dto.setStateName(dto.getStateName() != null ? dto.getStateName() : dto.getState());
				String countryName = dto.getCountryName() != null ? dto.getCountryName() : dto.getCountry();
				if (countryName != null && countryName.contains("United States")) {
					countryName = "USA";

				}
				dto.setCountry(countryName);

				dto.setFullName(dto.getFirstName() + " " + dto.getLastName());

				List<BcaClientvendorservice> cvs = bcaClientvendorserviceRepository
						.findByClientVendor_ClientVendorId(Integer.parseInt(dto.getClientVendorID()));
				for (BcaClientvendorservice clientVendorService : cvs) {
					VendorDto vendorService = new VendorDto();
					Optional<BcaServicetype> serviceType = bcaServicetypeRepository
							.findById(clientVendorService.getServiceId());
					if (serviceType.isPresent()) {
						vendorService.setClientVendorID(dto.getClientVendorID());
						vendorService.setServiceName(serviceType.get().getServiceName());
					}
					serviceList.add(vendorService);
				}
				objList.add(dto);
			}
		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());
		}

		return objList;
	}

//	public ArrayList getVendorsBySort(String compId, String sortBy) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null, pstmt_clientSer = null, pstmt_ser = null;
//		ResultSet rs = null, rs_clientSer = null, rs_ser = null;
//		ArrayList<VendorDto> objList = new ArrayList<>();
//		ArrayList<VendorDto> serviceList = new ArrayList<>();
//		List<String> vendorIDs = new ArrayList<>();
//		CountryState cs = new CountryState();
//		if (sortBy == null) {
//			sortBy = "ClientVendorID";
//		}
//		try {
//
//			String sqlString = "SELECT distinct c.ClientVendorID,c.Name,c.CustomerTitle,c.FirstName,c.LastName,c.Address1,c.Address2,c.City,c.State,c.ZipCode,c.Country,"
//					+ "c.Email,c.Phone,c.CellPhone,c.Fax,date_format(c.DateAdded,'%m-%d-%Y') as DateAdded,i.IsPaymentCompleted,c.CVCategoryName,"
//					+ "ct.Name AS CityName, st.Name AS StateName, cn.Name AS CountryName, c.DBAName,c.Detail "
//					+ "FROM bca_clientvendor AS c LEFT JOIN bca_countries as cn ON cn.ID=c.Country LEFT JOIN bca_states as st ON st.ID=c.State LEFT JOIN bca_cities as ct ON ct.ID=c.City "
//					+ "LEFT JOIN bca_invoice as i ON i.ClientVendorID=c.ClientVendorID AND NOT (i.invoiceStatus=1) AND i.IsPaymentCompleted = 0 AND i.InvoiceTypeID IN (1,13,17) "
//					+ "WHERE c.CompanyID=? AND CVTypeID IN (1,3) AND c.Status IN ('U','N') AND c.Deleted=0 AND c.Active=1";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, compId);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				// System.out.println(rs.getString("ClientVendorID")+":
//				// "+rs.getString("FirstName")+", "+rs.getString("LastName"));
//				if (vendorIDs.contains(rs.getString(1)))
//					continue;
//				else
//					vendorIDs.add(rs.getString(1));
//
//				VendorDto vendor = new VendorDto();
//				vendor.setClientVendorID(rs.getString("ClientVendorID"));
//				vendor.setCname(rs.getString("Name"));
//				vendor.setTitle(rs.getString("CustomerTitle"));
//				vendor.setFirstName(rs.getString("FirstName"));
//				vendor.setLastName(rs.getString("LastName"));
//				vendor.setAddress1(rs.getString("Address1"));
//				vendor.setAddress2(rs.getString("Address2"));
//				vendor.setZipCode(rs.getString("ZipCode"));
//				vendor.setCity(rs.getString("CityName") != null ? rs.getString("CityName") : rs.getString("City"));
//				vendor.setStateName(
//						rs.getString("StateName") != null ? rs.getString("StateName") : rs.getString("State"));
//				String countryName = rs.getString("CountryName") != null ? rs.getString("CountryName")
//						: rs.getString("Country");
//				if (countryName != null && countryName.contains("United States")) {
//					countryName = "USA";
//				}
//				vendor.setCountry(countryName);
//				vendor.setEmail(rs.getString("Email"));
//				vendor.setPhone(rs.getString("Phone"));
//				vendor.setCellPhone(rs.getString("CellPhone"));
//				vendor.setFax(rs.getString("Fax"));
//				vendor.setDateAdded(rs.getString("DateAdded"));
//				vendor.setFullName(rs.getString("FirstName") + " " + rs.getString("LastName"));
//				vendor.setType(rs.getString("CVCategoryName"));
//				vendor.setDbaName(rs.getString("DBAName"));
//				vendor.setMemo(rs.getString("Detail"));
//
//				pstmt_clientSer = con
//						.prepareStatement("select ServiceID from bca_clientvendorservice where ClientVendorID=?");
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
//			// request.setAttribute("Services", serviceList);
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());
//		} finally {
//			if (rs != null) {
//				db.close(rs);
//			}
//			if (rs_clientSer != null) {
//				db.close(rs_clientSer);
//			}
//			if (rs_ser != null) {
//				db.close(rs_ser);
//			}
//			if (pstmt != null) {
//				db.close(pstmt);
//			}
//			if (pstmt_clientSer != null) {
//				db.close(pstmt_clientSer);
//			}
//			if (pstmt_ser != null) {
//				db.close(pstmt_ser);
//			}
//			if (con != null) {
//				db.close(con);
//			}
//		}
//		return objList;
//	}

	public ArrayList searchVendors(String compId, String venderText) {
		ArrayList<VendorDto> objList = new ArrayList<>();
		ArrayList<VendorDto> serviceList = new ArrayList<>();
		try {
			List<BcaClientvendor> clientVendor = bcaClientvendorRepository
					.searchVendorByCompanyIdAndText(Long.parseLong(compId), venderText);
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
				vendor.setProvince(bcv.getProvince());
				vendor.setCountry(countryState.getCountryName(bcv.getCountry()));
				vendor.setZipCode(bcv.getZipCode());
				vendor.setMemo(bcv.getDetail());
				vendor.setDateAdded(DateHelper.dateFormatter(bcv.getDateAdded()));
				vendor.setMiddleName(bcv.getMiddleName());
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
				objList.add(vendor);

			}
			// request.setAttribute("Services", serviceList);
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());
		}
		return objList;
	}

//	public ArrayList searchVendors(String compId, String venderText) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		PreparedStatement pstmt_clientSer = null;
//		PreparedStatement pstmt_ser = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<VendorDto> objList = new ArrayList<>();
//		ArrayList<VendorDto> serviceList = new ArrayList<>();
//		ResultSet rs = null;
//		ResultSet rs_clientSer = null;
//		ResultSet rs_ser = null;
//		con = db.getConnection();
//		try {
//			String sqlString = "select ClientVendorID,Name,FirstName,LastName,Phone,Fax,Email,Address1,Address2,City,State,Province,Country,ZipCode,Detail,"
//					+ " date_format(DateAdded,'%m-%d-%Y') as DateAdded, MiddleName, DateInput,'%m-%d-%Y') As DateInput, DateTerminated,'%m-%d-%Y') As DateTerminated, isTerminated "
//					+ " FROM bca_clientvendor "
//					+ " WHERE CVTypeID IN (1, 3) and Status in ('N','U') and Deleted=0 and Active=1 and CompanyID=? "
//					+ " AND (Name LIKE '%" + venderText + "%' OR FirstName LIKE '%" + venderText
//					+ "%' OR LastName LIKE '%" + venderText + "%') order by Name";
//
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, compId);
//			rs = pstmt.executeQuery();
//			CountryState cs = new CountryState();
//			while (rs.next()) {
//				// System.out.println(rs.getString("ClientVendorID")+":
//				// "+rs.getString("FirstName")+", "+rs.getString("LastName"));
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
//				vendor.setMiddleName(rs.getString(17));
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
//				objList.add(vendor);
//			}
//			// request.setAttribute("Services", serviceList);
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());
//		} finally {
//			if (rs != null) {
//				db.close(rs);
//			}
//			if (rs_clientSer != null) {
//				db.close(rs_clientSer);
//			}
//			if (rs_ser != null) {
//				db.close(rs_ser);
//			}
//			if (pstmt != null) {
//				db.close(pstmt);
//			}
//			if (pstmt_clientSer != null) {
//				db.close(pstmt_clientSer);
//			}
//			if (pstmt_ser != null) {
//				db.close(pstmt_ser);
//			}
//			if (con != null) {
//				db.close(con);
//			}
//		}
//		return objList;
//	}

	/* vendor contact list */
	public ArrayList vendorContactList(String datesCombo, String fromDate, String toDate, String sortBy, String cId,
			HttpServletRequest request, PurchaseBoardDto form) {
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
		String dateBetween = "";
		ArrayList<Date> selectedRange = new ArrayList<>();
		CustomerInfo cInfo = new CustomerInfo();
		DateInfo dInfo = new DateInfo();

		if (datesCombo != null && !datesCombo.equals("8")) {
			if (datesCombo != null && !datesCombo.equals("")) {
				selectedRange = dInfo.selectedIndex(Integer.parseInt(datesCombo));
				if (!selectedRange.isEmpty() && selectedRange != null) {
					form.setFromDate(cInfo.date2String(selectedRange.get(0)));
					form.setToDate(cInfo.date2String(selectedRange.get(1)));
				}
				if (selectedRange != null && !selectedRange.isEmpty()) {
					dateBetween = " AND DateAdded BETWEEN Timestamp ('"
							+ JProjectUtil.getDateFormaterCommon().format(selectedRange.get(0)) + "') AND Timestamp ('"
							+ JProjectUtil.getDateFormaterCommon().format(selectedRange.get(1)) + "')";
				}
			}
		} else if (datesCombo != null && datesCombo.equals("8")) {
			if (fromDate.equals("") && toDate.equals("")) {
				dateBetween = "";
			} else if (!fromDate.equals("") && toDate.equals("")) {
				dateBetween = " AND DateAdded >= Timestamp ('"
						+ JProjectUtil.getDateFormaterCommon().format(cInfo.string2date(fromDate) + "')");
			} else if (fromDate.equals("") && !toDate.equals("")) {
				dateBetween = " AND DateAdded <= Timestamp ('"
						+ JProjectUtil.getDateFormaterCommon().format(cInfo.string2date(toDate) + "')");
			} else {
				dateBetween = " AND DateAdded BETWEEN Timestamp ('"
						+ JProjectUtil.getDateFormaterCommon().format(cInfo.string2date(fromDate))
						+ "') AND Timestamp ('" + JProjectUtil.getDateFormaterCommon().format(cInfo.string2date(toDate))
						+ "')";
			}
		}

		try {

			String sqlString = "select ClientVendorID,Name,FirstName,LastName,Phone,Fax,Email,Address1,Address2,City,State,Province,Country,"
					+ "ZipCode,Detail,date_format(DateAdded,'%m-%d-%Y') as DateAdded from bca_clientvendor where (CVTypeID=1 or CVTypeID=3 )and"
					+ " Status in ('N','U') and Deleted=0 and Active=1 and CompanyID=? " + dateBetween
					+ " order by Name";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, cId);
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			CountryState cs = new CountryState();
			while (rs.next()) {

				VendorDto vendor = new VendorDto();
				vendor.setClientVendorID(rs.getString(1));
				vendor.setCname(rs.getString(2));
				vendor.setFirstName(rs.getString(3));
				vendor.setLastName(rs.getString(4));
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

			request.setAttribute("Services", serviceList);
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
		} finally {
			try {
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
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return objList;
	}
	/**/

	/*
	 * The method insert the new vendor. It insert all the information related to
	 * that vendor such as finance charges,services,bsaaddress,etc.
	 */

	public boolean insertVendor(String cvId, VendorDto c, String compID, int istaxable, int isAlsoClient,
			int useIndividualFinanceCharges, int AssessFinanceChk, int FChargeInvoiceChk, String status,
			String stateName) {
		boolean ret = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt_services = null;
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
			PurchaseInfo pinfo = new PurchaseInfo();

			int cvID = Integer.parseInt(cvId);

			if (isAlsoClient == 1) {
				isAlsoClient = 1;
			} else
				isAlsoClient = 3;

			if (c.getOpeningUB() != null && c.getOpeningUB().trim().length() > 0)
				oBal = c.getOpeningUB();

			if (c.getExtCredit() != null && c.getExtCredit().trim().length() > 0)
				exCredit = c.getExtCredit();

			VendorCategory vc = new VendorCategory();
			String vcName = vc.CVCategory(c.getType());

			String sqlString = "insert into bca_clientvendor(ClientVendorID, Name,DateAdded, CustomerTitle, FirstName, LastName, Address1, Address2,"
					+ " City, State, Province, Country, ZipCode, Phone, CellPhone,Fax,HomePage, Email, CompanyID, ResellerTaxID,VendorOpenDebit,"
					+ " VendorAllowedCredit,Detail,Taxable,CVTypeID,CVCategoryID,CVCategoryName,Active,Deleted,Status,DBAName) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )";

			pstmt = con.prepareStatement(sqlString);
			pstmt.setInt(1, cvID);

			pstmt.setString(2, c.getCname());
			pstmt.setDate(3, (c.getDateAdded() == null || c.getDateAdded().equals("")) ? cinfo.string2date(" now() ")
					: cinfo.string2date(c.getDateAdded()));
			pstmt.setString(4, c.getTitle());
			pstmt.setString(5, c.getFirstName());
			pstmt.setString(6, c.getLastName());
			pstmt.setString(7, c.getAddress1());
			pstmt.setString(8, c.getAddress2());
			pstmt.setString(9, c.getCity());
			pstmt.setString(10, stateName);
			pstmt.setString(11, c.getProvince());
			pstmt.setString(12, c.getCountry());
			pstmt.setString(13, c.getZipCode());
			pstmt.setString(14, c.getPhone());
			pstmt.setString(15, c.getCellPhone());
			pstmt.setString(16, c.getFax());
			pstmt.setString(17, c.getHomePage());
			pstmt.setString(18, c.getEmail());
			pstmt.setString(19, compID);
			pstmt.setString(20, c.getTexID());
			pstmt.setString(21, oBal);
			pstmt.setString(22, exCredit);
			pstmt.setString(23, c.getMemo());
			pstmt.setInt(24, istaxable);
			pstmt.setInt(25, isAlsoClient);
			pstmt.setString(26, c.getType());
			pstmt.setString(27, vcName);
			pstmt.setString(28, "1");
			pstmt.setString(29, "0");
			pstmt.setString(30, status);
			pstmt.setString(31, c.getDbaName());

			Loger.log(sqlString);

			int num = pstmt.executeUpdate();
			System.out.println("Record inserted:" + num);

			if (num > 0) {
				ret = true;
			}

			if (c.getShipping() != null && c.getShipping().trim().length() > 0)
				pinfo.updateClientVendor("ShipCarrierID", c.getShipping(), cvID);

			if (c.getPaymentType() != null && c.getPaymentType().trim().length() > 0)
				pinfo.updateClientVendor("PaymentTypeID", c.getPaymentType(), cvID);

			if (c.getRep() != null && c.getRep().trim().length() > 0)
				pinfo.updateClientVendor("SalesRepID", c.getRep(), cvID);

			if (c.getTerm() != null && c.getTerm().trim().length() > 0)
				pinfo.updateClientVendor("TermID", c.getTerm(), cvID);

			if (c.getCcType() != null && c.getCcType().trim().length() > 0) {
				pinfo.updateClientVendor("CCTypeID", c.getCcType(), cvID);
			}

			pinfo.insertVendorCreditCard(cvID, c.getCcType(), c.getCardNo(), c.getExpDate(), c.getCw2(),
					c.getCardHolderName(), c.getCardBillAddress(), c.getCardZip());

			int bsAddID = pinfo.getLastBsAdd() + 1;

			if (c.getSetdefaultbs().equals("0")) {
				pinfo.insertVendorBSAddress(cvID, bsAddID, c.getBscname(), c.getBsdbaName(), c.getBsfirstName(),
						c.getBslastName(), c.getBsaddress1(), c.getBsaddress2(), c.getBscity(), c.getBsstate(),
						c.getBsprovince(), c.getBscountry(), c.getBszipCode(), "1");

				pinfo.insertVendorBSAddress(cvID, bsAddID, c.getShcname(), c.getShdbaName(), c.getShfirstName(),
						c.getShlastName(), c.getShaddress1(), c.getShaddress2(), c.getShcity(), c.getShstate(),
						c.getShprovince(), c.getShcountry(), c.getShzipCode(), "0");
			} else {
				pinfo.insertVendorBSAddress(cvID, bsAddID, c.getCname(), c.getDbaName(), c.getFirstName(),
						c.getLastName(), c.getAddress1(), c.getAddress2(), c.getCity(), c.getState(), c.getProvince(),
						c.getCountry(), c.getZipCode(), "1");

				pinfo.insertVendorBSAddress(cvID, bsAddID, c.getCname(), c.getDbaName(), c.getFirstName(),
						c.getLastName(), c.getAddress1(), c.getAddress2(), c.getCity(), c.getState(), c.getProvince(),
						c.getCountry(), c.getZipCode(), "0");
			}

//			pinfo.insertVendorBSAddress(cvID, bsAddID, c.getBscname(), c
//					.getBsfirstName(), c.getBslastName(), c.getBsaddress1(), c
//					.getBsaddress2(), c.getBscity(), c.getBsstate(), c
//					.getBsprovince(), c.getBscountry(), c.getBszipCode(), "1");
//
//			pinfo.insertVendorBSAddress(cvID, bsAddID, c.getShcname(), c
//					.getShfirstName(), c.getShlastName(), c.getShaddress1(), c
//					.getShaddress2(), c.getShcity(), c.getShstate(), c
//					.getShprovince(), c.getShcountry(), c.getShzipCode(), "0");

			pinfo.insertVFCharge(cvID, useIndividualFinanceCharges, c.getAnnualIntrestRate(), c.getMinFCharges(),
					c.getGracePrd(), AssessFinanceChk, 0);

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
				java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());

				for (i = 0; i < temp.length; i++) {
					sql = "insert into bca_clientvendorservice values (?,?,?,?,?,?,?)";
					pstmt_services = con.prepareStatement(sql);
					pstmt_services.setInt(1, cvID);
					pstmt_services.setDate(2, d);
					pstmt_services.setInt(3, Integer.parseInt(compID));
					pstmt_services.setInt(4, Integer.parseInt(temp2[i]));
					pstmt_services.setFloat(5, java.lang.Float.parseFloat(temp3[i]));
					if (Integer.parseInt(temp[i]) == Integer.parseInt(defaultser))
						pstmt_services.setInt(6, 1);
					else
						pstmt_services.setInt(6, 0);
					pstmt_services.setInt(7, Integer.parseInt(temp[i]));

					pstmt_services.executeUpdate();
				}
			}
			// code to save services END

		} catch (SQLException ee) {
			Loger.log(2, "SQLException in Class PurchaseInfo,  method -insertVendor & exception 1st" + ee.toString());
		}

		finally {
			try {
				if (pstmt != null) {
					db.close(pstmt);
				}
				if (pstmt_services != null) {
					db.close(pstmt_services);
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
	 * The method is useful is insertion of all the information of vendor related to
	 * credit card
	 */

	@Autowired
	private BcaCvcreditcardRepository bcaCvcreditcardRepository;

	@Autowired
	private BcaCctypeRepository cctypeRepository;

	public boolean insertVendorCreditCard(int cvID, String cardType, String ccNo, String expDate, String cw2,
			String cHoldername, String bsAddress, String zip) {
		boolean ret = false;
//		Connection con = null ;
//		PreparedStatement pstmt = null;
//		PreparedStatement pstmtUpdate = null;
		String month = "0";
		String year = "0";
//		SQLExecutor db = new SQLExecutor();

//		if (db == null)
//			return ret;
//		con = db.getConnection();
//		if (con == null)
//			return ret;
		Loger.log("The expDate is ___________________" + expDate);

		if (cardType == null)
			cardType = "0";
		else if (cardType.equals(""))
			cardType = "0";
		if (expDate == null || expDate.isEmpty()) {
			month = "0";
			year = "0";
		} else if (!expDate.isEmpty()) {
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
			Optional<BcaCctype> ccType = cctypeRepository.findById(Integer.valueOf(cardType));
			// int ccID = getLastCCID() + 1;
			// pstmtUpdate = con.prepareStatement("update bca_cvcreditcard set Active=0
			// where ClientVendorID=? and Active=1");
			// pstmtUpdate.setInt(1, cvID);
			// pstmtUpdate.executeUpdate();

//			String sqlString = "insert into bca_cvcreditcard(CCTypeID, ClientVendorID, CardNumber, CardExpMonth, CardExpYear,"
//					+ " CardCW2, CardHolderName, CardBillingAddress, CardBillingZipCode, Active, DEFAULTCard, DateAdded ) "
//					+ " values(?,?,?,?,?,?,?,?,?,?,?,?)";
//		JPA check 	java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());
			BcaCvcreditcard bcaCvcreditcard = new BcaCvcreditcard();
			bcaCvcreditcard.setCctype(ccType.get());
			BcaClientvendor bcaClientvendor = new BcaClientvendor();
			bcaClientvendor.setClientVendorId(cvID);
			bcaCvcreditcard.setClientVendor(bcaClientvendor);
			bcaCvcreditcard.setCardNumber(ccNo);
			bcaCvcreditcard.setCardExpMonth(month);
			bcaCvcreditcard.setCardExpYear(year);
			bcaCvcreditcard.setCardCw2(cw2);
			bcaCvcreditcard.setCardHolderName(cHoldername);
			bcaCvcreditcard.setCardBillingAddress(bsAddress);
			bcaCvcreditcard.setCardBillingZipCode(zip);
			bcaCvcreditcard.setActive(1);
			bcaCvcreditcard.setDefaultCard(false);
			bcaCvcreditcard.setDateAdded(OffsetDateTime.now());

//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, cardType);
//				//pstmt.setInt(2, ccID);
//			pstmt.setInt(2, cvID);
//			pstmt.setString(3, ccNo);
//			pstmt.setString(4, month);
//			pstmt.setString(5, year);
//			pstmt.setString(6, cw2);
//			pstmt.setString(7, cHoldername);
//			pstmt.setString(8, bsAddress);
//			pstmt.setString(9, zip);
//			pstmt.setString(10, "1");
//			pstmt.setInt(11, 0);
//			pstmt.setDate(12, d);
			String sqlString = "bcaCvcreditcardRepository.save(bcaCvcreditcard)"; // JPA Check
			Loger.log("CrediCard Query-------------->" + sqlString);
			BcaCvcreditcard bcaCvcreditcardSaved = bcaCvcreditcardRepository.save(bcaCvcreditcard);
			if (bcaCvcreditcardSaved != null)
//			int num = pstmt.executeUpdate();
//			if (num > 0)
			{
				ret = true;
				Loger.log("num:" + 1); // JPA Check
			}
//		} catch (SQLException ee) {
		} catch (Exception ee) {
//			Loger.log(2," SQL Error in Class Employee and  method -insertEmployee "+" " + ee.toString());
			Loger.log(2, " JPA Error in Class Employee and  method -insertEmployee " + " " + ee.toString());

		}
//		finally {
//			try {
//				if (pstmtUpdate != null) { db.close(pstmtUpdate); }
//				if (pstmt != null) { db.close(pstmt); }
//				if(con != null){ db.close(con); }
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return ret;
	}

	/*
	 * The method inserts the BSA address(bill to,ship to address) of the vendor in
	 * the table.
	 */

	public boolean insertVendorBSAddress(int cvID, int bsID, String cname, String dbaName, String fname, String lname,
			String add1, String add2, String city, String state, String province, String country, String zip,
			String addressType) {
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
		if (country == null)
			country = "";
		if (state == null)
			state = "";
		boolean ret = false;
		try {
			BcaBsaddress bcaBsaddress = new BcaBsaddress();

			bcaBsaddress.setBsaddressId(bsID);
			bcaBsaddress.setClientVendorId(cvID);
			bcaBsaddress.setName(cname);
			bcaBsaddress.setFirstName(fname);
			bcaBsaddress.setLastName(lname);
			bcaBsaddress.setAddress1(add1);
			bcaBsaddress.setAddress2(add2 != null ? add2 : "");
			bcaBsaddress.setCity(city);
			bcaBsaddress.setZipCode(zip);
			bcaBsaddress.setCountry(country);
			bcaBsaddress.setState(state);
			bcaBsaddress.setProvince(province != null ? province : "");
			bcaBsaddress.setAddressType(addressType);
			bcaBsaddress.setDbaname(dbaName);
			LocalDate date = LocalDate.now();
			bcaBsaddress.setDateAdded(date);
			bcaBsaddress.setStatus("N");
			BcaBsaddress save = bcaBsaddressRepository.save(bcaBsaddress);
			if (null != save) {
				ret = true;
			}

//			String sqlString = "insert into bca_bsaddress(BSAddressID,ClientVendorID, Name,FirstName,"
//					+ " LastName,Address1, Address2, City,ZipCode,Country,State,Province,AddressType, DBAName, DateAdded, Status) "
//					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setInt(1, bsID);
//			pstmt.setInt(2, cvID);
//			pstmt.setString(3, cname);
//			pstmt.setString(4, fname);
//			pstmt.setString(5, lname);
//			pstmt.setString(6, add1);
//			pstmt.setString(7, add2 != null ? add2 : "");
//			pstmt.setString(8, city);
//			pstmt.setString(9, zip);
//			pstmt.setString(10, country);
//			pstmt.setString(11, state);
//			pstmt.setString(12, province != null ? province : "");
//			pstmt.setString(13, addressType);
//			pstmt.setString(14, dbaName);
//			pstmt.setString(15, "N");

//			int num = pstmt.executeUpdate();
//			if (num > 0) {
//				ret = true;
//				Loger.log("Record inserted:" + num);
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -insertVendorBSAddress: " + ee.toString());

		}
//		finally {
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
		return ret;
	}

	/**
	 * make the address as updated, return addressId N:Default U:multiple address
	 * O:removed
	 */

	public int insertBillingShippingAddress(TblBSAddress2 address, int addressType, boolean defaultAddress)
			throws SQLException {
		int id = -1;
//		String sql_update = null;
//		String sql_insert = null;
		if (address.getAddressName().equalsIgnoreCase("Default")) {
			address.setAddressName("Default");
		} else if (address.getAddressName().equals("")) {
			address.setAddressName(address.getName() + JProjectUtil.dateFormatLong.format(new Date()));
		}
		try {
			if (addressType == TblBSAddress2.BILLING_ADDR_TYPE) {
				if (address.getState() == null)
					address.setState("");
//			sql_update = "UPDATE bca_billingaddress SET Status = 'U' " + "WHERE ClientVendorID = " + address.getCvId();
//			sql_insert = "INSERT INTO bca_billingaddress (AddressName,"
//					+ "ClientVendorID,Name,FirstName,LastName,Address1,"
//					+ "Address2,City,State,Province,Country,ZipCode,Status,DateAdded,Phone,CellPhone,Fax,isDefault,Active) VALUES ("
//					+ "'" + ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''") + "'" + ","
//					+ address.getCvId() + "," + "'" + ConstValue.hateNull(address.getName()).replaceAll("'", "''") + "'"
//					+ "," + "'" + ConstValue.hateNull(address.getFirstName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getLastName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCity()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getState()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getProvince()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCountry()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''") + "'" + "," + "'"
//					+ address.getStatus() + "'" + "," + // (defaultAddress?"'N'":"'U'")+","+
//					"'" + JProjectUtil.getDateFormater().format(new Date()) + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getFax()).replaceAll("'", "''") + "'" + "," + address.getIsDefault()
//					+ "," + address.getActive() + ")";
				Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(address.getCvId());

				if (clientVendor.isPresent()) {
//				BcaClientvendor cv = clientVendor.get();
					bcaBillingaddressRepository.updateStatusByClientVendorId("U", address.getCvId());
//				List<BcaBillingaddress> bcaBillingaddresses = bcaBillingaddressRepository.findByClientVendor(cv);
//
//				for (BcaBillingaddress bcaBillingaddress : bcaBillingaddresses) {
//					bcaBillingaddress.setStatus("U");
//					bcaBillingaddressRepository.save(bcaBillingaddress);
//				}

					BcaBillingaddress bcaBillingaddress = new BcaBillingaddress();
					bcaBillingaddress
							.setAddressName(ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''"));
					bcaBillingaddress.setClientVendor(clientVendor.get());
					bcaBillingaddress.setName(ConstValue.hateNull(address.getName()).replaceAll("'", "''"));
					bcaBillingaddress.setFirstName(ConstValue.hateNull(address.getFirstName()).replaceAll("'", "''"));
					bcaBillingaddress.setLastName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
					bcaBillingaddress.setAddress1(ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''"));
					bcaBillingaddress.setAddress2(ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''"));
					bcaBillingaddress.setCity(ConstValue.hateNull(address.getCity()).replaceAll("'", "''"));
					bcaBillingaddress.setState(ConstValue.hateNull(address.getState()).replaceAll("'", "''"));
					bcaBillingaddress.setProvince(ConstValue.hateNull(address.getProvince()).replaceAll("'", "''"));
					bcaBillingaddress.setCountry(ConstValue.hateNull(address.getCountry()).replaceAll("'", "''"));
					bcaBillingaddress.setZipCode(ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''"));
					bcaBillingaddress.setStatus(address.getStatus());
					Date dateAdded = string2date(" now() ");
					bcaBillingaddress.setDateAdded(DateHelper.convertDateToOffsetDateTime(dateAdded));
					bcaBillingaddress.setPhone(ConstValue.hateNull(address.getPhone()).replaceAll("'", "''"));
					bcaBillingaddress.setCellPhone(ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''"));
					bcaBillingaddress.setFax(ConstValue.hateNull(address.getFax()).replaceAll("'", "''"));
					bcaBillingaddress.setIsDefault(address.getIsDefault());
					bcaBillingaddress.setActive(Integer.parseInt(address.getActive()));
					bcaBillingaddress.setAddressType(String.valueOf(addressType));

					BcaBillingaddress billingaddress = bcaBillingaddressRepository.save(bcaBillingaddress);
					id = billingaddress.getAddressId();

				}

			} else {
//			sql_update = "UPDATE bca_shippingaddress SET Status = 'U' " + "WHERE ClientVendorID = " + address.getCvId();
//
//			sql_insert = "INSERT INTO bca_shippingaddress (AddressName,ClientVendorID,Name,FirstName,LastName,Address1,"
//					+ "Address2,City,State,Province,Country,ZipCode,Status,DateAdded,Phone,CellPhone,Fax,isDefault,Active) VALUES ("
//					+ "'" + ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''") + "'" + ","
//					+ address.getCvId() + "," + "'" + ConstValue.hateNull(address.getName()).replaceAll("'", "''") + "'"
//					+ "," + "'" + ConstValue.hateNull(address.getFirstName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getLastName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCity()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getState()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getProvince()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCountry()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''") + "'" + "," + "'"
//					+ address.getStatus() + "'" + "," + // (defaultAddress?"'N'":"'U'")+","+
//					"'" + JProjectUtil.getDateFormater().format(new Date()) + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getFax()).replaceAll("'", "''") + "'" + "," + address.getIsDefault()
//					+ "," + address.getActive() + ")";
				Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(address.getCvId());

				if (clientVendor.isPresent()) {
//				BcaClientvendor cv = clientVendor.get();
					bcaShippingaddressRepository.updateStatusByClientVendorId("U", address.getCvId());
//				List<BcaShippingaddress> bcaShippingaddresses = bcaShippingaddressRepository.findByClientVendor(cv);
//
//				for (BcaShippingaddress bcaShippingaddress : bcaShippingaddresses) {
//					bcaShippingaddress.setStatus("U");
//					bcaShippingaddressRepository.save(bcaShippingaddress);
//				}

					BcaShippingaddress bcaShippingaddress = new BcaShippingaddress();
					bcaShippingaddress
							.setAddressName(ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''"));
					bcaShippingaddress.setClientVendor(clientVendor.get());
					bcaShippingaddress.setName(ConstValue.hateNull(address.getName()).replaceAll("'", "''"));
					bcaShippingaddress.setFirstName(ConstValue.hateNull(address.getFirstName()).replaceAll("'", "''"));
					bcaShippingaddress.setLastName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
					bcaShippingaddress.setAddress1(ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''"));
					bcaShippingaddress.setAddress2(ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''"));
					bcaShippingaddress.setCity(ConstValue.hateNull(address.getCity()).replaceAll("'", "''"));
					bcaShippingaddress.setState(ConstValue.hateNull(address.getState()).replaceAll("'", "''"));
					bcaShippingaddress.setProvince(ConstValue.hateNull(address.getProvince()).replaceAll("'", "''"));
					bcaShippingaddress.setCountry(ConstValue.hateNull(address.getCountry()).replaceAll("'", "''"));
					bcaShippingaddress.setZipCode(ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''"));
					bcaShippingaddress.setStatus(address.getStatus());
					Date dateAdded = string2date(" now() ");
					bcaShippingaddress.setDateAdded(DateHelper.convertDateToOffsetDateTime(dateAdded));
					bcaShippingaddress.setPhone(ConstValue.hateNull(address.getPhone()).replaceAll("'", "''"));
					bcaShippingaddress.setCellPhone(ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''"));
					bcaShippingaddress.setFax(ConstValue.hateNull(address.getFax()).replaceAll("'", "''"));
					bcaShippingaddress.setIsDefault(address.getIsDefault());
					bcaShippingaddress.setActive(Integer.parseInt(address.getActive()));
					bcaShippingaddress.setAddressType(String.valueOf(addressType));

					bcaShippingaddress = bcaShippingaddressRepository.save(bcaShippingaddress);
					id = bcaShippingaddress.getAddressId();
				}
			}

//			BcaBillingaddress bcaBillingaddress = new BcaBillingaddress();
//			bcaBillingaddress.setAddressName(ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''"));
//			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(address.getCvId());
//			if (clientVendor.isPresent())
//				bcaBillingaddress.setClientVendor(clientVendor.get());
//			bcaBillingaddress.setName(ConstValue.hateNull(address.getName()).replaceAll("'", "''"));
//			bcaBillingaddress.setFirstName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
//			bcaBillingaddress.setLastName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
//			bcaBillingaddress.setAddress1(ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''"));
//			bcaBillingaddress.setAddress2(ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''"));
//			bcaBillingaddress.setCity(ConstValue.hateNull(address.getCity()).replaceAll("'", "''"));
//			bcaBillingaddress.setState(ConstValue.hateNull(address.getState()).replaceAll("'", "''"));
//			bcaBillingaddress.setProvince(ConstValue.hateNull(address.getProvince()).replaceAll("'", "''"));
//			bcaBillingaddress.setCountry(ConstValue.hateNull(address.getCountry()).replaceAll("'", "''"));
//			bcaBillingaddress.setZipCode(ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''"));
//			bcaBillingaddress.setStatus(address.getStatus());
//			bcaBillingaddress
//					.setDateAdded(DateHelper.StringToOffsetDateTime(JProjectUtil.getDateFormater().format(new Date())));
//			bcaBillingaddress.setPhone(ConstValue.hateNull(address.getPhone()).replaceAll("'", "''"));
//			bcaBillingaddress.setCellPhone(ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''"));
//			bcaBillingaddress.setFax(ConstValue.hateNull(address.getFax()).replaceAll("'", "''"));
//			bcaBillingaddress.setIsDefault(address.getIsDefault());
//			bcaBillingaddress.setActive(Integer.parseInt(address.getActive()));
//			bcaBillingaddressRepository.save(bcaBillingaddress);
//
//		} else {
//			bcaShippingaddressRepository.updateStatusByClientVendorId("U", address.getCvId());
//			BcaShippingaddress bcaShippingaddress = new BcaShippingaddress();
//			bcaShippingaddress.setAddressName(ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''"));
//			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(address.getCvId());
//			if (clientVendor.isPresent())
//				bcaShippingaddress.setClientVendor(clientVendor.get());
//			bcaShippingaddress.setName(ConstValue.hateNull(address.getName()).replaceAll("'", "''"));
//			bcaShippingaddress.setFirstName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
//			bcaShippingaddress.setLastName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
//			bcaShippingaddress.setAddress1(ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''"));
//			bcaShippingaddress.setAddress2(ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''"));
//			bcaShippingaddress.setCity(ConstValue.hateNull(address.getCity()).replaceAll("'", "''"));
//			bcaShippingaddress.setState(ConstValue.hateNull(address.getState()).replaceAll("'", "''"));
//			bcaShippingaddress.setProvince(ConstValue.hateNull(address.getProvince()).replaceAll("'", "''"));
//			bcaShippingaddress.setCountry(ConstValue.hateNull(address.getCountry()).replaceAll("'", "''"));
//			bcaShippingaddress.setZipCode(ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''"));
//			bcaShippingaddress.setStatus(address.getStatus());
//			bcaShippingaddress
//					.setDateAdded(DateHelper.StringToOffsetDateTime(JProjectUtil.getDateFormater().format(new Date())));
//			bcaShippingaddress.setPhone(ConstValue.hateNull(address.getPhone()).replaceAll("'", "''"));
//			bcaShippingaddress.setCellPhone(ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''"));
//			bcaShippingaddress.setFax(ConstValue.hateNull(address.getFax()).replaceAll("'", "''"));
//			bcaShippingaddress.setIsDefault(address.getIsDefault());
//			bcaShippingaddress.setActive(Integer.parseInt(address.getActive()));
//			bcaShippingaddressRepository.save(bcaShippingaddress);
//		}
//		int id = -1;
//		try {
//			innsertStorageBillingShippingAdd(address, addressType, defaultAddress);
//			if (addressType == TblBSAddress2.BILLING_ADDR_TYPE) {
//
//				BcaBillingaddress lastAddress = bcaBillingaddressRepository.findFirstByOrderByAddressIdDesc();
//				id = lastAddress.getAddressId();// LastID");
//			} else {
//				BcaShippingaddress lastAddress = bcaShippingaddressRepository.findFirstByOrderByAddressIdDesc();
//				id = lastAddress.getAddressId();
//
//			}

			/**
			 * This method is used for adding billing address and shipping address id in
			 * smd_cvinfo table
			 *
			 * It is usefull for merging BCA-SMC
			 * 
			 * @param cv
			 * @param cvId
			 */

//			if (address.getIsDefault() == 1) {
//				updateClientInfo(address);
//			}

		} catch (Exception e) {
			e.printStackTrace();
		}
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;

//		try {
//			/* new Code */
////            if (defaultAddress)
////                setToUndefaultAddress(address,addressType);
//
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql_update);
//			stmt.executeUpdate(sql_insert);
//
//			innsertStorageBillingShippingAdd(address, addressType, defaultAddress);
//			if (addressType == TblBSAddress2.BILLING_ADDR_TYPE) {
//				rs = stmt.executeQuery("SELECT MAX(AddressID) AS LastID FROM bca_billingaddress");// stmt.executeQuery("SELECT
//																									// @@IDENTITY AS
//																									// LastID");
//			} else {
//				rs = stmt.executeQuery("SELECT MAX(AddressID) AS LastID FROM bca_shippingaddress");// stmt.executeQuery("SELECT
//																									// @@IDENTITY AS
//																									// LastID");
//			}
//
//			if (rs.next()) {
//				id = rs.getInt("LastID");
//			}
//			/**
//			 * This method is used for adding billing address and shipping address id in
//			 * smd_cvinfo table
//			 *
//			 * It is usefull for merging BCA-SMC
//			 * 
//			 * @param cv
//			 * @param cvId
//			 */
//
//			if (address.getIsDefault() == 1) {
//				updateClientInfo(address);
//			}
//
//		} finally {
//			if (rs != null) {
//				rs.close();
//			}
//			if (stmt != null) {
//				stmt.close();
//			}
//		}

		return id;
	}

//	public int insertBillingShippingAddress(TblBSAddress2 address, int addressType, boolean defaultAddress)
//			throws SQLException {
//
//	
//		String sql_update = null;
//		String sql_insert = null;
//		if (address.getAddressName().equalsIgnoreCase("Default")) {
//			address.setAddressName("Default");
//		} else if (address.getAddressName().equals("")) {
//			address.setAddressName(address.getName() + JProjectUtil.dateFormatLong.format(new Date()));
//		}
//
//		if (addressType == TblBSAddress2.BILLING_ADDR_TYPE) {
//			if (address.getState() == null)
//				address.setState("");
//			sql_update = "UPDATE bca_billingaddress SET Status = 'U' " + "WHERE ClientVendorID = " + address.getCvId();
//
//			sql_insert = "INSERT INTO bca_billingaddress (AddressName,"
//					+ "ClientVendorID,Name,FirstName,LastName,Address1,"
//					+ "Address2,City,State,Province,Country,ZipCode,Status,DateAdded,Phone,CellPhone,Fax,isDefault,Active) VALUES ("
//					+ "'" + ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''") + "'" + ","
//					+ address.getCvId() + "," + "'" + ConstValue.hateNull(address.getName()).replaceAll("'", "''") + "'"
//					+ "," + "'" + ConstValue.hateNull(address.getFirstName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getLastName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCity()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getState()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getProvince()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCountry()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''") + "'" + "," + "'"
//					+ address.getStatus() + "'" + "," + // (defaultAddress?"'N'":"'U'")+","+
//					"'" + JProjectUtil.getDateFormater().format(new Date()) + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getFax()).replaceAll("'", "''") + "'" + "," + address.getIsDefault()
//					+ "," + address.getActive() + ")";
//
//		} else {
//			sql_update = "UPDATE bca_shippingaddress SET Status = 'U' " + "WHERE ClientVendorID = " + address.getCvId();
//
//			sql_insert = "INSERT INTO bca_shippingaddress (AddressName,ClientVendorID,Name,FirstName,LastName,Address1,"
//					+ "Address2,City,State,Province,Country,ZipCode,Status,DateAdded,Phone,CellPhone,Fax,isDefault,Active) VALUES ("
//					+ "'" + ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''") + "'" + ","
//					+ address.getCvId() + "," + "'" + ConstValue.hateNull(address.getName()).replaceAll("'", "''") + "'"
//					+ "," + "'" + ConstValue.hateNull(address.getFirstName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getLastName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCity()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getState()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getProvince()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCountry()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''") + "'" + "," + "'"
//					+ address.getStatus() + "'" + "," + // (defaultAddress?"'N'":"'U'")+","+
//					"'" + JProjectUtil.getDateFormater().format(new Date()) + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getFax()).replaceAll("'", "''") + "'" + "," + address.getIsDefault()
//					+ "," + address.getActive() + ")";
//		}
//		
//
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		int id = -1;
//		try {
//			/* new Code */
////            if (defaultAddress)
////                setToUndefaultAddress(address,addressType);
//
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql_update);
//			stmt.executeUpdate(sql_insert);
//
//			innsertStorageBillingShippingAdd(address, addressType, defaultAddress);
//			if (addressType == TblBSAddress2.BILLING_ADDR_TYPE) {
//				rs = stmt.executeQuery("SELECT MAX(AddressID) AS LastID FROM bca_billingaddress");// stmt.executeQuery("SELECT
//																									// @@IDENTITY AS
//																									// LastID");
//			} else {
//				rs = stmt.executeQuery("SELECT MAX(AddressID) AS LastID FROM bca_shippingaddress");// stmt.executeQuery("SELECT
//																									// @@IDENTITY AS
//																									// LastID");
//			}
//
//			if (rs.next()) {
//				id = rs.getInt("LastID");
//			}
//			/**
//			 * This method is used for adding billing address and shipping address id in
//			 * smd_cvinfo table
//			 *
//			 * It is usefull for merging BCA-SMC
//			 * 
//			 * @param cv
//			 * @param cvId
//			 */
//
//			if (address.getIsDefault() == 1) {
//				updateClientInfo(address);
//			}
//
//		} finally {
//			if (rs != null) {
//				rs.close();
//			}
//			if (stmt != null) {
//				stmt.close();
//			}
//		}
//
//		return id;
//	}

	public void innsertStorageBillingShippingAdd(TblBSAddress2 address, int addressType, boolean defaultAddress)
			throws SQLException {
		try {
			if (addressType == TblBSAddress2.BILLING_ADDR_TYPE) {
				storageBillingaddressRepository.updateStatusByClientVendorId("U", address.getCvId());
				StorageBillingaddress storageBillingaddress = new StorageBillingaddress();
				storageBillingaddress
						.setAddressName(ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''"));
				Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(address.getCvId());
				if (clientVendor.isPresent())
					storageBillingaddress.setClientVendor(clientVendor.get());
				storageBillingaddress.setName(ConstValue.hateNull(address.getName()).replaceAll("'", "''"));
				storageBillingaddress.setFirstName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
				storageBillingaddress.setLastName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
				storageBillingaddress.setAddress1(ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''"));
				storageBillingaddress.setAddress2(ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''"));
				storageBillingaddress.setCity(ConstValue.hateNull(address.getCity()).replaceAll("'", "''"));
				storageBillingaddress.setState(ConstValue.hateNull(address.getState()).replaceAll("'", "''"));
				storageBillingaddress.setProvince(ConstValue.hateNull(address.getProvince()).replaceAll("'", "''"));
				storageBillingaddress.setCountry(ConstValue.hateNull(address.getCountry()).replaceAll("'", "''"));
				storageBillingaddress.setZipCode(ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''"));
				storageBillingaddress.setStatus(address.getStatus());
				storageBillingaddress.setDateAdded(
						DateHelper.StringToOffsetDateTime(JProjectUtil.getDateFormater().format(new Date())));
				storageBillingaddress.setPhone(ConstValue.hateNull(address.getPhone()).replaceAll("'", "''"));
				storageBillingaddress.setCellPhone(ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''"));
				storageBillingaddress.setFax(ConstValue.hateNull(address.getFax()).replaceAll("'", "''"));
				storageBillingaddress.setIsDefault(address.getIsDefault());
				storageBillingaddress.setActive(Integer.parseInt(address.getActive()));
				storageBillingaddressRepository.save(storageBillingaddress);
			} else {
				storageShippingaddressRepository.updateStatusByClientVendorId("U", address.getCvId());
				StorageShippingaddress storageShippingaddress = new StorageShippingaddress();
				storageShippingaddress
						.setAddressName(ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''"));
				Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(address.getCvId());
				if (clientVendor.isPresent())
					storageShippingaddress.setClientVendor(clientVendor.get());
				storageShippingaddress.setName(ConstValue.hateNull(address.getName()).replaceAll("'", "''"));
				storageShippingaddress.setFirstName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
				storageShippingaddress.setLastName(ConstValue.hateNull(address.getLastName()).replaceAll("'", "''"));
				storageShippingaddress.setAddress1(ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''"));
				storageShippingaddress.setAddress2(ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''"));
				storageShippingaddress.setCity(ConstValue.hateNull(address.getCity()).replaceAll("'", "''"));

				storageShippingaddress.setState(ConstValue.hateNull(address.getState()).replaceAll("'", "''"));
				storageShippingaddress.setProvince(ConstValue.hateNull(address.getProvince()).replaceAll("'", "''"));
				storageShippingaddress.setCountry(ConstValue.hateNull(address.getCountry()).replaceAll("'", "''"));
				storageShippingaddress.setZipCode(ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''"));
				storageShippingaddress.setStatus(address.getStatus());
				storageShippingaddress.setDateAdded(
						DateHelper.StringToOffsetDateTime(JProjectUtil.getDateFormater().format(new Date())));
				storageShippingaddress.setPhone(ConstValue.hateNull(address.getPhone()).replaceAll("'", "''"));
				storageShippingaddress.setCellPhone(ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''"));
				storageShippingaddress.setFax(ConstValue.hateNull(address.getFax()).replaceAll("'", "''"));
				storageShippingaddress.setIsDefault(address.getIsDefault());
				storageShippingaddress.setActive(Integer.parseInt(address.getActive()));
				storageShippingaddressRepository.save(storageShippingaddress);
			}

		} catch (Exception e) {

		}
	}

//	public void innsertStorageBillingShippingAdd(TblBSAddress2 address, int addressType, boolean defaultAddress)
//			throws SQLException {
//		String sql_update = null;
//		String sql_insert = null;
//
//		if (addressType == TblBSAddress2.BILLING_ADDR_TYPE) {
//
//			sql_update = "UPDATE storage_billingaddress SET Status = 'U' " + "WHERE ClientVendorID = "
//					+ address.getCvId();
//
//			sql_insert = "INSERT INTO storage_billingaddress (AddressName,"
//					+ "ClientVendorID,Name,FirstName,LastName,Address1,"
//					+ "Address2,City,State,Province,Country,ZipCode,Status,"
//					+ "DateAdded,Phone,CellPhone,Fax,isDefault,Active) VALUES (" + "'"
//					+ ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''") + "'" + ","
//					+ address.getCvId() + "," + "'" + ConstValue.hateNull(address.getName()).replaceAll("'", "''") + "'"
//					+ "," + "'" + ConstValue.hateNull(address.getFirstName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getLastName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCity()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getState()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getProvince()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCountry()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''") + "'" + ","
//					+ (defaultAddress ? "'N'" : "'U'") + "," + "'" + JProjectUtil.getDateFormater().format(new Date())
//					+ "'" + ","
////                    + "'" + (!ConstValue.getLikeToken().equals("$") ? JProjectUtil.dateFormatLong.format(new Date()): JProjectUtil.dateTimeFormatLong.format(new Date()))+ "'" + ","
//					+ "'" + ConstValue.hateNull(address.getPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getFax()).replaceAll("'", "''") + "'" + "," + address.getIsDefault()
//					+ "," + address.getActive() + ")";
//		} else {
//			sql_update = "UPDATE storage_shippingaddress SET Status = 'U' " + "WHERE ClientVendorID = "
//					+ address.getCvId();
//			sql_insert = "INSERT INTO storage_shippingaddress (AddressName,"
//					+ "ClientVendorID,Name,FirstName,LastName,Address1,"
//					+ "Address2,City,State,Province,Country,ZipCode,Status,"
//					+ "DateAdded,Phone,CellPhone,Fax,isDefault,Active) VALUES (" + "'"
//					+ ConstValue.hateNull(address.getAddressName()).replaceAll("'", "''") + "'" + ","
//					+ address.getCvId() + "," + "'" + ConstValue.hateNull(address.getName()).replaceAll("'", "''") + "'"
//					+ "," + "'" + ConstValue.hateNull(address.getFirstName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getLastName()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress1()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getAddress2()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCity()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getState()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getProvince()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCountry()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getZipCode()).replaceAll("'", "''") + "'" + ","
//					+ (defaultAddress ? "'N'" : "'U'") + "," + "'" + JProjectUtil.getDateFormater().format(new Date())
//					+ "'" + ","
//
////                    + "'" + (!ConstValue.getLikeToken().equals("$") ? JProjectUtil.dateFormatLong.format(new Date()): JProjectUtil.dateTimeFormatLong.format(new Date())) + "'" + ","
//					+ "'" + ConstValue.hateNull(address.getPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getCellPhone()).replaceAll("'", "''") + "'" + "," + "'"
//					+ ConstValue.hateNull(address.getFax()).replaceAll("'", "''") + "'" + "," + address.getIsDefault()
//					+ "," + address.getActive() + ")";
//		}
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql_update);
//			stmt.executeUpdate(sql_insert);
//		} finally {
//			if (rs != null)
//				rs.close();
//			if (stmt != null) {
//				stmt.close();
//			}
//		}
//	}

	/**
	 * This method is used for adding billing address and shipping address id in
	 * smd_cvinfo table
	 *
	 * It is usefull for merging BCA-SMC
	 * 
	 * @param cv
	 * @param cvId
	 */

	public void updateClientInfo(TblBSAddress2 address) {

		int billingAddressId = -1;
		int shippingAddressId = -1;

		try {
			billingAddressId = bcaBillingaddressRepository.findFirstByOrderByAddressIdDesc().getAddressId();
			shippingAddressId = bcaShippingaddressRepository.findFirstByOrderByAddressIdDesc().getAddressId();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		try {
			List<SmdCvinfo> smdCvInfo = smdCvinfoRepository.findByClientVendor_ClientVendorId(address.getCvId());
			for (SmdCvinfo smd : smdCvInfo) {
				smd.setBillingAddressId(billingAddressId);
				smd.setShippingAddressId(shippingAddressId);
				smdCvinfoRepository.save(smd);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void updateClientInfo(int billingAdd, int shippingAdd, int cvID) {

//		int billingAddressId = -1;
//		int shippingAddressId = -1;

//		try {
//			billingAddressId = bcaBillingaddressRepository.findFirstByOrderByAddressIdDesc().getAddressId();
//			shippingAddressId = bcaShippingaddressRepository.findFirstByOrderByAddressIdDesc().getAddressId();
//
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}

		try {
			List<SmdCvinfo> smdCvInfo = smdCvinfoRepository.findByClientVendor_ClientVendorId(cvID);
			for (SmdCvinfo smd : smdCvInfo) {
				smd.setBillingAddressId(billingAdd);
				smd.setShippingAddressId(shippingAdd);
				smdCvinfoRepository.save(smd);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

//	public static void updateClientInfo(TblBSAddress2 address) {
//		Statement stmt = null;
//		ResultSet rs = null;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		int billingAddressId = -1;
//		int shippingAddressId = -1;
//
//		String sql = "SELECT MAX(AddressID) AS billingAddressId FROM bca_billingaddress";
//		String sql_1 = "SELECT MAX(AddressID) AS shippingAddressId FROM bca_shippingaddress";
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				billingAddressId = rs.getInt("billingAddressId");
//			}
//
//			rs = stmt.executeQuery(sql_1);
//			while (rs.next()) {
//				shippingAddressId = rs.getInt("shippingAddressId");
//			}
//
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//		}
//
//		String sql2 = "UPDATE smd_cvinfo SET " + "BillingAddressID = " + billingAddressId + " , shippingAddressId = "
//				+ shippingAddressId + " " + "WHERE ClientVendorID = " + address.getCvId();
//		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql2);
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (stmt != null) {
//					stmt.close();
//				}
//			} catch (SQLException ex) {
//				ex.printStackTrace();
//			}
//		}
//	}

	/*
	 * The method inserts the information of the vendor about finance charges.
	 */

	public boolean insertVFCharge(int cvID, int useIndividual, String aIRate, String mFCharge, String gPeriod,
			int assFCharge, int markFCharge) {
		boolean ret = false;
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

		try {

			// delete old record
			bcaClientvendorfinancechargesRepository.deleteByClientVendorId(cvID);
//			sqlString = "delete from bca_clientvendorfinancecharges where ClientVendorID=?";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setInt(1, cvID);
//			Loger.log("delete:" + sqlString);
//			pstmt.executeUpdate();
//			pstmt.close();
//			sqlString = "";
			// ...............delete old record finished

			BcaClientvendorfinancecharges bcvfCharges = new BcaClientvendorfinancecharges();
			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(cvID);
			if (clientVendor.isPresent())
				bcvfCharges.setClientVendor(clientVendor.get());
			bcvfCharges.setClientVendorId(cvID);
			bcvfCharges.setUseIndividual(useIndividual > 0 ? true : false);
			if (aIRate == null || aIRate.trim().equals(""))
				aIRate = "0";
			if (mFCharge == null || mFCharge.trim().equals(""))
				mFCharge = "0";
			if (gPeriod == null || gPeriod.trim().equals(""))
				gPeriod = "0";
			bcvfCharges.setAnnualInterestRate(Double.parseDouble(aIRate));
			bcvfCharges.setMinimumFinanceCharge(Double.parseDouble(mFCharge));
			bcvfCharges.setGracePeriod(Integer.parseInt(gPeriod));
			bcvfCharges.setAssessFinanceCharge(assFCharge > 0 ? true : false);
			bcvfCharges.setMarkFinanceCharge(markFCharge > 0 ? true : false);

			BcaClientvendorfinancecharges save = bcaClientvendorfinancechargesRepository.save(bcvfCharges);
			if (save != null) {
				ret = true;
			}
//			sqlString = "insert into bca_clientvendorfinancecharges(ClientVendorID,UseIndividual,AnnualInterestRate,"
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
//			if (num > 0) {
//				ret = true;
//				Loger.log("insertVFCharge Record inserted:" + num);
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -insertVFCharge" + "" + ee.toString());
		}
//		finally {
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
		return ret;
	}

	/*
	 * The method updates the information of vendor related to credit card.
	 */

	public boolean updateVendorCreditCard(int cvID, String cctype, String ccNo, String expDate, String cw2,
			String cHoldername, String bsAddress, String zip) {

		boolean ret = false;
//		Connection con = null ;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		SQLExecutor db = new SQLExecutor();

		int ccID = 0;

//		if (db == null)
//			return ret;
//		con = db.getConnection();
//		if (con == null)
//			return ret;

		try {
			List<Integer> ccIDs = bcaCvcreditcardRepository.findByClientVndoridAndActive(cvID);
//			ps = con.prepareStatement("select CreditCardID from bca_cvcreditcard where clientvendorid=" + cvID + " and active=1");
//			rs = ps.executeQuery();
//			if (rs.next()) {
			if (ccIDs.size() > 0) {
//				ccID = rs.getInt(1);
				ccID = ccIDs.get(0);
			} else {
				ccID = getLastCCID() + 1;
			}
//			rs.close();
//			ps.close();

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

//			String sqlString = "update  bca_cvcreditcard set "
//					+ " CardNumber=?, CardExpMonth=?, CardExpYear=?,CardCW2= ?, CardHolderName=?"
//					+ ", CardBillingAddress=?, CardBillingZipCode=?, Active=1, DateAdded=?,CCTypeID=?"
//					+ " where CreditCardID=? and clientvendorid= ?";

//			Loger.log("Update CrediCard Query-------------->" + sqlString);
//			ps = con.prepareStatement(sqlString);
//			ps.setString(1, ccNo);
//			ps.setString(2, month);
//			ps.setString(3, year);
//			ps.setString(4, cw2);
//			ps.setString(5, cHoldername);
//			ps.setString(6, bsAddress);
//			ps.setString(7, zip);
//			ps.setDate(8, new java.sql.Date(new java.util.Date().getTime())); // set
//			// current;
//			//ps.setInt(9, Integer.parseInt(cctype)); // date;
//			ps.setInt(9, (cctype==null || cctype.trim().equals(""))?0:Integer.parseInt(cctype));
//			ps.setInt(10, ccID);
//			ps.setInt(11, cvID);

//			int num = ps.executeUpdate();
			int num = bcaCvcreditcardRepository.updateByCreditCardIdAndClientVendorId(ccNo, month, year, cw2,
					cHoldername, bsAddress, zip, OffsetDateTime.now(),
					(cctype == null || cctype.trim().equals("")) ? 0 : Integer.parseInt(cctype), ccID, cvID);

			Loger.log("update  bca_cvcreditcard (no. of recs):" + num);

			if (num > 0) {
//				ret = true;
				return true;
				// Loger.log("update bca_cvcreditcard (no. of recs):"+num);
			}
		} catch (Exception ee) {
			Loger.log(2, "SQLException....PurchaseInfo.updateVendorCreditCard()" + " " + ee.toString());
		}
//		finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//					}
//				if (ps != null) {
//					db.close(ps);
//					}
//					if(con != null){
//					db.close(con);
//					}
//				} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return false;
	}

	/*
	 * Get the ID of last client or vendor
	 * 
	 */

	public int getLastClientVendorID() {
		int CVID = 0;

		try {
			String jpql = "SELECT c.clientVendorId FROM BcaClientvendor c ORDER BY c.clientVendorId DESC";

			TypedQuery<Integer> query = entityManager.createQuery(jpql, Integer.class);
			query.setMaxResults(1); // Fetch only the first result

			List<Integer> results = query.getResultList();

			if (!results.isEmpty()) {
				CVID = results.get(0);
			}
		} catch (Exception ex) {
			// Handle exceptions
			ex.printStackTrace();
		}

		return CVID;
	}
//	public int getLastClientVendorID() {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		int CVID = 0;
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
//		try {
//			String sqlString = "select ClientVendorID from bca_clientvendor order by ClientVendorID desc ";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				CVID = rs.getInt(1);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
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
//		return CVID;
//	}

	/*
	 * Get the Id of last credit card.
	 * 
	 */
	public int getLastCCID() {
//		Connection con = null ;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		int ID = 0;
//		ResultSet rs = null;
//		con = db.getConnection();

//		try {

		String sqlString = "select CreditCardID from bca_cvcreditcard order by CreditCardID desc ";
//			pstmt = con.prepareStatement(sqlString);
		Loger.log(sqlString);
//			rs = pstmt.executeQuery();
		List<Integer> creditCardIDs = bcaCvcreditcardRepository.findByOrderByCreditCardId();
//			if (rs.next()) {
		if (creditCardIDs.size() > 0) {
//				ID = rs.getInt(1);
			ID = creditCardIDs.get(0);

		}
//		} catch (SQLException ee) {
//			Loger.log(2,
//					" SQL Error in Class VendorInfo and  method -getLastCCID "
//							+ " " + ee.toString());
//		}
//		finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//					}
//				if (pstmt != null) {
//					db.close(pstmt);
//					}
//					if(con != null){
//					db.close(con);
//					}
//				} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return ID;
	}

	/*
	 * Get the ID of last bill to address(BSA address).
	 * 
	 */

	public int getLastBsAdd() {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		int ID = 0;
//		ResultSet rs = null;
//		con = db.getConnection();

		try {
			ID = bcaBsaddressRepository.findLastBsAddressId();

//			String sqlString = "select BSAddressID from bca_bsaddress order by BSAddressID desc ";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				ID = rs.getInt(1);
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class VendorInfo and  method -getLastBsAdd " + " " + ee.toString());
		}
//		finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
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
		con = db.getConnection();
		try {
			stmt = con.createStatement();
			String sqlString = "update bca_clientvendor set " + fieldname + " ='" + fieldvalue
					+ "' where ClientVendorID ='" + CVID + "' ";
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
	 * Searches the vendor
	 * 
	 */

	public void SearchVendor(String compId, String cvId, HttpServletRequest request) {

		Connection con = null;
		// PurchaseInfo pi = new PurchaseInfo();
		PreparedStatement pstmt = null, pstmt1 = null;
		PreparedStatement pstmt2 = null, pstmt3 = null;
		PreparedStatement pstmt4 = null, pstmt12 = null;
		PreparedStatement pstmt13 = null;
		SQLExecutor db = new SQLExecutor();
		// ArrayList objList = new ArrayList();
		ArrayList<VendorDto> serviceinfo = new ArrayList<VendorDto>();
		ResultSet rs = null, rs3 = null;
		ResultSet rs1 = null, rs2 = null, rs22 = null;
		ResultSet rs12 = null, rs13 = null;

		if (db == null)
			return;
		con = db.getConnection();
		if (con == null)
			return;
		VendorDto customer = new VendorDto();
		try {
			StringBuffer sqlString = new StringBuffer();
			sqlString.append(" select distinct bca_clientvendor.ClientVendorID,bca_clientvendor.Name,");
			sqlString.append("bca_clientvendor.FirstName, bca_clientvendor.LastName, ");
			sqlString.append("bca_clientvendor.Address1, bca_clientvendor.Address2,bca_clientvendor.City,");
			sqlString.append(" bca_clientvendor.State, bca_clientvendor.Province, bca_clientvendor.Country,");
			sqlString.append(" bca_clientvendor.ZipCode, bca_clientvendor.Phone, bca_clientvendor.CellPhone,");
			sqlString.append("bca_clientvendor.Fax, bca_clientvendor.Email,bca_clientvendor.HomePage,");
			sqlString.append(
					"bca_clientvendor.CustomerTitle,bca_clientvendor.ResellerTaxID,bca_clientvendor.VendorOpenDebit,");
			sqlString.append("bca_clientvendor.VendorAllowedCredit,bca_clientvendor.Detail,bca_clientvendor.Taxable,");
			sqlString.append(
					"bca_clientvendor.CVTypeID, bca_clientvendor.cvcategoryid, date_format(bca_clientvendor.DateAdded,'%m-%d-%Y')");
			sqlString.append(
					",bca_cvcreditcard.CardNumber ,bca_cvcreditcard.CardExpMonth,bca_cvcreditcard.CardExpYear ,");
			sqlString.append(
					"bca_cvcreditcard.CardCW2 ,bca_cvcreditcard.CardHolderName,bca_cvcreditcard.CardBillingAddress,bca_cvcreditcard.CardBillingZipCode,");
			sqlString.append("bca_bsaddress.Name,bca_bsaddress.FirstName,");
			sqlString.append(
					"bca_bsaddress.LastName,bca_bsaddress.Address1,bca_bsaddress.Address2,bca_bsaddress.City,bca_bsaddress.ZipCode,bca_bsaddress.Country,");
			sqlString.append("bca_bsaddress.State,bca_bsaddress.Province,bca_bsaddress.AddressType,");
			sqlString.append(
					"bca_clientvendorfinancecharges.UseIndividual ,bca_clientvendorfinancecharges.AnnualInterestRate ,bca_clientvendorfinancecharges.MinimumFinanceCharge ,");
			sqlString
					/*
					 * .append("bca_clientvendorfinancecharges.GracePeriod ,bca_clientvendorfinancecharges.AssessFinanceCharge ,bca_clientvendorfinancecharges.MarkFinanceCharge "
					 * );
					 */
					.append("bca_clientvendorfinancecharges.GracePeriod ,bca_clientvendorfinancecharges.AssessFinanceCharge ");
			sqlString.append(
					"from  bca_clientvendor left join ( bca_cvcreditcard ,bca_bsaddress ,bca_clientvendorfinancecharges )");
			sqlString.append(
					" on (bca_cvcreditcard.ClientVendorID= bca_clientvendor.ClientVendorID and bca_bsaddress.ClientVendorID= ");
			sqlString.append(
					"bca_clientvendor.ClientVendorID and bca_clientvendorfinancecharges.ClientVendorID= bca_clientvendor.ClientVendorID )");
			sqlString.append(
					" where (bca_clientvendor.Status like 'N' or bca_clientvendor.Status like 'U')  and  (bca_clientvendor.CVTypeID = '1' or ");
			sqlString.append(
					"bca_clientvendor.CVTypeID = '3')and ( bca_clientvendor.Deleted = '0') and CompanyID='1' and bca_clientvendor.ClientVendorID ='"
							+ cvId + "' group by ( bca_clientvendor.ClientVendorID )");
			sqlString.append(" order by bca_clientvendor.ClientVendorID ");

			pstmt = con.prepareStatement(sqlString.toString());
			// Loger.log(sqlString);
			rs = pstmt.executeQuery();

			String sqlString11 = "select ClientVendorID,ServiceID,DateAdded,InvoiceStyleID,ServiceBalance,DefaultService from bca_clientvendorservice where CompanyID = ? and ClientVendorID = ?";
			String sqlString12 = "select  Name from bca_invoicestyle where Active=1 and InvoiceStyleID=?";
			String sqlString13 = "select ServiceName from bca_servicetype where ServiceID=? ";

			pstmt2 = con.prepareStatement(sqlString11);
			pstmt12 = con.prepareStatement(sqlString12);
			pstmt13 = con.prepareStatement(sqlString13);
			pstmt2.setString(1, compId);
			pstmt2.setString(2, cvId);
			rs22 = pstmt2.executeQuery();
			String default_ser = "";
			while (rs22.next()) {
				VendorDto uform1 = new VendorDto();
				uform1.setServiceBalance((rs22.getDouble("ServiceBalance")));

				uform1.setDefaultService(rs22.getInt("DefaultService"));
				// Loger.log("SERVICE DDDD__________-----------________"+
				// uform1.getDefaultService());

				int svID = rs22.getInt("ServiceID");
				uform1.setServiceID(svID);

				if (uform1.getDefaultService() == 1) {
					default_ser = String.valueOf(svID);
				}

				pstmt12.setString(1, rs22.getString("InvoiceStyleID"));
				rs12 = pstmt12.executeQuery();
				pstmt13.setString(1, String.valueOf(svID));
				rs13 = pstmt13.executeQuery();

				while (rs12.next()) {
					uform1.setInvoiceStyle(rs12.getString(1));

				}
				while (rs13.next()) {
					uform1.setServiceName(rs13.getString(1));
				}

				serviceinfo.add(uform1);
			}
			request.setAttribute("ServiceInfo", serviceinfo);
			// Loger.log("deafult_ser________________" + default_ser);
			if (!(default_ser.equals(""))) {
				request.setAttribute("DefaultService", default_ser);
			} else {
				default_ser = "0";
				request.setAttribute("DefaultService", default_ser);
			}

			// String country = "";
			if (rs.next()) {
				// country = rs.getString(10);

				/* General */

				customer.setClientVendorID(rs.getString(1));
				customer.setCname(rs.getString(2));
				customer.setFirstName(rs.getString(3));
				customer.setLastName(rs.getString(4));
				customer.setAddress1(rs.getString(5));
				customer.setAddress2(rs.getString(6));
				customer.setCity(rs.getString(7));
				customer.setState(rs.getString(8));

				request.setAttribute("state_gen", rs.getString(8));

				customer.setProvince(rs.getString(9));
				customer.setCountry(rs.getString(10));
				customer.setZipCode(rs.getString(11));
				customer.setPhone(rs.getString(12));
				customer.setCellPhone(rs.getString(13));
				customer.setFax(rs.getString(14));
				customer.setEmail(rs.getString(15));
				customer.setHomePage(rs.getString(16));
				customer.setTitle(rs.getString(17));
				customer.setTexID(rs.getString(18));
				customer.setOpeningUB(rs.getString(19));

				customer.setExtCredit(rs.getString(20));
				customer.setMemo(rs.getString(21));
				customer.setTaxAble(rs.getString(22));

				customer.setIsclient(rs.getString(23)); // cvtypeid

				customer.setType(rs.getString(24));
				customer.setDateAdded(rs.getString(25));

				/* Account */
				customer.setCardNo(rs.getString(26));
				customer.setExpDate(rs.getString(27) + "/" + rs.getString(28));

				customer.setCw2(rs.getString(29));
				customer.setCardHolderName(rs.getString(30));
				customer.setCardBillAddress(rs.getString(31));
				customer.setCardZip(rs.getString(32));

				/* Finance */

				String str1 = rs.getString(48);
				// String str2 = rs.getString(49);

				customer.setFsUseIndividual(rs.getString(44));
				customer.setAnnualIntrestRate(rs.getString(45));
				customer.setMinFCharges(rs.getString(46));
				customer.setGracePrd(rs.getString(47));
				customer.setFsAssessFinanceCharge(str1);

			}
			rs.close();
			pstmt.close();

			StringBuffer sqlString1 = new StringBuffer();
			sqlString1.append("select bca_bsaddress.Name,bca_bsaddress.FirstName,");
			sqlString1.append(
					"bca_bsaddress.LastName,bca_bsaddress.Address1,bca_bsaddress.Address2,bca_bsaddress.City,bca_bsaddress.ZipCode,bca_bsaddress.Country,");
			sqlString1.append("bca_bsaddress.State,bca_bsaddress.Province ");
			sqlString1.append(" from bca_bsaddress ");
			sqlString1.append(
					" where ClientVendorID like '" + cvId + "' and AddressType like '1' and Status in ('N' , 'U') ");
			pstmt1 = con.prepareStatement(sqlString1.toString());
			// Loger.log(sqlString1);
			rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				customer.setBscname(rs1.getString(1));
				customer.setBsfirstName(rs1.getString(2));
				customer.setBslastName(rs1.getString(3));
				customer.setBsaddress1(rs1.getString(4));
				customer.setBsaddress2(rs1.getString(5));
				customer.setBscity(rs1.getString(6));
				customer.setBszipCode(rs1.getString(7));
				customer.setBscountry(rs1.getString(8));
				customer.setBsstate(rs1.getString(9));
				customer.setBsprovince(rs1.getString(10));

				request.setAttribute("state_bt", customer.getBsstate());
			}

			StringBuffer sqlString2 = new StringBuffer();
			sqlString2.append(" select bca_bsaddress.Name,bca_bsaddress.FirstName,");
			sqlString2.append(
					"bca_bsaddress.LastName,bca_bsaddress.Address1,bca_bsaddress.Address2,bca_bsaddress.City,bca_bsaddress.ZipCode,bca_bsaddress.Country,");
			sqlString2.append("bca_bsaddress.State,bca_bsaddress.Province ");
			sqlString2.append(" from bca_bsaddress ");
			sqlString2.append(
					" where ClientVendorID like '" + cvId + "' and AddressType like '0' and Status in ('N' , 'U') ");

			pstmt3 = con.prepareStatement(sqlString2.toString());

			rs2 = pstmt3.executeQuery();

			if (rs2.next()) {
				customer.setShcname(rs2.getString(1));
				customer.setShfirstName(rs2.getString(2));
				customer.setShlastName(rs2.getString(3));
				customer.setShaddress1(rs2.getString(4));
				customer.setShaddress2(rs2.getString(5));
				customer.setShcity(rs2.getString(6));
				customer.setShzipCode(rs2.getString(7));
				customer.setShcountry(rs2.getString(8));
				customer.setShstate(rs2.getString(9));
				customer.setShprovince(rs2.getString(10));

				request.setAttribute("state_st", customer.getShstate());

			}

			/* for Account tab */
			pstmt4 = con.prepareStatement(
					"select SalesRepID,TermID,PaymentTypeID,ShipCarrierID from bca_clientvendor where CompanyID=? and ClientVendorID=?");
			pstmt4.setString(1, compId);
			pstmt4.setString(2, cvId);

			rs3 = pstmt4.executeQuery();
			if (rs3.next()) {
				customer.setRep(rs3.getString(1));
				customer.setTerm(rs3.getString(2));
				customer.setPaymentType(rs3.getString(3));
				customer.setShipping(rs3.getString(4));
			}
			pstmt4.close();
			rs3.close();

			// ---start---------------------------------------------------------------------code

//			pstmt4 = con.prepareStatement("select * from bca_cvcreditcard "
//					+ " where clientvendorid=? and active=1");
//			pstmt4.setString(1, cvId);
//			rs3 = pstmt4.executeQuery();
			List<BcaCvcreditcard> bcaCvcreditcards = bcaCvcreditcardRepository
					.findByClientVendorIdAndActive(Integer.parseInt(cvId), 1);
//			if (rs3.next()) {
//				customer.setCcType(rs3.getString("CCTypeID"));
//				customer.setCardNo(rs3.getString("CardNumber"));
//				customer.setExpDate(rs3.getString("CardExpMonth") + "/"
//						+ rs3.getString("CardExpYear"));
//				customer.setCw2(rs3.getString("CardCW2"));
//				customer.setCardHolderName(rs3.getString("CardHolderName"));
//				customer
//						.setCardBillAddress(rs3.getString("CardBillingAddress"));
//				customer.setCardZip(rs3.getString("CardBillingZipCode"));
//			}
			for (BcaCvcreditcard bcaCvcreditcard : bcaCvcreditcards) {

				customer.setCcType(bcaCvcreditcard.getCctype().getcCTypeID().toString());
				customer.setCardNo(bcaCvcreditcard.getCardNumber());
				customer.setExpDate(bcaCvcreditcard.getCardExpMonth() + "/" + bcaCvcreditcard.getCardExpYear());
				customer.setCw2(bcaCvcreditcard.getCardCw2());
				customer.setCardHolderName(bcaCvcreditcard.getCardHolderName());
				customer.setCardBillAddress(bcaCvcreditcard.getCardBillingAddress());
				customer.setCardZip(bcaCvcreditcard.getCardBillingZipCode());

			}
//			pstmt4.close();
//			rs3.close();

			// ---end---------------------------------------------------------------------code

			request.setAttribute("vendorDetails1", customer);

			// System.out.println("vendorDetails1:"+customer.toString());
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());
		}

		finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (rs3 != null) {
					db.close(rs3);
				}
				if (rs1 != null) {
					db.close(rs1);
				}
				if (rs2 != null) {
					db.close(rs2);
				}
				if (rs22 != null) {
					db.close(rs22);
				}
				if (rs12 != null) {
					db.close(rs12);
				}
				if (rs13 != null) {
					db.close(rs13);
				}
				if (pstmt != null) {
					db.close(pstmt);
				}
				if (pstmt1 != null) {
					db.close(pstmt1);
				}
				if (pstmt2 != null) {
					db.close(pstmt2);
				}
				if (pstmt3 != null) {
					db.close(pstmt3);
				}
				if (pstmt4 != null) {
					db.close(pstmt4);
				}
				if (pstmt12 != null) {
					db.close(pstmt12);
				}
				if (pstmt13 != null) {
					db.close(pstmt13);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

	}

	/*
	 * Provides the servises of the purticular vendor
	 * 
	 */

	public void getServices(HttpServletRequest request, String compId, String cvId) {
		// TODO Auto-generated method stub
		ArrayList<VendorDto> serviceList = new ArrayList<VendorDto>();
		ArrayList<VendorDto> invoiceName = new ArrayList<VendorDto>();
		ArrayList<VendorDto> balenceDetails = new ArrayList<VendorDto>();
		ResultSet rs = null, rs1 = null, rs2 = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		PreparedStatement pstmt = null, pstmt1 = null, pstmt2 = null;
		con = db.getConnection();
		// Loger.log("@@@@@@@@The Client Vendor Id is @@@@@@@@" + cvId);
		String sqlString = "select * from bca_servicetype";
		String sqlString1 = "select  * from bca_invoicestyle where Active=1";
		String sqlString2 = "select * from bca_clientvendorservice where CompanyID=? and ClientVendorID=?";
		try {
			pstmt = con.prepareStatement(sqlString);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				VendorDto uform = new VendorDto();
				uform.setServiceID(rs.getInt(1));
				uform.setServiceName(rs.getString(2));
				uform.setInvoiceStyleId(rs.getInt(3));
				serviceList.add(uform);
			}

		} catch (Exception e) {
			// TODO: handle exception
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (pstmt != null) {
					db.close(pstmt);
				}

			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		request.setAttribute("ServiceList", serviceList);

		try {
			pstmt1 = con.prepareStatement(sqlString1);
			rs1 = pstmt1.executeQuery();
			while (rs1.next()) {
				VendorDto uform = new VendorDto();
				// Loger.log("The Incoice style id is " + rs1.getString(1));
				uform.setInvoiceStyleId(rs1.getInt(1));
				// Loger.log("The Invoice Style name is " + rs1.getString(2));
				uform.setInvoiceStyle(rs1.getString(2));
				invoiceName.add(uform);
			}

		} catch (Exception e) {
			// TODO: handle exception
			Loger.log(e.toString());
		} finally {
			try {

				if (rs1 != null) {
					db.close(rs1);
				}
				if (pstmt1 != null) {
					db.close(pstmt1);
				}

			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		request.setAttribute("InvoiceName", invoiceName);

		try {
			pstmt2 = con.prepareStatement(sqlString2);
			pstmt2.setString(1, compId);
			pstmt2.setString(2, cvId);

			rs2 = pstmt2.executeQuery();
			while (rs2.next()) {
				VendorDto uform = new VendorDto();

				uform.setClientVendorID(String.valueOf(rs2.getInt("ClientVendorID")));
				uform.setServiceBalance(rs2.getDouble("ServiceBalance"));
				// Loger.log("The Service Balence is "+ uform.getServiceBalance());
				// uform.setInvoiceStyleId(rs1.getInt(1));

				uform.setDefaultService(rs2.getInt("DefaultService"));
				// Loger.log("The Default Service is "+ uform.getDefaultService());

				uform.setServiceID(rs2.getInt("ServiceID"));
				// Loger.log("The ServiceID is " + uform.getServiceID());
				// uform.setInvoiceStyle(rs1.getString(2));

				// uform.setServiceId(rs.getInt(1));
				// uform.setServiceName(rs.getString(2));
				// uform.setInvoiceStyleId(rs.getInt(3));
				balenceDetails.add(uform);
			}

		} catch (Exception e) {
			// TODO: handle exception
			Loger.log(e.toString());
		} finally {
			try {
				if (rs2 != null) {
					db.close(rs2);
				}
				if (pstmt2 != null) {
					db.close(pstmt2);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		request.setAttribute("BalenceDetails", balenceDetails);

	}

	/*
	 * Method updates the vendor & his related information
	 * 
	 */
	public boolean updateInsertVendor(String cvId, VendorDto c, String compID, int istaxable, int isAlsoClient,
			int useIndividualFinanceCharges, int AssessFinanceChk, int fInvoiceCharge, String status) {
		boolean ret = false;

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

			String vcName = vendorCategory.CVCategory(c.getType());

			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(cvID);
			if (clientVendor.isPresent()) {
				BcaClientvendor bcv = clientVendor.get();
				bcv.setName(c.getCname());
				Date dateAdded = ((c.getDateAdded() == null || c.getDateAdded().equals(""))
						? customerInfo.string2date("now()")
						: customerInfo.string2date(c.getDateAdded()));
				bcv.setDateAdded(DateHelper.convertDateToOffsetDateTime(dateAdded));
				bcv.setCustomerTitle(c.getTitle());
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
				bcv.setTaxable(new Long(istaxable));
				bcv.setCvtypeId(isAlsoClient);
				bcv.setCvcategoryId(Integer.parseInt(c.getType()));
				bcv.setCvcategoryName(vcName);
				bcv.setActive(1);
				bcv.setDeleted(0);
				bcv.setStatus(status);
				bcv.setMiddleName(c.getMiddleName());
				Date dateInput = (c.getDateInput() == null || c.getDateInput().trim().equals("")) ? null
						: customerInfo.string2date(c.getDateInput());
				bcv.setDateInput(DateHelper.convertDateToOffsetDateTime(dateInput));
				Date dateTerminated = (c.getTerminatedDate() == null || c.getTerminatedDate().trim().equals("")) ? null
						: customerInfo.string2date(c.getTerminatedDate());
				bcv.setDateTerminated(DateHelper.convertDateToOffsetDateTime(dateTerminated));
				bcv.setIsTerminated(c.isTerminated());
				bcv.setDbaname(c.getDbaName());
				int cct = (c.getCcType() == null || c.getCcType().equals("") ? 0 : Integer.parseInt(c.getCcType()));

				bcv.setCctypeId(cct);
				if (c.getTerm() != null && c.getTerm().trim().length() > 0) {
					Optional<BcaTerm> term = bcaTermRepository.findById(Integer.parseInt(c.getTerm()));
					if (term.isPresent())
						bcv.setTerm(term.get());
				}
				if (c.getRep() != null && c.getRep().trim().length() > 0) {
					BcaSalesrep salesRep = bcaSalesrepRepository.findBySalesRepId(Integer.parseInt(c.getRep()));
					if (null != salesRep)
						bcv.setSalesRep(salesRep);
				}
				if (c.getShipping() != null && c.getShipping().trim().length() > 0) {
					Optional<BcaShipcarrier> shipCarrier = bcaShipcarrierRepository
							.findById(Integer.parseInt(c.getShipping()));
					if (shipCarrier.isPresent())
						bcv.setShipCarrier(shipCarrier.get());
				}
				if (c.getPaymentType() != null && c.getPaymentType().trim().length() > 0) {
					Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository
							.findById(Integer.parseInt(c.getPaymentType()));
					if (paymentType.isPresent())
						bcv.setPaymentType(paymentType.get());
				}

				BcaClientvendor save = bcaClientvendorRepository.save(bcv);
				if (null != save) {
					ret = true;
				}

			}

			// Update credit card details
			updateVendorCreditCard(cvID, c.getCcType(), c.getCardNo(), c.getExpDate(), c.getCw2(),
					c.getCardHolderName(), c.getCardBillAddress(), c.getCardZip());

			// change status of old record...........
			bcaBsaddressRepository.updateStatusByClientVendorIdAndStatus(cvID, Arrays.asList("N", "U"));

			// ......................status change finished.........

			int bsAddID = getLastBsAdd() + 1;

			System.out.println("c.getSetdefaultbs():" + c.getSetdefaultbs());

			insertVendorBSAddress(cvID, bsAddID, c.getBscname(), c.getBsdbaName(), c.getBsfirstName(),
					c.getBslastName(), c.getBsaddress1(), c.getBsaddress2(), c.getBscity(), c.getBsstate(),
					c.getBsprovince(), c.getBscountry(), c.getBszipCode(), "1");

			insertVendorBSAddress(cvID, bsAddID, c.getShcname(), c.getShdbaName(), c.getShfirstName(),
					c.getShlastName(), c.getShaddress1(), c.getShaddress2(), c.getShcity(), c.getShstate(),
					c.getShprovince(), c.getShcountry(), c.getShzipCode(), "0");
			TblBSAddress2 address = new TblBSAddress2();
			address.setAddressWithVendorDtoBilling(c, cvID);
			insertBillingShippingAddress(address, 1, true);
			address.setAddressWithVendorDtoShipping(c, cvID);
			insertBillingShippingAddress(address, 0, true);
			insertVFCharge(cvID, useIndividualFinanceCharges, c.getAnnualIntrestRate(), c.getMinFCharges(),
					c.getGracePrd(), AssessFinanceChk, fInvoiceCharge);

			// --------code to save services--------------------------START---
			int i = 0;
			String sql;
			String serviceID = c.getTable_serID();

			String serviceBal = c.getTable_bal();
			String defaultser = c.getTable_defaultVal();
			String invStyleID = c.getTable_invId();
			bcaClientvendorserviceRepository.deleteByClientVendorId(cvID);

			if (serviceID != null && !(serviceID.equals("") || invStyleID.equals("") || serviceBal.equals(""))) {
				String temp[] = null, temp2[] = null, temp3[] = null;
				if ((serviceID != "" && serviceID != null)
						&& (invStyleID != "" && invStyleID != null) & (serviceBal != "" && serviceBal != null)) {
					temp = serviceID.split(";"); // serviceID is in form like

					temp2 = invStyleID.split(";");
					temp3 = serviceBal.split(";");
				}
				System.out.println("Length of temp:" + temp.length);

				for (i = 0; i < temp.length; i++) {
					BcaClientvendorservice clientvendorservice = new BcaClientvendorservice();
					Optional<BcaClientvendor> vendor = bcaClientvendorRepository.findById(cvID);
					if (vendor.isPresent())
						clientvendorservice.setClientVendor(vendor.get());
					LocalDateTime currentDateTime = LocalDateTime.now();
					OffsetDateTime dateAdded = OffsetDateTime.of(currentDateTime, ZoneOffset.UTC);

					clientvendorservice.setDateAdded(dateAdded);

					Optional<BcaCompany> company = bcaCompanyRepository.findById(Long.parseLong(compID));
					if (company.isPresent())
						clientvendorservice.setCompany(company.get());
					clientvendorservice.setInvoiceStyleId(Integer.parseInt(temp2[i]));
					clientvendorservice.setServiceBalance(Double.parseDouble(temp3[i]));
					if (Integer.parseInt(temp[i]) == Integer.parseInt(defaultser)) {

						clientvendorservice.setDefaultService(true);
					} else {
						clientvendorservice.setDefaultService(false);
					}
					bcaClientvendorserviceRepository.save(clientvendorservice);

				}
			}
			// --------------------------code to save services
			// -------------------------------------END-------

		} catch (Exception ee) {
			Loger.log(2, "SQLException in Class PurchaseInfo,  method -updateInsertVendor " + ee.toString());
		}
		return ret;
	}

//	public boolean updateInsertVendor(String cvId, VendorDto c, String compID, int istaxable, int isAlsoClient,
//			int useIndividualFinanceCharges, int AssessFinanceChk, int fInvoiceCharge, String status) {
//		boolean ret = false;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		PreparedStatement ps = null;
//		SQLExecutor db = new SQLExecutor();
//		CustomerInfo cinfo = new CustomerInfo();
//		if (db == null)
//			return ret;
//		con = db.getConnection();
//		if (con == null)
//			return ret;
//
//		try {
//			String oBal = "0";
//			String exCredit = "0";
//
//			int cvID = Integer.parseInt(cvId);
//			if (c.getOpeningUB() != null && c.getOpeningUB().trim().length() > 0)
//				oBal = c.getOpeningUB();
//
//			if (c.getExtCredit() != null && c.getExtCredit().trim().length() > 0)
//				exCredit = c.getExtCredit();
//
//			if (c.getType() == null || c.getType().equals(""))
//				c.setType("0");
//
//			VendorCategory vc = new VendorCategory();
//			String vcName = vc.CVCategory(c.getType());
//
//			/*
//			 * String sqlString =
//			 * "insert into bca_clientvendor(ClientVendorID, Name,DateAdded, CustomerTitle, "
//			 * + " FirstName, LastName, Address1, Address2," +
//			 * " City, State, Province, Country, ZipCode, Phone, CellPhone,Fax,HomePage, Email, CompanyID,"
//			 * +
//			 * " ResellerTaxID,VendorOpenDebit,VendorAllowedCredit,Detail,Taxable,CVTypeID, "
//			 * + "CVCategoryID, CVCategoryName,Active,Deleted,Status,CCTypeID) " +
//			 * " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,0,?,? )";
//			 */ // total=31
//
//			String sqlString1 = "update bca_clientvendor set Name=?,DateAdded=?,CustomerTitle=?,FirstName=?,"
//					+ "LastName=?,Address1=?,Address2=?,City=?,State=?,Province=?,Country=?,ZipCode=?,"
//					+ "Phone=?,CellPhone=?,Fax=?,HomePage=?,Email=?,CompanyID=?,ResellerTaxID=?,"
//					+ "VendorOpenDebit=?,VendorAllowedCredit=?,Detail=?,Taxable=?,CVTypeID=?,"
//					+ "CVCategoryID=?,CVCategoryName=?,Active=1,Deleted=0,Status=?,CCTypeID=?,"
//					+ "isMobilePhoneNumber=?,MiddleName=?,DateInput=?,DateTerminated=?,isTerminated=?,DBAName=? "
//					+ " where ClientVendorID=" + cvID;
//
//			pstmt = con.prepareStatement(sqlString1);
//			pstmt.setString(1, c.getCname());
//			pstmt.setDate(2, ((c.getDateAdded() == null || c.getDateAdded().equals("")) ? cinfo.string2date("now()")
//					: cinfo.string2date(c.getDateAdded())));
//			pstmt.setString(3, c.getTitle());
//			pstmt.setString(4, c.getFirstName());
//			pstmt.setString(5, c.getLastName());
//			pstmt.setString(6, c.getAddress1());
//			pstmt.setString(7, c.getAddress2());
//			pstmt.setString(8, c.getCity());
//			pstmt.setString(9, c.getState());
//			pstmt.setString(10, c.getProvince());
//			pstmt.setString(11, c.getCountry());
//			pstmt.setString(12, c.getZipCode());
//			pstmt.setString(13, c.getPhone());
//			pstmt.setString(14, c.getCellPhone());
//			pstmt.setString(15, c.getFax());
//			pstmt.setString(16, c.getHomePage());
//			pstmt.setString(17, c.getEmail());
//			pstmt.setString(18, compID);
//			pstmt.setString(19, c.getTexID());
//			pstmt.setString(20, oBal);
//			pstmt.setString(21, exCredit);
//			pstmt.setString(22, c.getMemo()); // detail
//			pstmt.setInt(23, istaxable); // taxable
//			pstmt.setInt(24, isAlsoClient); // cvtypeid
//			pstmt.setInt(25, Integer.parseInt(c.getType())); // cvcategoryid
//			pstmt.setString(26, vcName); // CVCategoryName
//			pstmt.setString(27, status); // may be {N, U, 0(zero)}
//			int cct = (c.getCcType() == null || c.getCcType().equals("") ? 0 : Integer.parseInt(c.getCcType()));
//			pstmt.setInt(28, cct); // credit card type
//			// pstmt.setInt(29, cvID);
//			pstmt.setBoolean(29, c.isIsMobilePhoneNumber());
//			pstmt.setString(30, c.getMiddleName());
//			pstmt.setDate(31, (c.getDateInput() == null || c.getDateInput().trim().equals("")) ? null
//					: cinfo.string2date(c.getDateInput()));
//			pstmt.setDate(32, (c.getTerminatedDate() == null || c.getTerminatedDate().trim().equals("")) ? null
//					: cinfo.string2date(c.getTerminatedDate()));
//			pstmt.setBoolean(33, c.isTerminated());
//			pstmt.setString(34, c.getDbaName());
//
//			Loger.log(sqlString1);
//			int num = pstmt.executeUpdate();
//
//			if (num > 0) {
//				ret = true;
//			}
//			if (c.getShipping() != null && c.getShipping().trim().length() > 0)
//				updateClientVendor("ShipCarrierID", c.getShipping(), cvID);
//
//			if (c.getPaymentType() != null && c.getPaymentType().trim().length() > 0)
//				updateClientVendor("PaymentTypeID", c.getPaymentType(), cvID);
//
//			if (c.getRep() != null && c.getRep().trim().length() > 0)
//				updateClientVendor("SalesRepID", c.getRep(), cvID);
//
//			if (c.getTerm() != null && c.getTerm().trim().length() > 0)
//				updateClientVendor("TermID", c.getTerm(), cvID);
//
//			// Update credit card details
//			updateVendorCreditCard(cvID, c.getCcType(), c.getCardNo(), c.getExpDate(), c.getCw2(),
//					c.getCardHolderName(), c.getCardBillAddress(), c.getCardZip());
//
//			// change status of old record...........
//			pstmt = con.prepareStatement(
//					"update bca_bsaddress set status='O' where clientvendorid=? and status in ('N','U')");
//			pstmt.setInt(1, cvID);
//			pstmt.executeUpdate();
//			// ......................status change finished.........
//
//			int bsAddID = getLastBsAdd() + 1;
//
//			System.out.println("c.getSetdefaultbs():" + c.getSetdefaultbs());
//
//			insertVendorBSAddress(cvID, bsAddID, c.getBscname(), c.getBsdbaName(), c.getBsfirstName(),
//					c.getBslastName(), c.getBsaddress1(), c.getBsaddress2(), c.getBscity(), c.getBsstate(),
//					c.getBsprovince(), c.getBscountry(), c.getBszipCode(), "1");
//
//			insertVendorBSAddress(cvID, bsAddID, c.getShcname(), c.getShdbaName(), c.getShfirstName(),
//					c.getShlastName(), c.getShaddress1(), c.getShaddress2(), c.getShcity(), c.getShstate(),
//					c.getShprovince(), c.getShcountry(), c.getShzipCode(), "0");
//			TblBSAddress2 address = new TblBSAddress2();
//			address.setAddressWithVendorDtoBilling(c, cvID);
//			insertBillingShippingAddress(address, 1, true);
//			address.setAddressWithVendorDtoShipping(c, cvID);
//			insertBillingShippingAddress(address, 0, true);
//			insertVFCharge(cvID, useIndividualFinanceCharges, c.getAnnualIntrestRate(), c.getMinFCharges(),
//					c.getGracePrd(), AssessFinanceChk, fInvoiceCharge);
//
//			// --------code to save services--------------------------START---
//			int i = 0;
//			String sql;
//			String serviceID = c.getTable_serID();
//
//			String serviceBal = c.getTable_bal();
//			String defaultser = c.getTable_defaultVal();
//			String invStyleID = c.getTable_invId();
//
//			sql = "delete from bca_clientvendorservice where ClientVendorID = ?";
//			ps = con.prepareStatement(sql);
//			ps.setInt(1, cvID);
//			ps.executeUpdate();
//
//			if (serviceID != null && !(serviceID.equals("") || invStyleID.equals("") || serviceBal.equals(""))) {
//				String temp[] = null, temp2[] = null, temp3[] = null;
//				if ((serviceID != "" && serviceID != null)
//						&& (invStyleID != "" && invStyleID != null) & (serviceBal != "" && serviceBal != null)) {
//					temp = serviceID.split(";"); // serviceID is in form like
//
//					temp2 = invStyleID.split(";");
//					temp3 = serviceBal.split(";");
//				}
//				java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());
//
//				System.out.println("Length of temp:" + temp.length);
//
//				for (i = 0; i < temp.length; i++) {
//					sql = "insert into bca_clientvendorservice "
//							+ "(ClientVendorID,DateAdded,CompanyID,InvoiceStyleID,ServiceBalance,DEFAULTService) "
//							+ "values (?,?,?,?,?,?)";
//
//					/* sql = "insert into bca_clientvendorservice values (?,?,?,?,?,?,?)"; */
//					ps = con.prepareStatement(sql);
//					ps.setInt(1, cvID);
//					ps.setDate(2, d);
//					ps.setInt(3, Integer.parseInt(compID));
//					ps.setInt(4, Integer.parseInt(temp2[i]));
//					ps.setFloat(5, java.lang.Float.parseFloat(temp3[i]));
//					if (Integer.parseInt(temp[i]) == Integer.parseInt(defaultser)) {
//						ps.setInt(6, 1);
//						// Loger.log("EQUAL-------------------->>");
//					} else
//						ps.setInt(6, 0);
//					/* ps.setInt(7, Integer.parseInt(temp[i])); */
//					System.out.println("temp[i]:" + temp[i]);
//					ps.executeUpdate();
//				}
//			}
//			// --------------------------code to save services
//			// -------------------------------------END-------
//
//		} catch (SQLException ee) {
//			Loger.log(2, "SQLException in Class PurchaseInfo,  method -updateInsertVendor " + ee.toString());
//		} finally {
//			try {
//
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (ps != null) {
//					db.close(ps);
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
	 * Provides the information such as vendor name,id,address1,etc. & also provides
	 * the services related to these vendors with their ids.
	 */
	public ArrayList getPrintLabelInfo(HttpServletRequest request, String compId, int startValue, int limit) {
		Connection con = null;
		ArrayList<VendorDto> labelInfo = new ArrayList<VendorDto>();
		CountryState conState = new CountryState();
		PreparedStatement pstmt_client = null;
		PreparedStatement pstmt_clientSer = null;
		PreparedStatement pstmt_ser = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<VendorDto> serviceList = new ArrayList<VendorDto>();
		ResultSet rs_client = null;
		ResultSet rs_clientSer = null;
		ResultSet rs_ser = null;
		con = db.getConnection();
		int start = ((startValue - 1) * limit);
		try {

			String sqlString = "select ClientVendorID,Name,FirstName,LastName,Address1,Address2,"
					+ " City,State,ZipCode,CellPhone,Fax,Email,date_format(DateAdded,'%m-%d-%Y') as DateAdded"
					+ " from bca_clientvendor where (CVTypeID=1 or CVTypeID=3 )and Status in ('N','U') "
					+ " and Deleted=0 and Active=1 and CompanyID=? order by Name limit ?,?";

			pstmt_client = con.prepareStatement(sqlString);
			pstmt_client.setString(1, compId);
			pstmt_client.setInt(2, start);
			pstmt_client.setInt(3, limit);
			rs_client = pstmt_client.executeQuery();
			while (rs_client.next()) {
				VendorDto vendor = new VendorDto();
				vendor.setClientVendorID(rs_client.getString("ClientVendorID"));
				vendor.setCname(rs_client.getString("Name"));
				vendor.setFullName(rs_client.getString("FirstName") + " " + rs_client.getString("LastName"));
				vendor.setAddress1(rs_client.getString("Address1"));
				vendor.setAddress2(rs_client.getString("Address2"));
				vendor.setCity(rs_client.getString("City"));
				vendor.setState(conState.getStatesName(rs_client.getString("State")));
				vendor.setZipCode(rs_client.getString("ZipCode"));
				vendor.setCellPhone(rs_client.getString("CellPhone"));
				vendor.setFax(rs_client.getString("Fax"));
				vendor.setEmail(rs_client.getString("Email"));
				vendor.setDateAdded(rs_client.getString("DateAdded"));

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

				labelInfo.add(vendor);
			}
			request.setAttribute("Services", serviceList);

		} catch (SQLException ee) {
			Loger.log(2, "SQL Error in Class PurchaseInfo and  method -getPrintLabelInfo " + ee.toString());
		} finally {
			try {
				if (rs_client != null) {
					db.close(rs_client);
				}
				if (rs_clientSer != null) {
					db.close(rs_clientSer);
				}
				if (rs_ser != null) {
					db.close(rs_ser);
				}
				if (pstmt_client != null) {
					db.close(pstmt_client);
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
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return labelInfo;
	}

	/*
	 * Invoke the information such as label name width,height,top margin,etc. from
	 * its label id.
	 */
	public void getLabel(int lblId, PrintLabelDto label) {
		Connection con = null;
		PreparedStatement pstmt_lbl = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		try {
			pstmt_lbl = con.prepareStatement(
					"select ID,LabelType,Mar_Top,Mar_Left,Size_Width,Size_Height,Spacing_Hor,Spacing_Vert from bca_label where ID=?");
			pstmt_lbl.setInt(1, lblId);
			rs = pstmt_lbl.executeQuery();
			if (rs.next()) {

				label.setLabelType(rs.getInt("ID"));
				label.setLabelName(rs.getString("LabelType"));
				label.setTopMargin(rs.getString("Mar_Top"));
				label.setLeftMargin(rs.getString("Mar_Left"));
				label.setLabelWidth(rs.getString("Size_Width"));
				label.setLabelHeight(rs.getString("Size_Height"));
				label.setVertical(rs.getString("Spacing_Vert"));
				label.setHorizon(rs.getString("Spacing_Hor"));
			}

		} catch (SQLException ee) {
			Loger.log(2, "SQL Error in Class PurchaseInfo and method -getLabel " + ee.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (pstmt_lbl != null) {
					db.close(pstmt_lbl);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
	}

	/*
	 * Saves the new label to the database with its related information.
	 */
	public void saveLabel(PrintLabelDto form) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		try {
			int labelID = 0;
			pstmt1 = con.prepareStatement("select max(ID)+1 from bca_label");
			rs = pstmt1.executeQuery();
			if (rs.next()) {
				labelID = rs.getInt(1);
			}
			pstmt = con.prepareStatement("insert into bca_label values(?,\"" + form.getLabelName() + "\",?,?,?,?,?,?)");
			pstmt.setInt(1, labelID);
			pstmt.setString(2, form.getTopMargin());
			pstmt.setString(3, form.getLeftMargin());
			pstmt.setString(4, form.getLabelWidth());
			pstmt.setString(5, form.getLabelHeight());
			pstmt.setString(6, form.getHorizon());
			pstmt.setString(7, form.getVertical());
			pstmt.executeUpdate();
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class PurchaseInfo and  method -saveLabel" + ee.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (pstmt != null) {
					db.close(pstmt);
				}
				if (pstmt1 != null) {
					db.close(pstmt1);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
	}

	/*
	 * Delete the label selected by user from existing labels. It delete the labels
	 * according to their ids.
	 */
	public void deleteLabel(int lblId, PrintLabelDto form) {
		Connection con = null;
		PreparedStatement pstmt_delete = null, pstmt_id = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs_id = null;
		try {
			pstmt_delete = con.prepareStatement("delete from bca_label where ID=?");
			pstmt_delete.setInt(1, lblId);
			int del = pstmt_delete.executeUpdate();
			if (del > 0) {
				pstmt_id = con.prepareStatement("select ID from bca_label where ID >? order by ID asc");
				pstmt_id.setInt(1, lblId);
				rs_id = pstmt_id.executeQuery();
				if (rs_id.next())
					getLabel(rs_id.getInt("ID"), form);
				else {
					pstmt_id = con.prepareStatement("select ID from bca_label");
					rs_id = pstmt_id.executeQuery();
					if (rs_id.next()) {
						getLabel(rs_id.getInt("ID"), form);
					}

				}
			}
		} catch (SQLException ee) {
			Loger.log(2, "  SQL Error in Class CustomerInfo and  method -deleteLabel" + " " + ee.toString());
		} finally {
			try {
				if (rs_id != null) {
					db.close(rs_id);
				}
				if (pstmt_delete != null) {
					db.close(pstmt_delete);
				}
				if (pstmt_id != null) {
					db.close(pstmt_id);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(2, " SQL Error in Class CustomerInfo and  method -deleteLabel and in finally " + " "
						+ e.toString());
			}
		}
	}

	/*
	 * Updates the label selected by user from existing labels. It updates the label
	 * & its related information by its id.
	 */

	public void updateLabel(int labelID, PrintLabelDto form) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

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
			pstmt = con.prepareStatement("update bca_label set LabelType=\"" + form.getLabelName()
					+ "\",Mar_Top=?,Mar_Left=?,Size_Width=?,Size_Height=?,Spacing_Hor=?,Spacing_Vert=? where ID=?");
			pstmt.setString(1, form.getTopMargin());
			pstmt.setString(2, form.getLeftMargin());
			pstmt.setString(3, form.getLabelWidth());
			pstmt.setString(4, form.getLabelHeight());
			pstmt.setString(5, form.getHorizon());
			pstmt.setString(6, form.getVertical());
			pstmt.setInt(7, labelID);
			pstmt.executeUpdate();
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
		} finally {
			try {
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
	}

	private List<VendorDto> mapResultsToObject(List<Object[]> results) {
		List<VendorDto> vendorDtos = new ArrayList<>();

		for (Object[] result : results) {
			VendorDto vendorDto = new VendorDto();
			try {
				// Assuming the order of elements in the result array corresponds to the order
				// of fields in VendorDto
				BeanUtils.populate(vendorDto, getFieldNameValueMap(result));
				vendorDtos.add(vendorDto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// Handle exceptions if needed
				e.printStackTrace();
			}
		}

		return vendorDtos;
	}

	private Map<String, Object> getFieldNameValueMap(Object[] result) {
		// Assuming the fields in VendorDto are in the same order as the columns in the
		// query result
		Map<String, Object> map = new LinkedHashMap<>();
		// Replace these field names with the actual field names in VendorDto
		String[] fieldNames = { "clientVendorID", "cname", "title", "firstName", "lastName", "address1", "address2",
				"city", "state", "zipCode", "country", "email", "phone", "cellPhone", "fax", "dateAdded",
				"isPaymentCompleted", "type", "cityName", "stateName", "countryName", "dbaName", "memo" };

		for (int i = 0; i < result.length && i < fieldNames.length; i++) {
			map.put(fieldNames[i], result[i]);
		}

		return map;
	}

	public java.sql.Date string2date(String d) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");

		Date d1 = null;
		try {

			d1 = sdf.parse(d);

		} catch (ParseException e) {
			Loger.log(2, "ParseException" + e.getMessage());

		}

		return (d1 != null ? new java.sql.Date(d1.getTime()) : new java.sql.Date(new Date().getTime()));

	}

}
