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

import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.LabelValueBean;

/*
 * 
 */
public class Title {
	/*
	 * 
	 */
	public ArrayList getTitleList(String CompanyID) {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<LabelValueBean> arr = new ArrayList<>();
		try {
			pstmt = con.prepareStatement("select TitleID,Title from bca_title where CompanyID=? and Active=? order by TitleID Desc");
			pstmt.setString(1, CompanyID);
			pstmt.setString(2, "1");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				arr.add(new LabelValueBean(rs.getString("Title"), rs.getString("TitleID")));
			}
		} catch (SQLException ee) {
			Loger.log(2, "Error in  Class Title and  method -getTitleList " + ee.toString());
			ee.printStackTrace();
		}finally {
			try {
				if (rs != null) { db.close(rs); }
				if (pstmt != null) { db.close(pstmt); }
				if(con != null){ db.close(con); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return arr;
	}

	/*
	 * 
	 */
	public String getTitle(String TitleID) {
		String Title = null;
		Connection con = null ;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		if (db == null)
			Title = null;
		con = db.getConnection();

		if (con == null)
			Title = null;
		try {
			String sqlString = "select Title from bca_title where TitleID=? ";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, TitleID);
			rs = pstmt.executeQuery();
			if (rs.next())
				Title = rs.getString(1);
		} catch (SQLException ee) {
			Loger.log(2, "Error in  Class Title and  method -getTitle " + " "
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
				e.printStackTrace();
			}
		}

		return Title;
	}

}
