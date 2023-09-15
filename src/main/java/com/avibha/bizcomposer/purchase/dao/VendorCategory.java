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

import org.apache.struts.util.LabelValueBean;

import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;

public class VendorCategory {
	
	public ArrayList getCVCategoryList(String CompanyID) {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<LabelValueBean> arr = new ArrayList<>();
		try {
			pstmt = con.prepareStatement("SELECT CVCategoryID,Name FROM bca_clientcategory where CompanyID=? and Active=? ORDER BY Name");
			pstmt.setString(1, CompanyID);
			pstmt.setString(2, "1");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				arr.add(new org.apache.struts.util.LabelValueBean(rs.getString("Name"), rs.getString("CVCategoryID")));
			}
			pstmt.close();
			rs.close();
		} catch (SQLException ee) {
			Loger.log(2, "Error in  Class VendorCategory and  method -getCVCategoryList " + ee.toString());
		} finally {
			db.close(con);
		}
		return arr;
	}

	public String CVCategory(String CVCategoryID) {
		String CVCategory = null;
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement("select Name from bca_clientcategory where CVCategoryID=? ");
			pstmt.setString(1, CVCategoryID);
			rs = pstmt.executeQuery();
			if (rs.next())
				CVCategory = rs.getString(1);
		} catch (SQLException ee) {
			Loger.log(2, "Error in  VendorCategory and  method -CVCategory " + ee.toString());
		} finally {
			db.close(con);
		}
		return CVCategory;
	}
	
	//new methods for customer group
	public ArrayList getCustomerGroupList() {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<LabelValueBean> arr = new ArrayList<>();
		
//        Statement stmt = null;
//        ResultSet rs = null;
        String sql = null;
//        vCustGroup = new Vector();
        try {
            sql = "SELECT CustomerGroupID, CustomerGroupName From bca_mastercustomergroup "
                    + "WHERE CustomerGroupID <> ? AND Active = ? Order By CustomerGroupID ";
        	pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "-1");
			pstmt.setString(2, "1");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				arr.add(new org.apache.struts.util.LabelValueBean(rs.getString("CustomerGroupName"), rs.getString("CustomerGroupID")));
			}
			pstmt.close();
			rs.close();
			
        } catch (SQLException e) {
        	Loger.log(2, "Error in  VendorCategory and  method -getCustomerGroupList " + e.toString());
        } finally {
        	db.close(con);
        }
        return arr;

    }

//    public int readCustomerGroupID(String groupName) {
//        Statement stmt = null;
//        ResultSet rs = null;
//        String sql = "SELECT CustomerGroupID From " + ConstValue.getSchemaName() + "bca_mastercustomergroup "
//                + "WHERE CustomerGroupName = '" + groupName + "' AND Active = 1 ";
//        try {
//            stmt = ConstValue.gConnection.createStatement();
//            logger.debug("sql query=>"+sql);
//            rs = stmt.executeQuery(sql);
//            while (rs.next()) {
//                return rs.getInt("CustomerGroupID");
//
//            }
//        } catch (SQLException e) {
//        	logger.error("error in query execution :"+sql);
//        	logger.error(e);
//        } finally {
//            try {
//                stmt.close();
//            } catch (SQLException se) {
//            	logger.error(se);
//            }
//        }
//        return -1;
//    }
}