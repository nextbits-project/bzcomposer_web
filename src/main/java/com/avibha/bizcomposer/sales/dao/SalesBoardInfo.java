/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.sales.dao;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.sales.forms.SalesBoardDto;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.MyUtility;
import com.nxsol.bzcomposer.company.domain.BcaCart;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.BcaIteminventory;
import com.nxsol.bzcomposer.company.domain.BcaRmaitem;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.repos.BcaCartRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoiceRepository;
import com.nxsol.bzcomposer.company.repos.BcaRmaitemRepository;
import com.nxsol.bzcomposer.company.repos.BcaRmamasterRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.utils.JpaHelper;
import com.pritesh.bizcomposer.accounting.bean.RefundInvoiceReportDto;
import com.pritesh.bizcomposer.accounting.bean.SalesInvoiceBoardDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Service
public class SalesBoardInfo {
	@Autowired
	private EntityManager entityManager;
	@Autowired
	private BcaSalesrepRepository bcaSalesrepRepository;

	@Autowired
	private BcaCartRepository bcaCartRepository;

	@Autowired
	private BcaRmaitemRepository bcaRmaitemRepository;

	@Autowired
	private BcaInvoiceRepository bcaInvoiceRepository;

	@Autowired
	private BcaRmamasterRepository bcaRmamasterRepository;
	
	@Autowired 
	private CustomerInfo customerInfo;
	
	@Autowired
	private ConfigurationInfo configInfo;

