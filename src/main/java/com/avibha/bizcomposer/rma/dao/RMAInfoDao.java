/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.rma.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.rma.forms.RMADto;
import com.avibha.bizcomposer.sales.dao.CustomerInfo;
import com.avibha.bizcomposer.sales.dao.SalesBoard;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaCart;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.BcaRma;
import com.nxsol.bzcomposer.company.domain.BcaRmaitem;
import com.nxsol.bzcomposer.company.repos.BcaCartRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoiceRepository;
import com.nxsol.bzcomposer.company.repos.BcaRmaRepository;
import com.nxsol.bzcomposer.company.repos.BcaRmaitemRepository;
import com.nxsol.bzcomposer.company.utils.JpaHelper;

/*
 * 
 */
@Service
public class RMAInfoDao {
	@Autowired
	private EntityManager entityManager;

	@Autowired
	private BcaRmaRepository bcaRmaRepository;

	@Autowired
	private BcaClientvendorRepository bcaClientvendorRepository;

	@Autowired
	private BcaInvoiceRepository bcaInvoiceRepository;
	@Autowired
	private BcaCartRepository bcaCartRepository;

	public ArrayList getUserName(String compId) {
//		Connection con = null ;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
//		ResultSet rs = null;
		try {
//			con = db.getConnection();
			CustomerInfo cinfo = new CustomerInfo();
			List<BcaClientvendor> cvList = bcaClientvendorRepository.findUserName(Long.valueOf(compId));
			for (BcaClientvendor clientvendor : cvList) {
				RMADto rma = new RMADto();
				rma.setFname(clientvendor.getFirstName());
				rma.setLname(clientvendor.getLastName());
				objList.add(rma);
			}
//
//			String sqlString = "Select distinct clientvendor.FirstName,clientvendor.LastName " +
//					"					From   bca_clientvendor clientvendor ,  bca_invoice invoice \r\n" + 
//					"					 Where invoice.ClientVendorID= clientvendor.ClientVendorID \r\n" + 
//					"					and invoice.CompanyID like  ?" +  
//					"                    order by clientvendor.FirstName  ";
//			
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, compId);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				RMADto rma = new RMADto();
//				rma.setFname(rs.getString(1));
//				rma.setLname(rs.getString(2));
//				objList.add(rma);
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
		}
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
		return objList;
	}

	public ArrayList getOrderForRMACreate(String compId, String fname, String lname, String orderNo, String orderDate) {
//		Connection con = null ;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
		ResultSet rs = null;
		try {
//			con = db.getConnection();
			CustomerInfo cinfo = new CustomerInfo();
			StringBuffer query = new StringBuffer("select  distinct new " + RMADto.class.getCanonicalName()
					+ " (cv.firstName , cv.lastName , inv.orderNum ,  date_format(invoice.dateAdded,'%m/%d/%Y') as dateAdded , "
					+ " date_format(invoice.dateConfirmed,'%m/%d/%Y') as dateConfirmed  from BcaClientvendor as  cv join  BcaInvoice as inv on  inv.clientVendor.clientVendorId = "
					+ "  cv.clientVendorId where cv.status in ('N' ,'U') and cv.active =1 and inv.invoiceType.invoiceTypeId in (1,7) and inv.invoiceStatus =1 "
					+ " and inv.orderNum > 0 and inv.company.companyId like :companyId and inv.shipped =1  "
					+ ((fname != null && fname.trim().length() > 0) ? " and cv.firstName like '" + fname + "'" : "")
					+ ((lname != null && lname.trim().length() > 0) ? " and cv.lastName like '" + lname + "'" : " ")
					+ ((orderNo != null && orderNo.trim().length() > 0) ? " and in.orderNum like '" + orderNo + "'"
							: " ")
					+ ((orderDate != null && orderDate.trim().length() > 1)
							? " and in.dateAdded = '" + cinfo.string2date(orderDate) + "' "
							: " ")
					+ " order by clientvendor.firstName");

			TypedQuery<RMADto> typedQuery = this.entityManager.createQuery(query.toString(), RMADto.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));
			List<RMADto> dtos = typedQuery.getResultList();
			objList.addAll(dtos);

//			
//			String sqlString = "Select distinct clientvendor.FirstName,clientvendor.LastName , invoice.ordernum, date_format(invoice.DateAdded,'%m/%d/%Y') as DateAdded, \r\n" + 
//					"					date_format(invoice.DateConfirmed,'%m/%d/%Y') as DateConfirmed  \r\n" + 
//					"					From   bca_clientvendor clientvendor ,  bca_invoice invoice \r\n" + 
//					"					 Where invoice.ClientVendorID= clientvendor.ClientVendorID \r\n" + 
//					"                      AND clientvendor.status in ('N','U')   and clientvendor.Active = 1 and InvoiceTypeID in (1, 7 )\r\n" + 
//					"                      and invoiceStatus =1 and invoice.ordernum > 0 \r\n" + 
//					"					and invoice.CompanyID like ? \r\n" + 
//					"                    and shipped = 1 order by clientvendor.FirstName  ";
//
//			if (fname != null && fname.trim().length() > 0)
//				sqlString += " and clientvendor.FirstName like '" + fname + "'";
//
//			if (lname != null && lname.trim().length() > 0)
//				sqlString += " and clientvendor.LastName like '" + lname + "'";
//
//			if (orderNo != null && orderNo.trim().length() > 0)
//				sqlString += " and invoice.OrderNum like '" + orderNo + "'";
//
//			if (orderDate != null && orderDate.trim().length() > 1) {
//				sqlString += " and invoice.DateAdded = '"
//						+ cinfo.string2date(orderDate) + "' ";
//
//			}
//			
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, compId);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				RMADto rma = new RMADto();
//				rma.setFname(rs.getString(1));
//				rma.setLname(rs.getString(2));
//				rma.setRma(rs.getString(3));
//				rma.setOrderDate(rs.getString(4));
//				rma.setSentDate(rs.getString(5));
//				objList.add(rma);
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
		}
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
		return objList;
	}

	public ArrayList searchUserFName(String compId, String fname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
		ResultSet rs = null;
		try {
			con = db.getConnection();
			if (fname != null && fname.trim().length() > 0) {
				String sqlString = "Select distinct clientvendor.FirstName "
						+ " From   bca_clientvendor clientvendor ,  bca_invoice invoice "
						+ " Where invoice.ClientVendorID= clientvendor.ClientVendorID "
						+ " and invoice.CompanyID like ? and clientvendor.Active=1 and clientvendor.Status in ('U','N')"
						+ " and clientvendor.Deleted=0 and clientvendor.FirstName like '" + fname
						+ "%' order by clientvendor.FirstName ";

				pstmt = con.prepareStatement(sqlString);
				pstmt.setString(1, compId);
				Loger.log(sqlString);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					RMADto rma = new RMADto();
					rma.setFname(rs.getString(1));
					objList.add(rma);
				}
			}

		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class RMAInfo and  method -searchFName " + " " + ee.toString());
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

	public ArrayList searchUserLName(String compId, String lname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
		ResultSet rs = null;
		try {
			con = db.getConnection();
			if (lname != null && lname.trim().length() > 0) {
				String sqlString = "Select distinct clientvendor.LastName  "
						+ " From   bca_clientvendor clientvendor ,  bca_invoice invoice "
						+ " Where invoice.ClientVendorID= clientvendor.ClientVendorID "
						+ " and invoice.CompanyID like ? and clientvendor.Active=1 and "
						+ " clientvendor.Status in ('U','N') and clientvendor.Deleted=0 and "
						+ " clientvendor.LastName  like '" + lname + "%' order by clientvendor.LastName ";

				pstmt = con.prepareStatement(sqlString);
				pstmt.setString(1, compId);
				Loger.log(sqlString);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					RMADto rma = new RMADto();
					rma.setLname(rs.getString(1));
					objList.add(rma);
				}
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class RMAInfo and  method -searchFName " + " " + ee.toString());
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

	public ArrayList getRMASearch(String compId, String fname, String lname, String orderNo, String orderDate) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
//		ResultSet rs = null;
		CustomerInfo cinfo = new CustomerInfo();
		try {
			StringBuffer query = new StringBuffer("select distinct new " + RMADto.class.getCanonicalName()
					+ " (cv.firstName, cv.lastName , inv.orderNum "
					+ ", date_format(inv.dateAdded ,'%m/%d/%Y')as dateAdded , date_format(inv.dateconfirmed ,'%m/%d/%Y')as dateConfirmed ) "
					+ " from BcaClientvendor cv , BcaInvoice inv ,BcaCart cart where inv.clientVendor.clientVendorId = cv.clientVendorId and cart.invoice.invoiceId = inv.invoiceId "
					+ " and inv.company.companyId = :companyId "
					+ ((fname != null && fname.trim().length() > 0) ? " and cv.firstName like '" + fname + "'" : " ")
					+ ((lname != null && lname.trim().length() > 0) ? " and cv.lastName like '" + lname + "'" : " ")
					+ ((orderNo != null && orderNo.trim().length() > 0) ? " and inv.orderNum like '" + orderNo + "'"
							: " ")
					+ ((orderDate != null && orderDate.trim().length() > 1)
							? " and inv.dateAdded = '" + cinfo.string2date(orderDate) + "' "
							: " ")
					+ " and inv.orderNum > 0  and not (inv.invoiceStatus = 1) and inv.invoiceType.invoiceTypeId in (1,7) order by inv.invoiceId ");

			TypedQuery<RMADto> typedQuery = this.entityManager.createQuery(query.toString(), RMADto.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));
			objList.addAll(typedQuery.getResultList());

//			con = db.getConnection();
//			Loger.log("fname:" + fname + "  lname:" + lname + " orderNo:" + orderNo + " orderDate:" + orderDate);
//
//			String sqlString = "select distinct invoice.OrderNum,clientvendor.FirstName,"
//					+ "clientvendor.LastName, date_format(invoice.DateAdded,'%m/%d/%Y') as DateAdded,"
//					+ "date_format(invoice.DateConfirmed,'%m/%d/%Y') as DateConfirmed  From  bca_clientvendor clientvendor,  bca_invoice invoice, "
//					+ " bca_cart cart"
//					+ " Where invoice.ClientVendorID= clientvendor.ClientVendorID and cart.InvoiceID=invoice.InvoiceID "
//					+ " and invoice.CompanyID like ? ";
//
//			if (fname != null && fname.trim().length() > 0)
//				sqlString += " and clientvendor.FirstName like '" + fname + "'";
//
//			if (lname != null && lname.trim().length() > 0)
//				sqlString += " and clientvendor.LastName like '" + lname + "'";
//
//			if (orderNo != null && orderNo.trim().length() > 0)
//				sqlString += " and invoice.OrderNum like '" + orderNo + "'";
//
//			if (orderDate != null && orderDate.trim().length() > 1) {
//				sqlString += " and invoice.DateAdded = '" + cinfo.string2date(orderDate) + "' ";
//
//			}
//			sqlString += "AND invoice.OrderNum > 0 "; //
//
//			sqlString += "and not (invoice.invoiceStatus = 1) and  invoice.InvoiceTypeID	in (1,7) "
//					+ " order by invoice.InvoiceID";
//
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, compId);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				RMADto rma = new RMADto();
//				rma.setRma(rs.getString(1));
//				rma.setFname(rs.getString(2));
//				rma.setLname(rs.getString(3));
//				rma.setOrderDate(rs.getString(4));
//
//				rma.setSentDate(rs.getString(5));
//
//				objList.add(rma);
//			}
//			Loger.log("objList list size:" + objList.size());
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
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
		return objList;
	}

	public ArrayList getItemDetails(String compId, String OrderID) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
//		ResultSet rs = null;
		try {
//			con = db.getConnection();

			List<BcaCart> cartList = bcaCartRepository.findItemDetails(Long.valueOf(compId), Integer.valueOf(OrderID));
			for (BcaCart bcaCart : cartList) {
				RMADto rma = new RMADto();
				rma.setItemCode(bcaCart.getInventoryCode());
				rma.setItemDesc(bcaCart.getInventoryName());
				rma.setQty(bcaCart.getQty().toString());
				rma.setUnitPrice(String.valueOf(bcaCart.getUnitPrice()));
				rma.setUnitWeight(String.valueOf(bcaCart.getUnitWeight()));
				rma.setCartID(String.valueOf(bcaCart.getCartId()));
				objList.add(rma);
			}

//			String sqlString = " Select cart.InventoryCode,cart.InventoryName,cart.Qty,cart.UnitPrice, "
//					+ " cart.UnitWeight,cart.CartID from bca_cart cart,bca_invoice invoice "
//					+ " where cart.InvoiceID=invoice.InvoiceID and invoice.OrderNum like ? "
//					+ " and invoice.CompanyID like ? ";
//			Loger.log(sqlString);
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, OrderID);
//			pstmt.setString(2, compId);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				RMADto rma = new RMADto();
//				rma.setItemCode(rs.getString(1));
//				rma.setItemDesc(rs.getString(2));
//				rma.setQty(rs.getString(3));
//				rma.setUnitPrice(rs.getString(4));
//				rma.setUnitWeight(rs.getString(5));
//				rma.setCartID(rs.getString(6));
//				objList.add(rma);
//			}
			Loger.log("objList list size:" + objList.size());
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
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
		return objList;
	}

	public ArrayList getRMADetails(String compId, String OrderID) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
