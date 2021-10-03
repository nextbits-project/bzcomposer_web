/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.struts.util.LabelValueBean;

import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;

public class FilingState {

	/*
	 * Put the Comments
	 */
	public ArrayList getFilingStateList(String CompanyID) {
		ArrayList<LabelValueBean> arr = new ArrayList<LabelValueBean>();
		// boolean ret = false;
		Connection con = null ;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		if (db == null)
			arr = null;
		con = db.getConnection();

		if (con == null)
			arr = null;

		try {
			String sqlString = "select FilingStateID,FilingState from bcp_filingstate where CompanyID=? and Active=?";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, CompanyID);
			pstmt.setString(2, "1");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				arr.add(new org.apache.struts.util.LabelValueBean(rs
						.getString("FilingState"), rs
						.getString("FilingStateID")));
			}

		} catch (SQLException ee) {
			Loger.log(2, "Error in  method -getFilingStateList " + " "
					+ ee.toString());
		} finally {
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
				e.printStackTrace();
			}
		}

		return arr;
	}

	/*
	 * Put the method comments
	 */
	public String getFilingState(String FilingStateID) {
		String FilingState = null;
		Connection con = null ;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		if (db == null)
			FilingState = null;
		con = db.getConnection();

		if (con == null)
			FilingState = null;
		try {
			String sqlString = "select FilingState from bcp_filingstate where FilingStateID=? ";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, FilingStateID);
			rs = pstmt.executeQuery();
			if (rs.next())
				FilingState = rs.getString(1);
		} catch (SQLException ee) {
			Loger.log(2, "Error in  Class Title and  method -getFilingState "
					+ " " + ee.toString());
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
				e.printStackTrace();
			}
		}

		return FilingState;
	}
}
