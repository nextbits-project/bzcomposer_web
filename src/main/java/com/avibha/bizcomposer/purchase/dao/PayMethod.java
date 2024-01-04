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
import java.util.ArrayList;
import java.util.List;

import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;
import org.apache.struts.util.LabelValueBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;

/*
 * 
 */
@Service
public class PayMethod {
	
	/*		The method provides the payment type list
	 * with id and name.  				
	 */
	
	@Autowired
	private BcaPaymenttypeRepository bcaPaymenttypeRepository;
	public ArrayList getPaymentTypeList(String CompanyID) {
		//ArrayList<LabelValueBean> arr = new ArrayList<LabelValueBean>();
		ArrayList<TblPaymentType> arr1 = new ArrayList<TblPaymentType>();
//		Connection con = null ;
//		PreparedStatement pstmt=null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		if (db == null)
//			//arr = null;
//			arr1 = null;
//		con = db.getConnection();
//
//		if (con == null)
//			//arr = null;
//			arr1 = null;
		try {
			List<BcaPaymenttype> bcaPaymenttype = bcaPaymenttypeRepository.findByCompany_CompanyIdAndActiveAndTypeCategoryOrderByName(Long.valueOf(CompanyID), 1, 1);;
			for(BcaPaymenttype paymenttype:bcaPaymenttype) {
				TblPaymentType tblpaymnt = new TblPaymentType();
				tblpaymnt.setId(paymenttype.getPaymentTypeId());
				tblpaymnt.setTypeName(paymenttype.getName());
				arr1.add(tblpaymnt);
			}
//			String sqlString = "select paymentTypeID,Name from bca_paymenttype  where CompanyID=? and Active=?";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, CompanyID);
//			pstmt.setString(2, "1");
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				//arr.add(new org.apache.struts.util.LabelValueBean(rs
//						//.getString("Name"), rs.getString("paymentTypeID")));
//				TblPaymentType tblpaymnt = new TblPaymentType();
//				tblpaymnt.setId(Integer.parseInt(rs.getString("paymentTypeID")));
//				tblpaymnt.setTypeName(rs.getString("Name"));
//				arr1.add(tblpaymnt);
//			}
//			pstmt.close();
//			rs.close();
		} catch (Exception ee) {
			Loger.log(2, "Error in  Class PayMethod and  method -getPaymentTypeList "+ ee.toString());
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

		return arr1;
	}

	/*		The method provides the name of payment type
	 * from its id. 
	 * 
	 */
	public String getPaymentType(String paymentTypeID) {
		String paymentType = null;
		Connection con = null ;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		if (db == null)
			paymentType = null;
		con = db.getConnection();

		if (con == null)
			paymentType = null;
		try {
			String sqlString = "select Name from bca_paymenttype where paymentTypeID=? ";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, paymentTypeID);
			rs = pstmt.executeQuery();
			if (rs.next())
				paymentType = rs.getString(1);
		} catch (SQLException ee) {
			Loger.log(2, "Error in  Class Rep and  method -getRep " + " "
					+ ee.toString());
		}finally {
			try {
				if (rs != null) {
					db.close(rs);
					}
				if (pstmt != null) {
					db.close(pstmt);
					}
					if(con != null){
					db.close(con);
					}
				} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

		return paymentType;
	}

}