//		ResultSet rs = null;
		try {
//			con = db.getConnection();

			StringBuffer query = new StringBuffer("select distinct new " + RMADto.class.getCanonicalName()
					+ " (rma.rmaNo , cv.firstName ,cv.lastName "
					+ " cart.inventoryCode , cart .inventoryName , rma.rmaReason , rma.rmaQty , cart.unitPrice"
					+ " cart.unitWeight , rma.dateAdded ) from BcaClientvendor cv , BcaInvoice inv ,BcaCart  cart , BcaRma rma where inv.clientVendor.clientVendorId = "
					+ "cv.clientVendorId and cv.status in ('N','U') "
					+ " cv.active = 1 and rma.invoice.invoiceId = inv.invoiceId and rma.cart.cartId = cart.cartId "
					+ " and cart.invoice.invoiceId = inv.invoiceId and inv.orderNum like : orderNum "
					+ "and inv.company.companyId like :companyId order by rma.rmaNo asc ");

			TypedQuery<RMADto> typedQuery = this.entityManager.createQuery(query.toString(), RMADto.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));
			JpaHelper.addParameter(typedQuery, query.toString(), "orderNum", Integer.valueOf(OrderID));
			List<RMADto> rmaDtos = typedQuery.getResultList();

			objList.addAll(rmaDtos);

