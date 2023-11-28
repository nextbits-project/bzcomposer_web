/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */

package com.avibha.bizcomposer.sales.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.util.LabelValueBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.sales.forms.SalesForm;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaCctype;
import com.nxsol.bzcomposer.company.domain.BcaCvcategory;
import com.nxsol.bzcomposer.company.domain.BcaLocation;
import com.nxsol.bzcomposer.company.domain.BcaMessage;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.BcaReceivedtype;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.domain.BcaSalestax;
import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;
import com.nxsol.bzcomposer.company.domain.BcaTerm;
import com.nxsol.bzcomposer.company.domain.BcaTitle;
import com.nxsol.bzcomposer.company.repos.BcaCctypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaCvcategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaLocationRepository;
import com.nxsol.bzcomposer.company.repos.BcaMessageRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaReceivedtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalestaxRepository;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;
import com.nxsol.bzcomposer.company.repos.BcaTitleRepository;

/*
 * 
 */
@Service
public class SalesInfo {

	@Autowired
	private BcaTitleRepository titleRepository;

	public ArrayList<SalesForm> getCustomerTitle(Long compId) {
		List<BcaTitle> titles = titleRepository.findByCompany_CompanyIdAndActive(compId, 1);
		ArrayList<SalesForm> objList = new ArrayList<>();

		for (BcaTitle title : titles) {
			SalesForm sales = new SalesForm();
			sales.setTitleID(title.getTitleId().toString());
			sales.setTitle(title.getTitle());
		    sales.setDefaultItem(title.getIsDefault() != null ? title.getIsDefault() : false);
			objList.add(sales);
		}

		return objList;
	}
//	public ArrayList getCustomerTitle(String compId) {
//		Connection con = null ;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sqlString = "select TitleID,Title,IsDefault from bca_title where CompanyID like '" +compId+ "' and Active like '1'";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setTitleID(rs.getString(1));
//				sales.setTitle(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getCustomerTitle " + ee.toString());
//		}
//		finally {
//			try {
//				if (rs != null) { db.close(rs); }
//				if (pstmt != null) { db.close(pstmt); }
//				if(con != null){ db.close(con); }
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

	@Autowired
    private BcaSalesrepRepository salesRepRepository;

