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

import org.apache.struts.util.LabelValueBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;

/*
 * 
 */
@Service
public class Rep {
	/*
	 * 
	 */
	
	@Autowired
	private BcaSalesrepRepository bcaSalesrepRepository;
	
	public ArrayList getRepList(String CompanyID) {
		ArrayList<LabelValueBean> arr = new ArrayList<LabelValueBean>();
		// boolean ret = false;
//		Connection con = null ;
//		PreparedStatement pstmt=null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		if (db == null)
//			arr = null;
//		con = db.getConnection();
//
//		if (con == null)
//			arr = null;

		try {
			List<BcaSalesrep> salesRep = bcaSalesrepRepository.findByCompany_CompanyIdAndActive(Long.valueOf(CompanyID), 1);
			for(BcaSalesrep bcaSalesrep: salesRep) {
				arr.add(new org.apache.struts.util.LabelValueBean(bcaSalesrep.getName()
						,String.valueOf(bcaSalesrep.getSalesRepId())));
			}
//			String sqlString = "select SalesRepID,Name from bca_salesrep  where CompanyID=? and Active=?";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, CompanyID);
//			pstmt.setString(2, "1");
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				arr.add(new org.apache.struts.util.LabelValueBean(rs
//						.getString("Name"), rs.getString("SalesRepID")));
//			}

		} catch (Exception ee) {
			Loger.log(2, "Error in  Class Rep and method -getRepList "+ ee.toString());
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
		return arr;
	}

	/*
	 * 
	 */
	public String getRep(String SalesRepID) {
		String SalesRep = null;
		Connection con = null ;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		if (db == null)
			SalesRep = null;
		con = db.getConnection();

		if (con == null)
			SalesRep = null;
		try {
			String sqlString = "select Name from bca_salesrep   where SalesRepID=? ";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, SalesRepID);
			rs = pstmt.executeQuery();
			if (rs.next())
				SalesRep = rs.getString(1);
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
		return SalesRep;
	}

}
