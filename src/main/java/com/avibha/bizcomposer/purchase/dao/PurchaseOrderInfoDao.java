/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.purchase.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.purchase.forms.PurchaseOrderDto;
import com.avibha.bizcomposer.purchase.forms.VendorDto;
import com.avibha.bizcomposer.sales.dao.CustomerInfo;
import com.avibha.bizcomposer.sales.dao.Item;
import com.avibha.bizcomposer.sales.forms.InvoiceDto;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.avibha.common.utility.MyUtility;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaBsaddress;
import com.nxsol.bzcomposer.company.domain.BcaCart;
import com.nxsol.bzcomposer.company.domain.BcaCities;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.BcaInvoicestyle;
import com.nxsol.bzcomposer.company.domain.BcaInvoicetype;
import com.nxsol.bzcomposer.company.domain.BcaIteminventory;
import com.nxsol.bzcomposer.company.domain.BcaMessage;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.BcaPreference;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.domain.BcaSalestax;
import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;
import com.nxsol.bzcomposer.company.domain.BcaStates;
import com.nxsol.bzcomposer.company.domain.BcaTerm;
import com.nxsol.bzcomposer.company.repos.BcaBillingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaBsaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaCartRepository;
import com.nxsol.bzcomposer.company.repos.BcaCitiesRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCountriesRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoiceRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoicestyleRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoicetypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaIteminventoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaMessageRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaPreferenceRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalestaxRepository;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;
import com.nxsol.bzcomposer.company.repos.BcaShippingaddressRepository;
import com.nxsol.bzcomposer.company.repos.BcaStatesRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;
import com.nxsol.bzcomposer.company.utils.DateHelper;
import com.nxsol.bzcomposer.company.utils.JpaHelper;
import com.pritesh.bizcomposer.accounting.bean.BcaBillingAddressDto;
import com.pritesh.bizcomposer.accounting.bean.BcaShippingaddressDto;

@Service
public class PurchaseOrderInfoDao {

	@Autowired
	private ConfigurationInfo configInfo;

	@Autowired
	private CountryState countryState;
	@Autowired
	private BcaInvoiceRepository bcaInvoiceRepository;

	@Autowired
	private BcaPreferenceRepository bcaPreferenceRepository;

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private BcaClientvendorRepository bcaClientvendorRepository;

	@Autowired
	private BcaInvoicestyleRepository bcaInvoicestyleRepository;

	@Autowired
	private BcaInvoicetypeRepository bcaInvoicetypeRepository;

	@Autowired
	private BcaCompanyRepository bcaCompanyRepository;

	@Autowired
	private BcaTermRepository bcaTermRepository;

	@Autowired
	private BcaShipcarrierRepository bcaShipcarrierRepository;

	@Autowired
	private BcaMessageRepository bcaMessageRepository;

	@Autowired
	private BcaPaymenttypeRepository bcaPaymenttypeRepository;

	@Autowired
	private BcaCartRepository bcaCartRepository;

	@Autowired
	private BcaIteminventoryRepository bcaIteminventoryRepository;

	@Autowired
	private CustomerInfo customerInfo;

	@Autowired
	private BcaSalestaxRepository bcaSalestaxRepository;

	@Autowired
	private BcaShippingaddressRepository bcaShippingaddressRepository;

	@Autowired
	private BcaBillingaddressRepository bcaBillingaddressRepository;

	@Autowired
	private BcaBsaddressRepository bcaBsaddressRepository;
	@Autowired
	private BcaSalesrepRepository bcaSalesrepRepository;

	@Autowired
	private BcaCountriesRepository bcaCountriesRepository;

	@Autowired
	private BcaStatesRepository bcaStatesRepository;

	@Autowired
	private BcaCitiesRepository bcaCitiesRepository;

	/*
	 * Provide the list of all customers with their ids, last name,etc. The list is
	 * used for drop ship to.
	 */
	public ArrayList dropShipTo(String compId, String name) {
		ArrayList<PurchaseOrderDto> dlist = new ArrayList<PurchaseOrderDto>();
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = db.getConnection();
			String dropList = "select ClientVendorID,LastName,FirstName from bca_clientvendor "
					+ "where LastName like '" + name
					+ "%' and CVTypeID in (1,2) and Active=1 and Status in ('U','N') and "
					+ "Deleted=0 and CompanyID=? order by LastName ";
			pstmt = con.prepareStatement(dropList);
			pstmt.setString(1, compId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PurchaseOrderDto pform = new PurchaseOrderDto();
				pform.setFullName(rs.getString("LastName") + ", " + rs.getString("FirstName"));
				pform.setClientVendorID(rs.getString("ClientVendorID"));
				dlist.add(pform);
			}

		} catch (SQLException ex) {
			Loger.log("Exception in the dropShipTo" + " method of PurchaseOrderInfo class " + ex.toString());

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

		return dlist;
	}