//			String sqlString = "Select distinct rma.RMA_no, clientvendor. FirstName, clientvendor. LastName,"
//					+ " cart.InventoryCode, cart.InventoryName, rma.RMA_reason, rma.RMA_qty,cart.UnitPrice ,cart.UnitWeight,  rma.DateAdded"
//					+ " From  bca_clientvendor clientvendor, bca_invoice invoice, bca_cart cart, bca_rma rma "
//					+ " Where invoice.ClientVendorID= clientvendor.ClientVendorID "
//					+ " and clientvendor.status in ('N','U') " + "  and clientvendor.Active = 1 "
//					+ "and rma.InvoiceID = invoice. InvoiceID and   rma.CartID =  cart.CartID "
//					+ " and cart.InvoiceID=invoice.InvoiceID and invoice.OrderNum like ?  "
//					+ "and invoice.CompanyID like ? order by RMA_no asc";
//
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, OrderID);
//			pstmt.setString(2, compId);
//			rs = pstmt.executeQuery();
//			Loger.log(sqlString);
//			while (rs.next()) {
//				RMADto rma = new RMADto();
//				rma.setRma(rs.getString(1));
//				rma.setFname(rs.getString(2));
//				rma.setLname(rs.getString(3));
//				rma.setItemCode(rs.getString(4));
//				rma.setItemDesc(rs.getString(5));
//				rma.setReason(rs.getString(6));
//				rma.setQty(rs.getString(7));
//				rma.setUnitPrice(rs.getString(8));
//				rma.setUnitWeight(rs.getString(9));
//				rma.setSentDate(rs.getString(10));
//				objList.add(rma);
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getFederalTax " + " " + ee.toString());
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

		return objList;
	}

	public ArrayList getRMAListNew(String compId, int invoiceTypeId, int startValue, int limit) {
		ArrayList<RMADto> rmaDtoList = new ArrayList<RMADto>();
		if (startValue > 0) {
			startValue -= 1;
		}
		try {
			Long companyId = Long.valueOf(compId);
			List<Object[]> results = bcaRmaRepository.findRmaListByCompanyId(companyId, invoiceTypeId, startValue,
					limit);

			for (Object[] result : results) {
				RMADto rmaDto = new RMADto((Integer) result[0], // rmaNo
						(String) result[1], // firstName
						(String) result[2], // lastName
						(String) result[3], // companyName
						(String) result[4], // inventoryCode
						(String) result[5], // inventoryName
						(String) result[6], // rmaReason
						(Integer) result[7], // rmaQty
						(Double) result[8], // unitPrice
						(Double) result[9], // unitWeight
						(String) result[10], // dateAdded
						(Integer) result[11] // orderNum/POnum
				);
				rmaDtoList.add(rmaDto);
			}

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class RMAInfo and  method -getRMAList " + " " + ee.toString());
		}
		return rmaDtoList;
	}

	public ArrayList getRMAList(String compId, int startValue, int limit) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
