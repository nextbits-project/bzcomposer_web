package com.avibha.bizcomposer.registration.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.login.forms.MultiUserForm;
import com.avibha.common.City;
import com.avibha.common.Country;
import com.avibha.common.State;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.ConstValue;
import com.avibha.common.utility.MyUtility;
import com.nxsol.bzcomposer.company.ConfigurationDAO;

public class RegistrationDAOImpl implements RegistrationDAO {

	public boolean isUserExists(String userName) {
		Loger.log(this + "isUserExists");
		Statement stmt = null;
		ResultSet rs = null;
		SQLExecutor db = null;
		Connection con = null;
		Connection c = null;
		try {
			String sql = "SELECT LoginID FROM bca_user where LoginID = '" + userName + "'";
			db = new SQLExecutor();
			con = db.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return false;
	}

	public boolean isEmailExists(String emailId) {
		Loger.log(this + "isEmailExists");
		Statement stmt = null;
		ResultSet rs = null;
		SQLExecutor db = new SQLExecutor();
		Connection c = db.getConnection();
		try {
			stmt = c.createStatement();
			rs = stmt.executeQuery("SELECT Email_Address FROM bca_user where Email_Address = '" + emailId + "'");
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
				}
				if (c != null) {
					db.close(c);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return false;
	}

	public int addUserInformation(MultiUserForm user) {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null, pstmt2 = null, pstmt3 = null;
		ResultSet rs = null;
		int userID = 0;
		String sql = "INSERT INTO bca_user (LoginID, Password,Confirm_Password,Email_Address,Company_Name,Legal_Name,TaxID,Address1,Address2,City,State,Zip,"
				+ "Country,Phone,Fax,Province,Firstname,Lastname,membershipLevel,jobPosition,DateAdded,DateExpiry,Active,CompanyID)"
				+ " Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getConfirmPassword());
			pstmt.setString(4, user.getEmailAddress());
			pstmt.setString(5, user.getCompanyName());
			pstmt.setString(6, user.getNickName());
			pstmt.setString(7, com.nxsol.bizcomposer.common.ConstValue.hateNull(user.getTaxID()));
			pstmt.setString(8, user.getAddress1());
			pstmt.setString(9, user.getAddress2());
			pstmt.setString(10, user.getCity());
			pstmt.setString(11, user.getState());
			pstmt.setString(12, user.getZip());
			pstmt.setString(13, user.getCountry());
			pstmt.setString(14, user.getPhone());
//			pstmt.setString(15, user.getCellPhone());
//			pstmt.setBoolean(16, user.isSameAsPhoneNumber());
			pstmt.setString(15, user.getFax());
			pstmt.setString(16, user.getProvince());
			pstmt.setString(17, user.getFirstName());
			pstmt.setString(18, user.getLastName());
			pstmt.setString(19, user.getMembershipLevel());
			pstmt.setString(20, user.getJobPosition());
//			String dateAdded = user.getDateAdded();
			pstmt.setDate(21, MyUtility.string2Date(" now() "));
			// java.sql.Date sqlExpiryDate = java.sql.Date.valueOf(user.getDateExpiry()); //
			// Convert LocalDate to java.sql.Date
//	        pstmt.setDate(22, sqlExpiryDate);
			pstmt.setDate(22, MyUtility.string2Date(user.getDateExpiry()));
			pstmt.setBoolean(23, true);
			pstmt.setInt(24, user.getCompanyID());
			pstmt.executeUpdate();

			ResultSet generatedKeys = pstmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				userID = generatedKeys.getInt(1);
			}
			
//			pstmt2 = con.prepareStatement("SELECT MAX(ID) AS LastID FROM bca_user");
//			rs = pstmt2.executeQuery(); // userIdStmt.executeQuery("SELECT @@IDENTITY AS LastID");
//			while (rs.next()) {
//				userID = rs.getInt("LastID");
//				// userID = rs.getInt("LastID")+1;
//			}
			ConfigurationDAO confgDao = new ConfigurationDAO();
			ConfigurationDto configDto = new ConfigurationDto();
			configDto.setGroupName("Admin");
			configDto.setDescription("Admin");
			configDto.setGroupPermissions("1111111111111111111111111111111111111111111");

			int groupID = confgDao.saveUserGroupDetailsID(Long.valueOf(user.getCompanyID()), configDto);

			pstmt3 = con
					.prepareStatement("INSERT INTO bca_usermapping (CompanyID,UserGroupID,UserID,Role,Active,Deleted) Values("
							+ user.getCompanyID() + "," + groupID + "," + userID + ",'" + configDto.getGroupName()
							+ "',1,0)");
			
			pstmt3.executeUpdate();
		} catch (SQLException e) {
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (pstmt != null) {
					db.close(pstmt);
				}
				if (pstmt2 != null) {
					db.close(pstmt2);
				}
				if (pstmt3 != null) {
					db.close(pstmt3);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return userID;
	}

	public int updateUserInformation(MultiUserForm user) {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int updatedRows = 0;
		String sql = "UPDATE bca_user SET LoginID=?, Password=?,Confirm_Password=?,Email_Address=?,Company_Name=?,Legal_Name=?,TaxID=?,"
				+ "Address1=?,Address2=?,City=?,State=?,Zip=?,Country=?,Phone=?,CellPhone=?,SameAsPhoneNumber=?,Fax=?,Province=?,Firstname=?,Lastname=?,"
				+ "membershipLevel=?,jobPosition=?,DateExpiry=?,Active=? WHERE ID=?";
		try {
			boolean active = (MyUtility.isDateToday(user.getDateExpiry())
					|| MyUtility.isDateFuture(user.getDateExpiry()));
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getEmailAddress());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getConfirmPassword());
			pstmt.setString(4, user.getEmailAddress());
			pstmt.setString(5, user.getCompanyName());
			pstmt.setString(6, user.getNickName());
			pstmt.setString(7, user.getTaxID());
			pstmt.setString(8, user.getAddress1());
			pstmt.setString(9, user.getAddress2());
			pstmt.setString(10, user.getCity());
			pstmt.setString(11, user.getState());
			pstmt.setString(12, user.getZip());
			pstmt.setString(13, user.getCountry());
			pstmt.setString(14, user.getPhone());
			pstmt.setString(15, user.getCellPhone());
			pstmt.setBoolean(16, user.isSameAsPhoneNumber());
			pstmt.setString(17, user.getFax());
			pstmt.setString(18, user.getProvince());
			pstmt.setString(19, user.getFirstName());
			pstmt.setString(20, user.getLastName());
			pstmt.setString(21, user.getMembershipLevel());
			pstmt.setString(22, user.getJobPosition());
			pstmt.setDate(23, MyUtility.string2Date(user.getDateExpiry()));
			pstmt.setBoolean(24, active);
			pstmt.setInt(25, user.getUserID());
			updatedRows = pstmt.executeUpdate();
		} catch (SQLException e) {
			Loger.log(e.toString());
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
		return updatedRows;
	}

}