	/*
	 * The method provide the list of all vendor with their ids & company name. The
	 * list is used for the purchase order to select perticular vendor.
	 */
	public ArrayList getVendorList(String compId, String name, String companyValue) {
		ArrayList<PurchaseOrderDto> vList = new ArrayList<PurchaseOrderDto>();
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = db.getConnection();
			String vandorList = "";
			if (companyValue.equals("on")) {
				vandorList = "select ClientVendorID,Name from bca_clientvendor where " + "Name like '" + name
						+ "%' and CVTypeID in (1,3) and Status in ('U','N') "
						+ "and Active=1 and Deleted=0 and CompanyID=? order by Name";

				pstmt = con.prepareStatement(vandorList);
				pstmt.setString(1, compId);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					PurchaseOrderDto pform = new PurchaseOrderDto();
					pform.setCompanyID(rs.getString("Name"));
					pform.setClientVendorID(rs.getString("ClientVendorID"));
					vList.add(pform);
				}
			} else {
				vandorList = "select ClientVendorID,FirstName,LastName from bca_clientvendor where " + "LastName like '"
						+ name + "%' and CVTypeID in (1,3) and Status in ('U','N') and "
						+ "Active=1 and Deleted=0 and CompanyID=? order by LastName";

				pstmt = con.prepareStatement(vandorList);
				pstmt.setString(1, compId);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					PurchaseOrderDto pform = new PurchaseOrderDto();
					pform.setCompanyID(rs.getString("LastName") + ", " + rs.getString("FirstName"));
					pform.setClientVendorID(rs.getString("ClientVendorID"));
					vList.add(pform);
				}
			}

		} catch (SQLException ex) {
			Loger.log("Exception in the dropShipTo" + " method of PurchaseOrderInfo class " + ex.toString());
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
		return vList;
	}

	public ArrayList<PurchaseOrderDto> billAddress(String companyID, String cvID) {
	    ArrayList<PurchaseOrderDto> objList = new ArrayList<>();
	    try {
	        ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
	        StringBuilder query = new StringBuilder("select distinct new ")
	                .append(BcaBillingAddressDto.class.getCanonicalName())
	                .append("(a.addressId, a.clientVendor.clientVendorId, a.name, a.firstName, a.lastName, a.address1, a.address2, a.zipCode, a.city, ct.name as cityName, a.state, s.name as stateName, a.country, c.name as countryName) from BcaBillingaddress as a left join BcaCountries as c on c.id=a.country left join BcaStates as s on s.id=a.state left join BcaCities as ct on ct.id = a.city where a.status in ('N', 'U')");

	        if (cvID != null && !cvID.trim().isEmpty()) {
	            query.append(" and a.clientVendor.clientVendorId = :clientVendorId ");
	        }

	        if (companyID != null && !companyID.trim().isEmpty()) {
	            query.append(" and a.company.companyId = :companyId");
	        }

	        TypedQuery<BcaBillingAddressDto> typedQuery = entityManager.createQuery(query.toString(), BcaBillingAddressDto.class);

	        if (cvID != null && !cvID.trim().isEmpty()) {
	            typedQuery.setParameter("clientVendorId", Integer.parseInt(cvID));
	        }

	        if (companyID != null && !companyID.trim().isEmpty()) {
	            typedQuery.setParameter("companyId", Long.parseLong(companyID));
	        }

	        List<BcaBillingAddressDto> billingAddress = typedQuery.getResultList();
	        for (BcaBillingAddressDto address : billingAddress) {
	            PurchaseOrderDto customer = mapToPurchaseOrderDto(address, configDto, companyID);
	            objList.add(customer);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        Loger.log(2, " SQL Error in Class PurchaseOrderInfo and  method -billAddress " + e.toString());
	    }
	    return objList;
	}

	private PurchaseOrderDto mapToPurchaseOrderDto(BcaBillingAddressDto address, ConfigurationDto configDto, String companyID) {
	    PurchaseOrderDto customer = new PurchaseOrderDto();
	    customer.setCompanyID(companyID);
	    customer.setBsAddressID(String.valueOf(address.getAddressId()));
	    customer.setClientVendorID(String.valueOf(address.getClientVendorId()));
	    customer.setFullName(address.getFirstName() + " " + address.getLastName());
	    customer.setCountry(address.getCountry());

	    String address2 = Optional.ofNullable(address.getAddress2()).filter(str -> !str.trim().isEmpty()).map(str -> "\n" + str).orElse("");
	    String bill = customer.getFullName() + "\n" + address.getName() + "\n" + address.getAddress1()
	            + address2 + "\n" + address.getCityName() + ", " + address.getStateName() + " "
	            + address.getZipCode();
	    if (configDto.isShowUSAInBillShipAddress() || !customer.getCountry().equals("231")) {
	        bill += "\n" + address.getCountryName();
	    }
	    customer.setBillTo(bill);
	    return customer;
	}
//	public ArrayList billAddress(String companyID, String cvID) {
//
//		ArrayList<PurchaseOrderDto> objList = new ArrayList<>();
//
//		try {
//
//			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
//
//			StringBuffer query = new StringBuffer("select distinct new  "
//					+ BcaBillingAddressDto.class.getCanonicalName()
//					+ "(a.addressId , a.clientVendor.clientVendorId , a.name , a.firstName , a.lastName , a.address1 , a.address2, "
//					+ " a.zipCode ,a.city , ct.name as cityName , a.state , s.name as stateName , a.country , c.name as countryName) from BcaBillingaddress as a left join "
//					+ " BcaCountries as c on c.id=a.country left join  BcaStates as s on s.id=a.state left join BcaCities as ct on ct.id = a.city where a.status in ('N', 'U')"
//					+ ((cvID != null && !cvID.trim().isEmpty()) ? "and a.clientVendor.clientVendorId = :clientVendorId "
//							: " "));
//
//			
//			TypedQuery<BcaBillingAddressDto> typedQuery = this.entityManager.createQuery(query.toString(),
//					BcaBillingAddressDto.class);
//			if (null != cvID)
//				JpaHelper.addParameter(typedQuery, query.toString(), "clientVendorId", Integer.parseInt(cvID));
//			
//			if (companyID != null && !companyID.trim().isEmpty()) {
//			    query.append(" and a.company.companyId = :companyId");
//			}
//			
//			if (companyID != null)
//				JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(companyID));
//			
//			
//			List<BcaBillingAddressDto> billingAddress = typedQuery.getResultList();
//			for (BcaBillingAddressDto address : billingAddress) {
//				PurchaseOrderDto customer = new PurchaseOrderDto();
//				customer.setCompanyID(companyID);
//				customer.setBsAddressID(String.valueOf(address.getAddressId()));
//				customer.setClientVendorID(String.valueOf(address.getClientVendorId()));
//				customer.setFullName(address.getFirstName() + " " + address.getLastName());
//				customer.setCountry(address.getCountry());
//				String ADDRESS_ASD22 = address.getAddress2();
//				if (ADDRESS_ASD22 != null && ADDRESS_ASD22.trim().length() > 0) {
//					ADDRESS_ASD22 = "\n" + ADDRESS_ASD22;
//				} else {
//					ADDRESS_ASD22 = "";
//				}
//				String bill = customer.getFullName() + "\n" + address.getName() + "\n" + address.getAddress1()
//						+ ADDRESS_ASD22 + "\n" + address.getCityName() + ", " + address.getStateName() + " "
//						+ address.getZipCode();
//				if (configDto.isShowUSAInBillShipAddress()) {
//					bill = bill + "\n" + address.getCountryName();
//				} else if (!customer.getCountry().equals("231")) {
//					bill = bill + "\n" + address.getCountryName();
//				}
//				customer.setBillTo(bill);
//				objList.add(customer);
//			}
//
//		} catch (Exception ee) {
//			ee.printStackTrace();
//			Loger.log(2, " SQL Error in Class PurchaseOrderInfo and  method -billAddress " + ee.toString());
//		}
//		return objList;
//	}
//	public ArrayList billAddress(String companyID, String cvID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<PurchaseOrderDto> objList = new ArrayList<>();
//		CountryState conState = new CountryState();
//		try {
//			ConfigurationInfo configInfo = new ConfigurationInfo();
//			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
//
//			con = db.getConnection();
//			
//
//			String sqlString = "SELECT distinct a.AddressID,a.ClientVendorID,a.Name,a.FirstName,a.LastName,a.Address1,a.Address2,a.ZipCode,"
//					+ "a.City,ct.Name As CityName, a.State,s.name AS StateName, a.Country,c.name AS CountryName "
//					+ " FROM bca_billingaddress AS a LEFT JOIN bca_countries AS c ON c.id=a.Country LEFT JOIN bca_states AS s ON s.id=a.State "
//					+ " LEFT JOIN bca_cities AS ct ON ct.id=a.City WHERE a.Status IN ('N') ";
//			if (cvID != null && !cvID.trim().isEmpty()) {
//				sqlString = sqlString + " AND a.ClientVendorID=" + cvID + " LIMIT 1";
//			}
//			
//			
//			pstmt = con.prepareStatement(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				PurchaseOrderDto customer = new PurchaseOrderDto();
//				customer.setCompanyID(companyID);
//				customer.setBsAddressID(rs.getString(1));
//				customer.setClientVendorID(rs.getString(2));
//				customer.setFullName(rs.getString(4) + " " + rs.getString(5));
//				customer.setCountry(rs.getString("Country"));
//				/*
//				 * conState.getStatesName(rs.getString(9)) + "\n"+
//				 * conState.getCountryName(rs.getString(11));
//				 */
//				String ADDRESS_ASD22 = rs.getString(7);
//				if (ADDRESS_ASD22 != null && ADDRESS_ASD22.trim().length() > 0) {
//					ADDRESS_ASD22 = "\n" + ADDRESS_ASD22;
//				} else {
//					ADDRESS_ASD22 = "";
//				}
//				String bill = customer.getFullName() + "\n" + rs.getString(3) + "\n" + rs.getString(6) + ADDRESS_ASD22
//						+ "\n" + rs.getString("CityName") + ", " + rs.getString("StateName") + " "
//						+ rs.getString("ZipCode");
//				if (configDto.isShowUSAInBillShipAddress()) {
//					bill = bill + "\n" + rs.getString("CountryName");
//				} else if (!customer.getCountry().equals("231")) {
//					bill = bill + "\n" + rs.getString("CountryName");
//				}
//				customer.setBillTo(bill);
//				objList.add(customer);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class PurchaseOrderInfo and  method -billAddress " + ee.toString());
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
//		return objList;
//	}

	public ArrayList<PurchaseOrderDto> shipAddress(String companyID, String cvID) {
		ArrayList<PurchaseOrderDto> objList = new ArrayList<>();

	    try {
	    	 ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
	         StringBuilder query = new StringBuilder("select distinct new ")
	                 .append(BcaShippingaddressDto.class.getCanonicalName())
	                 .append("(a.addressId, a.clientVendor.clientVendorId, a.name, a.firstName, a.lastName, a.address1, a.address2, ")
	                 .append("a.zipCode, a.city, ct.name as cityName, a.state, s.name as stateName, a.country, c.name as countryName) ")
	                 .append("from BcaShippingaddress as a ")
	                 .append("left join BcaCountries as c on c.id=a.country ")
	                 .append("left join BcaStates as s on s.id=a.state ")
	                 .append("left join BcaCities as ct on ct.id = a.city ")
	                 .append("where a.status in ('N', 'U') ")
	                 .append(cvID != null && !cvID.trim().isEmpty() ? "and a.clientVendor.clientVendorId = :clientVendorId " : "");

	         // Append the condition for companyId before creating the TypedQuery
	         if (companyID != null && !companyID.trim().isEmpty()) {
	             query.append(" and a.company.companyId = :companyId");
	         }

	         TypedQuery<BcaShippingaddressDto> typedQuery = entityManager.createQuery(query.toString(), BcaShippingaddressDto.class);

	         if (cvID != null) {
	             typedQuery.setParameter("clientVendorId", Integer.parseInt(cvID));
	         }

	         if (companyID != null && !companyID.trim().isEmpty()) {
	             typedQuery.setParameter("companyId", Long.valueOf(companyID));
	         }


	        List<BcaShippingaddressDto> shippingAddresses = typedQuery.getResultList();
	        shippingAddresses.forEach(address -> {
	            PurchaseOrderDto customer = new PurchaseOrderDto();
	            customer.setShAddressID(String.valueOf(address.getAddressId()));
	            customer.setClientVendorID(String.valueOf(address.getClientVendorId()));
	            customer.setFullName(address.getFirstName() + " " + address.getLastName());
	            customer.setCountry(address.getCountry());
	            String addressLine2 = Optional.ofNullable(address.getAddress2()).filter(str -> !str.trim().isEmpty()).map(str -> "\n" + str).orElse("");
	            String shipAddress = Stream.of(customer.getFullName(), address.getName(), address.getAddress1() + addressLine2, address.getCityName() + ", " + address.getStateName() + " " + address.getZipCode())
	                    .collect(Collectors.joining("\n"));
	            if (configDto.isShowUSAInBillShipAddress() || !"231".equals(customer.getCountry())) {
	                shipAddress += "\n" + address.getCountryName();
	            }
	            customer.setShipTo(shipAddress);
	            objList.add(customer);
	        });
	    } catch (Exception e) {
	        e.printStackTrace();
	        Loger.log(2, " SQL Error in Class PurchaseOrderInfoDao and method -shipAddress " + e.toString());
	    }
	    return objList;
	}
//	public ArrayList shipAddress(String companyID, String cvID) {
//
//		ArrayList<PurchaseOrderDto> objList = new ArrayList<>();
//
//		try {
//
//			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
//			StringBuffer query = new StringBuffer("select distinct new  "
//					+ BcaShippingaddressDto.class.getCanonicalName()
//					+ "(a.addressId , a.clientVendor.clientVendorId , a.name , a.firstName , a.lastName , a.address1 , a.address2, "
//					+ " a.zipCode ,a.city , ct.name as cityName , a.state , s.name as stateName , a.country , c.name as countryName) from BcaShippingaddress as a left join "
//					+ " BcaCountries as c on c.id=a.country left join  BcaStates as s on s.id=a.state left join BcaCities as ct on ct.id = a.city where a.status in ('N', 'U') "
//					+ ((cvID != null && !cvID.trim().isEmpty()) ? "and a.clientVendor.clientVendorId = :clientVendorId "
//							: " "));
//			TypedQuery<BcaShippingaddressDto> typedQuery = this.entityManager.createQuery(query.toString(),
//					BcaShippingaddressDto.class);
//			if (null != cvID)
//				JpaHelper.addParameter(typedQuery, query.toString(), "clientVendorId", Integer.parseInt(cvID));
//			
//			if (companyID != null && !companyID.trim().isEmpty()) {
//			    query.append(" and a.company.companyId = :companyId");
//			}
//			
//			if (companyID != null)
//				JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(companyID));
//
//			
//			
//			
//			
//			List<BcaShippingaddressDto> ShippingAddress = typedQuery.getResultList();
//			for (BcaShippingaddressDto address : ShippingAddress) {
//				PurchaseOrderDto customer = new PurchaseOrderDto();
//
//				customer.setBsAddressID(String.valueOf(address.getAddressId()));
//				customer.setClientVendorID(String.valueOf(address.getClientVendorId()));
//				customer.setFullName(address.getFirstName() + " " + address.getLastName());
//				customer.setCountry(address.getCountry());
//				String ADDRESS_ASD22 = address.getAddress2();
//				if (ADDRESS_ASD22 != null && ADDRESS_ASD22.trim().length() > 0) {
//					ADDRESS_ASD22 = "\n" + ADDRESS_ASD22;
//				} else {
//					ADDRESS_ASD22 = "";
//				}
//				String ship = customer.getFullName() + "\n" + address.getName() + "\n" + address.getAddress1()
//						+ ADDRESS_ASD22 + "\n" + address.getCityName() + ", " + address.getStateName() + " "
//						+ address.getZipCode();
//				if (configDto.isShowUSAInBillShipAddress()) {
//					ship = ship + "\n" + address.getCountryName();
//				} else if (!customer.getCountry().equals("231")) {
//					ship = ship + "\n" + address.getCountryName();
//				}
//				if (ship.equals(""))
//					customer.setShipTo("");
//				else {
//					customer.setShipTo(ship);
//				}
//				objList.add(customer);
//			}
//
//		} catch (Exception ee) {
//			ee.printStackTrace();
//			Loger.log(2, " SQL Error in Class PurchaseOrderInfoDao and  method -shipAddress " + ee.toString());
//		}
//		return objList;
//	}

//	public ArrayList shipAddress(String companyID, String cvID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<PurchaseOrderDto> objList = new ArrayList<>();
//		CountryState conState = new CountryState();
//		try {
//			ConfigurationInfo configInfo = new ConfigurationInfo();
//			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
//
//			con = db.getConnection();
//			String sqlString = "SELECT distinct a.AddressID,a.ClientVendorID,a.Name,a.FirstName,a.LastName,a.Address1,a.Address2,a.City,a.ZipCode,"
//					+ "a.City,ct.Name As CityName, a.State,s.name AS StateName, a.Country,c.name AS CountryName "
//					+ " FROM bca_shippingaddress AS a LEFT JOIN bca_countries AS c ON c.id=a.Country LEFT JOIN bca_states AS s ON s.id=a.State "
//					+ " LEFT JOIN bca_cities AS ct ON ct.id=a.City WHERE a.Status IN ('N') ";
//			if (cvID != null && !cvID.trim().isEmpty()) {
//				sqlString = sqlString + " AND a.ClientVendorID=" + cvID + " LIMIT 1";
//			}
//			pstmt = con.prepareStatement(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				PurchaseOrderDto customer = new PurchaseOrderDto();
//				customer.setBsAddressID(rs.getString(1));
//				customer.setClientVendorID(rs.getString(2));
//				customer.setFullName(rs.getString(4) + "  " + rs.getString(5));
//				/*
//				 * conState.getStatesName(rs.getString(9)) + "\n"+
//				 * conState.getCountryName(rs.getString(11));
//				 */
//				customer.setCountry(rs.getString("Country"));
//				String ADDRESS_ASD22 = rs.getString(7);
//				if (ADDRESS_ASD22 != null && ADDRESS_ASD22.trim().length() > 0) {
//					ADDRESS_ASD22 = "\n" + ADDRESS_ASD22;
//				} else {
//					ADDRESS_ASD22 = "";
//				}
//				String ship = customer.getFullName() + "\n" + rs.getString(3) + "\n" + rs.getString(6) + ADDRESS_ASD22
//						+ "\n" + rs.getString("CityName") + ", " + rs.getString("StateName") + " "
//						+ rs.getString("ZipCode");
//				if (configDto.isShowUSAInBillShipAddress()) {
//					ship = ship + "\n" + rs.getString("CountryName");
//				} else if (!customer.getCountry().equals("231")) {
//					ship = ship + "\n" + rs.getString("CountryName");
//				}
//				if (ship.equals(""))
//					customer.setShipTo("");
//				else {
//					customer.setShipTo(ship);
//				}
//				objList.add(customer);
//			}
//			pstmt.close();
//			rs.close();
//
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
//		return objList;
//	}

	public ArrayList getVendorDetails(String compId, HttpServletRequest request) {
		ArrayList<VendorDto> objList = new ArrayList<VendorDto>();

		try {
			List<BcaClientvendor> clientVendor = bcaClientvendorRepository
					.findByCompanyIdAndActiveAndDeletedAndCvTypeIdInAndStatusInOrderByLastName(Long.parseLong(compId),
							1, 0, Arrays.asList(1, 3), Arrays.asList("U", "N"));
			for (BcaClientvendor vendor : clientVendor) {
				VendorDto vendorForm = new VendorDto();
				vendorForm.setClientVendorID(String.valueOf(vendor.getClientVendorId()));
				vendorForm.setFirstName(vendor.getFirstName());
				vendorForm.setLastName(vendor.getLastName());
				vendorForm.setCname(vendor.getName());
				objList.add(vendorForm);
			}

		} catch (Exception ex) {
			Loger.log("Exception in the getVendorDetails method of purchaseOrderInfoDao class " + ex.toString());
		}
		return objList;
	}

//	public ArrayList getVendorDetails(String compId, HttpServletRequest request) {
//		ArrayList<VendorDto> objList = new ArrayList<VendorDto>();
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			String vandorSQL = "SELECT ClientVendorID,FirstName,LastName,Name FROM bca_clientvendor "
//					+ "WHERE CVTypeID in (1,3) and Status in ('U','N') and Active=1 and Deleted=0 and CompanyID=? order by LastName";
//
//			pstmt = con.prepareStatement(vandorSQL);
//			pstmt.setString(1, compId);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				VendorDto vendorForm = new VendorDto();
//				vendorForm.setClientVendorID(rs.getString("ClientVendorID"));
//				vendorForm.setFirstName(rs.getString("FirstName"));
//				vendorForm.setLastName(rs.getString("LastName"));
//				vendorForm.setCname(rs.getString("Name"));
//				objList.add(vendorForm);
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the dropShipTo method of PurchaseOrderInfo class " + ex.toString());
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
//		return objList;
//	}

	/*
	 * The method provides the information of the perticular vendor as selected by
	 * user. It provides information such as vendor id, company name. vendor's first
	 * name,last name,etc.
	 * 
	 */
	public PurchaseOrderDto getVendorDetails(String compId, String cvId, String companyValue) {
		Connection con = null;
		PreparedStatement pstmt_clientInfo = null;
		PreparedStatement pstmt_bsaAddr = null;
		SQLExecutor db = new SQLExecutor();
		CountryState conState = new CountryState();
		ResultSet rs_clientInfo = null;
		ResultSet rs_bsaAddr = null;

		PurchaseOrderDto recvForm = new PurchaseOrderDto();

		try {
			con = db.getConnection();
			String venderDetail = "";
			venderDetail = "select Name,FirstName,LastName,Taxable,ShipCarrierID,PaymentTypeID,TermID "
					+ "from bca_clientvendor where Active=1 and Deleted=0 and Status in ('U','N') and "
					+ "ClientVendorID=? and CompanyID=?";
			pstmt_clientInfo = con.prepareStatement(venderDetail);
			pstmt_clientInfo.setString(1, cvId);
			pstmt_clientInfo.setString(2, compId);

			rs_clientInfo = pstmt_clientInfo.executeQuery();
			if (rs_clientInfo.next()) {
				recvForm.setFullName(rs_clientInfo.getString("LastName") + ", " + rs_clientInfo.getString("FirstName"));
				recvForm.setTaxable(rs_clientInfo.getInt("Taxable") == 1 ? "true" : "false");
				recvForm.setVia(rs_clientInfo.getString("ShipCarrierID"));
				recvForm.setPayMethod(rs_clientInfo.getString("PaymentTypeID"));
				recvForm.setTerm(rs_clientInfo.getString("TermID"));
				recvForm.setCompanyName(rs_clientInfo.getString("Name"));
			}
			rs_clientInfo.close();
			pstmt_clientInfo.close();
			String sqlBillQuery = "select BSAddressID,Name,FirstName,LastName, Address1,Address2,"
					+ "City,State,ZipCode,Country from bca_bsaddress where  (Status like 'N' or Status like 'U')"
					+ " and AddressType =1 and ClientVendorID=?";
			pstmt_bsaAddr = con.prepareStatement(sqlBillQuery);
			pstmt_bsaAddr.setString(1, cvId);
			rs_bsaAddr = pstmt_bsaAddr.executeQuery();
			if (rs_bsaAddr.next()) {
				recvForm.setBillAddrValue(rs_bsaAddr.getString(1));

				String bill = rs_bsaAddr.getString(2) + "\n" + rs_bsaAddr.getString(3) + "  " + rs_bsaAddr.getString(4)
						+ "\n" + rs_bsaAddr.getString(5) + "\n" + rs_bsaAddr.getString(6) + "\n"
						+ rs_bsaAddr.getString(7) + "\n" + conState.getStatesName(rs_bsaAddr.getString(8)) + "\n"
						+ rs_bsaAddr.getString(9) + "\n" + conState.getCountryName(rs_bsaAddr.getString(10));
				if (bill.equals(""))
					recvForm.setBillTo("");
				else {
					recvForm.setBillTo(bill);
				}
			}

		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + " " + ee.toString());
		} finally {
			try {
				if (rs_clientInfo != null) {
					db.close(rs_clientInfo);
				}
				if (rs_bsaAddr != null) {
					db.close(rs_bsaAddr);
				}
				if (pstmt_clientInfo != null) {
					db.close(pstmt_clientInfo);
				}
				if (pstmt_bsaAddr != null) {
					db.close(pstmt_bsaAddr);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

		return recvForm;
	}

	/*
	 * The method gives the last name & first name of the selected vendor,also
	 * provides the ship address information The information is provided by the
	 * vendor id.
	 */
	public PurchaseOrderDto getDropShipDetails(String compId, String cvId) {
		Connection con = null;
		PreparedStatement pstmt_clientInfo = null;
		PreparedStatement pstmt_bsaAddr = null;
		SQLExecutor db = new SQLExecutor();
		CountryState conState = new CountryState();
		ResultSet rs_clientInfo = null;
		ResultSet rs_bsaAddr = null;
		PurchaseOrderDto recvForm = new PurchaseOrderDto();
		try {
			con = db.getConnection();
			pstmt_clientInfo = con.prepareStatement("select LastName,FirstName from bca_clientvendor where Active=1"
					+ " and Deleted=0 and Status in ('U','N') and ClientVendorID=? and CompanyID=?");
			pstmt_clientInfo.setString(1, cvId);
			pstmt_clientInfo.setString(2, compId);

			rs_clientInfo = pstmt_clientInfo.executeQuery();
			if (rs_clientInfo.next()) {
				recvForm.setFullName(rs_clientInfo.getString("LastName") + ", " + rs_clientInfo.getString("FirstName"));
			}
			rs_clientInfo.close();
			pstmt_clientInfo.close();
			String sqlBillQuery = "select BSAddressID,Name,FirstName,LastName, Address1,Address2,"
					+ "City,State,ZipCode,Country from bca_bsaddress where  (Status like 'N' or Status like 'U')"
					+ " and AddressType =0 and ClientVendorID=?";
			pstmt_bsaAddr = con.prepareStatement(sqlBillQuery);
			pstmt_bsaAddr.setString(1, cvId);
			rs_bsaAddr = pstmt_bsaAddr.executeQuery();
			if (rs_bsaAddr.next()) {
				recvForm.setShipAddr(rs_bsaAddr.getString(1));
				String ship = rs_bsaAddr.getString(2) + "\n" + rs_bsaAddr.getString(3) + "  " + rs_bsaAddr.getString(4)
						+ "\n" + rs_bsaAddr.getString(5) + "\n" + rs_bsaAddr.getString(6) + "\n"
						+ rs_bsaAddr.getString(7) + "\n" + conState.getStatesName(rs_bsaAddr.getString(8)) + "\n"
						+ rs_bsaAddr.getString(9) + "\n" + conState.getCountryName(rs_bsaAddr.getString(10));
				if (ship.equals(""))
					recvForm.setShipTo("");
				else {
					recvForm.setShipTo(ship);
				}
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + " " + ee.toString());
		} finally {
			try {
				if (rs_clientInfo != null) {
					db.close(rs_clientInfo);
				}
				if (rs_bsaAddr != null) {
					db.close(rs_bsaAddr);
				}
				if (pstmt_clientInfo != null) {
					db.close(pstmt_clientInfo);
				}
				if (pstmt_bsaAddr != null) {
					db.close(pstmt_bsaAddr);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

		return recvForm;
	}

	/*
	 * The method provides the address of the company of the user. The address is
	 * selected when customer is not selected for ship address.
	 */
	public void getCommonShipAddr(HttpServletRequest request, String compId) {

		try {
			BcaCompany company = bcaCompanyRepository.findById(Long.parseLong(compId))
					.orElseThrow(() -> new EntityNotFoundException("Company Not Found"));
			String ship = company.getName() + "\n" + company.getFirstName() + "  " + company.getLastName() + "\n"
					+ company.getAddress1() + "\n" + company.getAddress2() + "\n" + company.getCity() + "\n"
					+ countryState.getStatesName(company.getState()) + "\n" + company.getZipcode() + "\n"
					+ countryState.getCountryName(company.getCountry());

			request.setAttribute("ShipAddr", ship);

		} catch (Exception ex) {
			Loger.log("Exception in the method getCommonShipAddr of " + "class PurchaseOrderInfo " + ex.toString());
		}
	}

//	public void getCommonShipAddr(HttpServletRequest request, String compId) {
//		Connection con = null;
//		PreparedStatement pstmt_bsaAddr = null;
//		SQLExecutor db = new SQLExecutor();
//		CountryState conState = new CountryState();
//		ResultSet rs_bsaAddr = null;
//		if (db == null)
//			return;
//		con = db.getConnection();
//		if (con == null)
//			return;
//		try {
//			String shipAddr = "select Name,FirstName,LastName,Address1,Address2,City,State,"
//					+ "Zipcode,Country from bca_company where CompanyID=?";
//			pstmt_bsaAddr = con.prepareStatement(shipAddr);
//			pstmt_bsaAddr.setString(1, compId);
//			rs_bsaAddr = pstmt_bsaAddr.executeQuery();
//			if (rs_bsaAddr.next()) {
//				String ship = rs_bsaAddr.getString("Name") + "\n" + rs_bsaAddr.getString("FirstName") + "  "
//						+ rs_bsaAddr.getString("LastName") + "\n" + rs_bsaAddr.getString("Address1") + "\n"
//						+ rs_bsaAddr.getString("Address2") + "\n" + rs_bsaAddr.getString("City") + "\n"
//						+ conState.getStatesName(rs_bsaAddr.getString("State")) + "\n" + rs_bsaAddr.getString("Zipcode")
//						+ "\n" + conState.getCountryName(rs_bsaAddr.getString("Country"));
//
//				request.setAttribute("ShipAddr", ship);
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the method getCommonShipAddr of " + "class PurchaseOrderInfo " + ex.toString());
//		} finally {
//			try {
//				if (rs_bsaAddr != null) {
//					db.close(rs_bsaAddr);
//				}
//				if (pstmt_bsaAddr != null) {
//					db.close(pstmt_bsaAddr);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//	}

	/*
	 * The method generates the next purchase order no.
	 */
	public String getNewPONum(String compId) {

		int lastOrderNo = 0;
		try {

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			List<BcaInvoice> invoice = bcaInvoiceRepository
					.findByCompanyIdAndInvoiceStatusNotAndInvoiceTypeIdIn(Long.parseLong(compId), 1, Arrays.asList(2));
			if (invoice != null && !invoice.isEmpty()) {
				lastOrderNo = invoice.get(0).getPonum() + 1;
			} else {
				String startNumber = configDto.getStartPONum();
				lastOrderNo = Integer.parseInt(startNumber.substring(startNumber.indexOf("-") + 1));
			}

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, "Error in  Class purchaseOrderInfoDao and  method -getNewPONum " + ee.toString());

		}
		return String.valueOf(lastOrderNo);
	}

//	public String getNewPONum(String compId) {
//		PreparedStatement pstmt=null;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		int lastOrderNo = 0;
//		try {
//			ConfigurationInfo configInfo = new ConfigurationInfo();
//			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
//
//			String sqlString = "select PONum from bca_invoice where CompanyID = ? and not(invoiceStatus=1) and InvoiceTypeID IN (2)  order by PONum desc";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, compId);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				lastOrderNo = rs.getInt(1)+1;
//			}else{
//				String startNumber = configDto.getStartPONum();
//				lastOrderNo = Integer.parseInt(startNumber.substring(startNumber.indexOf("-")+1));
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, "Error in  Class InvoiceInfo and  method -getNewPONum " + ee.toString());
//			
//		}finally {
//			try {
//				if (rs != null) { db.close(rs); }
//				if (pstmt != null) { db.close(pstmt); }
//				if(con != null){ db.close(con); }
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return String.valueOf(lastOrderNo);
//	}
//	
	/*
	 * The method provides the purchase order style which is default for the user's
	 * company. This style is used when user does not select the style.
	 */
	public String getDefaultPOStyle(String compId) {
		int poStyleID = 0;

		long cid = Long.parseLong(compId);

		try {
			BcaPreference bcaPreference = bcaPreferenceRepository.findByCompany_CompanyId(cid)
					.orElseThrow(() -> new EntityNotFoundException("Preference not found"));
			if (null != bcaPreference) {
				poStyleID = bcaPreference.getPostyle().getPostyleId();
			}

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, "Error in  Class PurchaseOrderInfo and  method -getDefaultPOStyle " + " " + ee.toString());
		}
		return String.valueOf(poStyleID);
	}

//	public String getDefaultPOStyle(String compId) {
//		int poStyleID = 0;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		if (db == null)
//			return null;
//		con = db.getConnection();
//		long cid = Long.parseLong(compId);
//		if (con == null)
//			return null;
//
//		try {
//			String sqlString = "select POStyleID from bca_preference where CompanyID=?";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setLong(1, cid);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				poStyleID = rs.getInt(1);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, "Error in  Class PurchaseOrderInfo and  method -getDefaultPOStyle " + " " + ee.toString());
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
//		return String.valueOf(poStyleID);
//	}

	/*
	 * The method check where the given purchase order number is exist or not in the
	 * database.
	 */
	public boolean poNumExist(String compId, String orderNo) {

		long cid = Long.parseLong(compId);
		boolean exist = false;
		try {
			StringBuffer query = new StringBuffer(
					"SELECT bi.ponum from BcaInvoice bi WHERE bi.company.companyId =:companyId and "
							+ "bi.invoiceStatus <> :invoiceStatus and bi.invoiceType.invoiceTypeId IN :invoiceTypeId and bi.ponum=:ponum");

			TypedQuery<Integer> typedQuery = this.entityManager.createQuery(query.toString(), Integer.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", cid);
			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceStatus", 1);
			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceTypeId", Arrays.asList(2));
			JpaHelper.addParameter(typedQuery, query.toString(), "ponum", Integer.parseInt(orderNo));

//			Integer ponum = typedQuery.getFirstResult();
			List<Integer> results = typedQuery.getResultList();
		    exist = !results.isEmpty(); // The PONum exists if the result list is not empty
//			if (null != ponum) {
//				exist = true;
//			}

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, "Error in  Class InvoiceInfo and  method -getTaxes " + ee.toString());

		}
		return exist;
	}

//	final public boolean poNumExist(String compId, String orderNo) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
//		int cid = Integer.parseInt(compId);
//		boolean exist = false;
//		try {
//			String sql = "select PONum from bca_invoice where PONum = ? and CompanyID = ? and not (invoiceStatus=1 ) and InvoiceTypeID in (2)";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, orderNo);
//			pstmt.setInt(2, cid);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				exist = true;
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, "Error in  Class InvoiceInfo and  method -getTaxes " + ee.toString());
//
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
//		return exist;
//	}

	/*
	 * The method check where the customer ship address exist for the selected
	 * purchase order. If not extst then select the user's company address as a ship
	 * address.
	 */
	public long getShipAddrExist(String compId, String orderNo) {

		long cid = Long.parseLong(compId);
		int shipAddr = 0;
		try {
			StringBuffer query = new StringBuffer(
					"SELECT bi.shippingAddrId from BcaInvoice bi WHERE bi.company.companyId =:companyId and "
							+ "bi.invoiceStatus <> :invoiceStatus and bi.invoiceType.invoiceTypeId IN :invoiceTypeId and bi.ponum=:ponum");

			TypedQuery<Integer> typedQuery = this.entityManager.createQuery(query.toString(), Integer.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", cid);
			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceStatus", 1);
			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceTypeId", Arrays.asList(2));
			JpaHelper.addParameter(typedQuery, query.toString(), "ponum", Integer.parseInt(orderNo));

			shipAddr = typedQuery.getFirstResult();

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, "Error in  Class PurchaseOrderInfoDao and  method -shipAddr " + ee.toString());

		}
		return shipAddr;
	}

//	final public long getShipAddrExist(String compId, String orderNo) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
//		long cid = Integer.parseInt(compId);
//		long shipAddr = 0;
//		try {
//			String sql = "select ShippingAddrID from bca_invoice where PONum = ? and CompanyID = ? and not (invoiceStatus=1 ) and InvoiceTypeID in (2)";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, orderNo);
//			pstmt.setLong(2, cid);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				shipAddr = rs.getLong("ShippingAddrID");
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, "Error in  Class InvoiceInfo and  method -getTaxes " + ee.toString());
//
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
//		return shipAddr;
//	}

	/*
	 * Provides the invoice id from the provided purchase order number.
	 * 
	 */

	public Integer getInvoiceNo(String compId, String no) {
	    Integer invoiceID = null;
	    try {
	        long cid = Long.parseLong(compId);
	        int ponum = Integer.parseInt(no);

	        // Native SQL query
	        String sql = "SELECT InvoiceID FROM bca_invoice WHERE CompanyID = ? AND invoiceStatus <> ? AND InvoiceTypeID IN (?) AND PONum = ?";

	        // Create native query
	        Query query = entityManager.createNativeQuery(sql);
	        query.setParameter(1, cid); // Parameters are 1-based in native queries
	        query.setParameter(2, 1);
	        query.setParameter(3, 2); // Assuming InvoiceTypeID is a single value here; adjust if it's more complex
	        query.setParameter(4, ponum);

	        // Execute the query and get the single result
	        invoiceID = (Integer) query.getSingleResult(); // Cast to Integer

	    } catch (NoResultException e) {
	        // Handle case where no result is found
	        System.out.println("No invoice found for the given criteria.");
	    } catch (NumberFormatException e) {
	        // Handle parsing errors
	        System.out.println("Number format exception: " + e.getMessage());
	    } catch (Exception e) {
	        // Handle other exceptions
	        e.printStackTrace();
	    }
	    return invoiceID;
	}
//	public int getInvoiceNo(String compId, String no) {
//		int invoiceID = 0;
//		long cid = Long.parseLong(compId);
//		try {
//
//			StringBuffer query = new StringBuffer(
//					"SELECT bi.invoiceId from BcaInvoice bi WHERE bi.company.companyId =:companyId and "
//							+ "bi.invoiceStatus <> :invoiceStatus and bi.invoiceType.invoiceTypeId IN :invoiceTypeId and bi.ponum=:ponum");
//
//			TypedQuery<Integer> typedQuery = this.entityManager.createQuery(query.toString(), Integer.class);
//			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", cid);
//			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceStatus", 1);
//			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceTypeId", Arrays.asList(2));
//			JpaHelper.addParameter(typedQuery, query.toString(), "ponum", Integer.parseInt(no));
//
//			invoiceID = typedQuery.getFirstResult();
//
//		} catch (Exception ee) {
//			ee.printStackTrace();
//			Loger.log("Exception" + ee.toString());
//
//		}
//		return invoiceID;
//	}

//	public int getInvoiceNo(String compId, String no) {
//		int invoiceID = 0;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		if (db == null)
//			return 0;
//		con = db.getConnection();
//		int cid = Integer.parseInt(compId);
//		if (con == null)
//			return 0;
//		try {
//			String sql = " select InvoiceID from bca_invoice where PONum =?"
//					+ " and CompanyID = ? and not (invoiceStatus=1 ) and InvoiceTypeID IN (2) ";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, no);
//			pstmt.setInt(2, cid);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				invoiceID = rs.getInt(1);
//			}
//
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//
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
//		return invoiceID;
//	}

	/*
	 * Saves the new purchase order & its related information to the database. Also
	 * it saves the items for the purchaseorder.
	 */
	public boolean Save(String compId, PurchaseOrderDto form) {
		Long cid = Long.parseLong(compId);
		int invoiceID = 0;
		boolean status = false;
		try {
			BcaInvoice invoice = new BcaInvoice();
			invoice.setOrderNum(0);
			invoice.setSonum(0);
			invoice.setRcvNum(0);
			invoice.setEstNum(0);
			invoice.setPonum(Integer.parseInt(form.getOrderNo()));
			invoice.setRefNum("0");
			invoice.setIsPaymentCompleted(false);
			if (null != form.getCustID()) {
				Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository
						.findById(Integer.parseInt(form.getCustID()));
				if (clientVendor.isPresent())
					invoice.setClientVendor(clientVendor.get());
			} // form.getCustID()
			invoice.setBsaddressId(Integer.parseInt(form.getBillAddrValue().isEmpty() ? "0" : form.getBillAddrValue()));
			Optional<BcaInvoicestyle> invoiceStyle = bcaInvoicestyleRepository
					.findById(Integer.parseInt(form.getInvoiceStyle()));
			if (invoiceStyle.isPresent())
				invoice.setInvoiceStyle(invoiceStyle.get());
			Optional<BcaInvoicetype> invoiceType = bcaInvoicetypeRepository.findById(2);
			if (invoiceType.isPresent())
				invoice.setInvoiceType(invoiceType.get());// 2
			Optional<BcaCompany> company = bcaCompanyRepository.findById(cid);
			if (company.isPresent())
				invoice.setCompany(company.get());
			invoice.setTotal(form.getTotal());
			invoice.setAdjustedTotal(form.getTotal());
			invoice.setPaidAmount(0D);
			invoice.setDeleted(0);
			invoice.setBalance(form.getTotal());
			if (null != form.getVia()) {
				Optional<BcaShipcarrier> shipCarrier = bcaShipcarrierRepository
						.findById(Integer.parseInt(form.getVia()));
				if (shipCarrier.isPresent())
					invoice.setShipCarrier(shipCarrier.get());// form.getVia()
				invoice.setSalesRepId(-1);
			}
			if ("0".equals(form.getMessage())) {
				invoice.setMessage(null);
			} else {
				if (null != form.getMessage()) {
					Optional<BcaMessage> message = bcaMessageRepository.findById(Integer.parseInt(form.getMessage()));
					if (message.isPresent())
						invoice.setMessage(message.get());// "0".equals(form.getMessage()) ? null :
				}
			}
			if (null != form.getTerm()) {
				Optional<BcaTerm> term = bcaTermRepository.findById(Integer.parseInt(form.getTerm()));
				if (term.isPresent())
					invoice.setTerm(term.get());
			} // form.getTerm(
			if ("0".equals(form.getPayMethod())) {
				invoice.setPaymentType(null);
			} else {
				if (null != form.getPayMethod()) {
					Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository
							.findById(Integer.parseInt(form.getPayMethod()));
					if (paymentType.isPresent())
						invoice.setPaymentType(paymentType.get());// "0".equals(form.getPayMethod()) ? null :
																	// form.getPayMethod()
				}
			}
			if (null != form.getTaxID()) {
				Optional<BcaSalestax> salesTax = bcaSalestaxRepository.findById(Integer.parseInt(form.getTaxID()));
				if (salesTax.isPresent())
					invoice.setSalesTax(salesTax.get());// form.getTaxID()
			}
			String tax = form.getTaxable();
			if (tax != null && tax.equals("on")) {
				invoice.setTaxable(1);
			} else {
				invoice.setTaxable(0);
			}
			invoice.setMemo(form.getMemo());
			invoice.setVendorAddrId(
					Integer.parseInt(form.getBillAddrValue().isEmpty() ? "0" : form.getBillAddrValue()));
			//invoice.setShippingAddrId(Integer.parseInt(form.getShipAddr()));
			Date dateAdded = (form.getOrderDate().equals("")) ? customerInfo.string2date("now()")
					: customerInfo.string2date(form.getOrderDate());
			invoice.setDateAdded(DateHelper.convertDateToOffsetDateTime(dateAdded));
			invoice.setInvoiceStatus(0);
			invoice.setBillingAddrId(Integer.parseInt(form.getBsAddressID()));
			invoice.setShippingAddrId(Integer.parseInt(form.getShAddressID()));
			invoice.setWeight(form.getWeight());
			invoice.setSubTotal(form.getSubtotal());
			invoice.setTax(form.getTax());
			invoice.setSh(form.getShipping());
			try {
				BcaInvoice bcaInvoice = bcaInvoiceRepository.save(invoice);
				invoiceID=bcaInvoice.getInvoiceId();
				bcaCartRepository.deleteByInvoice_InvoiceIdAndCompany_CompanyId(invoiceID, cid);
				AddItem(invoiceID, cid, form);
				status = true;
			} catch (IllegalArgumentException iae) {
				iae.printStackTrace();
				Loger.log("IllegalArgumentException" + iae.toString());
			}

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log("Exception" + ee.toString());

		}
		return status;
	}

//	public boolean Save(String compId, PurchaseOrderDto form) {
//		CustomerInfo cinfo = new CustomerInfo();
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null, pstmt2 = null, pstmt1 = null, pstmt3 = null;
//		int cid = Integer.parseInt(compId);
//		int invoiceID = 0;
//		boolean status = false;
//		try {
//			pstmt = con.prepareStatement("SELECT MAX(InvoiceID) FROM bca_invoice");
//			rs = pstmt.executeQuery();
//			/* Insert into invoice */
//			if (rs.next()) {
//				invoiceID = rs.getInt(1) + 1;
//				pstmt2 = con.prepareStatement("INSERT INTO bca_invoice (InvoiceID) values (?)");
//				pstmt2.setInt(1, invoiceID);
//				pstmt2.executeUpdate();
//				pstmt2.close();
//
//				String updateStr = "UPDATE bca_invoice SET OrderNum=?, PONum=?, RefNum=?, ClientVendorID=?, BSAddressID=?, InvoiceStyleID=?, InvoiceTypeID=?, "
//						+ "CompanyID=?, Total=?, AdjustedTotal=?, PaidAmount=?, Balance=?, ShipCarrierID=?, SalesRepID=?, MessageID=?, TermID=?, PaymentTypeID=?, "
//						+ "SalesTaxID=?, Taxable=?, Memo=?, VendorAddrID=?, ShippingAddrID=?, DateAdded=?, invoiceStatus=? WHERE InvoiceID = ? ";
//				pstmt1 = con.prepareStatement(updateStr);
//				pstmt1.setInt(1, 0);
//				pstmt1.setString(2, form.getOrderNo());
//				pstmt1.setString(3, "");
//
//				pstmt1.setString(4, form.getCustID());
//				pstmt1.setInt(5, Integer.parseInt(form.getBillAddrValue().isEmpty() ? "0" : form.getBillAddrValue()));
//				pstmt1.setString(6, form.getInvoiceStyle());
//				pstmt1.setInt(7, 2);
//
//				pstmt1.setString(8, compId);
//				pstmt1.setDouble(9, form.getTotal());
//				pstmt1.setDouble(10, form.getTotal());
//				pstmt1.setDouble(11, 0);
//				pstmt1.setDouble(12, form.getTotal());
//				pstmt1.setString(13, form.getVia());
//				pstmt1.setInt(14, -1);
////				pstmt1.setString(15, form.getMessage());
//				pstmt1.setString(15, "0".equals(form.getMessage()) ? null : form.getMessage());
//				pstmt1.setString(16, form.getTerm());
////				pstmt1.setString(17, form.getPayMethod());
//				pstmt1.setString(17, "0".equals(form.getPayMethod()) ? null : form.getPayMethod());
//				pstmt1.setString(18, form.getTaxID());
//
//				String tax = form.getTaxable();
//				if (tax != null && tax.equals("on")) {
//					pstmt1.setInt(19, 1);
//				} else {
//					pstmt1.setInt(19, 0);
//				}
//				pstmt1.setString(20, form.getMemo());
//				pstmt1.setInt(21, Integer.parseInt(form.getBillAddrValue().isEmpty() ? "0" : form.getBillAddrValue()));
//				pstmt1.setString(22, form.getShipAddr());
//				pstmt1.setDate(23, (form.getOrderDate().equals("")) ? cinfo.string2date("now()")
//						: cinfo.string2date(form.getOrderDate()));
//				pstmt1.setInt(24, 0);
//				pstmt1.setInt(25, invoiceID);
//
//				int rows = pstmt1.executeUpdate();
//				if (rows > 0) {
//					/* Delete Item from Cart */
//					pstmt3 = con.prepareStatement(
//							"DELETE FROM bca_cart WHERE InvoiceID=" + invoiceID + " and CompanyID=" + compId);
//					pstmt3.executeUpdate();
//					/* Add Item to Cart */
//					AddItem(invoiceID, cid, form);
//					status = true;
//				}
//			}
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//
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
//				if (pstmt2 != null) {
//					db.close(pstmt2);
//				}
//				if (pstmt3 != null) {
//					db.close(pstmt3);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return status;
//	}

	/*
	 * Updates the selected purchase order & its related information to the
	 * database. Also it updates the items for the purchase order.
	 */

	public void Update(String compId, PurchaseOrderDto form, int invoiceID) {

		int cid = Integer.parseInt(compId);
		try {

			BcaInvoice invoice = bcaInvoiceRepository.findById(invoiceID)
					.orElseThrow(() -> new EntityNotFoundException("Invoice not found"));
			invoice.setOrderNum(0);
			invoice.setPonum(Integer.parseInt(form.getOrderNo()));
			invoice.setRefNum("");
			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository
					.findById(Integer.parseInt(form.getCustID()));
			if (clientVendor.isPresent())
				invoice.setClientVendor(clientVendor.get()); // form.getCustID()
			invoice.setBsaddressId(Integer.parseInt(form.getBsAddressID()));
			Optional<BcaInvoicestyle> invoiceStyle = bcaInvoicestyleRepository
					.findById(Integer.parseInt(form.getInvoiceStyle()));
			if (invoiceStyle.isPresent())
				invoice.setInvoiceStyle(invoiceStyle.get());
			Optional<BcaInvoicetype> invoicetype = bcaInvoicetypeRepository.findById(2);
			if (invoicetype.isPresent())
				invoice.setInvoiceType(invoicetype.get());

			Optional<BcaCompany> company = bcaCompanyRepository.findById(Long.parseLong(compId));
			if (company.isPresent())
				invoice.setCompany(company.get());
			invoice.setTotal(form.getTotal());
			invoice.setAdjustedTotal(form.getTotal());
			invoice.setPaidAmount(0D);
			invoice.setBalance(form.getTotal());
			Optional<BcaShipcarrier> shipcarrier = bcaShipcarrierRepository.findById(Integer.parseInt(form.getVia()));
			if (shipcarrier.isPresent())
				invoice.setShipCarrier(shipcarrier.get());
			invoice.setSalesRepId(-1);
			Optional<BcaMessage> message = bcaMessageRepository.findById(Integer.parseInt(form.getMessage()));
			if (message.isPresent())
				invoice.setMessage(message.get());

			Optional<BcaTerm> term = bcaTermRepository.findById(Integer.parseInt(form.getTerm()));
			if (term.isPresent())
				invoice.setTerm(term.get());
			Optional<BcaPaymenttype> bcaPaymenttype = bcaPaymenttypeRepository
					.findById(Integer.parseInt(form.getPayMethod()));
			if (bcaPaymenttype.isPresent())
				invoice.setPaymentType(bcaPaymenttype.get());
			invoice.setSalesTax(null);
			String tax = form.getTaxable();
			if (tax != null && tax.equals("on")) {
				invoice.setTaxable(1);
			} else {
				invoice.setTaxable(0);
			}
			invoice.setMemo(form.getMemo());
			invoice.setShippingAddrId(Integer.parseInt(form.getShipAddr()));
			Date dated = (form.getOrderDate().equals("")) ? customerInfo.string2date("now()")
					: customerInfo.string2date(form.getOrderDate());
			invoice.setDateAdded(DateHelper.convertDateToOffsetDateTime(dated));
			invoice.setInvoiceStatus(0);
			try {
				bcaInvoiceRepository.save(invoice);
				Map<Integer, Integer> oldInvData = new HashMap<>();
				List<BcaCart> bcaCarts = bcaCartRepository.findByInvoiceIdAndCompanyId(invoiceID,
						Long.parseLong(compId));
				if (bcaCarts.size() > 0) {
					BcaCart bcaCart = bcaCarts.get(0);
					oldInvData.put(bcaCart.getInventory().getInventoryId(), bcaCart.getQty());
				}
				bcaCartRepository.deleteByInvoice_InvoiceIdAndCompany_CompanyId(invoiceID, Long.parseLong(compId));
				for (Integer key : oldInvData.keySet()) {
					Optional<BcaIteminventory> itemInventory = bcaIteminventoryRepository.findById(key);
					if (itemInventory.isPresent()) {
						BcaIteminventory item = itemInventory.get();
						int expectedQty = item.getExpectedQty();
						item.setExpectedQty(expectedQty - oldInvData.get(key));
						bcaIteminventoryRepository.save(item);
					}
				}

				/* Add Item to Cart */
				AddItem(invoiceID, cid, form);

			} catch (IllegalArgumentException iae) {
				iae.printStackTrace();
				Loger.log("Exception" + iae.toString());
			}

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log("Exception" + ee.toString());

		}
	}
//	public void Update(String compId, PurchaseOrderDto form, int invoiceID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt1 = null, pstmt2 = null, pstmt3 = null, pstmt4 = null;
//		CustomerInfo cinfo = new CustomerInfo();
//		int cid = Integer.parseInt(compId);
//		try {
//			
//			
//			String updateStr = "update bca_invoice set  OrderNum =?, PONum = ? ,RefNum = ? ,ClientVendorID = ? ,"
//					+ "BSAddressID = ? ,InvoiceStyleID = ?    ,InvoiceTypeID = ?  ,CompanyID = ?   ,"
//					+ "Total = ? ,AdjustedTotal =?    ,PaidAmount = ?    ,Balance = ? ,ShipCarrierID = ? ,"
//					+ "SalesRepID = ? ,MessageID = ?    ,TermID = ?    ,PaymentTypeID = ? ,"
//					+ "SalesTaxID = ?    ,Taxable = ?, Memo = ?, "
//					+ "DateAdded = ?  ,invoiceStatus = ? ,ShippingAddrID = ?  where InvoiceID = ? ";
//			pstmt1 = con.prepareStatement(updateStr);
//			pstmt1.setInt(1, 0);
//			pstmt1.setString(2, form.getOrderNo());
//			pstmt1.setString(3, "");
//
//			pstmt1.setString(4, form.getCustID());
//			// pstmt1.setString(5, form.getBillAddrValue());
//			pstmt1.setString(5, form.getBsAddressID());
//			pstmt1.setString(6, form.getInvoiceStyle());
//			pstmt1.setInt(7, 2); // purches Order
//
//			pstmt1.setString(8, compId);
//			pstmt1.setDouble(9, form.getTotal());
//			pstmt1.setDouble(10, form.getTotal());
//			pstmt1.setDouble(11, 0);
//			pstmt1.setDouble(12, form.getTotal());
//			pstmt1.setString(13, form.getVia());
//			pstmt1.setInt(14, -1);
//			pstmt1.setString(15, form.getMessage());
//			pstmt1.setString(16, form.getTerm());
//			pstmt1.setString(17, form.getPayMethod());
//			pstmt1.setInt(18, -1);
//
//			String tax = form.getTaxable();
//			if (tax != null && tax.equals("on")) {
//				pstmt1.setInt(19, 1);
//			} else {
//				pstmt1.setInt(19, 0);
//			}
//			pstmt1.setString(20, form.getMemo());
//			pstmt1.setDate(21, (form.getOrderDate().equals("")) ? cinfo.string2date("now()")
//					: cinfo.string2date(form.getOrderDate()));
//			pstmt1.setInt(22, 0);
//			pstmt1.setString(23, form.getShipAddr());
//			pstmt1.setInt(24, invoiceID);
//
//			int rows = pstmt1.executeUpdate();
//			if (rows > 0) {
//				Map<Integer, Integer> oldInvData = new HashMap<>();
//				pstmt2 = con.prepareStatement(
//						"SELECT * FROM bca_cart WHERE InvoiceID = " + invoiceID + " and CompanyID = " + cid);
//				rs = pstmt2.executeQuery();
//				if (rs.next()) {
//					oldInvData.put(rs.getInt("InventoryID"), rs.getInt("Qty"));
//				}
//				/* Delete Item from Cart */
//				pstmt3 = con.prepareStatement(
//						"DELETE FROM bca_cart WHERE InvoiceID = " + invoiceID + " and CompanyID=" + cid);
//				int updatedRows = pstmt3.executeUpdate();
//				if (updatedRows > 0) {
//					con.setAutoCommit(false);
//					pstmt4 = con.prepareStatement(
//							"UPDATE bca_iteminventory SET ExpectedQty=ExpectedQty-? WHERE InventoryID=?");
//					for (Integer key : oldInvData.keySet()) {
//						pstmt4.setInt(1, oldInvData.get(key));
//						pstmt4.setInt(2, key);
//						pstmt4.addBatch();
//					}
//					pstmt4.executeBatch();
//					con.commit();
//				}
//				/* Add Item to Cart */
//				AddItem(invoiceID, cid, form);
//			}
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
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
//					db.close(pstmt3);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//	}

	@Transactional
	public void SaveUpdate(String compId, PurchaseOrderDto form, int invoiceID) {
		Long cid = Long.parseLong(compId);
		try {

			BcaInvoice invoice = bcaInvoiceRepository.findById(invoiceID)
					.orElseThrow(() -> new EntityNotFoundException("Invoice not found"));
			invoice.setOrderNum(0);
			invoice.setPonum(Integer.parseInt(form.getOrderNo()));
			invoice.setRefNum("");
			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository
					.findById(Integer.parseInt(form.getCustID()));
			if (clientVendor.isPresent())
				invoice.setClientVendor(clientVendor.get()); // form.getCustID()
			invoice.setBsaddressId(Integer.parseInt(form.getBillAddrValue()));
			invoice.setBillingAddrId(Integer.parseInt(form.getBsAddressID()));
			invoice.setShippingAddrId(Integer.parseInt(form.getShAddressID()));
			Optional<BcaInvoicestyle> invoiceStyle = bcaInvoicestyleRepository
					.findById(Integer.parseInt(form.getInvoiceStyle()));
			if (invoiceStyle.isPresent())
				invoice.setInvoiceStyle(invoiceStyle.get());
			Optional<BcaInvoicetype> invoicetype = bcaInvoicetypeRepository.findById(2);
			if (invoicetype.isPresent())
				invoice.setInvoiceType(invoicetype.get());

			Optional<BcaCompany> company = bcaCompanyRepository.findById(Long.parseLong(compId));
			if (company.isPresent())
				invoice.setCompany(company.get());
			invoice.setTotal(form.getTotal());
			invoice.setAdjustedTotal(form.getTotal());
			invoice.setPaidAmount(0D);
			invoice.setBalance(form.getTotal());
			Optional<BcaShipcarrier> shipcarrier = bcaShipcarrierRepository.findById(Integer.parseInt(form.getVia()));
			if (shipcarrier.isPresent())
				invoice.setShipCarrier(shipcarrier.get());
			invoice.setSalesRepId(-1);
			Optional<BcaMessage> message = bcaMessageRepository.findById(Integer.parseInt(form.getMessage()));
			if (message.isPresent())
				invoice.setMessage(message.get());

			Optional<BcaTerm> term = bcaTermRepository.findById(Integer.parseInt(form.getTerm()));
			if (term.isPresent())
				invoice.setTerm(term.get());
			Optional<BcaPaymenttype> bcaPaymenttype = bcaPaymenttypeRepository
					.findById(Integer.parseInt(form.getPayMethod()));
			if (bcaPaymenttype.isPresent())
				invoice.setPaymentType(bcaPaymenttype.get());
			invoice.setSalesTax(null);
			String tax = form.getTaxable();
			if (tax != null && tax.equals("on")) {
				invoice.setTaxable(1);
			} else {
				invoice.setTaxable(0);
			}
			invoice.setMemo(form.getMemo());
			invoice.setShippingAddrId(Integer.parseInt(form.getShipAddr()));
			Date dated = (form.getOrderDate().equals("")) ? customerInfo.string2date("now()")
					: customerInfo.string2date(form.getOrderDate());
			invoice.setDateAdded(DateHelper.convertDateToOffsetDateTime(dated));
			invoice.setInvoiceStatus(0);
			try {
				bcaInvoiceRepository.save(invoice);
				Map<Integer, Integer> oldInvData = new HashMap<>();
				List<BcaCart> bcaCarts = bcaCartRepository.findByInvoiceIdAndCompanyId(invoiceID,
						Long.parseLong(compId));
				if (bcaCarts.size() > 0) {
					BcaCart bcaCart = bcaCarts.get(0);
					oldInvData.put(bcaCart.getInventory().getInventoryId(), bcaCart.getQty());
				}
				bcaCartRepository.deleteByInvoice_InvoiceIdAndCompany_CompanyId(invoiceID, Long.parseLong(compId));
				for (Integer key : oldInvData.keySet()) {
					Optional<BcaIteminventory> itemInventory = bcaIteminventoryRepository.findById(key);
					if (itemInventory.isPresent()) {
						BcaIteminventory item = itemInventory.get();
						int expectedQty = item.getExpectedQty();
						item.setExpectedQty(expectedQty - oldInvData.get(key));
						bcaIteminventoryRepository.save(item);
					}
				}

				/* Add Item to Cart */
				AddItem(invoiceID, cid, form);

			} catch (IllegalArgumentException iae) {
				iae.printStackTrace();
				Loger.log("Exception" + iae.toString());
			}

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log("Exception" + ee.toString());

		}
	}

//	public void SaveUpdate(String compId, PurchaseOrderDto form, int invoiceID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt1 = null, pstmt2 = null, pstmt3 = null, pstmt4 = null;
//		CustomerInfo cinfo = new CustomerInfo();
//		int cid = Integer.parseInt(compId);
//		try {
//			String updateStr = "UPDATE bca_invoice SET OrderNum=?, PONum=?, RefNum=?, ClientVendorID=?, BSAddressID=?, InvoiceStyleID=?, "
//					+ "InvoiceTypeID=?, CompanyID=?, Total=?, AdjustedTotal=?, PaidAmount=?, Balance=?, ShipCarrierID=?, SalesRepID=?, MessageID=?, "
//					+ "TermID=?, PaymentTypeID=?, SalesTaxID=?, Taxable=?, Memo=?, ShippingAddrID=?, DateAdded=?, invoiceStatus=? WHERE InvoiceID=?";
//			pstmt1 = con.prepareStatement(updateStr);
//			pstmt1.setInt(1, 0);
//			pstmt1.setString(2, form.getOrderNo());
//			pstmt1.setString(3, "");
//
//			pstmt1.setString(4, form.getCustID());
//			pstmt1.setString(5, form.getBillAddrValue());
//			pstmt1.setString(6, form.getInvoiceStyle());
//			pstmt1.setInt(7, 2);
//
//			pstmt1.setString(8, compId);
//			pstmt1.setDouble(9, form.getTotal());
//			pstmt1.setDouble(10, form.getTotal());
//			pstmt1.setDouble(11, 0);
//			pstmt1.setDouble(12, form.getTotal());
//			pstmt1.setString(13, form.getVia());
//			pstmt1.setInt(14, -1);
//			pstmt1.setString(15, form.getMessage());
//			pstmt1.setString(16, form.getTerm());
//			pstmt1.setString(17, form.getPayMethod());
//			pstmt1.setInt(18, -1);
//
//			String tax = form.getTaxable();
//			if (tax != null && tax.equals("on")) {
//				pstmt1.setInt(19, 1);
//			} else {
//				pstmt1.setInt(19, 0);
//			}
//			pstmt1.setString(20, form.getMemo());
//			pstmt1.setString(21, form.getShipAddr());
//			pstmt1.setDate(22, (form.getOrderDate().equals("")) ? cinfo.string2date("now()")
//					: cinfo.string2date(form.getOrderDate()));
//			pstmt1.setInt(23, 0);
//			pstmt1.setInt(24, invoiceID);
//
//			int rows = pstmt1.executeUpdate();
//			if (rows > 0) {
//				Map<Integer, Integer> oldInvData = new HashMap<>();
//				pstmt2 = con.prepareStatement(
//						"SELECT * FROM bca_cart WHERE InvoiceID = " + invoiceID + " and CompanyID = " + cid);
//				rs = pstmt2.executeQuery();
//				if (rs.next()) {
//					oldInvData.put(rs.getInt("InventoryID"), rs.getInt("Qty"));
//				}
//				/* Delete Item from Cart */
//				pstmt3 = con.prepareStatement(
//						"DELETE FROM bca_cart WHERE InvoiceID = " + invoiceID + " and CompanyID=" + cid);
//				int updatedRows = pstmt3.executeUpdate();
//				if (updatedRows > 0) {
//					con.setAutoCommit(false);
//					pstmt4 = con.prepareStatement(
//							"UPDATE bca_iteminventory SET ExpectedQty=ExpectedQty-? WHERE InventoryID=?");
//					for (Integer key : oldInvData.keySet()) {
//						pstmt4.setInt(1, oldInvData.get(key));
//						pstmt4.setInt(2, key);
//						pstmt4.addBatch();
//					}
//					pstmt4.executeBatch();
//					con.commit();
//				}
//				/* Add Item to Cart */
//				AddItem(invoiceID, cid, form);
//			}
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
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
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//	}

	/*
	 * Add the item to the database for the purticular purchase order.
	 */

	public void AddItem(int invoiceID, long cid, PurchaseOrderDto form) {

		if (form.getItem() == null || form.getItem().isEmpty())
			return;
		String invIDs[] = form.getItem().split(";");
		String invCodes[] = form.getCode().split(";");
		String invNames[] = form.getDesc().split(";");
		String invQtys[] = form.getQty().split(";");
		String invUWeights[] = form.getUnitWeight().split(";");
		String invUPrices[] = form.getUprice().split(";");
		String invIsTaxables[] = form.getIsTaxable().split(";");
		String invItemIDs[] = form.getItemTypeID().split(";");
		String invItemOrders[] = form.getItemOrder().split(";");
		try {
			for (int i = 0; i < form.getSize(); i++) {
				int inventoryID = Integer.parseInt(invIDs[i]);
				String itemCode = invCodes[i];
				String itemName = invNames[i];
				String qty = invQtys[i] != null && invQtys[i].length() > 0 ? invQtys[i] : "0";
				String uweight = invUWeights[i] != null && invUWeights[i].length() > 0 ? invUWeights[i] : "0.0";
				String uprice = invUPrices[i] != null && invUPrices[i].length() > 0 ? invUPrices[i] : "0.0";
				String taxable = invIsTaxables[i] != null && invIsTaxables[i].length() > 0 ? invIsTaxables[i] : "0";
				String itmTypeID = invItemIDs[i] != null && invItemIDs[i].length() > 0 ? invItemIDs[i] : "0";
				String itmOrder = invItemOrders[i];
				BcaCart bcaCart = new BcaCart();
				Optional<BcaIteminventory> itemInventory = bcaIteminventoryRepository.findById(inventoryID);
				if (itemInventory.isPresent())
					bcaCart.setInventory(itemInventory.get());
				
				Optional<BcaCompany> company = bcaCompanyRepository.findById(cid);
				if (company.isPresent())
					bcaCart.setCompany(company.get());
				
				Optional<BcaInvoice> invoice = bcaInvoiceRepository.findById(invoiceID);
				if (invoice.isPresent())
					bcaCart.setInvoice(invoice.get());
				
				bcaCart.setInventoryCode(itemCode);
				bcaCart.setInventoryName(itemName);
				bcaCart.setQty(Integer.parseInt(qty));
				bcaCart.setUnitWeight(Double.parseDouble(uweight));
				bcaCart.setWeight(0.0);
				bcaCart.setUnitPrice(Double.parseDouble(truncate(uprice)));
				bcaCart.setTaxable(Integer.parseInt(taxable));
				bcaCart.setItemTypeId(Integer.parseInt(itmTypeID));
				bcaCart.setItemOrder(Integer.parseInt(itmOrder));
				Date dateAdded = new Date();
				bcaCart.setDateAdded(DateHelper.convertDateToOffsetDateTime(dateAdded));
				
				
				BcaCart cartSave = bcaCartRepository.save(bcaCart);
//				if (null != cartSave) {
//					BcaIteminventory itemInventory = bcaIteminventoryRepository.findById(inventoryID)
//							.orElseThrow(() -> new EntityNotFoundException("Entity Not FOund"));
//					int expectedQty = itemInventory.getExpectedQty() + Integer.parseInt(qty);
//					itemInventory.setExpectedQty(expectedQty);
//					bcaIteminventoryRepository.save(itemInventory);
//				}
				if (null != cartSave) {
					Optional<BcaIteminventory> inventory = bcaIteminventoryRepository.findById(inventoryID);
					if (itemInventory.isPresent()) {
						BcaIteminventory item = inventory.get();
						int expectedQty = item.getExpectedQty();
						item.setExpectedQty(expectedQty + Integer.parseInt(qty));
						bcaIteminventoryRepository.save(item);
					}
				}

			}
		} catch (Exception ee) {
			Loger.log("Exception" + ee.toString());

		}
	}

//	public void AddItem(int invoiceID, int cid, PurchaseOrderDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null, pstmt2 = null;
//
//		if (form.getItem() == null || form.getItem().isEmpty())
//			return;
//		String invIDs[] = form.getItem().split(";");
//		String invCodes[] = form.getCode().split(";");
//		String invNames[] = form.getDesc().split(";");
//		String invQtys[] = form.getQty().split(";");
//		String invUWeights[] = form.getUnitWeight().split(";");
//		String invUPrices[] = form.getUprice().split(";");
//		String invIsTaxables[] = form.getIsTaxable().split(";");
//		String invItemIDs[] = form.getItemTypeID().split(";");
//		String invItemOrders[] = form.getItemOrder().split(";");
//		try {
//			for (int i = 0; i < form.getSize(); i++) {
//				int inventoryID = Integer.parseInt(invIDs[i]);
//				String itemCode = invCodes[i];
//				String itemName = invNames[i];
//				String qty = invQtys[i] != null && invQtys[i].length() > 0 ? invQtys[i] : "0";
//				String uweight = invUWeights[i] != null && invUWeights[i].length() > 0 ? invUWeights[i] : "0.0";
//				String uprice = invUPrices[i] != null && invUPrices[i].length() > 0 ? invUPrices[i] : "0.0";
//				String taxable = invIsTaxables[i] != null && invIsTaxables[i].length() > 0 ? invIsTaxables[i] : "0";
//				String itmTypeID = invItemIDs[i] != null && invItemIDs[i].length() > 0 ? invItemIDs[i] : "0";
//				String itmOrder = invItemOrders[i];
//
//				pstmt2 = con.prepareStatement("SELECT MAX(CartID) FROM bca_cart");
//				rs = pstmt2.executeQuery();
//				/* Insert into invoice */
//				if (rs.next()) {
//					int cartID = rs.getInt(1) + 1;
//					String insertItem = "INSERT INTO bca_cart (InventoryID,InvoiceID,CompanyID,InventoryCode,InventoryName,Qty,"
//							+ " UnitWeight,Weight,UnitPrice,Taxable,ItemTypeID,ItemOrder,CartID)"
//							+ " VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?,? )";
//					pstmt = con.prepareStatement(insertItem);
//					pstmt.setInt(1, inventoryID);
//					pstmt.setInt(2, invoiceID);
//					pstmt.setInt(3, cid);
//					pstmt.setString(4, itemCode);
//					pstmt.setString(5, itemName);
//					pstmt.setInt(6, Integer.parseInt(qty));
//					pstmt.setDouble(7, Double.parseDouble(uweight));
//					pstmt.setDouble(8, 0.0);
//					pstmt.setDouble(9, Double.parseDouble(truncate(uprice)));
//					pstmt.setInt(10, Integer.parseInt(taxable));
//					pstmt.setInt(11, Integer.parseInt(itmTypeID));
//					pstmt.setInt(12, Integer.parseInt(itmOrder));
//					pstmt.setInt(13, cartID);
//					int updatedRows = pstmt.executeUpdate();
//					if (updatedRows > 0) {
//						pstmt = con.prepareStatement(
//								"UPDATE bca_iteminventory SET ExpectedQty=ExpectedQty+? WHERE InventoryID=?");
//						pstmt.setInt(1, Integer.parseInt(qty));
//						pstmt.setInt(2, inventoryID);
//						updatedRows = pstmt.executeUpdate();
//					}
//				}
//			}
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
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
//	}

	/*
	 * The method is used to truncate the precision number more than 2.
	 */
	public String truncate(String num) {
		String string1 = null;
		int seperation = 0;
		string1 = "" + num;
		if (string1.indexOf(".") == -1)
			return (string1 + ".00");
		seperation = string1.length() - string1.indexOf('.');
		if (seperation > 3)
			return string1.substring(0, string1.length() - seperation + 3);
		else if (seperation == 2)
			return string1 + '0';
		return string1;
	}

	public Long getPONumberByBtnName(String compId, HttpServletRequest request) {

		Long orderNo = null;
		try {
			List<Long> orderNumbers = new ArrayList<>();
			String action = request.getParameter("tabid");
			Long prevPONo = (Long) request.getSession().getAttribute("prevPONo");
			prevPONo = prevPONo != null ? prevPONo : 0l;
			StringBuffer query = new StringBuffer(
					"select bi.ponum from BcaInvoice bi where bi.company.companyId =:companyId "
							+ "and bi.invoiceStatus = 0 and bi.invoiceType.invoiceTypeId = 2 and bi.ponum >0 order by bi.ponum ");

			if (action.equalsIgnoreCase("PreviousPurchaseOrder")) {

				query.append(" desc");
			} else {

				query.append(" asc");
			}
			TypedQuery<Integer> typedQuery = this.entityManager.createQuery(query.toString(), Integer.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.parseLong(compId));
			List<Integer> ponumList = typedQuery.getResultList();
			ponumList.stream().forEach(ponum -> orderNumbers.add((long) ponum));

			if (!orderNumbers.isEmpty()) {
				Long firstOrderNo = orderNumbers.get(0);
				Long lastOrderNo = orderNumbers.get(orderNumbers.size() - 1);
				orderNo = firstOrderNo;
				if (action.equalsIgnoreCase("FirstPurchaseOrder")) {
					orderNo = firstOrderNo;
				} else if (action.equalsIgnoreCase("LastPurchaseOrder")) {
					orderNo = lastOrderNo;
				} else if (action.equalsIgnoreCase("NextPurchaseOrder")) {
					if (prevPONo == lastOrderNo) {
						orderNo = prevPONo;
					} else {
						for (Long currOdrNo : orderNumbers) {
							if (currOdrNo > prevPONo) {
								orderNo = currOdrNo;
								break;
							}
						}
					}
				} else if (action.equalsIgnoreCase("PreviousPurchaseOrder")) {
					if (prevPONo == lastOrderNo) {
						orderNo = lastOrderNo;
					} else {
						for (Long currOdrNo : orderNumbers) {
							if (currOdrNo < prevPONo) {
								orderNo = currOdrNo;
								break;
							}
						}
					}
				}
				request.getSession().setAttribute("prevPONo", orderNo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			Loger.log("Exception in getPONumberByBtnName Function " + ex.toString());

		}
		return orderNo;
	}
//	public Long getPONumberByBtnName(String compId, HttpServletRequest request) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
//		Long orderNo = null;
//		try {
//			List<Long> orderNumbers = new ArrayList<>();
//			String action = request.getParameter("tabid");
//			Long prevPONo = (Long) request.getSession().getAttribute("prevPONo");
//			prevPONo = prevPONo != null ? prevPONo : 0l;
//			String sql = "SELECT PONum FROM bca_invoice WHERE CompanyID=? AND invoiceStatus=0 AND InvoiceTypeID=2 AND PONum>0 ORDER BY PONum ";
//			if (action.equalsIgnoreCase("PreviousPurchaseOrder")) {
//				sql = sql + "DESC";
//			} else {
//				sql = sql + "ASC";
//			}
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, compId);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				orderNumbers.add(rs.getLong("PONum"));
//			}
//			if (!orderNumbers.isEmpty()) {
//				Long firstOrderNo = orderNumbers.get(0);
//				Long lastOrderNo = orderNumbers.get(orderNumbers.size() - 1);
//				orderNo = firstOrderNo;
//				if (action.equalsIgnoreCase("FirstPurchaseOrder")) {
//					orderNo = firstOrderNo;
//				} else if (action.equalsIgnoreCase("LastPurchaseOrder")) {
//					orderNo = lastOrderNo;
//				} else if (action.equalsIgnoreCase("NextPurchaseOrder")) {
//					if (prevPONo == lastOrderNo) {
//						orderNo = prevPONo;
//					} else {
//						for (Long currOdrNo : orderNumbers) {
//							if (currOdrNo > prevPONo) {
//								orderNo = currOdrNo;
//								break;
//							}
//						}
//					}
//				} else if (action.equalsIgnoreCase("PreviousPurchaseOrder")) {
//					if (prevPONo == lastOrderNo) {
//						orderNo = lastOrderNo;
//					} else {
//						for (Long currOdrNo : orderNumbers) {
//							if (currOdrNo < prevPONo) {
//								orderNo = currOdrNo;
//								break;
//							}
//						}
//					}
//				}
//				request.getSession().setAttribute("prevPONo", orderNo);
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in getPONumberByBtnName Function " + ex.toString());
//			ex.printStackTrace();
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
//		return orderNo;
//	}

	/**
	 * @author: Sarfraz-Malik
	 * @return
	 */
	public List<String> getCustomerPONums(String custID, String compId) {

		List<String> poNums = new ArrayList<>();
		try {
			List<BcaInvoice> bcaInvoice = bcaInvoiceRepository
					.findByCompanyIdAndClientVendorIdAndInvoiceStatusNotAndInvoiceTypeIdAndPonumLessThan(
							Long.parseLong(compId), Integer.parseInt(custID), 1, 2, 0);
			for (BcaInvoice invoice : bcaInvoice) {
				poNums.add(String.valueOf(invoice.getPonum()));
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			Loger.log("Exception in getCustomerPONums Function " + ex.toString());
		}
		return poNums;
	}

//	public List<String> getCustomerPONums(String custID, String compId) {
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		List<String> poNums = new ArrayList<>();
//		try {
//			String sql = "SELECT PONum FROM bca_invoice WHERE ClientVendorID=? and CompanyID=? AND invoiceStatus<>1 AND InvoiceTypeID=2 AND PONum>0";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, custID);
//			pstmt.setString(2, compId);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				poNums.add(rs.getString("PONum"));
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in getCustomerPONums Function " + ex.toString());
//			ex.printStackTrace();
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
//		return poNums;
//	}

	public PurchaseOrderDto getRecordForPO(String compId, String poNo, PurchaseOrderDto form,
			HttpServletRequest request) throws Throwable{

		try {
			String query = "SELECT bi FROM BcaInvoice bi " + "LEFT JOIN bi.term t " + "LEFT JOIN bi.paymentType p "
					+ "LEFT JOIN bi.shipCarrier s " + "LEFT JOIN bi.message m " + "WHERE bi.ponum = :ponum "
					+ "AND bi.company.companyId = :companyId " + "AND bi.invoiceStatus <> :invoiceStatus "
					+ "AND bi.invoiceType.invoiceTypeId = :invoiceTypeId";

			BcaInvoice invoice = this.entityManager.createQuery(query.toString(), BcaInvoice.class)
					.setParameter("ponum", Integer.parseInt(poNo)).setParameter("companyId", Long.parseLong(compId))
					.setParameter("invoiceStatus", 1).setParameter("invoiceTypeId", 2).getSingleResult();

			// Separate query for BcaSalesrep
			BcaSalesrep salesRep = null;
			try {
				salesRep = bcaSalesrepRepository.findById(invoice.getSalesRepId()).orElseThrow(() -> {
					throw new IllegalStateException("account does not exist: " + invoice.getSalesRepId());
				});
			} catch (IllegalStateException exception) {
				Loger.log("Exception in getRecordForPO Function" + exception.toString());
			}

			int invoiceID = 0;
			String style = "";
			if (null != invoice) {
				invoiceID = invoice.getInvoiceId();
				if (null != invoice.getClientVendor()) {
					form.setCustID(String.valueOf(invoice.getClientVendor().getClientVendorId()));
					form.setClientVendorID(form.getCustID());
				}
				form.setOrderNo(poNo);
				if (null != invoice.getInvoiceStyle()) {
					style = String.valueOf(invoice.getInvoiceStyle().getInvoiceStyleId());
					form.setInvoiceStyle(style);
				}
				if (null == salesRep) {
					form.setRep(String.valueOf(invoice.getSalesRepId()));
				} else {
					form.setRep(salesRep.getName());
				}
				if (null != invoice.getTerm()) {
					form.setTerm(invoice.getTerm().getName() != null ? invoice.getTerm().getName()
							: String.valueOf(invoice.getTerm().getTermId()));
				}
				if (null != invoice.getPaymentType()) {
					form.setPayMethod(invoice.getPaymentType().getName() != null ? invoice.getPaymentType().getName()
							: String.valueOf(invoice.getPaymentType().getPaymentTypeId()));
				}
				if (null != invoice.getShipCarrier()) {
					form.setVia(invoice.getShipCarrier().getName() != null ? invoice.getShipCarrier().getName()
							: String.valueOf(invoice.getShipCarrier().getShipCarrierId()));
				}
				if (null != invoice.getMessage()) {
					form.setPayMethod(invoice.getMessage().getName() != null ? invoice.getMessage().getName()
							: String.valueOf(invoice.getMessage().getMessageId()));
				}
				if (null != invoice.getSalesTax())
					form.setSalesTaxID(String.valueOf(invoice.getSalesTax().getSalesTaxId()));
				form.setServiceID(invoice.getServiceId());

				form.setWeight(invoice.getWeight());
				form.setSubtotal(invoice.getSubTotal());
				form.setTax(invoice.getTax());
				form.setShipping(invoice.getSh());
				form.setTotal(invoice.getTotal());
				form.setAdjustedtotal(invoice.getAdjustedTotal());
				form.setBsAddressID(String.valueOf(invoice.getBsaddressId()));
				form.setCompanyID(String.valueOf(invoice.getCompany().getCompanyId()));
				form.setTaxID(String.valueOf(invoice.getSalesTax().getSalesTaxId()));
				form.setShipDate(DateHelper.dateFormatter(invoice.getDateConfirmed()));
				form.setOrderDate(DateHelper.dateFormatter(invoice.getDateAdded()));
				form.setBalance(invoice.getBalance());
				form.setIsPending(invoice.getIsPending() == 1 ? "true" : "false");

				form.setTaxable(invoice.getTaxable() == 1 ? "true" : "false");
				form.setItemShipped(invoice.getShipped() == 1 ? "true" : "false");
				form.setPaid(String.valueOf(invoice.getIsPaymentCompleted()));
				form.setPaid(String.valueOf(invoice.getIsPaymentCompleted()));
				;
				form.setMemo(invoice.getMemo());

			}

			/* Bill Address */
			ArrayList<PurchaseOrderDto> billAddresses = billAddress(compId, form.getCustID());
			if (!billAddresses.isEmpty()) {
				PurchaseOrderDto POBillAddr = billAddresses.get(0);
				form.setBsAddressID(POBillAddr.getBsAddressID());
				String billTo = POBillAddr.getBillTo();
				form.setBillTo(billTo != null ? billTo.replace("\n", "<br>") : "");
			}
			/* Ship Address */
			ArrayList<PurchaseOrderDto> shipAddresses = shipAddress(compId, form.getCustID());
			if (!shipAddresses.isEmpty()) {
				PurchaseOrderDto POShipAddr = shipAddresses.get(0);
				form.setShAddressID(POShipAddr.getShAddressID());
				String shipTo = POShipAddr.getShipTo();
				form.setShipTo(shipTo != null ? shipTo.replace("\n", "<br>") : "");
			}
			try {
				BcaClientvendor clientVendor = bcaClientvendorRepository.findById(Integer.parseInt(form.getCustID()))
						.orElseThrow(() -> {
							throw new IllegalStateException("clientVendor does not exist: " + form.getCustID());
						});
				form.setCompanyName(clientVendor.getName());
				form.setFullName(clientVendor.getFirstName() + " " + clientVendor.getLastName());
				form.setFirstName(clientVendor.getFirstName());
				form.setLastName(clientVendor.getLastName());
				form.setAddress1(clientVendor.getAddress1());
				form.setAddress2(clientVendor.getAddress2());
				Optional<BcaCountries> country = bcaCountriesRepository
						.findById(Integer.parseInt(clientVendor.getCountry()));
				Optional<BcaStates> state = bcaStatesRepository.findById(Integer.parseInt(clientVendor.getState()));
				Optional<BcaCities> city = bcaCitiesRepository.findById(Integer.parseInt(clientVendor.getCity()));

				form.setCity(city.get().getName() != null ? city.get().getName() : clientVendor.getCity());
				form.setState(state.get().getName() != null ? state.get().getName() : clientVendor.getCity());
				form.setCountry(country.get().getName() != null ? country.get().getName() : clientVendor.getCountry());
				form.setZipcode(clientVendor.getZipCode());
				form.setEmailAddr(clientVendor.getEmail());
				String phoneNumber = clientVendor.getPhone();
				if (phoneNumber != null && !phoneNumber.trim().isEmpty()) {
					form.setBillTo(form.getBillTo() + "<br>" + phoneNumber);
					form.setShipTo(form.getShipTo() + "<br>" + phoneNumber);
				}

			} catch (IllegalArgumentException iae) {
				Loger.log("Exception in getRecordForPO Function" + iae.toString());
			}

			/* Item List in the cart */
			itemList(invoiceID, compId, request, form);
			request.setAttribute("Style", style);
		} catch (Exception ex) {
			ex.printStackTrace();
			Loger.log("Exception in getRecordForPO Function" + ex.toString());

		}
		return form;
	}
//	public PurchaseOrderDto getRecordForPO(String compId, String poNo, PurchaseOrderDto form,
//			HttpServletRequest request) {
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		try {
//			String sql = "SELECT i.InvoiceID,i.ClientVendorID,i.PONum,i.InvoiceStyleID,i.SalesRepID,i.TermID,i.PaymentTypeID,i.ShipCarrierID,"
//					+ "i.MessageID,i.SalesTaxID,i.Weight,i.SubTotal,i.Tax,i.SH,i.Total,i.AdjustedTotal,i.BSAddressID,i.CompanyID,"
//					+ "date_format(i.DateConfirmed,'%m-%d-%Y') as DateConfirmed, date_format(i.DateAdded,'%m-%d-%Y') as DateAdded,"
//					+ "i.Taxable,i.Balance,i.InvoiceTypeID,i.Shipped,i.ServiceID,i.IsPaymentCompleted,i.Memo,i.isPending, "
//					+ "r.Name AS RepName, t.Name As TermName, p.Name AS PaymentTypeName, s.Name AS ShipCarrierName, m.Name AS MessageName "
//					+ "FROM bca_invoice As i LEFT JOIN bca_salesrep AS r ON r.SalesRepID=i.SalesRepID "
//					+ "LEFT JOIN bca_term AS t ON t.TermID=i.TermID LEFT JOIN bca_paymenttype AS p ON p.PaymentTypeID=i.PaymentTypeID "
//					+ "LEFT JOIN bca_shipcarrier AS s ON s.ShipCarrierID=i.ShipCarrierID LEFT JOIN bca_message AS m ON m.MessageID=i.MessageID "
//					+ "WHERE i.PONum=? and i.CompanyID=? AND i.invoiceStatus<>1 AND InvoiceTypeID=2";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, poNo);
//			pstmt.setString(2, compId);
//			rs = pstmt.executeQuery();
//			int invoiceID = 0;
//			String style = "";
//			if (rs.next()) {
//				invoiceID = rs.getInt("InvoiceID");
//				form.setCustID(rs.getString("ClientVendorID"));
//				form.setClientVendorID(form.getCustID());
//				form.setOrderNo(poNo);
//				style = rs.getString("InvoiceStyleID");
//				form.setInvoiceStyle(style);
//
//				form.setRep(rs.getString("RepName") != null ? rs.getString("RepName") : rs.getString("SalesRepID"));
//				form.setTerm(rs.getString("TermName") != null ? rs.getString("TermName") : rs.getString("TermID"));
//				form.setPayMethod(rs.getString("PaymentTypeName") != null ? rs.getString("PaymentTypeName")
//						: rs.getString("PaymentTypeID"));
//				form.setVia(rs.getString("ShipCarrierName") != null ? rs.getString("ShipCarrierName")
//						: rs.getString("ShipCarrierID"));
//				form.setMessage(
//						rs.getString("MessageName") != null ? rs.getString("MessageName") : rs.getString("MessageID"));
//				form.setSalesTaxID(rs.getString("SalesTaxID"));
//				form.setServiceID(rs.getInt("ServiceID"));
//				form.setWeight(Double.parseDouble(truncate(String.valueOf(rs.getDouble("Weight")))));
//				form.setSubtotal(Double.parseDouble(truncate(String.valueOf(rs.getDouble("SubTotal")))));
//
//				form.setTax(Double.parseDouble(truncate(String.valueOf(rs.getDouble("Tax")))));
//				form.setShipping(Double.parseDouble(truncate(String.valueOf(rs.getDouble("SH")))));
//				form.setTotal(Double.parseDouble(truncate(String.valueOf(rs.getDouble("Total")))));
//				form.setAdjustedtotal(Double.parseDouble(truncate(String.valueOf(rs.getDouble("AdjustedTotal")))));
//				form.setBsAddressID(rs.getString("BSAddressID"));
//				form.setCompanyID(rs.getString("CompanyID"));
//				form.setTaxID(rs.getString("SalesTaxID"));
//				form.setShipDate(rs.getString("DateConfirmed"));
//				form.setOrderDate(rs.getString("DateAdded"));
//
//				form.setBalance(Double.parseDouble(truncate(String.valueOf(rs.getDouble("Balance")))));
//				form.setIsPending(rs.getInt("isPending") == 1 ? "true" : "false");
//				form.setTaxable(rs.getInt("Taxable") == 1 ? "true" : "false");
//				form.setItemShipped(rs.getInt("Shipped") == 1 ? "true" : "false");
//				form.setPaid(rs.getInt("IsPaymentCompleted") == 1 ? "true" : "false");
//				form.setMemo(rs.getString("Memo"));
//			}
//			/* Bill Address */
//			ArrayList<PurchaseOrderDto> billAddresses = billAddress(compId, form.getCustID());
//			if (!billAddresses.isEmpty()) {
//				PurchaseOrderDto POBillAddr = billAddresses.get(0);
//				form.setBsAddressID(POBillAddr.getBsAddressID());
//				String billTo = POBillAddr.getBillTo();
//				form.setBillTo(billTo != null ? billTo.replace("\n", "<br>") : "");
//			}
//			/* Ship Address */
//			ArrayList<PurchaseOrderDto> shipAddresses = shipAddress(compId, form.getCustID());
//			if (!shipAddresses.isEmpty()) {
//				PurchaseOrderDto POShipAddr = shipAddresses.get(0);
//				form.setShAddressID(POShipAddr.getShAddressID());
//				String shipTo = POShipAddr.getShipTo();
//				form.setShipTo(shipTo != null ? shipTo.replace("\n", "<br>") : "");
//			}
//			String clientSQL = "SELECT cv.Name,cv.FirstName,cv.LastName,cv.Address1,cv.Address2,cv.City,cv.State,cv.Country,cv.ZipCode,"
//					+ "cv.Email,cv.Phone, ct.Name As CityName, s.name AS StateName, c.name AS CountryName "
//					+ "FROM bca_clientvendor AS cv LEFT JOIN bca_countries AS c ON c.id=cv.Country LEFT JOIN bca_states AS s ON s.id=cv.State "
//					+ "LEFT JOIN bca_cities AS ct ON ct.id=cv.City WHERE cv.ClientVendorID=?";
//			pstmt = con.prepareStatement(clientSQL);
//			pstmt.setString(1, form.getCustID());
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				form.setCompanyName(rs.getString("Name"));
//				form.setFullName(rs.getString("FirstName") + " " + rs.getString("LastName"));
//				form.setFirstName(rs.getString("FirstName"));
//				form.setLastName(rs.getString("LastName"));
//				form.setAddress1(rs.getString("Address1"));
//				form.setAddress2(rs.getString("Address2"));
//				form.setCity(rs.getString("CityName") != null ? rs.getString("CityName") : rs.getString("City"));
//				form.setState(rs.getString("StateName") != null ? rs.getString("StateName") : rs.getString("State"));
//				form.setCountry(rs.getString("CountryName") != null ? rs.getString("CountryName")
//						: rs.getString("CountryName"));
//				form.setZipcode(rs.getString("ZipCode"));
//				form.setEmailAddr(rs.getString("Email"));
//				String phoneNumber = rs.getString("Phone");
//				if (phoneNumber != null && !phoneNumber.trim().isEmpty()) {
//					form.setBillTo(form.getBillTo() + "<br>" + phoneNumber);
//					form.setShipTo(form.getShipTo() + "<br>" + phoneNumber);
//				}
//			}
//
//			/* Item List in the cart */
//			itemList(invoiceID, compId, request, form);
//			request.setAttribute("Style", style);
//		} catch (SQLException ex) {
//			Loger.log("Exception in getRecordForPO Function" + ex.toString());
//			ex.printStackTrace();
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
//		return form;
//	}

	/*
	 * The method provides all the information required for purchase order according
	 * to the purchase order number.
	 */
	public ArrayList getRecord(HttpServletRequest request, PurchaseOrderDto form, String compId, long PONum) {
		ArrayList<PurchaseOrderDto> list = new ArrayList<>();
		try {

			StringBuffer query = new StringBuffer(
					"select bi from BcaInvoice bi where bi.company.companyId =:companyId and bi.invoiceStatus =:invoiceStatus and"
							+ " bi.invoiceType.invoiceTypeId =:invoiceTypeId"
							+ ((PONum > 0) ? " and ponum =:ponum" : " "));

			TypedQuery<BcaInvoice> typedQuery = this.entityManager.createQuery(query.toString(), BcaInvoice.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.parseLong(compId));
			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceStatus", 0);
			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceTypeId", 2);
			JpaHelper.addParameter(typedQuery, query.toString(), "ponum", (int) PONum);

			List<BcaInvoice> bcaInvoices = typedQuery.getResultList();
			int invoiceID = 0;
			for (BcaInvoice invoice : bcaInvoices) {
				if (!list.isEmpty()) {
					form = new PurchaseOrderDto();
				}
				invoiceID = invoice.getInvoiceId();
				form.setCustID(String.valueOf(invoice.getClientVendor().getClientVendorId()));
				form.setClientVendorID(form.getCustID());
				form.setOrderNo(String.valueOf(PONum));
				form.setInvoiceStyle(String.valueOf(invoice.getInvoiceStyle().getInvoiceStyleId()));
				form.setTerm(String.valueOf(invoice.getTerm().getTermId()));
//				form.setPayMethod(String.valueOf(invoice.getPaymentType().getPaymentTypeId()));
				form.setPayMethod(invoice.getPaymentType() != null ? String.valueOf(invoice.getPaymentType().getPaymentTypeId()) : "0");
				form.setVia(String.valueOf(invoice.getShipCarrier().getShipCarrierId()));
//				form.setMessage(String.valueOf(invoice.getMessage().getMessageId()));
				form.setMessage(invoice.getMessage() != null ? String.valueOf(invoice.getMessage().getMessageId()) : "0");
				form.setTotal(Double.parseDouble(truncate(String.valueOf(invoice.getTotal()))));
				form.setOrderDate(DateHelper.dateFormatter(invoice.getDateAdded()));
				form.setTaxable(invoice.getTaxable() == 1 ? "true" : "false");

				form.setMemo(invoice.getMemo());
				request.setAttribute("Style", form.getInvoiceStyle());

				/* Bill Address */
				ArrayList<PurchaseOrderDto> billAddresses = billAddress(compId, form.getCustID());
				if (!billAddresses.isEmpty()) {
					PurchaseOrderDto POBillAddr = billAddresses.get(0);
					form.setBillAddrValue(POBillAddr.getBsAddressID());
					form.setFullName(POBillAddr.getFullName());
					form.setBillTo(POBillAddr.getBillTo());
				}
				/* Ship Address */
				ArrayList<PurchaseOrderDto> shipAddresses = shipAddress(compId, form.getCustID());
				if (!shipAddresses.isEmpty()) {
					PurchaseOrderDto POShipAddr = shipAddresses.get(0);
					form.setShipAddr(POShipAddr.getBsAddressID());
					form.setShipTo(POShipAddr.getShipTo());
				}
				BcaClientvendor clientVendor = bcaClientvendorRepository.findById(Integer.parseInt(form.getCustID()))
						.orElseThrow(() -> new NoSuchElementException("clientVendorId is not found"));

				form.setCompanyName(clientVendor.getName());
				form.setFullName(clientVendor.getLastName() + ", " + clientVendor.getLastName());
				request.setAttribute("CustomerName", form.getFullName());

				request.setAttribute("VendorName", form.getCompanyName());
				list.add(form);
				/* Item List in the cart */
				itemList(invoiceID, compId, request, form);
			}

		} catch (NoSuchElementException ex) {
			ex.printStackTrace();
			Loger.log("Exception in getRecord Function" + ex.toString());

		} catch (Exception ex) {
			ex.printStackTrace();
			Loger.log("Exception in getRecord Function" + ex.toString());

		}
		return list;
	}
//	public ArrayList getRecord(HttpServletRequest request, PurchaseOrderDto form, String compId, long PONum) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null, pstmtTemp = null;
//		ResultSet rs = null, rsTemp = null;
//		ArrayList<PurchaseOrderDto> list = new ArrayList<>();
//		try {
//			String sql = "SELECT InvoiceID,ClientVendorID,InvoiceStyleID,TermID,PaymentTypeID,ShipCarrierID,MessageID,Total,"
//					+ "date_format(DateAdded,'%m-%d-%Y') as DateAdded, Taxable,VendorAddrID,ShippingAddrID,Memo "
//					+ " FROM bca_invoice WHERE CompanyID=" + compId + " AND invoiceStatus=0 and InvoiceTypeID=2 ";
//			if (PONum > 0) {
//				sql = sql + " AND PONum=" + PONum;
//			}
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			int invoiceID = 0;
//			while (rs.next()) {
//				if (!list.isEmpty()) {
//					form = new PurchaseOrderDto();
//				}
//				invoiceID = rs.getInt("InvoiceID");
//				form.setCustID(rs.getString("ClientVendorID"));
//				form.setClientVendorID(form.getCustID());
//				form.setOrderNo(String.valueOf(PONum));
//				form.setInvoiceStyle(rs.getString("InvoiceStyleID"));
//				form.setTerm(rs.getString("TermID"));
//				form.setPayMethod(rs.getString("PaymentTypeID"));
//				form.setVia(rs.getString("ShipCarrierID"));
//				form.setMessage(rs.getString("MessageID"));
//				form.setTotal(Double.parseDouble(truncate(String.valueOf(rs.getDouble("Total")))));
//				form.setOrderDate(rs.getString("DateAdded"));
//				form.setTaxable(rs.getInt("Taxable") == 1 ? "true" : "false");
//				// billAddr=rs.getString("VendorAddrID");
//				// shipAddr=rs.getString("ShippingAddrID");
//				form.setMemo(rs.getString("Memo"));
//				request.setAttribute("Style", form.getInvoiceStyle());
//
//				/* Bill Address */
//				ArrayList<PurchaseOrderDto> billAddresses = billAddress(compId, form.getCustID());
//				if (!billAddresses.isEmpty()) {
//					PurchaseOrderDto POBillAddr = billAddresses.get(0);
//					form.setBillAddrValue(POBillAddr.getBsAddressID());
//					form.setFullName(POBillAddr.getFullName());
//					form.setBillTo(POBillAddr.getBillTo());
//				}
//				/* Ship Address */
//				ArrayList<PurchaseOrderDto> shipAddresses = shipAddress(compId, form.getCustID());
//				if (!shipAddresses.isEmpty()) {
//					PurchaseOrderDto POShipAddr = shipAddresses.get(0);
//					form.setShipAddr(POShipAddr.getBsAddressID());
//					form.setShipTo(POShipAddr.getShipTo());
//				}
//				pstmtTemp = con.prepareStatement(
//						"select Name,FirstName,LastName from bca_clientvendor where ClientVendorID=?");
//				pstmtTemp.setString(1, form.getCustID());
//				rsTemp = pstmtTemp.executeQuery();
//				if (rsTemp.next()) {
//					form.setCompanyName(rsTemp.getString("Name"));
//					form.setFullName(rsTemp.getString("LastName") + ", " + rsTemp.getString("FirstName"));
//					request.setAttribute("CustomerName", form.getFullName());
//				}
//				request.setAttribute("VendorName", form.getCompanyName());
//				list.add(form);
//				/* Item List in the cart */
//				itemList(invoiceID, compId, request, form);
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in getRecord Function" + ex.toString());
//			ex.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (rsTemp != null) {
//					db.close(rsTemp);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (pstmtTemp != null) {
//					db.close(pstmtTemp);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return list;
//	}

	/*
	 * The method provides the list of all the items for the purchase order. The
	 * list with all the necessary information.
	 */
	public void itemList(int invoiceID, String compId, HttpServletRequest request, PurchaseOrderDto form) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		ArrayList<Item> cart = new ArrayList<Item>();
		if (db == null)
			return;
		con = db.getConnection();
		if (con == null)
			return;
		try {
			pstmt = con.prepareStatement("select * from bca_cart where InvoiceID=? and companyID=?");
			pstmt.setInt(1, invoiceID);
			pstmt.setString(2, compId);
			rs = pstmt.executeQuery();
			double taxTotal = 0;
			while (rs.next()) {
				Item inForm = new Item();
				inForm.setInvCode(rs.getString("InventoryCode"));
				int qty = rs.getInt("Qty");
				double uprice = rs.getDouble("UnitPrice");
				inForm.setQty(qty);
				inForm.setInvDesc(rs.getString("InventoryName"));
				inForm.setUprice(uprice);
				inForm.setWeight(rs.getDouble("UnitWeight"));
				int tax = rs.getInt("Taxable");
				inForm.setAmount(Double.parseDouble(truncate(String.valueOf(qty * uprice))));
				if (tax == 1) {
					inForm.setTax("Yes");
					taxTotal += (qty * uprice);
				} else if (tax == 0) {
					inForm.setTax("No");
				}
				inForm.setItemTypeID(rs.getInt("ItemTypeID"));
				Loger.log("ITEMID" + inForm.getItemTypeID());
				inForm.setInventoryID(rs.getString("InventoryID"));
				cart.add(inForm);
			}
			request.setAttribute("Cart", cart);
			form.setCart(cart);
			InvoiceDto invoiceDto = new InvoiceDto();
			invoiceDto.setTaxValue(Double.parseDouble(truncate(String.valueOf(taxTotal))));
			request.setAttribute("TaxValue", invoiceDto);
		} catch (SQLException ex) {
			Loger.log("Exception in getRecord Function" + ex.toString());
			ex.printStackTrace();
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
	}

	/*
	 * Deletes the purchase order from database. It deletes the all the information
	 * related to the purchase order. It deletes according to purchase order number.
	 */
	@Transactional
	public void Delete(String compId, String poNum) {

		int invoiceId = 0;

		try {
			BcaInvoice bcaInvoice = bcaInvoiceRepository.findByCompanyIdAndPoNum(Long.parseLong(compId),
					Integer.parseInt(poNum));
			if (null != bcaInvoice) {
				invoiceId = bcaInvoice.getInvoiceId();
				int count = bcaInvoiceRepository.deleteByInvoiceIdAndCompanyId(invoiceId, Long.parseLong(compId));
				if (count > 0) {
					bcaCartRepository.deleteByInvoice_InvoiceId(invoiceId);
				}

			}
		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log("Exception" + ee.toString());

		}
	}

//	public void Delete(String compId, String poNum) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		PreparedStatement pstmtCartDelete = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rsInvoice = null;
//		long invoiceId = 0;
//		if (db == null)
//			return;
//		con = db.getConnection();
//		if (con == null)
//			return;
//		try {
//			String invoice = "select InvoiceID from bca_invoice where PONum =? and CompanyID=?";
//			pstmt = con.prepareStatement(invoice);
//			pstmt.setString(1, poNum);
//			pstmt.setString(2, compId);
//			rsInvoice = pstmt.executeQuery();
//			if (rsInvoice.next()) {
//				invoiceId = rsInvoice.getLong("InvoiceID");
//			}
//			pstmt.close();
//			rsInvoice.close();
//			pstmt = con.prepareStatement("delete from bca_invoice where InvoiceID =? and CompanyID=?");
//			pstmt.setLong(1, invoiceId);
//			pstmt.setString(2, compId);
//			int deleted = pstmt.executeUpdate();
//			if (deleted > 0) {
//				String cartQuery = "delete from bca_cart where InvoiceID=? ";
//				pstmtCartDelete = con.prepareStatement(cartQuery);
//				pstmtCartDelete.setLong(1, invoiceId);
//				pstmtCartDelete.executeUpdate();
//			}
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//
//		} finally {
//			try {
//				if (rsInvoice != null) {
//					db.close(rsInvoice);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (pstmtCartDelete != null) {
//					db.close(pstmtCartDelete);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//	}

	/*
	 * Shows the all the information of the bill or ship address of purticular
	 * vendor.
	 * 
	 */

	public void showConfirmAddress(VendorDto vForm, HttpServletRequest request, String cType) {
		List<String> statuses = Arrays.asList("N", "U");
		try {
			int addressType = (cType != null && cType.equals("bill")) ? 1 : 0;
			if (addressType == 0) {
				
				BcaShippingaddress shippingAddress = bcaShippingaddressRepository
						.findByClientVendorIdAndStatusIn(Integer.parseInt(vForm.getClientVendorID()), statuses);
				if (null != shippingAddress) {
					vForm.setClientVendorID(String.valueOf(shippingAddress.getClientVendor().getClientVendorId()));
					vForm.setBsAddressID(String.valueOf(shippingAddress.getAddressId()));
					vForm.setCname(shippingAddress.getName());
					vForm.setFirstName(shippingAddress.getFirstName());
					vForm.setLastName(shippingAddress.getLastName());
					vForm.setAddress1(shippingAddress.getAddress1());
					vForm.setAddress2(shippingAddress.getAddress2());
					vForm.setCity(shippingAddress.getCity());

					vForm.setZipCode(shippingAddress.getZipCode());
					vForm.setState(shippingAddress.getState());
					vForm.setCountry(shippingAddress.getCountry());
					vForm.setAddressType(shippingAddress.getAddressType() != null ? Integer.parseInt(shippingAddress.getAddressType()) : 0);
//					vForm.setAddressType(Integer.parseInt(shippingAddress.getAddressType()));
					vForm.setBillTo(vForm.getCname() + "\n" + vForm.getFirstName() + " " + vForm.getLastName() + "\n"
							+ vForm.getAddress1() + "\n" + vForm.getAddress2() + "\n" + vForm.getCity() + "\n"
							+ countryState.getStatesName(vForm.getState()) + "\n" + vForm.getZipCode() + "\n"
							+ countryState.getCountryName(vForm.getCountry()));
				}

			} else {
				BcaBillingaddress billingAddress = bcaBillingaddressRepository
						.findByClientVendorIdAndStatusIn(Integer.parseInt(vForm.getClientVendorID()), statuses);
				if (null != billingAddress) {
					vForm.setClientVendorID(String.valueOf(billingAddress.getClientVendor().getClientVendorId()));
					vForm.setBsAddressID(String.valueOf(billingAddress.getAddressId()));
					vForm.setCname(billingAddress.getName());
					vForm.setFirstName(billingAddress.getFirstName());
					vForm.setLastName(billingAddress.getLastName());
					vForm.setAddress1(billingAddress.getAddress1());
					vForm.setAddress2(billingAddress.getAddress2());
					vForm.setCity(billingAddress.getCity());

					vForm.setZipCode(billingAddress.getZipCode());
					vForm.setState(billingAddress.getState());
					vForm.setCountry(billingAddress.getCountry());
					vForm.setAddressType(billingAddress.getAddressType() != null ? Integer.parseInt(billingAddress.getAddressType()) : 1);
//					vForm.setAddressType(Integer.parseInt(billingAddress.getAddressType()));
					vForm.setBillTo(vForm.getCname() + "\n" + vForm.getFirstName() + " " + vForm.getLastName() + "\n"
							+ vForm.getAddress1() + "\n" + vForm.getAddress2() + "\n" + vForm.getCity() + "\n"
							+ countryState.getStatesName(vForm.getState()) + "\n" + vForm.getZipCode() + "\n"
							+ countryState.getCountryName(vForm.getCountry()));
				}

			}
			vForm.setCity(MyUtility.checkDefaultCityID(vForm.getCity()));
			vForm.setState(MyUtility.checkDefaultStateID(vForm.getState()));
			vForm.setCountry(MyUtility.checkDefaultCountryID(vForm.getCountry()));
			request.setAttribute("state", vForm.getState());

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log("Exception" + ee.toString());

		}
	}

//	public void showConfirmAddress(VendorDto vForm, HttpServletRequest request, String cType) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
//		CountryState conState = new CountryState();
//		String address = "";
//		try {
//			int addressType = (cType != null && cType.equals("bill")) ? 1 : 0;
//			if (addressType == 0) {
//				address = "select * from bca_shippingaddress where ClientVendorID=? and Status in ('N')";
//			} else {
//				address = "select * from bca_billingaddress where ClientVendorID=? and Status in ('N')";
//			}
//			pstmt = con.prepareStatement(address);
////			pstmt.setInt(1, addressType);
//			pstmt.setString(1, vForm.getClientVendorID());
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				vForm.setClientVendorID(rs.getString("ClientVendorID"));
//				vForm.setBsAddressID(rs.getString("AddressID"));
//				vForm.setCname(rs.getString("Name"));
//				vForm.setFirstName(rs.getString("FirstName"));
//				vForm.setLastName(rs.getString("LastName"));
//				vForm.setAddress1(rs.getString("Address1"));
//				vForm.setAddress2(rs.getString("Address2"));
//				vForm.setCity(rs.getString("City"));
//
//				vForm.setZipCode(rs.getString("ZipCode"));
//				vForm.setState(rs.getString("State"));
//				vForm.setCountry(rs.getString("Country"));
//				vForm.setAddressType(rs.getInt("AddressType"));
//				vForm.setBillTo(vForm.getCname() + "\n" + vForm.getFirstName() + " " + vForm.getLastName() + "\n"
//						+ vForm.getAddress1() + "\n" + vForm.getAddress2() + "\n" + vForm.getCity() + "\n"
//						+ conState.getStatesName(vForm.getState()) + "\n" + vForm.getZipCode() + "\n"
//						+ conState.getCountryName(vForm.getCountry()));
//			}
//			vForm.setCity(MyUtility.checkDefaultCityID(vForm.getCity()));
//			vForm.setState(MyUtility.checkDefaultStateID(vForm.getState()));
//			vForm.setCountry(MyUtility.checkDefaultCountryID(vForm.getCountry()));
//			request.setAttribute("state", vForm.getState());
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//
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
//	}

	/*
	 * Add/Update the Billing & Shipping address & related information of perticular
	 * vendor to the database.
	 */
	public boolean updateBillingShippingAddress(VendorDto vForm, HttpServletRequest request) {

		boolean isUpdated = false;
		try {

			BcaBsaddress bcaBsaAddress = bcaBsaddressRepository.findByBsaddressIdAndAddressType(
					Integer.parseInt(vForm.getBsAddressID()), String.valueOf(vForm.getAddressType()));
			if (null != bcaBsaAddress) {
				bcaBsaAddress.setName(vForm.getCname());
				bcaBsaAddress.setFirstName(vForm.getFirstName());
				bcaBsaAddress.setLastName(vForm.getLastName());
				bcaBsaAddress.setAddress1(vForm.getAddress1());
				bcaBsaAddress.setAddress2(vForm.getAddress2());
				bcaBsaAddress.setCity(vForm.getCity());
				bcaBsaAddress.setZipCode(vForm.getZipCode());
				bcaBsaAddress.setState(vForm.getState());
				bcaBsaAddress.setCountry(vForm.getCountry());
				bcaBsaAddress.setProvince(vForm.getProvince());
				bcaBsaAddress.setStatus("U");
				try {
					bcaBsaddressRepository.save(bcaBsaAddress);
					isUpdated = true;

				} catch (IllegalArgumentException argumentException) {
					Loger.log("Exception" + argumentException.toString());
				}

			} else {
				BcaBsaddress bsaAddress = new BcaBsaddress();
				bsaAddress.setClientVendorId(Integer.parseInt(vForm.getClientVendorID()));
				bsaAddress.setName(vForm.getCname());
				bsaAddress.setFirstName(vForm.getFirstName());
				bsaAddress.setLastName(vForm.getLastName());
				bsaAddress.setAddress1(vForm.getAddress1());
				bsaAddress.setAddress2(vForm.getAddress2());
				bsaAddress.setCity(vForm.getCity());
				bsaAddress.setZipCode(vForm.getZipCode());
				bsaAddress.setState(vForm.getState());
				bsaAddress.setCountry(vForm.getCountry());
				bsaAddress.setProvince(vForm.getProvince());
				bsaAddress.setStatus("U");
				LocalDate currentDate = LocalDate.now();

				bsaAddress.setDateAdded(currentDate);
				try {
					BcaBsaddress bcaaddresss = bcaBsaddressRepository.save(bsaAddress);
					bcaInvoiceRepository.updateBsaAddressIdByClientVendorId(bcaaddresss.getBsaddressId(),
							Integer.parseInt(vForm.getClientVendorID()));

					isUpdated = true;

				} catch (IllegalArgumentException argumentException) {
					Loger.log("Exception" + argumentException.toString());
				}

			}

		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log("Exception" + ee.toString());

		}
		return isUpdated;
	}

//	public boolean updateBillingShippingAddress(VendorDto vForm, HttpServletRequest request) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
//		boolean isUpdated = false;
//		try {
//			boolean isFound = false;
//			pstmt = con.prepareStatement("SELECT * FROM bca_bsaddress WHERE BSAddressID=? AND AddressType=?");
//			pstmt.setString(1, vForm.getBsAddressID());
//			pstmt.setInt(2, vForm.getAddressType());
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				isFound = true;
//			}
//			if (isFound) {
//				String sqlString = "UPDATE bca_bsaddress SET Name=?, FirstName=?, LastName=?, Address1=?, Address2=?, City=?,"
//						+ " ZipCode=?, State=?, Country=?, Province=?, Status=? WHERE BSAddressID=? AND AddressType=?";
//				pstmt = con.prepareStatement(sqlString);
//				pstmt.setString(1, vForm.getCname());
//				pstmt.setString(2, vForm.getFirstName());
//				pstmt.setString(3, vForm.getLastName());
//				pstmt.setString(4, vForm.getAddress1());
//				pstmt.setString(5, vForm.getAddress2());
//				pstmt.setString(6, vForm.getCity());
//				pstmt.setString(7, vForm.getZipCode());
//				pstmt.setString(8, vForm.getState());
//				pstmt.setString(9, vForm.getCountry());
//				pstmt.setString(10, vForm.getProvince());
//				pstmt.setString(11, "U");
//				pstmt.setString(12, vForm.getBsAddressID());
//				pstmt.setInt(13, vForm.getAddressType());
//				isUpdated = pstmt.executeUpdate() > 0 ? true : false;
//			} else {
//				String newAddressID = vForm.getBsAddressID();
//				if (newAddressID == null || newAddressID.isEmpty() || newAddressID.equals("0")) {
//					pstmt = con.prepareStatement("SELECT MAX(BSAddressID) FROM bca_bsaddress");
//					rs = pstmt.executeQuery();
//					if (rs.next()) {
//						newAddressID = String.valueOf(rs.getInt(1) + 1);
//					}
//				}
//				String sqlString = "INSERT INTO bca_bsaddress(BSAddressID,ClientVendorID, Name,FirstName,"
//						+ " LastName,Address1, Address2, City,ZipCode,State,Country,Province,AddressType,Status,DateAdded) "
//						+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
//				pstmt = con.prepareStatement(sqlString);
//				pstmt.setString(1, newAddressID);
//				pstmt.setString(2, vForm.getClientVendorID());
//				pstmt.setString(3, vForm.getCname());
//				pstmt.setString(4, vForm.getFirstName());
//				pstmt.setString(5, vForm.getLastName());
//				pstmt.setString(6, vForm.getAddress1());
//				pstmt.setString(7, vForm.getAddress2());
//				pstmt.setString(8, vForm.getCity());
//				pstmt.setString(9, vForm.getZipCode());
//				pstmt.setString(10, vForm.getState());
//				pstmt.setString(11, vForm.getCountry());
//				pstmt.setString(12, vForm.getProvince());
//				pstmt.setInt(13, vForm.getAddressType());
//				pstmt.setString(14, "U");
//				int updatedRows = pstmt.executeUpdate();
//				if (updatedRows > 0) {
//					pstmt = con.prepareStatement("UPDATE bca_invoice SET BSAddressID=? WHERE ClientVendorID=?");
//					pstmt.setString(1, newAddressID);
//					pstmt.setString(2, vForm.getClientVendorID());
//					pstmt.executeUpdate();
//					isUpdated = true;
//				}
//			}
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//
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
//		return isUpdated;
//	}

}