//		ResultSet rs = null;
//		int start = ((startValue - 1) * limit);
		try {
//			String sqlString = "Select distinct rma.RMA_no, clientvendor. FirstName, clientvendor. LastName,"
//					+ " cart.InventoryCode, cart.InventoryName, rma.RMA_reason, rma.RMA_qty ,cart.UnitPrice ,"
//					+ "cart.UnitWeight, date_format(rma.DateAdded,'%m/%d/%Y') as DateAdded,invoice.OrderNum"
//					+ " From  bca_clientvendor clientvendor, bca_invoice invoice, bca_cart cart,"
//					+ " bca_rma rma Where invoice.ClientVendorID= clientvendor.ClientVendorID and  clientvendor.status in ('N','U')   and clientvendor.Active = 1  and "
//					+ "rma.InvoiceID = invoice. InvoiceID and   rma.CartID =  cart.CartID "
//					+ " and invoice.CompanyID like ? order by rma.RMA_no asc limit ?,?";

			StringBuffer query = new StringBuffer(" select distinct new " + RMADto.class.getCanonicalName()
					+ " (rm.rmaNo , cv.firstName , cv.lastName , cv.name, cart.inventoryCode , "
					+ " cart.inventoryName , rm.rmaReason , rm.rmaQty , cart.unitPrice , cart.unitWeight ,  date_format(rm.dateAdded,'%m/%d/%Y') as dateAdded  , "
					+ "inv.orderNum) from BcaClientvendor cv , BcaInvoice inv , BcaCart cart , BcaRma rm where inv.clientVendor.clientVendorId = cv.clientVendorId and"
					+ " cv.status in ('N','U') and  cv.active = 1 and  "
					+ " rm.invoice.invoiceId = inv.invoiceId and rm.cart.cartId = cart.cartId and inv.company.companyId = :companyId order by rm.rmaNo asc  ");

			TypedQuery<RMADto> typedQuery = this.entityManager.createQuery(query.toString(), RMADto.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));
			typedQuery.setFirstResult((startValue - 1) * limit);
			typedQuery.setMaxResults(limit);
			objList.addAll(typedQuery.getResultList());

//			con = db.getConnection();

