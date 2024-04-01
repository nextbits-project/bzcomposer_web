package com.avibha.bizcomposer.File.dao;

import com.avibha.bizcomposer.File.forms.CompanyInfoDto;
import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.sales.forms.InvoiceDto;
import com.avibha.bizcomposer.sales.forms.ItemDto;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.avibha.common.utility.MyUtility;
import com.nxsol.bzcomposer.company.domain.BcaBusinesstype;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaPreference;
import com.nxsol.bzcomposer.company.repos.BcaBusinesstypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaPreferenceRepository;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class CompanyInfo {

	@Autowired
	private BcaCompanyRepository companyRepository;

	public ArrayList<CompanyInfoDto> searchCompany(Long compId, int userID, HttpServletRequest request) {
		ArrayList<CompanyInfoDto> objList = new ArrayList<>();
		CompanyInfoDto comInfo = new CompanyInfoDto();
		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(compId);
			if (companyOpt.isPresent()) {
				BcaCompany company = companyOpt.get();
				// Set properties to customer from company

				comInfo.setCompanyName(company.getName());
				comInfo.setNickName(company.getNickName());
				comInfo.setFirstName(company.getFirstName());
				comInfo.setLastName(company.getLastName());
				comInfo.setAddress1(company.getAddress1());
				comInfo.setAddress2(company.getAddress2());
				comInfo.setCity(company.getCity());
//				customer.setStateId(company.getState());
				comInfo.setState(company.getState());

				comInfo.setZip(company.getZipcode());
				comInfo.setProvince(company.getProvince());

				request.setAttribute("state_gen", company.getState());
				comInfo.setCountry(company.getCountry());
//				customer.setCountryId(company.getCountry());

				comInfo.setPhone(company.getPhone1());
				comInfo.setCellPhone(company.getPhone2());
				comInfo.setFax(company.getFax1());
				comInfo.setEmail(company.getEmail());
//				customer.setBusinessTypeId(company.getBusinessType());
				comInfo.setMembershipLevel(company.getMembershipLevel());
				comInfo.setPassword(company.getPassword());
				comInfo.setSameAsPhoneNumber(company.getSameAsPhoneNumber());
				comInfo.setTaxID(company.getTaxId());
				comInfo.setJobPosition(company.getJobPosition());
				comInfo.setType(company.getBusinessType().getBusinessName());
				objList.add(comInfo);
			}
		} catch (Exception e) {
			Loger.log("Exception in searchCompany: " + e.toString());
		}

		// Additional logic if necessary...

		return objList;
	}

