package com.avibha.bizcomposer.sales.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.sales.forms.SalesBoardDto;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.MyUtility;
import com.nxsol.bzcomposer.company.domain.BcaCart;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.repos.BcaCartRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoiceRepository;
import com.nxsol.bzcomposer.company.utils.JpaHelper;

@Repository
public class SalesOrderBoardInfo {

	@Autowired
	private BcaCartRepository bcaCartRepository;

	@Autowired
	private BcaInvoiceRepository bcaInvoiceRepository;

	@Autowired
	private EntityManager entityManager;

	public ArrayList SalesRecordSearch(String compId, SalesBoardDto sform) {

		String oDate1 = sform.getOrderDate1();
		String oDate2 = sform.getOrderDate2();
		String saleDate1 = sform.getSaleDate1();
		String saleDate2 = sform.getSaleDate2();
		String searchType = sform.getSearchType();
		String searchTxt = sform.getSearchTxt();
		String orderNoFrom = sform.getOrderNoFrom();
		String orderNoTo = sform.getOrderNoTo();

		Loger.log("From SalesInfo" + compId);
//		Connection con = null;
//		Statement stmt = null, stmt1 = null, stmt2 = null;
//		SQLExecutor db = new SQLExecutor();
		ArrayList<SalesBoard> objList = new ArrayList<SalesBoard>();
		ResultSet rs = null, rs2 = null, rs3 = null;
//		con = db.getConnection();
		String mark = null;
		CustomerInfo cinfo = new CustomerInfo();
		ConfigurationInfo configInfo = new ConfigurationInfo();
		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		try {
//			stmt = con.createStatement();
//			stmt1 = con.createStatement();
//			stmt2 = con.createStatement();
			Loger.log("oDate1:" + oDate1 + " oDate2:" + oDate2);
			StringBuffer query = new StringBuffer(
					"select bi from BcaInvoice as bi where bi.company.companyId  = :companyId and bi.invoiceStatus =0  "
							+ (orderNoFrom != null && orderNoTo != null && !orderNoFrom.isEmpty()
									&& !orderNoTo.isEmpty()
											? " and i.sonum between " + orderNoFrom + " and " + orderNoTo
											: " ")
							+ (oDate1 != null && oDate2 != null && oDate1.trim().length() > 1
									&& oDate2.trim().length() > 1
											? " and bi.dateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
													+ cinfo.string2date(oDate2) + "' "
											: " ")
							+ (oDate1 != null && oDate1.trim().length() > 1
									? " and bi.dateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
											+ cinfo.string2date("now()") + "' "
									: " ")
							+ (oDate2 != null && oDate2.trim().length() > 1
									? " and bi.dateConfirmed <= '" + cinfo.string2date(oDate2) + "' "
									: " ")
							+ (saleDate1 != null && saleDate2 != null && saleDate1.trim().length() > 1
									&& saleDate2.trim().length() > 1
											? " and bi.dateAdded between '" + cinfo.string2date(saleDate1) + "' and '"
													+ cinfo.string2date(saleDate2) + "' "
											: " ")
							+ (saleDate1 != null && saleDate1.trim().length() > 1
									? " and bi.dateAdded between '" + cinfo.string2date(saleDate1) + "' and '"
											+ cinfo.string2date("now()") + "' "
									: "")
							+ (saleDate2 != null && saleDate2.trim().length() > 1
									? " and bi.dateAdded <= '" + cinfo.string2date(saleDate2) + "' "
									: " ")
							+ (searchTxt != null && !searchTxt.trim().isEmpty()
									? (searchType.equals("2") || searchType.equals("3")
											? " and bi.sonum LIKE '%" + searchTxt + "%' "
											: " ")
									: " "));

			query = query.append(" and bi.invoiceType.invoiceTypeId = 7 and bi.deleted = :deleted order by bi.sonum desc");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");

			TypedQuery<BcaInvoice> typedQuery = this.entityManager.createQuery(query.toString(), BcaInvoice.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));
			JpaHelper.addParameter(typedQuery, query.toString(), "deleted", 0);

			List<BcaInvoice> lists = typedQuery.getResultList();
			for (BcaInvoice bcaInvoice : lists) {
				SalesBoard d = new SalesBoard();
				d.setInvoiceID(bcaInvoice.getInvoiceId());
				if (null != bcaInvoice.getTotal())
					d.setTotal(new BigDecimal(bcaInvoice.getAdjustedTotal()).setScale(2, BigDecimal.ROUND_HALF_UP));
				if (null != bcaInvoice.getOrderid()) {
					d.setOrderid(Integer.parseInt(bcaInvoice.getOrderid().getOrderId()));
					d.setTransactionID(bcaInvoice.getOrderid().getOrderId());
				}
				if (null != bcaInvoice.getOrderNum())
					d.setOrderNum(bcaInvoice.getOrderNum());
				if (null != bcaInvoice.getSonum()) {
					d.setSo_no(bcaInvoice.getSonum()); // Sales Order Num

					String orderNo = (String.valueOf(bcaInvoice.getSonum()));
					d.setSoNumStr(MyUtility.getOrderNumberByConfigData(orderNo, AppConstants.SOType, configDto, false));
				}
				if (null != bcaInvoice.getPonum())
					d.setPo_no(bcaInvoice.getPonum());
				if (null != bcaInvoice.getRcvNum())
					d.setRcv_no(bcaInvoice.getRcvNum());
				if (null != bcaInvoice.getEstNum())
					d.setEst_no(bcaInvoice.getEstNum());
				if (null != bcaInvoice.getClientVendor())
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
				if (null != bcaInvoice.getIsInvoice())
					d.setIsInvoice(bcaInvoice.getIsInvoice());
				d.setMarketPlaceName(mark);

				StringBuffer query2 = new StringBuffer("select new " + SalesBoard.class.getCanonicalName()
						+ " (a.lastName, a.firstName, a.email, b.address1 , b.address2, b.city , b.state , b.country, b.zipCode, a.name) "
						+ " from BcaClientvendor a , BcaBillingaddress b where a.clientVendorId = :clientVendorId and b.addressId = :addressId "
						+ " and a.active =1 and b.active =1 and a.status in ('N' , 'U') and b.status in ('N','U') and a.deleted=0 and b.isDefault =1 ");

				if (searchTxt != null && !searchTxt.trim().isEmpty()) {

					query = query.append((searchType.equals("1")
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
					d.setInventoryCode(bcaCart.getInventoryCode());
					d.setInventoryQty(bcaCart.getQty());
					break;
				}

				objList.add(d);
			}

//			String sqlString = "select Total, InvoiceID,OrderNum,PONum,SONum,RcvNum,EstNum,"
//					+ "ClientVendorID,BSAddressID,date_format(DateAdded,'%m-%d-%Y') as DateAdded,orderid,date_format(DateConfirmed,'%m-%d-%Y') as DateConfirmed,IsPrinted,Shipped,IsInvoice  "
//					+ "from bca_invoice as i where CompanyID ='" + compId + "' and invoiceStatus =0 ";// AND
//
//			if (orderNoFrom != null && orderNoTo != null && !orderNoFrom.isEmpty() && !orderNoTo.isEmpty()) {
//				sqlString += " and i.SONum between " + orderNoFrom + " AND " + orderNoTo + " ";
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
//					sqlString += " AND SONum LIKE '%" + searchTxt + "%' ";
//				}
//			}
//			sqlString += " and i.InvoiceTypeID=7 ORDER BY i.SONum DESC"; // sales Order desc
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sqlString);
//			while (rs.next()) {
//				SalesBoard d = new SalesBoard();
//				d.setInvoiceID(rs.getInt("InvoiceID"));
//				d.setTotal(rs.getBigDecimal("Total").setScale(2));
//				d.setOrderid(rs.getInt("orderid"));
//				d.setOrderNum(rs.getLong("OrderNum"));
//				d.setSo_no(rs.getLong("SONum")); // Sales Order Num
//				String orderNo = (rs.getString("SONum"));
//				d.setSoNumStr(MyUtility.getOrderNumberByConfigData(orderNo, AppConstants.SOType, configDto, false));
//				d.setPo_no(rs.getLong("PONum"));
//				d.setRcv_no(rs.getLong("RcvNum"));
//				d.setEst_no(rs.getLong("EstNum"));
//				d.setCvID(rs.getInt("ClientVendorID"));
//				d.setBsAddressID(rs.getInt("BSAddressID"));
//				d.setDateAdded(rs.getString("DateAdded"));
//				d.setTransactionID(rs.getString("orderid"));
//				d.setSaleDate(rs.getString("DateConfirmed"));
//				d.setPrinted(rs.getBoolean("IsPrinted"));
//				d.setShipped(rs.getInt("Shipped"));
//				d.setIsInvoice(rs.getInt("IsInvoice"));
//				d.setMarketPlaceName(mark);
//
//				String sql2 = " select a.LastName,a.FirstName,a.Email, b.Address1,b.Address2,b.City,b.State,b.Country,b.ZipCode,a.Name"
//						+ " from bca_clientvendor a, bca_billingaddress b  where a.ClientVendorID = " + d.getCvID()
//						+ " and b.AddressID =" + d.getBsAddressID()
//						+ " and a.Active=1 and b.Active=1 and a.Status IN ('N', 'U') and b.Status IN ('N', 'U') and a.Deleted=0  and b.isDefault=1 ";
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
//				for (rs2 = stmt1.executeQuery(sql2); rs2.next();) {
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
//				String sql3 = " select InventoryName,InventoryCode, Qty  from bca_cart  where InvoiceID ="
//						+ d.getInvoiceID() + " and CompanyID = " + compId;
//
//				rs3 = stmt2.executeQuery(sql3);
//				int item_c = 0;
//				do {
//					if (!rs3.next())
//						break;
//					if (++item_c != 1)
//						continue;
//					d.setItemName(rs3.getString("InventoryName"));
//					d.setInventoryCode(rs3.getString("InventoryCode")); // report
//					d.setInventoryQty(rs3.getInt("Qty")); // report
//					Loger.log("IName=" + rs3.getString("Qty"));
//					break;
//				} while (true);
//				objList.add(d);
//
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());

		}
//		finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (rs2 != null) {
//					db.close(rs2);
//				}
//				if (rs2 != null) {
//					db.close(rs2);
//				}
//				if (stmt != null) {
//					db.close(stmt);
//				}
//				if (stmt2 != null) {
//					db.close(stmt2);
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
	