	public ArrayList SalesRecordSearch(String compId, String invoiceReportType, SalesBoardDto salesBoardDto) {

		String oDate1 = salesBoardDto.getOrderDate1();
		String oDate2 = salesBoardDto.getOrderDate2();
		String saleDate1 = salesBoardDto.getSaleDate1();
		String saleDate2 = salesBoardDto.getSaleDate2();
		String searchType = salesBoardDto.getSearchType();
		String searchTxt = salesBoardDto.getSearchTxt();
		String marketID = salesBoardDto.getFilterMarket();
		String orderNoFrom = salesBoardDto.getOrderNoFrom();
		String orderNoTo = salesBoardDto.getOrderNoTo();
//
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null, rs2 = null, rs3 = null, rs4 = null;
//		Statement stmt = null, stmt1 = null, stmt2 = null, stmt4 = null;
		String mark = null;
//		String sqlString = "";
//		CustomerInfo cinfo = new CustomerInfo();
		ArrayList<SalesBoard> objList = new ArrayList<>();
//		ConfigurationInfo configInfo = new ConfigurationInfo();
		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		try {
//			stmt = con.createStatement();
//			stmt1 = con.createStatement();
//			stmt2 = con.createStatement();
//			stmt4 = con.createStatement();
			Loger.log("oDate1:" + oDate1 + " oDate2:" + oDate2);
			StringBuffer query = new StringBuffer(
					"select bi from BcaInvoice as bi where bi.company.companyId  = :companyId and bi.invoiceStatus =0  "
							+ (invoiceReportType.equalsIgnoreCase("2") ? "and bi.isPaymentCompleted = 1" : " ")
							+ (invoiceReportType.equalsIgnoreCase("3") ? "and bi.isPaymentCompleted = 0" : " ")
							+ (orderNoFrom != null && orderNoTo != null && !orderNoFrom.isEmpty()
									&& !orderNoTo.isEmpty()
											? " and bi.orderNum between " + orderNoFrom + " and " + orderNoTo
											: " ")
							+ (oDate1 != null && oDate2 != null && oDate1.trim().length() > 1
									&& oDate2.trim().length() > 1
											? " and bi.dateConfirmed between '" + customerInfo.string2date(oDate1) + "' and '"
													+ customerInfo.string2date(oDate2) + "' "
											: " ")
							+ (oDate1 != null && oDate1.trim().length() > 1
									? " and bi.dateConfirmed between '" + customerInfo.string2date(oDate1) + "' and '"
											+ customerInfo.string2date("now()") + "' "
									: " ")
							+ (oDate2 != null && oDate2.trim().length() > 1
									? " and bi.dateConfirmed <= '" + customerInfo.string2date(oDate2) + "' "
									: " ")
							+ (saleDate1 != null && saleDate2 != null && saleDate1.trim().length() > 1
									&& saleDate2.trim().length() > 1
											? " and bi.dateConfirmed between '" + customerInfo.string2date(saleDate1)
													+ "' and '" + customerInfo.string2date(saleDate2) + "' "
											: " ")
							+ (saleDate1 != null && saleDate1.trim().length() > 1
									? " and bi.dateConfirmed between '" + customerInfo.string2date(saleDate1) + "' and '"
											+ customerInfo.string2date("now()") + "' "
									: "")
							+ (saleDate2 != null && saleDate2.trim().length() > 1
									? " and bi.dateConfirmed <= '" + customerInfo.string2date(saleDate2) + "' "
									: " ")
							+ (searchTxt != null && !searchTxt.trim().isEmpty()
									? (searchType.equals("2") || searchType.equals("3")
											? " and bi.orderNum LIKE '%" + searchTxt + "%' "
											: " ")
									: " "));

			if ("1".equalsIgnoreCase(marketID)) {
				query = query.append(" and bi.orderType=7 ");
				mark = "eBay";
			}
			if ("2".equalsIgnoreCase(marketID)) {
				query = query.append(" and bi.orderType=5 ");
				mark = "Amazon Seller";
			}
			if ("3".equalsIgnoreCase(marketID)) {
				query = query.append(" and bi.orderType=6 ");
				mark = "Amazon Market";
			}
			if ("4".equalsIgnoreCase(marketID)) {
				query = query.append(" and bi.orderType=8 ");
				mark = "Half.com";
			}
			if ("5".equalsIgnoreCase(marketID)) {
				query = query.append(" and bi.orderType=9 ");
				mark = "Price Grabber";
			}
			query = query
					.append(" and bi.orderNum > 0 and bi.invoiceType.invoiceTypeId = 1 order by bi.orderNum desc ");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");

			TypedQuery<BcaInvoice> typedQuery = this.entityManager.createQuery(query.toString(), BcaInvoice.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));

			List<BcaInvoice> lists = typedQuery.getResultList();
			for (BcaInvoice bcaInvoice : lists) {

				SalesBoard d = new SalesBoard();
				d.setInvoiceID(bcaInvoice.getInvoiceId());
				if (null != bcaInvoice.getIsPaymentCompleted())
					d.setPaymentCompleted(bcaInvoice.getIsPaymentCompleted());
				if (null != bcaInvoice.getOrderid()) {
					d.setOrderid(Integer.parseInt(bcaInvoice.getOrderid().getOrderId()));
					d.setTransactionID(bcaInvoice.getOrderid().getOrderId());
				}
				if (null != bcaInvoice.getOrderNum()) {
					d.setOrderNum(bcaInvoice.getOrderNum());
					String orderNo = (bcaInvoice.getOrderNum().toString());
					String yearPart = MyUtility.getYearPart(bcaInvoice.getDateAdded().format(formatter));
					if (configDto.getIsSalePrefix().equals("on")) {
						d.setOrderNumStr("IV".concat(yearPart).concat("-" + MyUtility
								.getOrderNumberByConfigData(orderNo, AppConstants.InvoiceType, configDto, false)));
					} else {
						d.setOrderNumStr(MyUtility.getOrderNumberByConfigData(orderNo, AppConstants.InvoiceType,
								configDto, false));
					}
				}
				if (null != bcaInvoice.getPonum())
					d.setPo_no(bcaInvoice.getPonum());
				if (null != bcaInvoice.getRcvNum())
					d.setRcv_no(bcaInvoice.getRcvNum());
				if (null != bcaInvoice.getEstNum())
					d.setEst_no(bcaInvoice.getEstNum());
				if (null != bcaInvoice.getClientVendor().getClientVendorId())
					d.setCvID(bcaInvoice.getClientVendor().getClientVendorId());
				if (null != bcaInvoice.getBsaddressId())
					d.setBsAddressID(bcaInvoice.getBsaddressId());
				if (null != bcaInvoice.getDateAdded())
					d.setDateAdded(bcaInvoice.getDateAdded().format(formatter));
				if (null != bcaInvoice.getDateConfirmed())
					d.setSaleDate(bcaInvoice.getDateConfirmed().format(formatter));
				if (null != bcaInvoice.getIsPrinted())
					d.setPrinted(bcaInvoice.getIsPrinted());
				if (null != bcaInvoice.getShipped())
					d.setShipped(bcaInvoice.getShipped());
				if (null != bcaInvoice.getIsEmailed())
					d.setEmailed(bcaInvoice.getIsEmailed() ? 1 : 0);
				d.setMarketPlaceName(mark);
				if (null != bcaInvoice.getTotal()) {
					BigDecimal number = new BigDecimal(String.valueOf(bcaInvoice.getTotal()));
					BigDecimal total = number.setScale(2, RoundingMode.HALF_UP);
					d.setTotal(total);
				}
				if (null != bcaInvoice.getSalesRepId()) {
					String rep = bcaInvoice.getSalesRepId().toString();
					if (rep != null) {
						BcaSalesrep bcaSalesreps = bcaSalesrepRepository.findBySalesRepId(Integer.valueOf(rep));

						if (null != bcaSalesreps) {
							d.setRep(bcaSalesreps.getName());
						}
					}
				}
				StringBuffer query2 = new StringBuffer("select new " + SalesBoard.class.getCanonicalName()
						+ " (a.lastName, a.firstName, a.email, b.address1 , b.address2, b.city , b.state , b.country, b.zipCode, a.name) "
						+ " from BcaClientvendor a , BcaBillingaddress b where a.clientVendorId = :clientVendorId and b.addressId = :addressId "
						+ " and a.active =1 and b.active =1 and a.status in ('N' , 'U') and b.status in ('N', 'U') and a.deleted=0 and b.isDefault =1 ");

				if (searchTxt != null && !searchTxt.trim().isEmpty()) {

					query2 = query2.append((searchType.equals("1")
							? " and(a.firstName like '%" + searchTxt + "%' or a.lastName like '%" + searchTxt + "%')"
							: " ")
							+ (searchType.equals("4")
									? " and (b.address1 like '%" + searchTxt + "%' or b.address2 like '%" + searchTxt
											+ "%' or b.city like '%" + searchTxt + "%' or b.country like '%" + searchTxt
											+ "%'))"
									: " ")
							+ (searchType.equals("5") ? " and a.name like '%" + searchTxt + "%'" : " ")
							+ (searchType.equals("6") ? " and a.email like '%" + searchTxt + "%'" : " "));

				}
				TypedQuery<SalesBoard> typedQuery2 = this.entityManager.createQuery(query2.toString(),
						SalesBoard.class);
				JpaHelper.addParameter(typedQuery2, query2.toString(), "clientVendorId", d.getCvID());
				JpaHelper.addParameter(typedQuery2, query2.toString(), "addressId", d.getBsAddressID());

				List<SalesBoard> salesBoards = typedQuery2.getResultList();
				for (SalesBoard board : salesBoards) {
					d.setFirstName(board.getFirstName());
					d.setLastName(board.getLastName());
					d.setAddress1(board.getAddress1());
					d.setAddress2(board.getAddress2());
					d.setCity(board.getCity());
					d.setState(board.getState());
					d.setCountry(board.getCountry());
					d.setZipCode(board.getZipCode());
					d.setEmail(board.getEmail());
					d.setCompanyName(board.getCompanyName());
				}

				if (searchTxt != null && !searchTxt.trim().isEmpty()) {
					if (searchType.equals("1") && d.getFirstName() == null && d.getLastName() == null) {
						continue;
					} else if (searchType.equals("4") && d.getAddress1() == null && d.getAddress2() == null
							&& d.getCity() == null && d.getCountry() == null) {
						continue;
					} else if (searchType.equals("5") && d.getCompanyName() == null) {
						continue;
					} else if (searchType.equals("6") && d.getEmail() == null) {
						continue;
					}
				}

				List<BcaCart> carts = bcaCartRepository.findByInvoiceIdAndCompanyId(d.getInvoiceID(),
						Long.valueOf(compId));

				int item_c = 0;
				for (BcaCart bcaCart : carts) {
					if (++item_c != 1)
						continue;
					d.setItemName(bcaCart.getInventoryName());
					d.setInventoryQty(bcaCart.getQty());
					break;
				}

				objList.add(d);

			}

//			if (invoiceReportType.equalsIgnoreCase("2")) {
//				sqlString = "select IsPaymentCompleted,InvoiceID,OrderNum,PONum,RcvNum,EstNum,"
//						+ "ClientVendorID,BSAddressID,date_format(DateAdded,'%m-%d-%Y') as DateAdded,orderid,date_format(DateConfirmed,'%m-%d-%Y') as DateConfirmed,IsPrinted,Shipped,IsEmailed,Total,SalesRepID  "
//						+ "from bca_invoice as i where CompanyID ='" + compId
//						+ "' and invoiceStatus =0 and IsPaymentCompleted =1";// AND
//			} else if (invoiceReportType.equalsIgnoreCase("3")) {
//				sqlString = "select IsPaymentCompleted, InvoiceID,OrderNum,PONum,RcvNum,EstNum,"
//						+ "ClientVendorID,BSAddressID,date_format(DateAdded,'%m-%d-%Y') as DateAdded,orderid,date_format(DateConfirmed,'%m-%d-%Y') as DateConfirmed,IsPrinted,Shipped,IsEmailed,Total,SalesRepID  "
//						+ "from bca_invoice as i where CompanyID ='" + compId
//						+ "' and invoiceStatus =0 and IsPaymentCompleted =0"; // AND
//			} else {
//				sqlString = "select IsPaymentCompleted, InvoiceID,OrderNum,PONum,RcvNum,EstNum,"
//						+ "ClientVendorID,BSAddressID,date_format(DateAdded,'%m-%d-%Y') as DateAdded,orderid,date_format(DateConfirmed,'%m-%d-%Y') as DateConfirmed,IsPrinted,Shipped,IsEmailed,Total,SalesRepID  "
//						+ "from bca_invoice as i where CompanyID ='" + compId + "' and invoiceStatus =0 ";// AND
//			}
//
//			if (orderNoFrom != null && orderNoTo != null && !orderNoFrom.isEmpty() && !orderNoTo.isEmpty()) {
//				sqlString += " and i.OrderNum between " + orderNoFrom + " AND " + orderNoTo + " ";
//			}
//			if (oDate1 != null && oDate2 != null && oDate1.trim().length() > 1 && oDate2.trim().length() > 1) {
//				sqlString += "	and i.DateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
//						+ cinfo.string2date(oDate2) + "' ";
//			} else if (oDate1 != null && oDate1.trim().length() > 1) {
//				sqlString += "	and i.DateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
//						+ cinfo.string2date("now()") + "' ";
//			} else if (oDate2 != null && oDate2.trim().length() > 1) {
//				sqlString += "	and i.DateConfirmed <= '" + cinfo.string2date(oDate2) + "'  ";
//			}
//			if (saleDate1 != null && saleDate2 != null && saleDate1.trim().length() > 1
//					&& saleDate2.trim().length() > 1) {
//				sqlString += "	and i.DateAdded between '" + cinfo.string2date(saleDate1) + "' and '"
//						+ cinfo.string2date(saleDate2) + "'  ";
//			} else if (saleDate1 != null && saleDate1.trim().length() > 1) {
//				sqlString += "	and i.DateAdded between '" + cinfo.string2date(saleDate1) + "' and '"
//						+ cinfo.string2date("now()") + "' ";
//			} else if (saleDate2 != null && saleDate2.trim().length() > 1) {
//				sqlString += "	and i.DateAdded <= '" + cinfo.string2date(saleDate2) + "'  ";
//			}
//			if (searchTxt != null && !searchTxt.trim().isEmpty()) {
//				if (searchType.equals("2") || searchType.equals("3")) {
//					sqlString += " AND OrderNum LIKE '%" + searchTxt + "%' ";
//				}
//			}
//			if ("1".equalsIgnoreCase(marketID)) {
//				sqlString += "and i.OrderType=7";
//				mark = "eBay";
//			}
//			if ("2".equalsIgnoreCase(marketID)) {
//				sqlString += "and i.OrderType=5";
//				mark = "Amazon Seller";
//			}
//			if ("3".equalsIgnoreCase(marketID)) {
//				sqlString += "and i.OrderType=6";
//				mark = "Amazon Market";
//			}
//			if ("4".equalsIgnoreCase(marketID)) {
//				sqlString += "and i.OrderType=8";
//				mark = "Half.com";
//			}
//			if ("5".equalsIgnoreCase(marketID)) {
//				sqlString += "and i.OrderType=9";
//				mark = "Price Grabber";
//			}
//			// sqlString += " and i.IsSalestype=1";
//			sqlString += " and i.OrderNum > 0 and i.InvoiceTypeID=1 ORDER BY i.DateAdded DESC";
//
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sqlString);
//			while (rs.next()) {
//				SalesBoard d = new SalesBoard();
//				d.setInvoiceID(rs.getInt("InvoiceID"));
//				d.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
//				d.setOrderid(rs.getInt("orderid"));
//				d.setOrderNum(rs.getLong("OrderNum"));
//				String orderNo = (rs.getString("OrderNum"));
//				String yearPart = MyUtility.getYearPart(rs.getString("DateAdded"));
//				if (configDto.getIsSalePrefix().equals("on")) {
//					d.setOrderNumStr("IV".concat(yearPart).concat("-" + MyUtility.getOrderNumberByConfigData(orderNo,
//							AppConstants.InvoiceType, configDto, false)));
//				} else {
//					d.setOrderNumStr(
//							MyUtility.getOrderNumberByConfigData(orderNo, AppConstants.InvoiceType, configDto, false));
//				}
//				d.setPo_no(rs.getLong("PONum"));
//				d.setRcv_no(rs.getLong("RcvNum"));
//				d.setEst_no(rs.getLong("EstNum"));
//				d.setCvID(rs.getInt("ClientVendorID"));
//				d.setBsAddressID(rs.getInt("BSAddressID"));
//
//				d.setTransactionID(rs.getString("orderid"));
//				d.setDateAdded(rs.getString("DateAdded"));
//				d.setSaleDate(rs.getString("DateConfirmed"));
//				d.setPrinted(rs.getBoolean("IsPrinted"));
//				d.setShipped(rs.getInt("Shipped"));
//				d.setEmailed(rs.getInt("IsEmailed"));
//				d.setMarketPlaceName(mark);
//
//				BigDecimal number = new BigDecimal(String.valueOf(rs.getBigDecimal("Total")));
//				BigDecimal total = number.setScale(2, RoundingMode.HALF_UP);
//				d.setTotal(total);
////				d.setTotal(rs.getBigDecimal("Total").setScale(2));
//				String rep = rs.getString("SalesRepID");
//				if (rep != null) {
//					rs4 = stmt4.executeQuery("select Name from bca_salesrep where SalesRepID =" + rep);
//					while (rs4.next()) {
//						d.setRep(rs4.getString("Name"));
//					}
//				}
//				String sql2 = "SELECT a.LastName,a.FirstName,a.Email, b.Address1,b.Address2,b.City,b.State,b.Country,b.ZipCode,a.Name "
//						+ " FROM bca_clientvendor a, bca_billingaddress b  WHERE a.ClientVendorID = " + d.getCvID()
//						+ " and b.AddressID =" + d.getBsAddressID()
//						+ " and a.Active=1 and b.Active=1 and a.Status IN ('N', 'U') and b.Status IN ('N') and a.Deleted=0 and b.isDefault=1 ";
//
//				if (searchTxt != null && !searchTxt.trim().isEmpty()) {
//					if (searchType.equals("1")) {
//						sql2 += " AND (a.FirstName LIKE '%" + searchTxt + "%' OR a.LastName LIKE '%" + searchTxt
//								+ "%')";
//					} else if (searchType.equals("4")) {
//						sql2 += "AND (b.Address1 LIKE '%" + searchTxt + "%' OR b.Address2 LIKE '%" + searchTxt
//								+ "%' OR b.City LIKE '%" + searchTxt + "%' OR b.Country LIKE '%" + searchTxt + "%'))";
//					} else if (searchType.equals("5")) {
//						sql2 += "AND a.Name LIKE '%" + searchTxt + "%'";
//					} else if (searchType.equals("6")) {
//						sql2 += "AND a.Email LIKE '%" + searchTxt + "%'";
//					}
//				}
//				rs2 = stmt1.executeQuery(sql2);
//				while (rs2.next()) {
//					d.setFirstName(rs2.getString("FirstName"));
//					d.setLastName(rs2.getString("LastName"));
//					d.setAddress1(rs2.getString("Address1"));
//					d.setAddress2(rs2.getString("Address2"));
//					d.setCity(rs2.getString("City"));
//					d.setState(rs2.getString("State"));
//					d.setCountry(rs2.getString("Country"));
//					d.setZipCode(rs2.getString("ZipCode"));
//					d.setEmail(rs2.getString("Email"));
//					d.setCompanyName(rs2.getString("Name"));
//				}
//				if (searchTxt != null && !searchTxt.trim().isEmpty()) {
//					if (searchType.equals("1") && d.getFirstName() == null && d.getLastName() == null) {
//						continue;
//					} else if (searchType.equals("4") && d.getAddress1() == null && d.getAddress2() == null
//							&& d.getCity() == null && d.getCountry() == null) {
//						continue;
//					} else if (searchType.equals("5") && d.getCompanyName() == null) {
//						continue;
//					} else if (searchType.equals("6") && d.getEmail() == null) {
//						continue;
//					}
//				}
//
//				String sql3 = " select InventoryName, Qty  from bca_cart  where InvoiceID =" + d.getInvoiceID()
//						+ " and CompanyID = " + compId;
//				rs3 = stmt2.executeQuery(sql3);
//				int item_c = 0;
//				do {
//					if (!rs3.next())
//						break;
//					if (++item_c != 1)
//						continue;
//					d.setItemName(rs3.getString("InventoryName"));
//					d.setInventoryQty(rs3.getInt("Qty"));
//					break;
//				} while (true);
//				objList.add(d);
//			}
		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + ee.toString());

		}
