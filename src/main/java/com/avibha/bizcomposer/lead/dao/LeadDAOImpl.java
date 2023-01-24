package com.avibha.bizcomposer.lead.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.avibha.bizcomposer.lead.dto.LeadDto;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;

@Service
public class LeadDAOImpl implements LeadDAO {

	private SQLExecutor db;
	
	private SimpleDateFormat dateFormat;
  

	@PostConstruct
	private void postConstruct() {
		db = new SQLExecutor();
		dateFormat = new SimpleDateFormat("MM-DD-YYYY");
		java.util.Date date = new java.util.Date();

	    String currentTime = dateFormat.format(date);
	    
	    System.out.println(currentTime);
	}

	@Override
	public LeadDto loadLead(long leadId, String companyId) {

		LeadDto returnDto = null;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			String sqlString = "select * from crm_lead where companyId = ? and LeadID = ?";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, companyId);
			pstmt.setLong(2, leadId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				returnDto = parse(rs);

			}

			// -------------------Code to save services---END-----------------------
		} catch (SQLException ee) {
			Loger.log(2, "SQLException in Class CustomerInfo,  method -insertCustomer " + ee.toString());

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
		return returnDto;

	}

	@Override
	public List<LeadDto> loadLeads(String companyId) {

		List<LeadDto> returnList = new ArrayList<>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			String sqlString = "select * from crm_lead where companyId = ?";
			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, companyId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				LeadDto dto = parse(rs);

				returnList.add(dto);

			}

			// -------------------Code to save services---END-----------------------
		} catch (SQLException ee) {
			Loger.log(2, "SQLException in Class CustomerInfo,  method -insertCustomer " + ee.toString());

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
		return returnList;

	}

	private LeadDto parse(ResultSet rs) throws SQLException {
 
		LeadDto dto = new LeadDto();
		dto.setLeadId(rs.getLong("LeadId"));
		dto.setStatus(rs.getString("Status"));
		dto.setSource(rs.getString("Source"));
		dto.setCity(rs.getString("City"));
		dto.setState(rs.getString("State"));
		dto.setCountry(rs.getString("Country"));
		dto.setTitle(rs.getString("Title"));
		dto.setFirstName(rs.getString("FirstName"));
		dto.setLastName(rs.getString("LastName"));
		dto.setAddress1(rs.getString("Address1"));
		dto.setAddress2(rs.getString("Address2"));
		dto.setPhone(rs.getString("Phone"));

		dto.setEmail(rs.getString("Email"));
		dto.setZipCode(rs.getString("ZipCode"));
		dto.setWebsite(rs.getString("WebSite"));
		dto.setLeadValue(rs.getLong("LeadValue"));
		dto.setCompany(rs.getString("Company"));
		dto.setDescription(rs.getString("Description"));
		dto.setLeadPublic(rs.getBoolean("isPublic"));
		dto.setContactToday(rs.getBoolean("isContactToday"));

		dto.setPosition(rs.getString("Position"));
		dto.setTags(rs.getString("Tags"));
 
		Date contactDate = rs.getDate("contactDate");
		if (contactDate != null) {
			String currentTime = dateFormat.format(contactDate);
		    dto.setContactDate(currentTime);
		}
		
		Date createAt = rs.getDate("createdAt");
		if (createAt != null)
			dto.setCreatedAT(createAt.toString());

		Date updateAt = rs.getDate("updatedAt");
		if (updateAt != null)
			dto.setUpdatedAT(updateAt.toString());
		
 

		return dto;
	}

	@Override
	public boolean insert(LeadDto dto, String companyId) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		boolean ret = false;
		try {

			String sqlString = "insert into crm_lead(CompanyID, Status,Source,"
					+ "City, State, Country, Title, FirstName , LastName, Address1, Address2"
					+ ",Email,ZipCode,WebSite,LeadValue,Company,Description,"
					+ "isPublic,isContactToday,contactDate,createdAt,updatedAt,Phone, Position, Tags) "
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sqlString, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, companyId);
			pstmt.setString(2, dto.getStatus());
			pstmt.setString(3, dto.getSource());

			pstmt.setString(4, dto.getCity());
			pstmt.setString(5, dto.getState());
			pstmt.setString(6, dto.getCountry());
			pstmt.setString(7, dto.getTitle());
			pstmt.setString(8, dto.getFirstName());
			pstmt.setString(9, dto.getLastName());
			pstmt.setString(10, dto.getAddress1());
			pstmt.setString(11, dto.getAddress2());

			pstmt.setString(12, dto.getEmail());
			pstmt.setString(13, dto.getZipCode());
			pstmt.setString(14, dto.getWebsite());
			pstmt.setLong(15, dto.getLeadValue() != null ? dto.getLeadValue() : 0);
			pstmt.setString(16, dto.getCompany());
			pstmt.setString(17, dto.getDescription());

			pstmt.setBoolean(18, dto.isLeadPublic());
			pstmt.setBoolean(19, dto.isContactToday());
			
			if(!ObjectUtils.isEmpty(dto.getContactDate())) {
				try {
					pstmt.setDate(20, new Date(dateFormat.parse(dto.getContactDate()).getTime()));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					pstmt.setDate(20, null);
				}
			}else {
				pstmt.setDate(20, null);
			}			
			
			pstmt.setDate(21, new Date(System.currentTimeMillis()));
			pstmt.setDate(22, new Date(System.currentTimeMillis()));
			pstmt.setString(23, dto.getPhone());
			pstmt.setString(24, dto.getPosition());
			pstmt.setString(25, dto.getTags());
			
		 
			Loger.log(sqlString);

			int num = pstmt.executeUpdate();
			if (num > 0) {

				ResultSet rs = pstmt.getGeneratedKeys();
				long generatedKey = 0;
				if (rs.next()) {
					generatedKey = rs.getLong(1);
					dto.setLeadId(generatedKey);
				}

				ret = true;
			}

			// -------------------Code to save services---END-----------------------
		} catch (SQLException ee) {
			Loger.log(2, "SQLException in Class CustomerInfo,  method -insertCustomer " + ee.toString());

		} catch (Exception ee) {
			Loger.log(2, "SQLException in Class CustomerInfo,  method -insertCustomer " + ee.toString());

		} finally {
			try {
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
		return ret;
	}
	
	@Override
	public boolean delete(Long leadId, String companyId) {
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		boolean ret = false;
		try {

			String sqlString = "DELETE FROM crm_lead where CompanyID=? and LeadId=?";

			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, companyId);
			pstmt.setLong(2, leadId);
 
			Loger.log(sqlString);

			int num = pstmt.executeUpdate();
			if (num > 0) {
				ret = true;
			}

			// -------------------Code to save services---END-----------------------
		} catch (SQLException ee) {
			Loger.log(2, "SQLException in Class CustomerInfo,  method -insertCustomer " + ee.toString());

		} finally {
			try {
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
		return ret;
		
	}

	@Override
	public boolean update(LeadDto dto, String companyId) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		boolean ret = false;
		try {

			String sqlString = "update crm_lead set Status=? , Source=? , City=? , State=? , Country=? , Title=? , FirstName=?  , LastName=? "
					+ ", Address1=? , Address2=? ,Email=?,ZipCode=?,WebSite=?,LeadValue=?,Company=?,Description=?,"
					+ "isPublic=?,isContactToday=?,contactDate=?,updatedAt=?, Phone=? , Position=?, Tags=? , contactDate=? where CompanyID=? and LeadId=?";

			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, dto.getStatus());
			pstmt.setString(2, dto.getSource());

			pstmt.setString(3, dto.getCity());
			pstmt.setString(4, dto.getState());
			pstmt.setString(5, dto.getCountry());
			pstmt.setString(6, dto.getTitle());
			pstmt.setString(7, dto.getFirstName());
			pstmt.setString(8, dto.getLastName());
			pstmt.setString(9, dto.getAddress1());
			pstmt.setString(10, dto.getAddress2());

			pstmt.setString(11, dto.getEmail());
			pstmt.setString(12, dto.getZipCode());
			pstmt.setString(13, dto.getWebsite());
			pstmt.setLong(14, dto.getLeadValue() != null ? dto.getLeadValue() : 0);
			pstmt.setString(15, dto.getCompany());
			pstmt.setString(16, dto.getDescription());

			pstmt.setBoolean(17, dto.isLeadPublic());
			pstmt.setBoolean(18, dto.isContactToday());
			pstmt.setDate(19, new Date(System.currentTimeMillis()));
			pstmt.setDate(20, new Date(System.currentTimeMillis()));
			pstmt.setString(21, dto.getPhone());
			pstmt.setString(22, dto.getPosition());
			pstmt.setString(23, dto.getTags());
			
			if(!ObjectUtils.isEmpty(dto.getContactDate())) {
				try {
					pstmt.setDate(24, new Date(dateFormat.parse(dto.getContactDate()).getTime()));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					pstmt.setDate(24, null);
				}
			}else {
				pstmt.setDate(24, null);
			}		

			pstmt.setString(25, companyId);
			pstmt.setLong(26, dto.getLeadId());

			Loger.log(sqlString);

			int num = pstmt.executeUpdate();
			if (num > 0) {
				ret = true;
			}

			// -------------------Code to save services---END-----------------------
		} catch (SQLException ee) {
			Loger.log(2, "SQLException in Class CustomerInfo,  method -insertCustomer " + ee.toString());

		} finally {
			try {
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
		return ret;
	}

}
