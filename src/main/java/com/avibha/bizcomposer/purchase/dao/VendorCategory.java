/*
 * Author : Avibha IT Solutions Copyright 2006 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.purchase.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.struts.util.LabelValueBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaClientcategory;
import com.nxsol.bzcomposer.company.domain.BcaMastercustomergroup;
import com.nxsol.bzcomposer.company.repos.BcaClientcategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaMastercustomergroupRepository;

@Service
public class VendorCategory {

	@Autowired
	private BcaMastercustomergroupRepository bcaMastercustomergroupRepository;
	
	@Autowired
	private BcaClientcategoryRepository bcaClientcategoryRepository;
	


	public ArrayList getCVCategoryList(String CompanyID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
		ArrayList<LabelValueBean> arr = new ArrayList<>();
		try {
			List<BcaClientcategory> bcaClientcategories = bcaClientcategoryRepository
					.findByCompany_CompanyIdAndActive(Long.parseLong(CompanyID), 1);
			for (BcaClientcategory bcaClientcategory : bcaClientcategories) {
				arr.add(new org.apache.struts.util.LabelValueBean(bcaClientcategory.getName(),
						String.valueOf(bcaClientcategory.getCvcategoryId())));
			}
//			pstmt = con.prepareStatement(
//					"SELECT CVCategoryID,Name FROM bca_clientcategory where CompanyID=? and Active=? ORDER BY Name");
//			pstmt.setString(1, CompanyID);
//			pstmt.setString(2, "1");
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				arr.add(new org.apache.struts.util.LabelValueBean(rs.getString("Name"), rs.getString("CVCategoryID")));
//			}
//			pstmt.close();
//			rs.close();
		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, "Error in  Class VendorCategory and  method -getCVCategoryList " + ee.toString());
		} 
//		finally {
//			db.close(con);
//		}
		return arr;
	}

	public String CVCategory(String CVCategoryID) {
		String CVCategory = null;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt;
		try {
			Optional<BcaClientcategory> category = bcaClientcategoryRepository.findById(Integer.parseInt(CVCategoryID));
			if(category.isPresent()) {
				CVCategory = category.get().getName();
			}
//			pstmt = con.prepareStatement("select Name from bca_clientcategory where CVCategoryID=? ");
//			pstmt.setString(1, CVCategoryID);
//			rs = pstmt.executeQuery();
//			if (rs.next())
//				CVCategory = rs.getString(1);
		} catch (Exception ee) {
			Loger.log(2, "Error in  VendorCategory and  method -CVCategory " + ee.toString());
		}
//		finally {
//			db.close(con);
//		}
		return CVCategory;
	}

	// new methods for customer group
	public ArrayList getCustomerGroupList() {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
		ArrayList<LabelValueBean> arr = new ArrayList<>();

//        Statement stmt = null;
//        ResultSet rs = null;
		String sql = null;
//        vCustGroup = new Vector();
		try {
			
			
			List<BcaMastercustomergroup> customerGroup = bcaMastercustomergroupRepository.findByCustomerGroupIdNotAndActiveOrderByCustomerGroupId(-1, 1);
			for(BcaMastercustomergroup mcg:customerGroup) {
			
					arr.add(new org.apache.struts.util.LabelValueBean(mcg.getCustomerGroupName(),
							String.valueOf(mcg.getCustomerGroupId())));
			}
			
//			sql = "SELECT CustomerGroupID, CustomerGroupName From bca_mastercustomergroup "
//					+ "WHERE CustomerGroupID <> ? AND Active = ? Order By CustomerGroupID ";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, "-1");
//			pstmt.setString(2, "1");
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				arr.add(new org.apache.struts.util.LabelValueBean(rs.getString("CustomerGroupName"),
//						rs.getString("CustomerGroupID")));
//			}
//			pstmt.close();
//			rs.close();

		} catch (Exception e) {
			Loger.log(2, "Error in  VendorCategory and  method -getCustomerGroupList " + e.toString());
		} 
//		finally {
//			db.close(con);
//		}
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