//
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, compId);
//			pstmt.setInt(2, start);
//			pstmt.setInt(3, limit);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				RMADto rma = new RMADto();
//				rma.setRma(rs.getString(1));
//				rma.setFname(rs.getString(2));
//				rma.setLname(rs.getString(3));
//				rma.setItemCode(rs.getString(4));
//				rma.setItemDesc(rs.getString(5));
//				rma.setReason(rs.getString(6));
//				rma.setQty(rs.getString(7));
//				rma.setUnitPrice(rs.getString(8));
//				rma.setUnitWeight(rs.getString(9));
//				String sentdate = rs.getString(10);
//				sentdate = sentdate.substring(0, 10);
//				rma.setSentDate(sentdate);
//				rma.setOrder(rs.getString(11));
//				objList.add(rma);
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class RMAInfo and  method -getRMAList " + " " + ee.toString());
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
		return objList;
	}

	public ArrayList getVendorRMAList(String compId, int invoiceTypeID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<RMADto> objList = new ArrayList<RMADto>();
		ResultSet rs = null;
		try {
			con = db.getConnection();
			String sqlString = "Select distinct rma.RMA_no, clientvendor. FirstName, clientvendor. LastName,"
					+ " cart.InventoryCode, cart.InventoryName, rma.RMA_reason, rma.RMA_qty ,cart.UnitPrice ,"
					+ "cart.UnitWeight, date_format(rma.DateAdded,'%m/%d/%Y') as DateAdded,invoice.OrderNum"
					+ " From  bca_clientvendor clientvendor, bca_invoice invoice, bca_cart cart,"
					+ " bca_rma rma Where invoice.ClientVendorID= clientvendor.ClientVendorID and  clientvendor.status in ('N','U')   and clientvendor.Active = 1  and "
					+ "rma.InvoiceID = invoice. InvoiceID and   rma.CartID =  cart.CartID "
					+ " and invoice.CompanyID like ? and invoice.InvoiceTypeID = ? order by rma.RMA_no asc";

			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, compId);
			pstmt.setInt(2, invoiceTypeID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RMADto rma = new RMADto();
				rma.setRma(rs.getString(1));
				rma.setFname(rs.getString(2));
				rma.setLname(rs.getString(3));
				rma.setItemCode(rs.getString(4));
				rma.setItemDesc(rs.getString(5));
				rma.setReason(rs.getString(6));
				rma.setQty(rs.getString(7));
				rma.setUnitPrice(rs.getString(8));
				rma.setUnitWeight(rs.getString(9));
				String sentdate = rs.getString(10);
				sentdate = sentdate.substring(0, 10);
				rma.setSentDate(sentdate);
				rma.setOrder(rs.getString(11));
				objList.add(rma);
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class RMAInfo and  method -getRMAList " + " " + ee.toString());
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

	public int calculatePages(long compId, int limit, int invoiceTypeID) {
		int records = 0;
		try {
			List<BcaRma> bcaRma = bcaRmaRepository.findByActiveAndInvoiceType_InvoiceTypeIdAndCompany_CompanyId(true,
					invoiceTypeID, compId);
			records = bcaRma.size();

		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class RMAInfo and  method -calculatePages " + " " + ee.toString());
		}
		return (records > 0) ? (int) Math.ceil((double) records / limit) : 0;
	}

//	public int calculatePages(long compId, int limit) {
////		Connection con = null;
////		PreparedStatement pstmt = null;
////		SQLExecutor db = new SQLExecutor();
////		int pages = 0;
//		int records = 0;
////		ResultSet rs = null;
//		try {
//
//			StringBuffer query = new StringBuffer(" select distinct new " + RMADto.class.getCanonicalName()
//					+ " (rm.rmaNo , cv.firstName , cv.lastName , cart.inventoryCode , "
//					+ " cart.inventoryName , rm.rmaReason , rm.rmaQty , cart.unitPrice , cart.unitWeight ,  date_format(rm.dateAdded,'%m/%d/%Y') as dateAdded  , "
//					+ "inv.orderNum) from BcaClientvendor cv , BcaInvoice inv , BcaCart cart , BcaRma rm where inv.clientVendor.clientVendorId = cv.clientVendorId and"
//					+ " rm.invoice.invoiceId = inv.invoiceId and rm.cart.cartId = cart.cartId and inv.company.companyId = :companyId order by rm.rmaNo asc  ");
//
//			TypedQuery<RMADto> typedQuery = this.entityManager.createQuery(query.toString(), RMADto.class);
//			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", Long.valueOf(compId));
//			List<RMADto> result = typedQuery.getResultList();
//			records = result.size();
////			con = db.getConnection();
////			
////			String sqlString = "Select distinct rma.RMA_no, clientvendor. FirstName, clientvendor. LastName,"
////					+ " cart.InventoryCode, cart.InventoryName, rma.RMA_reason, rma.RMA_qty ,cart.UnitPrice ,"
////					+ "cart.UnitWeight, date_format(rma.DateAdded,'%m/%d/%Y') as DateAdded,invoice.OrderNum"
////					+ " From  bca_clientvendor clientvendor, bca_invoice invoice, bca_cart cart,"
////					+ " bca_rma rma Where invoice.ClientVendorID= clientvendor.ClientVendorID and "
////					+ "rma.InvoiceID = invoice. InvoiceID and   rma.CartID =  cart.CartID "
////					+ " and invoice.CompanyID=? order by rma.RMA_no asc";
////
////			pstmt = con.prepareStatement(sqlString);
////			pstmt.setLong(1, compId);
////			rs = pstmt.executeQuery();
////			while (rs.next()) {
////				records++;
////			}
////			if (records > 0) {
////				pages = (int) Math.ceil((double) records / limit);
////			}
//		} catch (Exception ee) {
//			Loger.log(2, " SQL Error in Class RMAInfo and  method -calculatePages " + " " + ee.toString());
//		}
////		finally {
////			try {
////				if (rs != null) {
////					db.close(rs);
////				}
////				if (pstmt != null) {
////					db.close(pstmt);
////				}
////				if (con != null) {
////					db.close(con);
////				}
////			} catch (Exception e) {
////				Loger.log(e.toString());
////			}
////		}
//		return (records > 0) ? (int) Math.ceil((double) records / limit) : 0;
//	}

	public String getLastRMA() {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		String lastRMA = "";
//		ResultSet rs = null;
		try {
//			con = db.getConnection();
			BcaRma lastRecord = bcaRmaRepository.findLastRecordOrderByDateAddedDesc(PageRequest.of(0, 1)).get(0);
			if (lastRecord != null) {
				lastRMA = String.valueOf(lastRecord.getRmaNo());
			}

//			String sqlString = "select RMA_no " + " from  bca_rma order by DateAdded desc";
//			pstmt = con.prepareStatement(sqlString);
//			rs = pstmt.executeQuery();
//			Loger.log(sqlString);
//			if (rs.next()) {
//				lastRMA = rs.getString(1);
//			}
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class RMAInfo and  method -getLastRMA " + " " + ee.toString());
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
		return lastRMA;
	}

	public boolean isExistingRMA(String rma) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		boolean status = false;
//		ResultSet rs = null;
		try {
			status = bcaRmaRepository.findById(Integer.valueOf(rma)).isPresent();

//			con = db.getConnection();
//			String sqlString = "select RMA_no " + " from  bca_rma where RMA_no like ? ";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, rma);
//			rs = pstmt.executeQuery();
//			Loger.log(sqlString);
//			if (rs.next()) {
//				status = true;
//			}
//			pstmt.close();
//			rs.close();
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class RMAInfo and  method -isExistingRMA " + " " + ee.toString());
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
		return status;
	}

	public boolean insertRMA(String RMAno, String qty, String Reason, String cartId) {
		boolean valid = false;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		try {
			BcaRma bcaRma = new BcaRma();
			bcaRma.setRmaNo(Integer.valueOf(RMAno));
			bcaRma.setDateAdded(OffsetDateTime.now());
//			bcaRma.setRmaQty(Integer.valueOf(qty));
			bcaRma.setReasonText(Reason);
			Optional<BcaCart> bcaCart = bcaCartRepository.findById(Integer.valueOf(cartId));
			if (bcaCart.isPresent()) {
//				bcaRma.setCart(bcaCart.get());
				bcaRma.setInvoice(bcaCart.get().getInvoice());
			}

			BcaRma save = bcaRmaRepository.save(bcaRma);
			if (null != save) {
				valid = true;
			}
//			con = db.getConnection();
//			String sqlString = "insert into  bca_rma values(?,?,(Select InvoiceID from bca_cart where CartID ='"
//					+ cartId + "'),?,?,now())";
//			pstmt = con.prepareStatement(sqlString);
//			// setting parameters in the prepared statement
//			pstmt.setString(1, RMAno);
//			pstmt.setString(2, cartId);
//			pstmt.setString(3, qty);
//			pstmt.setString(4, Reason);
//
//			int num = pstmt.executeUpdate();
//			if (num > 0)
//				valid = true;
//			Loger.log(sqlString);
//			pstmt.close();
		} catch (Exception ee) {
			Loger.log("Error in update image in dvdinfo " + ee);
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
		return valid;
	}

	@Autowired
	private BcaRmaitemRepository bcaRmaitemRepository;

	public boolean insertRMAJpa(BcaInvoice bcaInvoice, String Reason) {
		boolean isCreated = false;
		try {
			BcaRma bcaRma = new BcaRma();
			bcaRma.setReasonText(Reason);
			bcaRma.setDateAdded(OffsetDateTime.now());
			if (bcaInvoice.getInvoiceType().getInvoiceTypeId() == 1) {
				bcaRma.setOrderNo(bcaInvoice.getOrderNum().toString());
			} else if (bcaInvoice.getInvoiceType().getInvoiceTypeId() == 2) {
				bcaRma.setOrderNo(bcaInvoice.getPonum().toString());
			} else {
				bcaRma.setOrderNo(bcaInvoice.getOrderNum().toString());
			}

			bcaRma.setInvoice(bcaInvoice);
			bcaRma.setInvoiceType(bcaInvoice.getInvoiceType());
			bcaRma.setClientVendor(bcaInvoice.getClientVendor());
			bcaRma.setStatus("Pending");
			bcaRma.setCompany(bcaInvoice.getCompany());
			bcaRma.setActive(true);

			BcaRma saveBcaRma = bcaRmaRepository.save(bcaRma);

			List<BcaCart> bcaCartList = bcaCartRepository.findByInvoice_InvoiceId(bcaInvoice.getInvoiceId());
			for (BcaCart cart : bcaCartList) {
				BcaRmaitem rmaItem = new BcaRmaitem();
				rmaItem.setRma(bcaRma);
				rmaItem.setCart(cart);
				rmaItem.setInventory(cart.getInventory());
				rmaItem.setInvName(cart.getInventoryName());
				rmaItem.setUnitPrice(cart.getUnitPrice());
				rmaItem.setRmaItemQty(cart.getQty()); // Assuming you have a quantity field
//	            rmaItem.setTotal(cart.getUnitPrice().multiply(new Double(cart.getQty())));
				rmaItem.setReason(bcaRma.getReason());
				rmaItem.setReasonText(bcaRma.getReasonText());
				rmaItem.setAction("Pending"); // Set appropriate action
//	            rmaItem.setSubstituteInvoiceOrderNumber(null); // Set as needed
				rmaItem.setPaymentCompleted(false);
				rmaItem.setPaidAmount(0.00);
				rmaItem.setBalance(0.00);
				rmaItem.setAdjusted(false);
				rmaItem.setTotalAdjustedQty(0);
				rmaItem.setDeleted(false);

				bcaRmaitemRepository.save(rmaItem);
			}

			if (null != saveBcaRma) {
				isCreated = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return isCreated;
	}

	public boolean insertRMA2(int qty, String Reason, int cartId) {
		boolean valid = false;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		try {
//			con = db.getConnection();
			BcaRma bcaRma = new BcaRma();
//			bcaRma.setRmaQty(qty);
			bcaRma.setReasonText(Reason);
			bcaRma.setDateAdded(OffsetDateTime.now());
			BcaCart bcaCart = bcaCartRepository.getOne(cartId);
			if (null != bcaCart) {
//				bcaRma.setCart(bcaCart);
				bcaRma.setInvoice(bcaCart.getInvoice());
			}

			BcaRma save = bcaRmaRepository.save(bcaRma);
			if (null != save) {
				valid = true;
			}
//			String sqlString = "insert into  bca_rma(CartId, InvoiceID, RMA_qty, RMA_reason, DateAdded) "
//					+ "values(?,(Select InvoiceID from bca_cart where CartID ='" + cartId + "'),?,?,now())";
//			pstmt = con.prepareStatement(sqlString);
//			// setting parameters in the prepared statement
//			pstmt.setInt(1, cartId);
//			pstmt.setInt(2, qty);
//			pstmt.setString(3, Reason);
//
//			int num = pstmt.executeUpdate();
//			if (num > 0)
//				valid = true;
//			Loger.log(sqlString);
//			pstmt.close();
		} catch (Exception ee) {
			Loger.log("Error in update image in dvdinfo " + ee);
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
		return valid;
	}

	public boolean deleteRMA(String RMAno) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
		boolean status = true;
//		Statement stmt = null;
		try {

			bcaRmaRepository.deleteById(Integer.valueOf(RMAno));
			Optional<BcaRma> bcarma = bcaRmaRepository.findById(Integer.valueOf(RMAno));
			if (bcarma.isPresent()) {
				status = false;
			}
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sqlString = "delete from bca_rma where RMA_no like '" + RMAno + "'";
//
//			// ResultSet rs = stmt.executeQuery(sqlString);
//			int num1 = stmt.executeUpdate(sqlString);
//			if (num1 > 0)
//				Loger.log(sqlString);
		} catch (Exception ee) {
			Loger.log("Error in Delete RMA transaction() " + ee);
		}
//		finally {
//			try {
//
//				if (stmt != null) {
//					db.close(stmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return status;
	}

	public int getInvoiceId(int orderNo, int invoiceTypeID, String compId) {
//		Connection con = null ;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
		int invoiceId = 0;
//		ResultSet rs = null;
		try {
//			con = db.getConnection();
			String sql = null;
			if (invoiceTypeID == 1) {

				invoiceId = bcaInvoiceRepository.findByCompanyIdAndOrderNum(Long.valueOf(compId), orderNo)
						.getInvoiceId();
//				sql = "SELECT InvoiceID FROM bca_invoice WHERE OrderNum = ? AND CompanyID = ?";
			} else if (invoiceTypeID == 2) {
				invoiceId = bcaInvoiceRepository.findByCompanyIdAndPoNum(Long.valueOf(compId), orderNo).getInvoiceId();
//				sql = "SELECT InvoiceID FROM bca_invoice WHERE PONum = ? AND CompanyID = ?";
			}
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, orderNo);
//			pstmt.setString(2, compId);
//			rs = pstmt.executeQuery();
//			Loger.log(sql);
//			if (rs.next()) {
//				invoiceId = rs.getInt(1);
//			}
//			pstmt.close();
//			rs.close();
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class RMAInfoDao and  method -getInvoiceId " + " " + ee.toString());
		}
//		finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if(con != null){
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
		return invoiceId;
	}

	public SalesBoard getInvoice(int invoiceId, String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null, pstmt2 = null;
//		SQLExecutor db = new SQLExecutor();
		SalesBoard salesBoard = new SalesBoard();
//		ResultSet rs = null, rs2 = null;
		try {
//			con = db.getConnection();
			Optional<BcaInvoice> bcaInvoice = bcaInvoiceRepository.findById(invoiceId);
			if (bcaInvoice.isPresent()) {
				BcaInvoice invoice = bcaInvoice.get();
				salesBoard.setInvoiceID(invoice.getInvoiceId());
				salesBoard.setPaymentCompleted(invoice.getIsPaymentCompleted());
				if (null != invoice.getOrderid()) {
					salesBoard.setOrderid(Integer.parseInt(invoice.getOrderid().getOrderId()));
					salesBoard.setTransactionID(invoice.getOrderid().getOrderId());
				}
				if (null != invoice.getOrderNum())
					salesBoard.setOrderNum(invoice.getOrderNum());
//				String orderNo = (invoice.getOrderNum().toString());
//				d.setOrderNum(Long.parseLong(orderNo));
				if (null != invoice.getPonum())
					salesBoard.setPo_no(invoice.getPonum());
				if (null != invoice.getRcvNum())
					salesBoard.setRcv_no(invoice.getRcvNum());
				if (null != invoice.getEstNum())
					salesBoard.setEst_no(invoice.getEstNum());
				if (null != invoice.getClientVendor())
					salesBoard.setCvID(invoice.getClientVendor().getClientVendorId());
				if (null != invoice.getBsaddressId())
					salesBoard.setBsAddressID(invoice.getBsaddressId());
				if (null != invoice.getDateAdded())
					salesBoard.setDateAdded(dateFormatter(invoice.getDateAdded()));
				if (null != invoice.getDateConfirmed())
					salesBoard.setSaleDate(dateFormatter(invoice.getDateConfirmed()));
				if (null != invoice.getIsPrinted())
					salesBoard.setPrinted(invoice.getIsPrinted());
				if (null != invoice.getShipped())
					salesBoard.setShipped(invoice.getShipped());
				if (null != invoice.getIsEmailed())
					salesBoard.setEmailed(invoice.getIsEmailed() ? 1 : 0);
				List<BcaCart> bcaCart = bcaCartRepository.findByInvoiceIdAndCompanyId(invoiceId, Long.valueOf(compId));
				if (!bcaCart.isEmpty()) {
					BcaCart cart = bcaCart.get(0);
					salesBoard.setInventoryId(cart.getCartId());
					salesBoard.setItemName(cart.getInventoryName());
					salesBoard.setInventoryQty(cart.getQty());
				}

			}

//			String sqlString = "select IsPaymentCompleted,InvoiceID,OrderNum,PONum,RcvNum,EstNum,"
//					+ "ClientVendorID,BSAddressID,date_format(DateAdded,'%m-%d-%Y') as DateAdded,orderid,date_format(DateConfirmed,'%m-%d-%Y') as DateConfirmed,IsPrinted,Shipped,IsEmailed,Total,SalesRepID  "
//					+ "from bca_invoice as i where InvoiceID = " + invoiceId;
//			pstmt = con.prepareStatement(sqlString);
//			rs = pstmt.executeQuery();
//			Loger.log(sqlString);
//			if (rs.next()) {
//				d.setInvoiceID(rs.getInt("InvoiceID"));
//				d.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
//				d.setOrderid(rs.getInt("orderid"));
//				d.setOrderNum(rs.getLong("OrderNum"));
//				String orderNo = (rs.getString("OrderNum"));
//				d.setOrderNum(Long.parseLong(orderNo));
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
//				String sql3 = " select CartID, InventoryName, Qty  from bca_cart  where InvoiceID =" + invoiceId
//						+ " and CompanyID = " + compId;
//				pstmt2 = con.prepareStatement(sql3);
//				rs2 = pstmt2.executeQuery();
//				if (rs2.next()) {
//					d.setInventoryId(rs2.getInt("CartID"));
//					d.setItemName(rs2.getString("InventoryName"));
//					d.setInventoryQty(rs2.getInt("Qty"));
//				}
//			}
//			pstmt.close();
//			rs.close();
		} catch (Exception ee) {
			Loger.log(2, " SQL Error in Class RMAInfoDao and  method -getInvoiceId " + " " + ee.toString());
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
		return salesBoard;
	}

	public int getCartId(int invoiceId, String compId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		int cartId = 0;
		ResultSet rs = null;
		try {
			con = db.getConnection();
			String sql = "select CartId  from bca_cart  where InvoiceID =" + invoiceId + " and CompanyID = " + compId;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Loger.log(sql);
			if (rs.next()) {
				cartId = rs.getInt(1);
			}
			pstmt.close();
			rs.close();
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class RMAInfoDao and  method -getInvoiceId " + " " + ee.toString());
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
		return cartId;
	}

	private String dateFormatter(OffsetDateTime dateTime) {
		// Define the desired date format
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");

		// Format the OffsetDateTime using the formatter
		String formattedDate = dateTime.format(formatter);
		return formattedDate;
	}
}