//    public ArrayList<CompanyInfoDto> SearchCompany(String compId, int userID, CompanyInfoDto customer, HttpServletRequest request) {
//        SQLExecutor db = new SQLExecutor();
//        Connection con = db.getConnection();
//        ResultSet rs = null, rs1 = null,rs2 = null;
//        PreparedStatement pstmt = null, pstmt1 = null, pstmt2 = null;
//        CountryState cs = new CountryState();
//        ArrayList<CompanyInfoDto> objList = new ArrayList<>();
//        try {
//            String sqlString = "select NAME,NickName,FirstName,LastName,Address1,Address2,City,State,Zipcode,Province,"
//                    + "Phone1,Phone2,Fax1,Email,Country,BusinessTypeID,MembershipLevel,Password,SameAsPhoneNumber,TaxID,JobPosition "
//                    + "FROM bca_company WHERE CompanyId="+compId;
//            pstmt = con.prepareStatement(sqlString);
//            rs = pstmt.executeQuery();
//            if (rs.next()) {
//                customer.setCompanyName(replaceNullWithBlank(rs.getString(1)));
//                customer.setNickName(replaceNullWithBlank(rs.getString(2)));
//                customer.setFirstName(replaceNullWithBlank(rs.getString(3)));
//                customer.setLastName(replaceNullWithBlank(rs.getString(4)));
//                customer.setAddress1(replaceNullWithBlank(rs.getString(5)));
//                customer.setAddress2(replaceNullWithBlank(rs.getString(6)));
//                customer.setCity(rs.getString(7));
//                customer.setZip(replaceNullWithBlank(rs.getString(9)));
//                customer.setProvince(replaceNullWithBlank(rs.getString(10)));
//                customer.setStateId(rs.getInt(8));
//                customer.setState(rs.getString(8));
//                request.setAttribute("state_gen", replaceNullWithBlank(rs.getString(8)));
//                customer.setCountry(replaceNullWithBlank(rs.getString(15)));
//                customer.setCountryId(rs.getInt(15));
//
//                customer.setPhone(replaceNullWithBlank(rs.getString(11)));
//                customer.setCellPhone(replaceNullWithBlank(rs.getString(12)));
//                customer.setFax(replaceNullWithBlank(rs.getString(13)));
//                customer.setEmail(replaceNullWithBlank(rs.getString(14)));
//                customer.setBusinessTypeId(rs.getInt(16));
//                customer.setMembershipLevel(rs.getString(17));
//                customer.setPassword(rs.getString(18));
//                customer.setSameAsPhoneNumber(rs.getBoolean(19));
//                customer.setTaxID(replaceNullWithBlank(rs.getString(20)));
//                customer.setJobPosition(replaceNullWithBlank(rs.getString(21)));
//
//                int businessTypeId = customer.getBusinessTypeId();
//                String sql2 = "select BusinessName from bca_businesstype where BusinessTypeID = "+businessTypeId;
//                pstmt2=con.prepareStatement(sql2);
//                rs2=pstmt2.executeQuery();
//                if(rs2.next()) {
//                    customer.setType(rs2.getString("BusinessName"));
//                }
//                objList.add(customer);
//            }
//        } catch (SQLException ee) {
//            Loger.log(2," SQL Error in Class CompanyInfo and  method -SearchCompany "+ " " + ee.toString());
//            
//        } finally {
//            try {
//                if (rs != null) { db.close(rs); }
//                if (pstmt != null) { db.close(pstmt); }
//                if (rs1 != null) { db.close(rs1); }
//                if (pstmt1 != null) { db.close(pstmt1); }
//                if(con != null){ db.close(con); }
//            } catch (Exception e) {
//                Loger.log(e.toString());
//            }
//        }
//        return objList;
//    }

	private String replaceNullWithBlank(String s) {
		return s == null || s.equalsIgnoreCase("null") ? "" : s;
	}
	// Below methods are added on 18-05-2020

	public ArrayList<InvoiceDto> selectPurchaseOrders(String compId, ConfigurationInfo configInfo, String sartYearDate, String endYearDate)
			throws ParseException {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<InvoiceDto> objPurchaseList = new ArrayList<>();
		ResultSet rs = null;
		con = db.getConnection();
		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		try {
			String sqlString = "SELECT i.PONum,c.DateAdded,c.FirstName,c.LastName,i.Total "
					+ "FROM bca_invoice AS i, bca_clientvendor AS c " + "WHERE i.CompanyID = " + compId
					+ " AND invoiceStatus=0 AND c.status IN('U','N') " + "AND InvoiceTypeID IN (2, 6) "
					+ "AND c.ClientVendorID = i.ClientVendorID AND c.CompanyID = " + compId;
			
			if(sartYearDate != null && !sartYearDate.isEmpty() && endYearDate != null && !endYearDate.isEmpty()) {
				Loger.log("sartYearDate--"+sartYearDate+"endYearDate---"+endYearDate);//2024-03-31 14:21:08
				sqlString = sqlString.concat(" AND c.DateAdded between '"+sartYearDate+"' AND '"+endYearDate+"' ORDER BY i.PONum DESC");
			} else {
				sqlString = sqlString.concat(" ORDER BY i.PONum DESC");
			}
			
			pstmt = con.prepareStatement(sqlString.toString());
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				InvoiceDto purchaseOrder = new InvoiceDto();

				String orderNo = (rs.getString("PONum"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
				java.util.Date d = sdf.parse(rs.getString(2));

				String dateStr = sdf2.format(d);

				// added by ferdous

				String yearPart = MyUtility.getYearPart(dateStr);

				if (configDto.getIsPurchasePrefix().equals("on")) {
					purchaseOrder.setPoNum("PO".concat(yearPart).concat("-"
							+ MyUtility.getOrderNumberByConfigData(orderNo, AppConstants.POType, configDto, false)));
				} else {
					purchaseOrder.setPoNum(
							MyUtility.getOrderNumberByConfigData(orderNo, AppConstants.POType, configDto, false));
				}

				/*
				 * purchaseOrder.setPoNum(MyUtility.getOrderNumberByConfigData(rs.getString(1),
				 * AppConstants.POType, configDto, false));
				 */

				purchaseOrder.setDateAdded(rs.getString(2));
				purchaseOrder.setFirstName(rs.getString(3));
				purchaseOrder.setLastName(rs.getString(4));
				purchaseOrder.setTotal(rs.getDouble("Total"));
				objPurchaseList.add(purchaseOrder);
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class CompanyInfo and  method -selectPurchaseOrders " + " " + ee.toString());
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
		return objPurchaseList;
	}

	public ArrayList<InvoiceDto> selectSalesOrders(String compId, ConfigurationInfo configInfo, String sartYearDate, String endYearDate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<InvoiceDto> objSalesOrderList = new ArrayList<>();
		ResultSet rs = null;
		con = db.getConnection();
		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		try {
			String sqlString = "SELECT distinct i.SONum,i.DateAdded,c.FirstName,c.LastName,i.Total "
					+ "FROM bca_invoice AS i, bca_clientvendor AS c " + "WHERE i.CompanyID=" + compId
					+ " AND InvoiceTypeID IN (7,18) AND c.status IN('U','N') "
					+ "AND c.ClientVendorID = i.ClientVendorID AND c.CompanyID = " + compId;
			
			if(sartYearDate != null && !sartYearDate.isEmpty() && endYearDate != null && !endYearDate.isEmpty()) {
				Loger.log("sartYearDate--"+sartYearDate+"endYearDate---"+endYearDate);//2024-03-31 14:21:08
				sqlString = sqlString.concat(" AND i.DateAdded between '"+sartYearDate+"' AND '"+endYearDate+"' ORDER BY i.SONum DESC");
			} else {
				sqlString = sqlString.concat(" ORDER BY i.SONum DESC");
			}
			
			pstmt = con.prepareStatement(sqlString.toString());
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				InvoiceDto salesOrder = new InvoiceDto();
				salesOrder.setOrderNo(
						MyUtility.getOrderNumberByConfigData(rs.getString(1), AppConstants.SOType, configDto, false));
				salesOrder.setDateAdded(rs.getString(2));
				salesOrder.setFirstName(rs.getString(3));
				salesOrder.setLastName(rs.getString(4));
				salesOrder.setTotal(rs.getDouble("Total"));
				objSalesOrderList.add(salesOrder);
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class CompanyInfo and  method -selectSalesOrders " + " " + ee.toString());
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
		return objSalesOrderList;
	}

	public ArrayList<InvoiceDto> selectInvoiceDetails(String compId, ConfigurationInfo configInfo, String sartYearDate, String endYearDate)
			throws ParseException {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<InvoiceDto> objSalesOrderList = new ArrayList<>();
		ResultSet rs = null;
		con = db.getConnection();
		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		try {
			String sqlString = "SELECT distinct i.OrderNum,c.DateAdded,c.FirstName,c.LastName,i.Total "
					+ "FROM bca_invoice AS i, bca_clientvendor AS c " + "WHERE i.CompanyID = " + compId
					+ " AND c.ClientVendorID = i.ClientVendorID "
					+ "AND c.Active = 1 and c.Status IN('N','U') and c.Deleted = 0 " + "AND c.CompanyID = " + compId
					+ " AND i.OrderNum > 0 ";
			
			if(sartYearDate != null && !sartYearDate.isEmpty() && endYearDate != null && !endYearDate.isEmpty()) {
				Loger.log("sartYearDate--"+sartYearDate+"endYearDate---"+endYearDate);//2024-03-31 14:21:08
				sqlString = sqlString.concat("AND c.DateAdded between '"+sartYearDate+"' AND '"+endYearDate+"' ORDER BY i.OrderNum DESC");
			} else {
				sqlString = sqlString.concat("ORDER BY i.OrderNum DESC");
			}
			
			pstmt = con.prepareStatement(sqlString.toString());
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				InvoiceDto salesOrder = new InvoiceDto();

				/*
				 * salesOrder.setOrderNo(MyUtility.getOrderNumberByConfigData(rs.getString(1),
				 * AppConstants.InvoiceType, configDto, false));
				 */

				String orderNo = rs.getString(1);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
				java.util.Date d = sdf.parse(rs.getString(2));

				String dateStr = sdf2.format(d);

				// added by ferdous

				String yearPart = MyUtility.getYearPart(dateStr);

				if (configDto.getIsSalePrefix().equals("on")) {
					salesOrder.setOrderNo("IV".concat(yearPart).concat("-" + MyUtility
							.getOrderNumberByConfigData(orderNo, AppConstants.InvoiceType, configDto, false)));
				} else {
					salesOrder.setOrderNo(
							MyUtility.getOrderNumberByConfigData(orderNo, AppConstants.InvoiceType, configDto, false));
				}

				salesOrder.setDateAdded(rs.getString(2));
				salesOrder.setFirstName(rs.getString(3));
				salesOrder.setLastName(rs.getString(4));
				salesOrder.setTotal(rs.getDouble(5));
				objSalesOrderList.add(salesOrder);
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class CompanyInfo and  method -selectSalesOrders " + ee.toString());

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
		return objSalesOrderList;
	}

	public ArrayList<InvoiceDto> selectEstimateDetails(String compId, ConfigurationInfo configInfo, String sartYearDate, String endYearDate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ArrayList<InvoiceDto> objSalesOrderList = new ArrayList<>();
		ResultSet rs = null;
		con = db.getConnection();
		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		try {
			String sqlString = "SELECT distinct i.EstNum,c.DateAdded,c.FirstName,c.LastName,(i.AdjustedTotal) as Total "
					+ "FROM bca_invoice AS i, bca_clientvendor AS c " + "WHERE i.CompanyID = " + compId
					+ " AND NOT (invoiceStatus = 1 )  AND c.status IN('U','N')  "
					+ "AND InvoiceTypeID = 10 AND c.ClientVendorID = i.ClientVendorID " + "AND c.CompanyID = " + compId;
			
			if(sartYearDate != null && !sartYearDate.isEmpty() && endYearDate != null && !endYearDate.isEmpty()) {
				Loger.log("sartYearDate--"+sartYearDate+"endYearDate---"+endYearDate);//2024-03-31 14:21:08
				sqlString = sqlString.concat(" AND c.DateAdded between '"+sartYearDate+"' AND '"+endYearDate+"' ORDER BY i.EstNum DESC");
			} else {
				sqlString = sqlString.concat(" ORDER BY i.EstNum DESC");
			}
			
			pstmt = con.prepareStatement(sqlString.toString());
			Loger.log(sqlString);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				InvoiceDto salesOrder = new InvoiceDto();
				salesOrder.setOrderNo(
						MyUtility.getOrderNumberByConfigData(rs.getString(1), AppConstants.EstType, configDto, false));
				salesOrder.setDateAdded(rs.getString(2));
				salesOrder.setFirstName(rs.getString(3));
				salesOrder.setLastName(rs.getString(4));
				salesOrder.setTotal(rs.getDouble(5));
				objSalesOrderList.add(salesOrder);
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class CompanyInfo and  method -selectEstimateDetails " + ee.toString());

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
		return objSalesOrderList;
	}

	public ArrayList<ItemDto> getItemListDetails(String compId, String sartYearDate, String endYearDate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1, pstmt2;
		SQLExecutor db = new SQLExecutor();
		ArrayList<ItemDto> objItemListList = new ArrayList<ItemDto>();
		ResultSet rs = null;
		ResultSet rs1, rs2 = null;
		con = db.getConnection();
		CountryState cs = new CountryState();
		try {
			StringBuffer sqlString = new StringBuffer();
			/*
			 * sqlString
			 * .append("select NAME,NickName,FirstName,LastName,Address1,Address2,City,State,"
			 * + "Zipcode,Province,Phone1,Phone2,Fax1,Email,Country,BusinessTypeID " +
			 * "FROM bca_company WHERE CompanyId='"+ compId+ "'");
			 */
			sqlString.append(
					"select a.InventoryCode, a.ItemTypeID, a.InventoryName, a.Qty, b.InventoryCode AS category, a.DateAdded from bca_iteminventory AS a INNER JOIN bca_iteminventory AS b ON a.ParentID = b.InventoryID where a.CompanyID like '"
							+ compId + "' and a.Active like '1' and a.ItemtypeId not like '0'");
			
			if(sartYearDate != null && !sartYearDate.isEmpty() && endYearDate != null && !endYearDate.isEmpty()) {
				Loger.log("sartYearDate--"+sartYearDate+"endYearDate---"+endYearDate);//2024-03-31 14:21:08
				sqlString = sqlString.append(" AND a.DateAdded between '"+sartYearDate+"' AND '"+endYearDate+"' order by a.parentid");
			} else {
				sqlString = sqlString.append(" order by a.parentid");
			}
			
			String sql = "";
			pstmt = con.prepareStatement(sqlString.toString());
			Loger.log("getItemListDetails----"+sqlString);
			rs = pstmt.executeQuery();
			/*
			 * pstmt1=con.prepareStatement(sql); rs1=pstmt1.executeQuery();
			 */
			while (rs.next()) {
				ItemDto itemList = new ItemDto();
				itemList.setItemCode(rs.getString(1));
				itemList.setItemType(rs.getString(2));
				itemList.setItemName(rs.getString(3));
				itemList.setQty(rs.getString(4));
				itemList.setCategory(rs.getString(5));
				objItemListList.add(itemList);
			}
		} catch (SQLException ee) {

			Loger.log(2, " SQL Error in Class CompanyInfo and  method -getItemListDetails " + " " + ee.toString());
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
		return objItemListList;
	}

///	
	@Autowired
	private BcaPreferenceRepository preferenceRepository;

	@Autowired
	private BcaBusinesstypeRepository businesstypeRepository;

	@Transactional
	public boolean updateComapanyinfo(CompanyInfoDto c, int userID, String companyId) {

		int InvoiceStyleID = 0;
		int businessTypeID = c.getBusinessTypeId();
		String businessTypeName = null;
		boolean valid = false;

		Long compId = Long.parseLong(companyId); // Convert to Long if necessary

		Optional<BcaPreference> preferenceOpt = preferenceRepository.findByCompany_CompanyId(compId);

		BcaCompany company = companyRepository.findByCompanyId(compId);

		Optional<BcaBusinesstype> businessType = businesstypeRepository.findById(businessTypeID);

		try {

			if (businessType.isPresent()) {
				businessTypeName = businessType.get().getBusinessName();
			}

			if (businessTypeName.equals("Manufacturer")) {
				InvoiceStyleID = 3;

			} else if (businessTypeName.equals("Finance")) {
				InvoiceStyleID = 6;

			} else if (businessTypeName.equals("Retail")) {
				InvoiceStyleID = 4;

			} else if (businessTypeName.equals("Wholesale")) {
				InvoiceStyleID = 4;

			} else if (businessTypeName.equals("Service")) {
				InvoiceStyleID = 1;

			} else {
				InvoiceStyleID = 7;
			}

			if (company != null) {
				company.setName(c.getCompanyName());
				company.setNickName(c.getNickName());
				company.setFirstName(c.getFirstName());
				company.setLastName(c.getLastName());
				company.setAddress1(c.getAddress1());
				company.setAddress2(c.getAddress2());
				company.setCity(c.getCity());
				company.setZipcode(c.getZip());
				company.setProvince(c.getProvince());
				company.setPhone1(c.getPhone());
				company.setPhone2(c.getCellPhone());

				company.setFax1(c.getFax());
				company.setEmail(c.getEmail());
				company.setState(String.valueOf(c.getStateId()));
				company.setCountry(String.valueOf(c.getCountryId()));
				company.setBusinessType(businessType.get());
				company.setMembershipLevel(c.getMembershipLevel());
				company.setSameAsPhoneNumber(c.isSameAsPhoneNumber());
				company.setTaxId(c.getTaxID());
				company.setJobPosition(c.getJobPosition());

				companyRepository.save(company);
				valid = true;
				Loger.log("updated successfully");
			}

			if (preferenceOpt.isPresent()) {
				BcaPreference preference = preferenceOpt.get();

				// Set the fields from cForm
				preference.setInvoiceStyleTypeId(InvoiceStyleID);

				preferenceRepository.save(preference); // This will update the record
			} else {
				// Handle the case where the preference does not exist
				Loger.log("Preference not found for Company ID: " + compId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			Loger.log(2, " SQL Error in Class CompanyInfo and  method -updateComapanyinfo " + e.toString());

		}

		return valid;

	}
///	
//	public boolean updateComapanyinfo(CompanyInfoDto c, int userID, String compId) {
//
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		boolean valid = false;
//		Statement stmt = null, stmt1 = null, stmt2 = null, stmt3 = null;
//		ResultSet rs2 = null;
//		con = db.getConnection();
//		int InvoiceStyleID = 0;
//		int BusinessTypeID = c.getBusinessTypeId();
//		String BusinessTypeName = null;
//		try {
//			stmt2 = con.createStatement();
//			rs2 = stmt2
//					.executeQuery("select businessname from bca_businesstype where BusinessTypeID =" + BusinessTypeID);
//			while (rs2.next()) {
//				BusinessTypeName = rs2.getString(1);
//			}
//			if (BusinessTypeName.equals("Manufacturer")) {
//				InvoiceStyleID = 3;
//
//			} else if (BusinessTypeName.equals("Finance")) {
//				InvoiceStyleID = 6;
//
//			} else if (BusinessTypeName.equals("Retail")) {
//				InvoiceStyleID = 4;
//
//			} else if (BusinessTypeName.equals("Wholesale")) {
//				InvoiceStyleID = 4;
//
//			} else if (BusinessTypeName.equals("Service")) {
//				InvoiceStyleID = 1;
//
//			} else {
//				InvoiceStyleID = 7;
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		}
//		try {
//			stmt = con.createStatement();
//			stmt1 = con.createStatement();
//			StringBuffer sqlString = new StringBuffer();
//			sqlString.append("update bca_company set  Name='" + c.getCompanyName() + "',NickName='" + c.getNickName()
//					+ "',FirstName='" + c.getFirstName() + "'," + "LastName='" + c.getLastName() + "',Address1='"
//					+ c.getAddress1() + "',Address2='" + c.getAddress2() + "',City='" + c.getCity() + "'," + "Zipcode='"
//					+ c.getZip() + "',Province='" + c.getProvince() + "',Phone1='" + c.getPhone() + "',Phone2='"
//					+ c.getCellPhone() + "'," + "Fax1='" + c.getFax() + "',Email='" + c.getEmail() + "',State='"
//					+ c.getStateId() + "',Country='" + c.getCountryId() + "'," + "BusinessTypeID='"
//					+ c.getBusinessTypeId() + "',MembershipLevel='" + c.getMembershipLevel() + "',"
//					+ "SameAsPhoneNumber=" + c.isSameAsPhoneNumber() + ",TaxID='" + c.getTaxID() + "',JobPosition='"
//					+ c.getJobPosition() + "'" + " where CompanyID=" + compId);
//			Loger.log(sqlString);
//			int count = stmt.executeUpdate(sqlString.toString());
//			if (count > 0) {
//				valid = true;
//				Loger.log("updated successfully");
//			}
//			stmt3 = con.createStatement();
//			stmt3.executeUpdate(
//					"update bca_preference set InvoiceStyleID = " + InvoiceStyleID + " where CompanyID =" + compId);
//			System.out.println(stmt3);
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class CompanyInfo and  method -updateComapanyinfo " + ee.toString());
//
//		} finally {
//			try {
//				if (stmt != null) {
//					db.close(stmt);
//				}
//				if (stmt1 != null) {
//					db.close(stmt1);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return valid;
//	}

	public boolean updateComapanySecurity(String password, String compId) {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		Statement stmt = null;
		boolean valid = false;
		try {
			stmt = con.createStatement();
			int count = stmt
					.executeUpdate("update bca_company set Password='" + password + "' where CompanyID=" + compId);
			if (count > 0) {
				valid = true;
				Loger.log("updated successfully");
			}
		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class CompanyInfo and  method -updateComapanySecurity " + ee.toString());

		} finally {
			try {
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
		return valid;
	}

	public boolean updateInsertComapany(CompanyInfoDto c, String compId) {
		boolean ret = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();

		if (db == null)
			return ret;
		con = db.getConnection();
		if (con == null)
			return ret;

		try {
			String sqlString = "insert into bca_company(NAME,NickName,FirstName,LastName,Address1,Address2,City,Zipcode,Province,Phone1,Phone2,Fax1,Email) "
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
//			String sqlString = "insert into bca_clientvendor(NAME,NickName,FirstName,LastName,Address1,Address2,City,Zipcode,Province,Phone1,Phone2,Fax1,Email,State,Country) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sqlString);

			pstmt.setString(1, c.getCompanyName());
			pstmt.setString(2, c.getNickName());
			pstmt.setString(3, c.getFirstName());
			pstmt.setString(4, c.getLastName());
			pstmt.setString(5, c.getAddress1());
			pstmt.setString(6, c.getAddress2());
			pstmt.setString(7, c.getCity());
			pstmt.setString(8, c.getZip());
			pstmt.setString(9, c.getProvince());
			pstmt.setString(10, c.getPhone());
			pstmt.setString(11, c.getCellPhone());
			pstmt.setString(12, c.getFax());
			pstmt.setString(13, c.getEmail());
//			pstmt.setString(14, c.getState());
//			pstmt.setString(15, c.getCountry());
			/* Loger.log(sqlString); */ // Commented on 05-05-2020
			int num = pstmt.executeUpdate();

			if (num > 0) {
				ret = true;
			}
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

	public static boolean deleteCompany(String compId) {
		boolean loginStatus = false;
		Statement stmt = null;
		ResultSet rs = null;
		SQLExecutor db1 = new SQLExecutor();
		Connection c = db1.getConnection();

		String sql = "update bca_company set Active = 0 where CompanyID = " + compId;
		String sql1 = " DELETE FROM bca_preference WHERE CompanyID=" + compId;
		try {

			stmt = c.createStatement();
			/* rs = stmt.executeQuery(sql); */
			stmt.executeUpdate(sql);
			int count = stmt.executeUpdate(sql.toString());
			if (count > 0) {
				loginStatus = true;
				Loger.log("company updated from bca_company successfully");
			}
			int countDel = stmt.executeUpdate(sql1.toString());
			if (countDel > 0) {
				loginStatus = true;
				Loger.log(countDel + " company deleted successfully");
			}
		} catch (SQLException e) {
			Loger.log(e.toString());
			System.out.println("Error in delete company:" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					db1.close(rs);
				}
				if (stmt != null) {
					db1.close(stmt);
				}
				if (c != null) {
					db1.close(c);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return loginStatus;
	}
}