	public ArrayList layawaysRecordSearch(String compId, SalesBoardDto sform) {

		String oDate1 = sform.getOrderDate1();
		String oDate2 = sform.getOrderDate2();
		String saleDate1 = sform.getSaleDate1();
		String saleDate2 = sform.getSaleDate2();
		String searchType = sform.getSearchType();
		String searchTxt = sform.getSearchTxt();
		String orderNoFrom = sform.getOrderNoFrom();
		String orderNoTo = sform.getOrderNoTo();

		Loger.log("From SalesInfo" + compId);
		ArrayList<SalesBoard> objList = new ArrayList<SalesBoard>();
		ResultSet rs = null, rs2 = null, rs3 = null;
		String mark = null;
		CustomerInfo cinfo = new CustomerInfo();
		ConfigurationInfo configInfo = new ConfigurationInfo();
		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		try {
			Loger.log("oDate1:" + oDate1 + " oDate2:" + oDate2);
			StringBuffer query = new StringBuffer(
					"select bi from BcaInvoice as bi where bi.company.companyId  = :companyId and bi.invoiceStatus =0  "
							+ (orderNoFrom != null && orderNoTo != null && !orderNoFrom.isEmpty()
									&& !orderNoTo.isEmpty()
											? " and i.sonum between " + orderNoFrom + " and " + orderNoTo
											: " ")
							+ (oDate1 != null && oDate2 != null && oDate1.trim().length() > 1
									&& oDate2.trim().length() > 1
											? " and bi.dateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
													+ cinfo.string2date(oDate2) + "' "
											: " ")
							+ (oDate1 != null && oDate1.trim().length() > 1
									? " and bi.dateConfirmed between '" + cinfo.string2date(oDate1) + "' and '"
											+ cinfo.string2date("now()") + "' "
									: " ")
							+ (oDate2 != null && oDate2.trim().length() > 1
									? " and bi.dateConfirmed <= '" + cinfo.string2date(oDate2) + "' "
									: " ")
							+ (saleDate1 != null && saleDate2 != null && saleDate1.trim().length() > 1
									&& saleDate2.trim().length() > 1
											? " and bi.dateAdded between '" + cinfo.string2date(saleDate1) + "' and '"
													+ cinfo.string2date(saleDate2) + "' "
											: " ")
							+ (saleDate1 != null && saleDate1.trim().length() > 1
									? " and bi.dateAdded between '" + cinfo.string2date(saleDate1) + "' and '"
											+ cinfo.string2date("now()") + "' "
									: "")
							+ (saleDate2 != null && saleDate2.trim().length() > 1
									? " and bi.dateAdded <= '" + cinfo.string2date(saleDate2) + "' "
									: " ")
							+ (searchTxt != null && !searchTxt.trim().isEmpty()
									? (searchType.equals("2") || searchType.equals("3")
											? " and bi.sonum LIKE '%" + searchTxt + "%' "
											: " ")
									: " "));

			query = query.append(" and bi.invoiceType.invoiceTypeId = 18 and bi.deleted = :deleted order by bi.sonum desc");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");

			TypedQuery<BcaInvoice> typedQuery = this.entityManager.createQuery(query.toString(), BcaInvoice.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));
			JpaHelper.addParameter(typedQuery, query.toString(), "deleted", 0);

			List<BcaInvoice> lists = typedQuery.getResultList();
			for (BcaInvoice bcaInvoice : lists) {
				SalesBoard d = new SalesBoard();
				d.setInvoiceID(bcaInvoice.getInvoiceId());
				if (null != bcaInvoice.getTotal())
					d.setTotal(new BigDecimal(bcaInvoice.getAdjustedTotal()).setScale(2, BigDecimal.ROUND_HALF_UP));
				if (null != bcaInvoice.getOrderid()) {
					d.setOrderid(Integer.parseInt(bcaInvoice.getOrderid().getOrderId()));
					d.setTransactionID(bcaInvoice.getOrderid().getOrderId());
				}
				if (null != bcaInvoice.getOrderNum())
					d.setOrderNum(bcaInvoice.getOrderNum());
				if (null != bcaInvoice.getSonum()) {
					d.setSo_no(bcaInvoice.getSonum()); // Sales Order Num

					String orderNo = (String.valueOf(bcaInvoice.getSonum()));
					d.setSoNumStr(MyUtility.getOrderNumberByConfigData(orderNo, AppConstants.SOType, configDto, false));
				}
				if (null != bcaInvoice.getPonum())
					d.setPo_no(bcaInvoice.getPonum());
				if (null != bcaInvoice.getRcvNum())
					d.setRcv_no(bcaInvoice.getRcvNum());
				if (null != bcaInvoice.getEstNum())
					d.setEst_no(bcaInvoice.getEstNum());
				if (null != bcaInvoice.getClientVendor())
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
				if (null != bcaInvoice.getIsInvoice())
					d.setIsInvoice(bcaInvoice.getIsInvoice());
				d.setMarketPlaceName(mark);

				StringBuffer query2 = new StringBuffer("select new " + SalesBoard.class.getCanonicalName()
						+ " (a.lastName, a.firstName, a.email, b.address1 , b.address2, b.city , b.state , b.country, b.zipCode, a.name) "
						+ " from BcaClientvendor a , BcaBillingaddress b where a.clientVendorId = :clientVendorId and b.addressId = :addressId "
						+ " and a.active =1 and b.active =1 and a.status in ('N' , 'U') and b.status in ('N','U') and a.deleted=0 and b.isDefault =1 ");

				if (searchTxt != null && !searchTxt.trim().isEmpty()) {

					query = query.append((searchType.equals("1")
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
					d.setInventoryCode(bcaCart.getInventoryCode());
					d.setInventoryQty(bcaCart.getQty());
					break;
				}

				objList.add(d);
			}

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());

		}
		return objList;
	}
	