//		finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (rs2 != null) {
//					db.close(rs2);
//				}
//				if (rs3 != null) {
//					db.close(rs3);
//				}
//				if (rs4 != null) {
//					db.close(rs4);
//				}
//				if (stmt != null) {
//					db.close(stmt);
//				}
//				if (stmt1 != null) {
//					db.close(stmt1);
//				}
//				if (stmt2 != null) {
//					db.close(stmt2);
//				}
//				if (stmt4 != null) {
//					db.close(stmt4);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return objList;
	}

	public ArrayList getSaleReportCustomerSearch(String cId, String invoiceReportType1, SalesBoardDto salesBoardDto) {

		String date1 = salesBoardDto.getOrderDate1();
		String date2 = salesBoardDto.getOrderDate2();
		String sDate1 = salesBoardDto.getSaleDate1();
		String sDate2 = salesBoardDto.getSaleDate2();
		String sTxt = salesBoardDto.getSearchTxt();
		String marketId = salesBoardDto.getFilterMarket();

		String sOpt1 = salesBoardDto.getSortType1();
		String sOpt2 = salesBoardDto.getSortType2();
		String sType1 = salesBoardDto.getSearchType();

		ArrayList<SalesBoard> objList = new ArrayList<>();
		Connection con = null;
		Statement stmt1 = null, stmt2 = null, stmt3 = null, stmt4 = null;
		ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		String sql = "";
		CustomerInfo info = new CustomerInfo();
		try {

			if ("1".equals(invoiceReportType1)) {
				double sales = 0.00;
				double ref = 0.00;
//				stmt1 = con.createStatement();

				StringBuffer query = new StringBuffer(
						"select cv from BcaClientvendor as cv left join BcaClientvendorservice as s where cv.clientVendorId = s.clientVendorId where"
								+ " (cv.status = 'U' or cv.status ='N' ) and cv.deleted = 0 cv.company.companyId = :companyId and cv.cvtypeId in (1,2)"
								+ ((date1 != null && date2 != null && date1.trim().length() > 1
										&& date2.trim().length() > 1)
												? " and cv.dateAdded between '" + info.string2date(date1) + "' and '"
														+ info.string2date(date2) + "'"
												: ""));
				TypedQuery<BcaClientvendor> typedQuery = this.entityManager.createQuery(query.toString(),
						BcaClientvendor.class);
				JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(cId));

				List<BcaClientvendor> clientvendorList = typedQuery.getResultList();
				for (BcaClientvendor cv : clientvendorList) {
					SalesBoard d = new SalesBoard();
					d.setCompanyName(cv.getClientVendorId().toString());
					d.setCvName(cv.getName() + " " + cv.getFirstName());
					sales = getBalanceForReportForCustoemr(cv.getClientVendorId(), cId);
					d.setSalesTotal(sales);
					ref = calculateRefundBalance(cv.getClientVendorId(), cId);
					d.setRefTotal(ref);
					d.setAdjTotal(sales - ref);
					objList.add(d);
				}

//				sql = "" + "SELECT cv.clientvendorid, " + "       cv.NAME, " + "       cv.firstname, "
//						+ "       cv.lastname, " + "       s.clientvendorid, " + "       s.serviceid "
//						+ "FROM   bca_clientvendor AS cv " + "       LEFT JOIN bca_clientvendorservice AS s "
//						+ "              ON cv.clientvendorid = s.clientvendorid " + "WHERE  ( cv.status = 'U' "
//						+ "          OR cv.status = 'N' ) " + "       AND cv.deleted =  0 "
//						+ "       AND cv.companyid = '" + cId + "'" + "       AND cv.cvtypeid IN ( 1, 2 )";
//				if (date1 != null && date2 != null && date1.trim().length() > 1 && date2.trim().length() > 1) {
//					sql += " AND cv.DateAdded BETWEEN '" + info.string2date(date1) + "' AND '" + info.string2date(date2)
//							+ "'";
//
//				}
//				
//
//				rs1 = stmt1.executeQuery(sql);
//				while (rs1.next()) {
//					SalesBoard d = new SalesBoard();
//					d.setCompanyName(rs1.getString(1));
//					d.setCvName(rs1.getString(2) + " " + rs1.getString(3));
//					sales = getBalanceForReportForCustoemr(rs1.getLong(1), cId);
//					d.setSalesTotal(sales);
//					ref = calculateRefundBalance(rs1.getLong(1), cId);
//					d.setRefTotal(ref);
//					d.setAdjTotal(sales - ref);
//					objList.add(d);
//				}
			} else if (invoiceReportType1.equals("2")) {
				int Soldqty = 0;
				double Soldamt = 0.0;
				int refqty = 0;
				double refAmt = 0.00;
				double adjusted_amt = 0.0;
				double totalsolamt = 0;
				stmt2 = con.createStatement();

				StringBuffer query = new StringBuffer(
						"select a from BcaIteminventory as a right join BcaIteminventory as b on a.parentId = b.inventoryId where "
								+ " a.company.companyId = :companyId and a.inventoryId <> -1 and a.active =1 "
								+ ((date1 != null && date2 != null && date1.trim().length() > 1
										&& date2.trim().length() > 1)
												? "and b.dateAdded between '" + info.string2date(date1) + "' and '"
														+ info.string2date(date2) + "'"
												: ""));

				TypedQuery<BcaIteminventory> typedQuery = this.entityManager.createQuery(query.toString(),
						BcaIteminventory.class);
				JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(cId));

				List<BcaIteminventory> bcaIteminventories = typedQuery.getResultList();
				for (BcaIteminventory itemInventory : bcaIteminventories) {
					SalesBoard d = new SalesBoard();
					d.setInventoryCode(itemInventory.getInventoryCode());
					d.setCategory(itemInventory.getIsCategory());
					d.setInventoryId(itemInventory.getInventoryId());
					if (!d.isCategory()) {
						List<BcaCart> bcaCart = bcaCartRepository
								.findByInventoryIdAndCompanyIdAndInvoiceStatus(d.getInventoryId(), Long.valueOf(cId));
						for (BcaCart cart : bcaCart) {
							int qty = cart.getQty();
							Soldqty = Soldqty + qty;
							Soldamt = Soldamt + qty * cart.getUnitPrice();
							List<BcaRmaitem> bcaRmaitems = bcaRmaitemRepository.findRmaItemByCardtId(cart.getCartId());
							for (BcaRmaitem bcaRmaitem : bcaRmaitems) {
								int qty_1 = bcaRmaitem.getRmaItemQty();
								refqty = refqty + qty_1;
								refAmt = refAmt + bcaRmaitem.getTotal();

							}

							adjusted_amt = Soldamt - refAmt;
							Soldqty = Soldqty - refqty;
							Soldamt = Soldamt - refAmt;
						}

					}
					d.setSoldQty(Soldqty);
					d.setSoldAmount(Double.parseDouble(new DecimalFormat("#0.00").format(Soldamt)));
					d.setRefundQty(refqty);
					d.setRefundAmt(refAmt);
					d.setAdjTotal(adjusted_amt);
					objList.add(d);

				}

//				---------------------------------------------------------------------------------------------------------------
//				sql = "" + "SELECT a.*, " + "       b.inventorycode AS Category " + "FROM   bca_iteminventory AS a "
//						+ "       RIGHT JOIN bca_iteminventory AS b " + "               ON a.parentid = b.inventoryid "
//						+ "WHERE  a.companyid = '" + cId + "'" + "       AND a.inventoryid <> -1 "
//						+ "       AND a.active = 1";
//				if (date1 != null && date2 != null && date1.trim().length() > 1 && date2.trim().length() > 1) {
//					sql += " AND b.DateAdded BETWEEN '" + info.string2date(date1) + "' AND '" + info.string2date(date2)
//							+ "'";
//
//				}
//
//				rs2 = stmt2.executeQuery(sql);
//				while (rs2.next()) {
//					SalesBoard d = new SalesBoard();
//					d.setInventoryCode(rs2.getString(4));
//					d.setCategory(rs2.getBoolean("isCategory"));
//					d.setInventoryId(rs2.getInt("InventoryID"));
//					if (!d.isCategory()) {
//
//						String sql1 = "" + "SELECT qty, " + "       unitprice, " + "       b.invoiceid, "
//								+ "       a.cartid " + "FROM   bca_cart a, " + "       bca_invoice b "
//								+ "WHERE  a.invoiceid = b.invoiceid " + "       AND b.invoicetypeid = 1 "
//								+ "       AND b.companyid = '" + cId + "'" + "       AND NOT ( b.invoicestatus = 1 ) "
//								+ "       AND inventoryid = " + d.getInventoryId();
//
//						stmt3 = con.createStatement();
//						rs3 = stmt3.executeQuery(sql1);
//						while (rs3.next()) {
//							Loger.log(sql1);
//							int qty = rs3.getInt("Qty");
//							Soldqty = Soldqty + qty;
//							Soldamt = Soldamt + qty * rs3.getDouble("UnitPrice");
//
//							String refund = "SELECT RmaItemQty,Total " + " FROM bca_rmaitem as a"
//									+ " INNER JOIN bca_rmamaster as b " + " ON a.RmaNo=b.RmaID " + " WHERE CartID = "
//									+ rs3.getInt("CartID") + " AND NOT (b.Status = 'Canceled')";
//							stmt4 = con.createStatement();
//							rs4 = stmt4.executeQuery(refund);
//							while (rs4.next()) {
//								int qty_1 = rs4.getInt("RmaItemQty");
//								refqty = refqty + qty_1;
//								refAmt = refAmt + rs4.getDouble("Total");
//							}
//
//							adjusted_amt = Soldamt - refAmt;
//							Soldqty = Soldqty - refqty;
//							Soldamt = Soldamt - refAmt;
//						}
//					}
//					d.setSoldQty(Soldqty);
//					d.setSoldAmount(Double.parseDouble(new DecimalFormat("#0.00").format(Soldamt)));
//					d.setRefundQty(refqty);
//					d.setRefundAmt(refAmt);
//					d.setAdjTotal(adjusted_amt);
//					objList.add(d);
//				}
			} else if (invoiceReportType1.equals("3")) {
				int IVID = -1;
				String invName = "";
				int qtyTotal = 0;
				double amtTotal = 0.0;
				double balTotal = 0.0;

				StringBuffer query = new StringBuffer(" select new " + SalesInvoiceBoardDto.class.getCanonicalName()
						+ "(cart.inventoryName , cart.dateAdded , cart.inventory.inventoryId , inv.orderNum , inv.memo , "
						+ " cv.name , cv.clientVendorId , cart.qty , cart.unitPrice , (cart.qty * cart.unitPrice ) as amount) from BcaCart as cart, "
						+ " BcaInvoice as inv , BcaClientvendor as cv  where (cv.status = 'U' or cv.status = 'N' ) and cv.deleted = 0 and "
						+ " inv.clientVendor.clientVendorId = cv.clientVendorId and inv.invoiceId= cart.invoice.invoiceId and not (inv.invoiceStatus = 1 ) "
						+ " and inv.invoiceType.invoiceTypeId = 1  and cart.inventory.inventoryId <> -1 and inv.company.companyId = :companyId ");

				TypedQuery<SalesInvoiceBoardDto> typedQuery = this.entityManager.createQuery(query.toString(),
						SalesInvoiceBoardDto.class);
				JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(cId));
				List<SalesInvoiceBoardDto> boards = typedQuery.getResultList();
				for (SalesInvoiceBoardDto dto : boards) {
					SalesBoard d = new SalesBoard();
					invName = dto.getInventoryName();
					/* d.setInventoryName(rs1.getString("InventoryName")); */
					d.setInventoryId(dto.getInventoryId());
					if (d.getInventoryId() == IVID || IVID == -1) {
						Loger.log(sql);
						d.setInventoryName(invName);
						IVID = d.getInventoryId();
						d.setCvName(dto.getName());
						d.setInventoryQty(dto.getQty());
						d.setAmount(dto.getAmount());
					} else {

						d.setInventoryId(dto.getInventoryId());
						d.setInventoryName(dto.getInventoryName());

						StringBuffer query1 = new StringBuffer(" select new "
								+ SalesInvoiceBoardDto.class.getCanonicalName()
								+ "(sum (cart.qty ) as qtySum , sum(cart.qty * cart.unitPrice) as amountSum) from BcaCart as cart , BcaInvoice as inv ,"
								+ " BcaClientvendor as cv where (cv.status = 'U' or cv.status = 'N' ) and cv.deleted = 0 and inv.clientVendor.clientVendorId = cv.clientVendorId "
								+ " and inv.invoice.invoiceId = cart.invoice.invoiceId and not (inv.invoiceStatus = 1) and inv.company.companyId = ':companyId  and "
								+ "inv.invoiceType.invoiceTypeId = 1 and cart.inventory.inventoryId = :inventoryId ");

						TypedQuery<SalesInvoiceBoardDto> typedQuery1 = this.entityManager
								.createNamedQuery(query1.toString(), SalesInvoiceBoardDto.class);
						JpaHelper.addParameter(typedQuery1, query1.toString(), "companyId", Long.valueOf(cId));
						JpaHelper.addParameter(typedQuery1, query1.toString(), "inventoryId", d.getInventoryId());

						SalesInvoiceBoardDto boardDto = typedQuery1.getSingleResult();
						if (null != boardDto) {
							qtyTotal = boardDto.getQtySum();
							amtTotal = boardDto.getAmountSum();
							balTotal = amtTotal;
							d.setQtyTotal(qtyTotal);
							d.setAmtTotal(amtTotal);
							d.setBalTotal(balTotal);
						}

						IVID = -1;

					}
					objList.add(d);
				}