    public ArrayList<SalesForm> getSalesRep(Long compId) {
        List<BcaSalesrep> salesReps = salesRepRepository.findByCompany_CompanyIdAndActive(compId, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaSalesrep salesRep : salesReps) {
            SalesForm salesForm = new SalesForm();
            salesForm.setSalesRepID(salesRep.getSalesRepId().toString());
            salesForm.setSalesRepName(salesRep.getName());
            salesForm.setDefaultItem(salesRep.getIsDefault() != null ? salesRep.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
    
//	public ArrayList getSalesRep(String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sqlString = "select SalesRepID,Name,IsDefault from bca_salesrep where CompanyID like '" + compId
//					+ "' and Active like '1'";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setSalesRepID(rs.getString(1));
//				sales.setSalesRepName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

    @Autowired
    private BcaCvcategoryRepository cvcategoryRepository;

    public ArrayList<SalesForm> getCatType(Long compId) {
        List<BcaCvcategory> cvcategories = cvcategoryRepository.findByCompany_CompanyIdAndActive(compId, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaCvcategory cvcategory : cvcategories) {
            SalesForm salesForm = new SalesForm();
            salesForm.setCvCategoryID(cvcategory.getcVCategoryID().toString());
            salesForm.setCvCategoryName(cvcategory.getName());
            salesForm.setDefaultItem(cvcategory.getIsDefault() != null ? cvcategory.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
//	public ArrayList getCatType(String compId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		try {
//			String sqlString = "select CVCategoryID,Name,IsDefault from bca_cvcategory where CompanyID=" + compId
//					+ " and Active=1 ORDER BY Name";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setCvCategoryID(rs.getString(1));
//				sales.setCvCategoryName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

    @Autowired
    private BcaTermRepository termRepository;

    public ArrayList<SalesForm> getTerms(Long compId) {
        List<BcaTerm> terms = termRepository.findByCompany_CompanyIdAndActive(compId, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaTerm term : terms) {
            SalesForm salesForm = new SalesForm();
            salesForm.setTermId(term.getTermId().toString());
            salesForm.setTermName(term.getName());
            salesForm.setDefaultItem(term.getIsDefault() != null ? term.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
//	public ArrayList getTerms(String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sqlString = "select TermID,Name,IsDefault from bca_term where CompanyID like '" + compId
//					+ "' and Active like '1'";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setTermId(rs.getString(1));
//				sales.setTermName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

    @Autowired
    private BcaLocationRepository locationRepository;

    public ArrayList<SalesForm> getLocation(Long compId) {
        List<BcaLocation> locations = locationRepository.findByCompany_CompanyIdAndActive(compId, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaLocation location : locations) {
            SalesForm salesForm = new SalesForm();
            salesForm.setLocationId(location.getLocationId().toString());
            salesForm.setLocationName(location.getName());
            salesForm.setDefaultItem(location.getIsDefault() != null ? location.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
    
//	public ArrayList getLocation(String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sqlString = "select LocationID,Name,IsDefault from bca_location where CompanyID like '" + compId
//					+ "' and Active like '1'";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setLocationId(rs.getString(1));
//				sales.setLocationName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

    @Autowired
    private BcaPaymenttypeRepository paymentTypeRepository;

    public ArrayList<SalesForm> getPaymentType(Long compId) {
        List<BcaPaymenttype> paymentTypes = paymentTypeRepository.findByCompany_CompanyIdAndActiveAndTypeCategory(compId, 1, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaPaymenttype paymentType : paymentTypes) {
            SalesForm salesForm = new SalesForm();
            salesForm.setPaymentTypeId(paymentType.getPaymentTypeId().toString());
            salesForm.setPaymentTypeName(paymentType.getName());
            salesForm.setDefaultItem(paymentType.getIsDefault() != null ? paymentType.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
    
//	public ArrayList getPaymentType(String compId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		try {
//			String sqlString = "select PaymentTypeID,Name,IsDefault from bca_paymenttype where CompanyID='" + compId
//					+ "' and Active=1 and TypeCategory=1 ORDER BY Name";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setPaymentTypeId(rs.getString(1));
//				sales.setPaymentTypeName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

    @Autowired
    private BcaReceivedtypeRepository receivedTypeRepository;

    public ArrayList<SalesForm> getReceivedType(Long compId) {
        List<BcaReceivedtype> receivedTypes = receivedTypeRepository.findByCompany_CompanyIdAndActiveAndTypeCategory(compId, 1, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaReceivedtype receivedType : receivedTypes) {
            SalesForm salesForm = new SalesForm();
            salesForm.setPaymentTypeId(receivedType.getPaymentTypeId().toString());
            salesForm.setPaymentTypeName(receivedType.getName());
            salesForm.setDefaultItem(receivedType.getIsDefault() != null ? receivedType.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
//	public ArrayList getReceivedType(String compId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		try {
//			String sqlString = "select PaymentTypeID,Name,IsDefault from bca_receicedtype where CompanyID='" + compId
//					+ "' and Active=1 and TypeCategory=1 ORDER BY Name";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setPaymentTypeId(rs.getString(1));
//				sales.setPaymentTypeName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

    @Autowired
    private BcaCctypeRepository cctypeRepository;

    public ArrayList<SalesForm> getCreditCard(Long compId) {
        List<BcaCctype> ccTypes = cctypeRepository.findByCompany_CompanyIdAndActive(compId, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaCctype ccType : ccTypes) {
            SalesForm salesForm = new SalesForm();
            salesForm.setCcTypeID(ccType.getcCTypeID().toString());
            salesForm.setCcTypeName(ccType.getName());
            salesForm.setDefaultItem(ccType.getIsDefault() != null ? ccType.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
    
//	public ArrayList getCreditCard(String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sqlString = "select CCTypeID,Name,IsDefault from bca_cctype where CompanyID like '" + compId
//					+ "' and Active like '1'";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setCcTypeID(rs.getString(1));
//				sales.setCcTypeName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getSalesRep " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

	@Autowired
    private BcaMessageRepository messageRepository;

    public ArrayList<SalesForm> getMessage(Long compId) {
        List<BcaMessage> messages = messageRepository.findByCompany_CompanyIdAndActive(compId, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaMessage message : messages) {
            SalesForm salesForm = new SalesForm();
            salesForm.setMessageID(message.getMessageId().toString());
            salesForm.setMessageName(message.getName());
            salesForm.setDefaultItem(message.getIsDefault() != null ? message.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
    
//	public ArrayList getMessage(String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sqlString = "select messageID,Name,IsDefault from bca_message where CompanyID like '" + compId
//					+ "' and Active like '1'";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setMessageID(rs.getString(1));
//				sales.setMessageName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getMessage " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

    @Autowired
    private BcaSalestaxRepository salesTaxRepository;

    public ArrayList<SalesForm> getTax(Long compId) {
        List<BcaSalestax> salesTaxes = salesTaxRepository.findByCompany_CompanyIdAndActive(compId, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaSalestax salesTax : salesTaxes) {
            SalesForm salesForm = new SalesForm();
            salesForm.setSalesTaxID(salesTax.getSalesTaxId().toString());
            salesForm.setState(salesTax.getState());
            salesForm.setSalesRate(salesTax.getRate().toString());
            objList.add(salesForm);
        }

        return objList;
    }
    
//	public ArrayList getTax(String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sqlString = "select SalesTaxID,State,Rate from bca_salestax where CompanyID like '" + compId
//					+ "' and Active like '1'";
//			pstmt = con.prepareStatement(sqlString);
//			Loger.log(sqlString);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setSalesTaxID(rs.getString(1));
//				sales.setState(rs.getString(2));
//				sales.setSalesRate(rs.getString(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class SalesInfo and  method -getTax " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//
//		return objList;
//	}

    @Autowired
    private BcaShipcarrierRepository shipCarrierRepository;

    public ArrayList<SalesForm> getVia(Long compId) {
        List<BcaShipcarrier> shipCarriers = shipCarrierRepository.findByCompany_CompanyIdAndActive(compId, 1);
        ArrayList<SalesForm> objList = new ArrayList<>();

        for (BcaShipcarrier shipCarrier : shipCarriers) {
            SalesForm salesForm = new SalesForm();
            salesForm.setShipCarrierID(shipCarrier.getShipCarrierId().toString());
            salesForm.setShipCarrierName(shipCarrier.getName());
            salesForm.setDefaultItem(shipCarrier.getIsDefault() != null ? shipCarrier.getIsDefault() : false);
            objList.add(salesForm);
        }

        return objList;
    }
//	public ArrayList getVia(String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//		int cid = Integer.parseInt(compId);
//		ArrayList<SalesForm> objList = new ArrayList<>();
//		try {
//			String sqlString = "select ShipCarrierID,Name,IsDefault from bca_shipcarrier where Active=1 and CompanyID=?";
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setInt(1, cid);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SalesForm sales = new SalesForm();
//				sales.setShipCarrierID(rs.getString(1));
//				sales.setShipCarrierName(rs.getString(2));
//				sales.setDefaultItem(rs.getBoolean(3));
//				objList.add(sales);
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, "Error in  Class InvoiceInfo and  method -getVia " + ee.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return objList;
//	}

	public boolean insertSalesData(String sNewID, String title, String oldVal, String newVal, String taxRateVal,
			String compId) {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null, pstmt1, pstmt2, pstmt3, pstmt4, pstmt5, pstmt6, pstmt7, pstmt8, pstmt9, pstmt10,
				pstmt11 = null;
		ResultSet rs = null;
		boolean valid = false;
		try {
			Statement stmt = con.createStatement();
			String sqlString = "";
			String iD = "";
			if ("TAX".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(SalesTaxID)+1 from bca_salestax");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
				}
				pstmt.close();
				rs.close();
				String newValtaxRateVal = newVal + " " + taxRateVal;
//				sqlString="INSERT INTO `bca_salestax`(`SalesTaxID`, `CompanyID`, `State`, `Rate`, `Active`, `Suffix`) " +
//						"values('" + iD + "','" + compId + "',\"" + newValtaxRateVal + "\",'" + taxRateVal + "',1,1)";
				pstmt1 = con.prepareStatement(
						"INSERT INTO `bca_salestax`(`SalesTaxID`, `CompanyID`, `State`, `Rate`, `Active`, `Suffix`)"
								+ "values(?,?,?,?,?,?)");
				pstmt1.setString(1, iD);
				pstmt1.setString(2, compId);
				pstmt1.setString(3, newValtaxRateVal);
				pstmt1.setString(4, taxRateVal);
				pstmt1.setInt(5, 1);
				pstmt1.setInt(6, 1);
				pstmt1.executeUpdate();
				pstmt1.close();

			} else if ("CUSTOMER TITLE".equalsIgnoreCase(title)) {
				Loger.log("CUSTOMER TITLE");
				pstmt = con.prepareStatement("select max(TitleID)+1 from bca_title");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// iD = rs.getString(1);
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_title(TitleID, Title, CompanyID, Active)  values('" + iD + "',\""
//						+ newVal + "\",'" + compId + "',1)";

				pstmt2 = con
						.prepareStatement("insert into bca_title(TitleID, Title, CompanyID, Active) values(?,?,?,?)");
				pstmt2.setString(1, iD);
				pstmt2.setString(2, newVal);
				pstmt2.setString(3, compId);
				pstmt2.setInt(4, 1);
				pstmt2.executeUpdate();
				pstmt2.close();

			} else if ("REP".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(SalesRepID)+1 from bca_salesrep");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
					// iD = rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_salesrep values('" + iD
//						+ "','" + compId + "',\"" + newVal + "\",1,0)";
				pstmt3 = con.prepareStatement("insert into bca_salesrep values(?,?,?,?,?)");
				pstmt3.setString(1, iD);
				pstmt3.setString(2, compId);
				pstmt3.setString(3, newVal);
				pstmt3.setInt(4, 1);
				pstmt3.setInt(5, 0);
				pstmt3.executeUpdate();
				pstmt3.close();

			} else if ("TERMS".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(TermID)+1 from bca_term");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
					// iD = rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_term values('" + iD + "','"
//						+ compId + "',\"" + newVal + "\",1,0)";
				pstmt4 = con.prepareStatement("insert into bca_term values(?,?,?,?,?)");
				pstmt4.setString(1, iD);
				pstmt4.setString(2, compId);
				pstmt4.setString(3, newVal);
				pstmt4.setInt(4, 1);
				pstmt4.setInt(5, 0);
				pstmt4.executeUpdate();
				pstmt4.close();
			} else if ("MESSAGE".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(MessageID)+1 from bca_message");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
					// iD = rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_message values('" + iD + "','"
//						+ compId + "',\"" + newVal + "\",1,0)";
				pstmt5 = con.prepareStatement("insert into bca_message values(?,?,?,?,?)");
				pstmt5.setString(1, iD);
				pstmt5.setString(2, compId);
				pstmt5.setString(3, newVal);
				pstmt5.setInt(4, 1);
				pstmt5.setInt(5, 0);
				pstmt5.executeUpdate();
				pstmt5.close();
			} else if ("BUSINESS TYPE".equalsIgnoreCase(title)) {

				pstmt = con.prepareStatement("select max(CVCategoryID)+1 from bca_cvcategory");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
					// iD = rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_cvcategory values('" + iD
//						+ "','" + compId + "',\"" + newVal + "\",1,0)";
				pstmt6 = con.prepareStatement("insert into bca_cvcategory values(?,?,?,?,?)");
				pstmt6.setString(1, iD);
				pstmt6.setString(2, compId);
				pstmt6.setString(3, newVal);
				pstmt6.setInt(4, 1);
				pstmt6.setInt(5, 0);
				pstmt6.executeUpdate();
				pstmt6.close();
			} else if ("LOCATION".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(LocationID)+1 from bca_location");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
					// iD = rs.getString(1);

				}

				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_location(LocationID,Name,CompanyID,Active) values('"
//						+ iD + "',\"" + newVal + "\",'" + compId + "',1)";
				pstmt7 = con
						.prepareStatement("insert into bca_location(LocationID,Name,CompanyID,Active) values(?,?,?,?)");
				pstmt7.setString(1, iD);
				pstmt7.setString(2, newVal);
				pstmt7.setString(3, compId);
				pstmt7.setInt(4, 1);
				pstmt7.executeUpdate();
				pstmt7.close();

			} else if ("PAYMENT TYPE".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(PaymentTypeID)+1 from bca_paymenttype");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_paymenttype(PaymentTypeID,CompanyID,Name,Active,TypeCategory) values('"
//						+ iD + "','" + compId + "',\"" + newVal + "\",1,1)";
				pstmt8 = con.prepareStatement(
						"insert into bca_paymenttype(PaymentTypeID,CompanyID,Name,Active,TypeCategory) values(?,?,?,?,?)");
				pstmt8.setString(1, iD);
				pstmt8.setString(2, compId);
				pstmt8.setString(3, newVal);
				pstmt8.setInt(4, 1);
				pstmt8.setInt(5, 1);
				pstmt8.executeUpdate();
				pstmt8.close();
			} else if ("RECEIVED TYPE".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(PaymentTypeID)+1 from bca_receicedtype");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_receicedtype(PaymentTypeID,CompanyID,Name,Active,TypeCategory) values('"
//						+ iD + "','" + compId + "',\"" + newVal + "\",1,1)";
				pstmt9 = con.prepareStatement(
						"insert into bca_receicedtype(PaymentTypeID,CompanyID,Name,Active,TypeCategory) values(?,?,?,?,?)");
				pstmt9.setString(1, iD);
				pstmt9.setString(2, compId);
				pstmt9.setString(3, newVal);
				pstmt9.setInt(4, 1);
				pstmt9.setInt(5, 1);
				pstmt9.executeUpdate();
				pstmt9.close();

			} else if ("CREDIT CARD".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(CCTypeID)+1 from bca_cctype");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// iD = rs.getString(1);
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_cctype values('" + iD + "','"
//						+ compId + "',\"" + newVal + "\",1,0)";
				pstmt10 = con.prepareStatement("insert into bca_cctype values(?,?,?,?,?)");
				pstmt10.setString(1, iD);
				pstmt10.setString(2, compId);
				pstmt10.setString(3, newVal);
				pstmt10.setInt(4, 1);
				pstmt10.setInt(5, 0);
				pstmt10.executeUpdate();
				pstmt10.close();
			} else if ("SHIPPING VIA".equalsIgnoreCase(title)) {
				pstmt = con.prepareStatement("select max(ShipCarrierID)+1 from bca_shipcarrier");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// iD = rs.getString(1);
					iD = (rs.getString(1) == null) ? "0" : rs.getString(1);
				}
				pstmt.close();
				rs.close();
//				sqlString = "insert into bca_shipcarrier  (ShipCarrierID, CompanyID,Name,Active) values('" + iD+ "','" + compId + "',\"" + newVal + "\",1)";
				pstmt11 = con.prepareStatement(
						"insert into bca_shipcarrier (ShipCarrierID, CompanyID,Name,Active) values(?,?,?,?)");
				pstmt11.setString(1, iD);
				pstmt11.setString(2, compId);
				pstmt11.setString(3, newVal);
				pstmt11.setInt(4, 1);
				pstmt11.executeUpdate();
				pstmt11.close();
			}

			Loger.log(sqlString);

			int count = stmt.executeUpdate(sqlString);
			if (count > 0)
				valid = true;

		} catch (SQLException ee) {

			Loger.log(2, "Error in updateSalesData() " + ee);
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
		return valid;

	}

	public boolean updateSalesData(String sNewID, String title, String oldVal, String newVal, String taxRateVal,
			String compId) {
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		boolean valid = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// ResultSet rs = null;
		con = db.getConnection();

		try {
			Statement stmt = con.createStatement();
			String sqlString = "";
			String iD = "";
			int sNewvalID = Integer.parseInt(sNewID);
			if ("CUSTOMER TITLE".equalsIgnoreCase(title))
				sqlString = "update bca_title set Title=\"" + newVal + "\" where TitleID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("SHIPPING VIA".equalsIgnoreCase(title))
				sqlString = "update bca_shipcarrier set Name=\"" + newVal + "\" where ShipCarrierID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("REP".equalsIgnoreCase(title))
				sqlString = "update  bca_salesrep set Name=\"" + newVal + "\" where SalesRepID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("TERMS".equalsIgnoreCase(title))
				sqlString = "update bca_term set Name=\"" + newVal + "\" where TermID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("BUSINESS TYPE".equalsIgnoreCase(title))
				sqlString = "update bca_cvcategory set Name=\"" + newVal + "\" where CVCategoryID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("LOCATION".equalsIgnoreCase(title))
				sqlString = "update bca_location set Name=\"" + newVal + "\" where LocationID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("PAYMENT TYPE".equalsIgnoreCase(title))
				sqlString = "update bca_paymenttype set Name=\"" + newVal + "\" where PaymentTypeID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("RECEIVED TYPE".equalsIgnoreCase(title))
				sqlString = "update bca_receicedtype set Name=\"" + newVal + "\" where PaymentTypeID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("CREDIT CARD".equalsIgnoreCase(title))
				sqlString = "update bca_cctype set Name=\"" + newVal + "\" where CCTypeID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("MESSAGE".equalsIgnoreCase(title))
				sqlString = "update bca_message set Name=\"" + newVal + "\" where MessageID=" + sNewvalID
						+ " and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("TAX".equalsIgnoreCase(title))
				sqlString = "update bca_salestax set State=\"" + newVal + "\" , rate='" + taxRateVal
						+ "' where SalesTaxID=" + sNewvalID + " and CompanyID like '" + compId
						+ "'	and Active like '1'";

			Loger.log(sqlString);
			int count = stmt.executeUpdate(sqlString);
			if (count > 0)
				valid = true;
		} catch (SQLException ee) {
			Loger.log(2, "Error in updateSalesData() " + ee);
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
		return valid;
	}

	public boolean DeleteSalesData(String sNewvalID, String title, String compId) {

		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		boolean valid = false;
		// ResultSet rs = null;
		con = db.getConnection();
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			String sqlString = "";
			if ("CUSTOMER TITLE".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_title set Active = '0' where TitleID=\"" + sNewvalID
				 * + "\" and CompanyID like '" + compId + "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_title set Active = '0' where Title=\"" + sNewvalID + "\" and CompanyID like '"
						+ compId + "'	and Active like '1'";
			else if ("SHIPPING VIA".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_shipcarrier set Active = '0' where ShipCarrierID=\""
				 * + sNewvalID + "\" and CompanyID like '" + compId +
				 * "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_shipcarrier set Active = '0' where Name=\"" + sNewvalID
						+ "\" and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("REP".equalsIgnoreCase(title))
				/*
				 * sqlString = "update  bca_salesrep set Active = '0' where SalesRepID=\"" +
				 * sNewvalID + "\" and CompanyID like '" + compId + "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update  bca_salesrep set Active = '0' where Name=\"" + sNewvalID
						+ "\" and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("TERMS".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_term set Active = '0' where TermID=\"" + sNewvalID +
				 * "\" and CompanyID like '" + compId + "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_term set Active = '0' where Name=\"" + sNewvalID + "\" and CompanyID like '"
						+ compId + "'	and Active like '1'";
			else if ("BUSINESS TYPE".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_cvcategory set Active = '0' where CVCategoryID=\"" +
				 * sNewvalID + "\" and CompanyID like '" + compId + "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_cvcategory set Active = '0' where Name=\"" + sNewvalID
						+ "\" and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("LOCATION".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_location set Active = '0' where LocationID=\"" +
				 * sNewvalID + "\" and CompanyID like '" + compId + "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_location set Active = '0' where Name=\"" + sNewvalID + "\" and CompanyID like '"
						+ compId + "'	and Active like '1'";
			else if ("PAYMENT TYPE".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_paymenttype set Active = '0' where PaymentTypeID=\""
				 * + sNewvalID + "\" and CompanyID like '" + compId +
				 * "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_paymenttype set Active = '0' where Name=\"" + sNewvalID
						+ "\" and CompanyID like '" + compId + "'	and Active like '1'";
			else if ("RECEIVED TYPE".equalsIgnoreCase(title))
				sqlString = "update bca_receicedtype set Active = '0' where Name=\"" + sNewvalID
						+ "\" and CompanyID like '" + compId + "' and Active like '1'";
			else if ("CREDIT CARD".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_cctype set Active = '0' where CCTypeID=\"" +
				 * sNewvalID + "\" and CompanyID like '" + compId + "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_cctype set Active = '0' where Name=\"" + sNewvalID + "\" and CompanyID like '"
						+ compId + "'	and Active like '1'";
			else if ("MESSAGE".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_message set Active = '0' where MessageID=\"" +
				 * sNewvalID + "\" and CompanyID like '" + compId + "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_message set Active = '0' where Name=\"" + sNewvalID + "\" and CompanyID like '"
						+ compId + "'	and Active like '1'";
			else if ("TAX".equalsIgnoreCase(title))
				/*
				 * sqlString = "update bca_salestax set Active = '0' where SalesTaxID=\"" +
				 * sNewvalID + "\" and CompanyID like '" + compId + "'	and Active like '1'";
				 */
				// Added By Tulsi
				sqlString = "update bca_salestax set Active = '0' where State=\"" + sNewvalID
						+ "\" and CompanyID like '" + compId + "'	and Active like '1'";

			Loger.log(sqlString);
			int count = stmt.executeUpdate(sqlString);
			if (count > 0)
				valid = true;

		} catch (SQLException ee) {
			Loger.log(2, "Error in updateSalesData() " + ee);
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
}