	public boolean updateSalesOrder(HttpServletRequest request)
	{
		 int count=0;
		
		String orderID[]=request.getParameter("DeletedSalesOrders").split(",");
		for (String orderid_str: orderID) {
			int SONum=Integer.parseInt(orderid_str);
			
		  count+= bcaInvoiceRepository.updateIsDeletedBySONum(1, SONum);
		}
		if(count>0)
			return true;
		else {
			 return false;
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

//		con = db.getConnection();
		int size = Integer.parseInt(request.getParameter("Size"));
		String orderValue = request.getParameter("OrderValue");
		String status = request.getParameter("StatusValue");

		try {
			for (int cnt = 0; cnt < size; cnt++) {
				int index1 = orderValue.indexOf(";");
				String temp1 = orderValue.substring(0, index1);
				long orderID = Long.parseLong(temp1);
				orderValue = orderValue.substring(index1 + 1);

				int index2 = status.indexOf(";");
				String temp2 = status.substring(0, index2);
				status = status.substring(index2 + 1);

				String updateQuery = "";
				int rows=0;
				if (temp2.equals("false"))
					bcaInvoiceRepository.updateIsInvoiceByOrderNum(0, (int) orderID);
				// updateQuery = "update bca_invoice set IsInvoice = 0 where OrderNum = ?";
				else
					bcaInvoiceRepository.updateIsInvoiceByOrderNum(1, (int) orderID);
				// updateQuery = "update bca_invoice set IsInvoice = 1 where OrderNum = ?";
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

}
