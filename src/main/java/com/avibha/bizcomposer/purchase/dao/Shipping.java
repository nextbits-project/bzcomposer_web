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
import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;

/*
 * 
 */
@Service
public class Shipping {
	/*
	 * 
	 */
	@Autowired 
	private BcaShipcarrierRepository bcaShipcarrierRepository;
	public ArrayList getShipCarrierList(String CompanyID) {
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
			List<BcaShipcarrier> bcaShipCarrier = bcaShipcarrierRepository.findByCompany_CompanyIdAndActive(Long.valueOf(CompanyID), 1);
			for(BcaShipcarrier shipcarrier: bcaShipCarrier) {
				arr.add(new org.apache.struts.util.LabelValueBean(shipcarrier.getName()
						, String.valueOf(shipcarrier.getShipCarrierId())));
			}
//			String sqlString = "select ShipCarrierID,Name from bca_shipcarrier where CompanyID=? and Active=?";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, CompanyID);
//			pstmt.setString(2, "1");
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				arr.add(new org.apache.struts.util.LabelValueBean(rs
//						.getString("Name"), rs.getString("ShipCarrierID")));
//			}
		} catch (Exception ee) {
			ee.printStackTrace();
			Loger.log(2, "Error in  Class Shipping and  method -getShipCarrierList "
					+ " " + ee.toString());
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
	public String getShipCarrier(String ShipCarrierID) {
		String ShipCarrier = null;
		Connection con = null ;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		if (db == null)
			ShipCarrier = null;
		con = db.getConnection();

		if (con == null)
			ShipCarrier = null;
		try {
			String sqlString = "select Name from bca_shipcarrier where ShipCarrierID=? ";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, ShipCarrierID);
			rs = pstmt.executeQuery();
			if (rs.next())
				ShipCarrier = rs.getString(1);
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
		return ShipCarrier;
	}

}