//				sql = "" + "SELECT cart.inventoryname, " + "       cart.dateadded, " + "       cart.inventoryid, "
//						+ "       invoice.ordernum, " + "       invoice.memo, " + "       clientVendor.NAME, "
//						+ "       clientVendor.clientvendorid, " + "       cart.qty, " + "       cart.unitprice, "
//						+ "       ( cart.qty * cart.unitprice ) AS Amount " + "FROM   bca_cart AS cart, "
//						+ "       bca_invoice AS invoice, " + "       bca_clientvendor AS clientVendor "
//						+ "WHERE  ( clientVendor.status = 'U' " + "          OR clientVendor.status = 'N' ) "
//						+ "       AND clientVendor.deleted = 0 "
//						+ "       AND invoice.clientvendorid = clientVendor.clientvendorid "
//						+ "       AND invoice.invoiceid = cart.invoiceid "
//						+ "       AND NOT ( invoice.invoicestatus = 1 ) " + "       AND invoice.invoicetypeid = 1 "
//						+ "       AND cart.inventoryid <> -1 " + "       AND invoice.companyid = '" + cId + "'";

//				stmt1 = con.createStatement();
//				rs1 = stmt1.executeQuery(sql);
//				while (rs1.next()) {
//					SalesBoard d = new SalesBoard();
//					invName = rs1.getString("InventoryName");
//					/* d.setInventoryName(rs1.getString("InventoryName")); */
//					d.setInventoryId(rs1.getInt("InventoryID"));
//					if (d.getInventoryId() == IVID || IVID == -1) {
//						Loger.log(sql);
//						d.setInventoryName(invName);
//						IVID = d.getInventoryId();
//						d.setCvName(rs1.getString("Name"));
//						d.setInventoryQty(rs1.getInt("Qty"));
//						d.setAmount(rs1.getDouble("Amount"));
//					} else {
//
//						d.setInventoryId(rs1.getInt("InventoryID"));
//						d.setInventoryName(rs1.getString("InventoryName"));
//
//						String sql1 = "" + "SELECT Sum(cart.qty) AS QtySum, "
//								+ "       Sum(( cart.qty * cart.unitprice )) AS AmountSum "
//								+ "FROM   bca_cart AS cart, " + "       bca_invoice AS invoice, "
//								+ "       bca_clientvendor AS clientVendor " + "WHERE  ( clientVendor.status = 'U' "
//								+ "          OR clientVendor.status = 'N' ) " + "       AND clientVendor.deleted = 0 "
//								+ "       AND invoice.clientvendorid = clientVendor.clientvendorid "
//								+ "       AND invoice.invoiceid = cart.invoiceid "
//								+ "       AND NOT ( invoice.invoicestatus = 1 ) " + "       AND invoice.companyid = '"
//								+ cId + "'" + "       AND invoice.invoicetypeid = 1 " + "       AND cart.inventoryid = "
//								+ d.getInventoryId();
//
//						stmt2 = con.createStatement();
//						rs2 = stmt2.executeQuery(sql1);
//						if (rs2.next()) {
//							qtyTotal = rs2.getInt("QtySum");
//							amtTotal = rs2.getDouble("AmountSum");
//							balTotal = amtTotal;
//							d.setQtyTotal(qtyTotal);
//							d.setAmtTotal(amtTotal);
//							d.setBalTotal(balTotal);
//						}
//						IVID = -1;
//					}
//					objList.add(d);
//				}

			}
		} catch (Exception e) {
			Loger.log(e.toString());
		} finally {
			try {
				if (rs1 != null) {
					db.close(rs1);
				}
				if (rs2 != null) {
					db.close(rs2);
				}
				if (rs3 != null) {
					db.close(rs3);
				}
				if (rs4 != null) {
					db.close(rs4);
				}
				if (stmt1 != null) {
					db.close(stmt1);
				}
				if (stmt2 != null) {
					db.close(stmt2);
				}
				if (stmt3 != null) {
					db.close(stmt3);
				}
				if (stmt4 != null) {
					db.close(stmt4);
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

	public double getBalanceForReportForCustoemr(long cvId, String comId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		String sql = "";
		double bal = 0.00;
		try {
			bal = bcaInvoiceRepository.calculateSalesTotal((int) cvId, Long.valueOf(comId));

			// sql = "" + "SELECT Sum(inv.adjustedtotal) AS salesTotal " + "FROM bca_invoice
			// AS inv "
//					+ "WHERE  inv.clientvendorid =  " + cvId + "       AND inv.companyid = '" + comId + "'"
//					+ "       AND inv.invoicetypeid = 1 " + "       AND NOT ( inv.invoicestatus = 1 )";

//			con = db.getConnection();
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				bal = rs.getDouble(1);
//			}
		} catch (Exception e) {
			Loger.log(e.toString());
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
		return bal;
	}

	public double calculateRefundBalance(long cvId, String comId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		String sql = "";
		double refBal = 0.00;

		try {
			refBal = bcaRmamasterRepository.calculateRefundBalance((int) cvId, Long.valueOf(comId));

//			sql = "" + " SELECT Sum(item.total) AS refundTotal " + " FROM   bca_rmamaster AS master "
//					+ "       INNER JOIN bca_rmaitem AS item " + "               ON item.rmano = master.rmano "
//					+ " WHERE  master.companyid = '" + comId + "'" + "       AND clientvendorid =" + cvId
//					+ " GROUP  BY master.rmano";
//
//			con = db.getConnection();
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				refBal = rs.getDouble(1);
//			}
		} catch (Exception e) {
			Loger.log(e.toString());
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
		return refBal;
	}

	public ArrayList SalesReportByRep(String compId, String oDate1, String oDate2) {

//		Loger.log("From SalesRepInfo" + compId);
//		Connection con = null;
//		Statement stmt1 = null, stmt2 = null;
//		SQLExecutor db = new SQLExecutor();
		ArrayList<SalesBoard> objList = new ArrayList<SalesBoard>();
		ResultSet rs1 = null, rs2 = null;
//		con = db.getConnection();
		String sql1 = "";
		CustomerInfo cinfo = new CustomerInfo();
		try {
//			stmt1 = con.createStatement();
//			stmt2 = con.createStatement();

			StringBuffer query = new StringBuffer(
					"select bi.total ,sum(bc.qty) as qty ,bi.salesRepId from BcaInvoice as bi , BcaCart as bc where bi.company.companyId = :companyId "
							+ " and bi.invoiceId = bc.invoice.invoiceId and bi.invoiceType.invoiceTypeId = '1' and bi.orderNum > 0 and bi.invoiceStatus = 0 "
							+ ((oDate1 != null && oDate2 != null && oDate1.trim().length() > 1
									&& oDate2.trim().length() > 1)
											? " and bi.dateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
													+ cinfo.string2date(oDate2) + "' "
											: " ")
							+ ((oDate1 != null && oDate1.trim().length() > 1)
									? " and bi.dateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
											+ cinfo.string2date("now()") + "' "
									: " ")
							+ ((oDate2 != null && oDate2.trim().length() > 1)
									? " and bi.DateConfirmed <= '" + cinfo.string2date(oDate2) + "'  "
									: "")
							+ " group by bi.salesRepId , bi.total ");

			TypedQuery<SalesInvoiceBoardDtos> typedQuery = this.entityManager.createQuery(query.toString(),
					SalesInvoiceBoardDtos.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));
			List<SalesInvoiceBoardDtos> typeList = typedQuery.getResultList();
			Map<Integer, SalesSummary> salesSummary = typeList.stream()
					.collect(Collectors.groupingBy(SalesInvoiceBoardDtos::getSalesRepId, Collectors
							.reducing(new SalesSummary(), SalesInvoiceBoardDtos::toSalesSummary, SalesSummary::merge)));

			salesSummary.forEach((salesRepId, summary) -> {

				SalesBoard d = new SalesBoard();
				d.setTotal(new BigDecimal(summary.getTotal()).setScale(2));
				d.setInventoryQty(summary.getQty());
				String rep = salesRepId.toString();
				if (rep != null) {
					BcaSalesrep salesrep = bcaSalesrepRepository.findBySalesRepId(salesRepId);
					d.setRep(salesrep.getName());

				}
				objList.add(d);

			});

//			sql1 = "SELECT SUM(total) AS Total , SUM(qty) AS Qty ,salesRepId FROM ( SELECT Total total, SUM(Qty) qty, bi.SalesRepID salesRepId "
//					+ "FROM bca_invoice AS bi, bca_cart AS bc WHERE bi.companyId = '" + compId + "' "
//					+ "AND bi.InvoiceID = bc.InvoiceID " + "AND bi.InvoiceTypeID = '1' " + "AND bi.OrderNum > 0 "
//					+ "AND bi.invoiceStatus = 0 ";
//
//			if (oDate1 != null && oDate2 != null && oDate1.trim().length() > 1 && oDate2.trim().length() > 1) {
//
//				sql1 += "	and bi.DateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
//						+ cinfo.string2date(oDate2) + "' ";
//			} else if (oDate1 != null && oDate1.trim().length() > 1) {
//				sql1 += "	and bi.DateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
//						+ cinfo.string2date("now()") + "' ";
//			} else if (oDate2 != null && oDate2.trim().length() > 1) {
//				sql1 += "	and bi.DateConfirmed <= '" + cinfo.string2date(oDate2) + "'  ";
//
//			}
//			sql1 += "GROUP BY bi.SalesRepID, total)";
//			sql1 += "sales_summary ";
//			sql1 += "GROUP BY salesRepId";
//
//			stmt1 = con.createStatement();
//			rs1 = stmt1.executeQuery(sql1);
//
//			do {
//				if (!rs1.next())
//					break;
//				SalesBoard d = new SalesBoard();
//				d.setTotal(rs1.getBigDecimal("Total").setScale(2));
//				d.setInventoryQty(rs1.getInt("Qty"));
//				String rep = rs1.getString("salesRepId");
//				if (rep != null) {
//					String sql4 = "select Name from bca_salesrep where SalesRepID =" + rep;
//					rs2 = stmt2.executeQuery(sql4);
//					while (rs2.next()) {
//						d.setRep(rs2.getString("Name"));
//					}
//				}
//				objList.add(d);
//
//			} while (true);

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class SalesReportByRep and  method -SalesReportByRep " + " " + ee.toString());
		}
//		finally {
//			try {
//				if (rs1 != null) {
//					db.close(rs1);
//				}
//				if (stmt1 != null) {
//					db.close(stmt1);
//				}
//				if (rs2 != null) {
//					db.close(rs2);
//				}
//				if (stmt2 != null) {
//					db.close(stmt2);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return objList;

	}

//	@AllArgsConstructor
	@Data
	@NoArgsConstructor
	public static class SalesInvoiceBoardDtos {
		private Double total;
		private Integer qtySum;
		private Integer salesRepId;

        public SalesInvoiceBoardDtos(Double total, Integer qtySum, Integer salesRepId) {
            this.total = total;
            this.qtySum = qtySum;
            this.salesRepId = salesRepId;
        }

		public SalesSummary toSalesSummary() {
			return new SalesSummary(total, qtySum);
		}

		public Integer getSalesRepId() {
			return salesRepId;
		}

		// Additional getters and setters
	}

	// Your existing SalesSummary class
	@AllArgsConstructor
	@Data
	@NoArgsConstructor
	public static class SalesSummary {
		private Double total = 0.0;
		private Integer qtySum = 0;

		public SalesSummary merge(SalesSummary other) {
			this.total += other.total;
			this.qtySum += other.qtySum;
			return this;
		}

		public Double getTotal() {
			return total;
		}

		public Integer getQty() {
			return qtySum;
		}
	}

	public java.sql.Date getdate(String d) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		Date d1 = null;
		try {
			d1 = sdf.parse(d);

		} catch (ParseException e) {
			Loger.log(2, "ParseException" + e.getMessage());
		}

		return (new java.sql.Date(d1.getTime()));

	}

	public boolean update(HttpServletRequest request) {
		boolean result = false;
//		Connection con = null;
//		PreparedStatement pstmtUpdate = null;
//		SQLExecutor db = new SQLExecutor();
//
//		con = db.getConnection();
		int size = Integer.parseInt(request.getParameter("Size"));
		String orderValue = request.getParameter("OrderValue");
		String status = request.getParameter("StatusValue");

		try {
			for (int cnt = 0; cnt < size; cnt++) {
				int index1 = orderValue.indexOf(";");
				String temp1 = orderValue.substring(0, index1);
				Integer orderID = Integer.parseInt(temp1);
				orderValue = orderValue.substring(index1 + 1);

				int index2 = status.indexOf(";");
				String temp2 = status.substring(0, index2);
				status = status.substring(index2 + 1);

//				String updateQuery = "";
				int rows=0;

				if (temp2.equals("false"))
				bcaInvoiceRepository.updateShippedByOrderNum(0, orderID);
//					updateQuery = "update bca_invoice set  Shipped = 0 where OrderNum = ?";
				else
					bcaInvoiceRepository.updateShippedByOrderNum(1, orderID);
//					updateQuery = "update bca_invoice set  Shipped = 1 where OrderNum = ?";
//				pstmtUpdate = con.prepareStatement(updateQuery);
//				pstmtUpdate.setLong(1, orderID);
//				int rows = pstmtUpdate.executeUpdate();
				if (rows > 0) {
					result = true;
				}

			}

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
		} 
//		finally {
//			try {
//				if (pstmtUpdate != null) {
//					db.close(pstmtUpdate);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return result;
	}

	public ArrayList getRefundInvoiceReport(String compId, String oDate1, String oDate2) {
//		Connection con = null;
//		Statement stmt1 = null;
//		SQLExecutor db = new SQLExecutor();
		CustomerInfo cinfo = new CustomerInfo();
		ArrayList<SalesBoard> objList = new ArrayList<SalesBoard>();
//		ResultSet rs = null;
//		con = db.getConnection();
//		String sql1 = "";
		try {
//			stmt1 = con.createStatement();

			StringBuffer query = new StringBuffer("select new " + RefundInvoiceReportDto.class.getCanonicalName()
					+ " ref.orderNum, ref.dateAdded, ref.clientVendor.clientVendorId, cv.name, cv.firstName, cv.lastName , "
					+ " srep.name as srName, ref.refundReasonId, ref.orderPaymentType.paymentTypeId, ref.amount from ((BcaClientvendor  as cv inner join BcaRefundlist as ref "
					+ " on ref.clientVendor.clientVendorId = cv.clientVendorId) left join BcaSalesrep as srep on srep.salesRepId = ref.salesRep.salesRepId) where ref.status = 1 "
					+ " and  and ref.invoiceType.invoiceTypeId = 1 and (cv.status = 'U' or cv.status = 'N') and  cv.deleted = and ref.company.companyId = :companyId "
					+ ((oDate1 != null && oDate2 != null && oDate1.trim().length() > 1 && oDate2.trim().length() > 1)
							? "	and cv.dateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
									+ cinfo.string2date(oDate2) + "' "
							: " ")
					+ ((oDate1 != null && oDate1.trim().length() > 1) ? "	and cv.dateConfirmed between '"
							+ cinfo.string2date(oDate1) + "' and '" + cinfo.string2date("now()") + "' " : "")
					+ ((oDate2 != null && oDate2.trim().length() > 1)
							? "	and cv.dateConfirmed <= '" + cinfo.string2date(oDate2) + "'  "
							: " ")
					+ " group by cv.salesRep.salesRepId ");

			TypedQuery<RefundInvoiceReportDto> typedQuery = this.entityManager.createQuery(query.toString(),
					RefundInvoiceReportDto.class);
			JpaHelper.addParameter(typedQuery, typedQuery.toString(), "companyId", Long.valueOf(compId));

			List<RefundInvoiceReportDto> list = typedQuery.getResultList();
			for (RefundInvoiceReportDto dto : list) {
				SalesBoard d = new SalesBoard();
				d.setInvoiceID(dto.getOrderNum());
				d.setDateAdded(dto.getDateAdded().toString());
				d.setCvName(dto.getFirstName() + " " + dto.getLastName());
				d.setFirstName(dto.getFirstName());
				d.setLastName(dto.getLastName());
				d.setAmount(dto.getAmount());
				objList.add(d);
			}
//			sql1 = "SELECT ref.OrderNum, ref.DateAdded, ref.ClientVendorID, cv.Name,cv.FirstName,cv.LastName,srep.Name AS SRName, ref.RefundReasonID, "
//					+ "ref.OrderPaymentTypeID, ref.Amount " + "FROM ((bca_clientvendor AS cv INNER JOIN bca_refundlist "
//					+ "AS ref ON ref.ClientVendorID = cv.ClientVendorID) " + "LEFT JOIN bca_salesrep AS srep  "
//					+ "ON srep.SalesRepID = ref.SalesRepID) " + "WHERE ref.Status = 1  AND ref.InvoiceTypeID =1  "
//					+ "And (cv.Status='U' Or cv.Status='N')  " + "AND Deleted = 0  AND ref.CompanyID = " + compId;
//
//			
//			
//			if (oDate1 != null && oDate2 != null && oDate1.trim().length() > 1 && oDate2.trim().length() > 1) {
//
//				sql1 += "	and cv.DateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
//						+ cinfo.string2date(oDate2) + "' ";
//			} else if (oDate1 != null && oDate1.trim().length() > 1) {
//				sql1 += "	and cv.DateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
//						+ cinfo.string2date("now()") + "' ";
//			} else if (oDate2 != null && oDate2.trim().length() > 1) {
//				sql1 += "	and cv.DateConfirmed <= '" + cinfo.string2date(oDate2) + "'  ";
//
//			}
//			sql1 += "GROUP BY cv.SalesRepID, total)";
//			sql1 += "sales_summary ";
//			sql1 += "GROUP BY salesRepId";
//
//			stmt1 = con.createStatement();
//			rs = stmt1.executeQuery(sql1);
//
//			do {
//				if (!rs.next())
//					break;
//				SalesBoard d = new SalesBoard();
//				d.setInvoiceID(rs.getInt("OrderNum"));
//				d.setDateAdded(rs.getString("DateAdded"));
//				d.setCvName(rs.getString("FirstName") + " " + rs.getString("LastName"));
//				d.setFirstName(rs.getString("FirstName"));
//				d.setLastName(rs.getString("LastName"));
//				d.setAmount(rs.getDouble("Amount"));
//				objList.add(d);
//
//			} while (true);
		} catch (Exception ee) {
			Loger.log(2,
					" SQL Error in Class SalesReportByRep and  method -getRefundInvoiceReport " + " " + ee.toString());
		}

//		finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (stmt1 != null) {
//					db.close(stmt1);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return objList;
	}

}