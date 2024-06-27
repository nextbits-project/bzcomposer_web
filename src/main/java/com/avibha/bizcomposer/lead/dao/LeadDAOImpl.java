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
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.avibha.bizcomposer.lead.dto.LeadDto;
import com.avibha.bizcomposer.purchase.dao.VendorCategory;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaCities;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaLeadDirectory;
import com.nxsol.bzcomposer.company.domain.BcaLeadNew;
import com.nxsol.bzcomposer.company.domain.BcaLeadSource;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;
import com.nxsol.bzcomposer.company.domain.BcaStates;
import com.nxsol.bzcomposer.company.domain.BcaTerm;
import com.nxsol.bzcomposer.company.domain.BcaTitle;
import com.nxsol.bzcomposer.company.repos.BcaCitiesRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCountriesRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadNewRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadSourceRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;
import com.nxsol.bzcomposer.company.repos.BcaStatesRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;
import com.nxsol.bzcomposer.company.repos.BcaTitleRepository;
import com.nxsol.bzcomposer.company.service.LeadSourceService;
import com.nxsol.bzcomposer.company.utils.DateHelper;
import com.pritesh.bizcomposer.accounting.bean.TblBSAddress2;

@Service
public class LeadDAOImpl implements LeadDAO {

	private SQLExecutor db;
	
	private SimpleDateFormat dateFormat;
  
	@Autowired
	BcaLeadNewRepository bcaLeadNewRepository;
	
	@Autowired
	private VendorCategory vc;
	
	@Autowired
	private BcaTitleRepository bcaTitleRepository;
	
	@Autowired
	private BcaCountriesRepository countriesRepository;
	
	@Autowired
	private BcaStatesRepository stateRepository;
	
	@Autowired
	private BcaCitiesRepository cityRepository;
	
	@Autowired
	private BcaCompanyRepository bcaCompanyRepository;
	
	@Autowired
	private BcaTermRepository bcaTermRepository;
	
	@Autowired
	private BcaSalesrepRepository bcaSalesrepRepository;
	
	@Autowired
	private BcaShipcarrierRepository bcaShipcarrierRepository;
	
	@Autowired
	private BcaPaymenttypeRepository bcaPaymenttypeRepository;
	
	@Autowired
	private BcaLeadSourceRepository bcaLeadSourceRepository;
	
	@Autowired
	private LeadSourceService leadSourceService;
	
	@PostConstruct
	private void postConstruct() {
		db = new SQLExecutor();
		dateFormat = new SimpleDateFormat("dd MMM, YYYY");
		java.util.Date date = new java.util.Date();

	    String currentTime = dateFormat.format(date);
	    
	    System.out.println(currentTime);
	}
	
	public static void main(String[] args) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM, YYYY");
		
		System.out.println(dateFormat.format(new java.util.Date()));
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
	
	@Override
	public boolean insertLead(BcaLeadDirectory bcaLeadDirectory, CustomerDto c, String compID) {
		boolean ret = false;
		try {
			String oBal = "0.0";
			String exCredit = "0.0";
			String status = "N";
			Integer insertedleadID = 0;
			String maxleadID = bcaLeadNewRepository.getMaxId();
			if (c.getOpeningUB() != null && c.getOpeningUB().trim().length() > 0)
				oBal = c.getOpeningUB();

			if (c.getExtCredit() != null && c.getExtCredit().trim().length() > 0)
				exCredit = c.getExtCredit();
			
			String vcName = vc.CVCategory(removeLast2Digit(c.getType()));
			BcaLeadNew bcv = new BcaLeadNew();
			bcv.setLeadID(Integer.valueOf(maxleadID));
			bcv.setName(c.getCname());
			Date dateAdded = (c.getDateAdded() == null || c.getDateAdded().equals("")) ? string2date(" now() ") : string2date(c.getDateAdded());
			bcv.setDateAdded(DateHelper.convertDateToOffsetDateTime(dateAdded));
			if(c.getTitle() != null && !c.getTitle().isEmpty()) {
				BcaTitle bcaTitle = bcaTitleRepository.findBytitleAndCompany_CompanyIdAndActive(c.getTitle(), Long.valueOf(compID), 1);
				bcv.setCustomerTitle(String.valueOf(bcaTitle.getTitleId()));
			}
			
			bcv.setFirstName(c.getFirstName());
			bcv.setLastName(c.getLastName());
			bcv.setAddress1(c.getAddress1());
			if(c.getAddress2() != null && !c.getAddress2().isEmpty())
				bcv.setAddress2(c.getAddress2());
			else 
				bcv.setAddress2("");
			
			if(c.getCity() != null && !c.getCity().isEmpty()) {
				BcaCities bcaCities = cityRepository.findByname(c.getCity());
				if(bcaCities != null && bcaCities.getId() != null && bcaCities.getId() > 0)
					bcv.setCity(String.valueOf(bcaCities.getId()));
			}
			
			if(c.getState() != null && !c.getState().isEmpty()) {
				BcaStates bcaStates = stateRepository.findByname(c.getState());
				if(bcaStates != null && bcaStates.getId() != null && bcaStates.getId() > 0)
					bcv.setState(String.valueOf(bcaStates.getId()));
			}
			
			if(c.getCountry() != null && !c.getCountry().isEmpty()) {
				BcaCountries bcaCountries = countriesRepository.findByname(c.getCountry());
				if(bcaCountries != null && bcaCountries.getId() != null && bcaCountries.getId() > 0)
					bcv.setCountry(String.valueOf(bcaCountries.getId()));
			}
			
			if (null != c.getZipCode() && !c.getZipCode().isEmpty()) {
				if(c.getZipCode().contains(".")) {
					String zipcode = c.getZipCode().replace(".0", "");
					bcv.setZipCode(zipcode);
				} else {
					bcv.setZipCode(c.getZipCode());
				}
			}
			
			if(c.getPhone() != null && !c.getPhone().isEmpty())
				bcv.setPhone(c.getPhone());
			else 
				bcv.setPhone("");
			
			if(c.getPhone() != null && !c.getPhone().isEmpty())
				bcv.setCellPhone(c.getPhone());
			else 
				bcv.setCellPhone("");
			
			if(c.getFax() != null && !c.getFax().isEmpty())
				bcv.setFax(removeLast2Digit(c.getFax()));
			else 
				bcv.setFax("");
			
			bcv.setHomePage(c.getHomePage());
			if(c.getEmail() != null && !c.getEmail().isEmpty())
				bcv.setEmail(c.getEmail());
			else 
				bcv.setEmail("");
			
			Optional<BcaCompany> company = bcaCompanyRepository.findById(Long.parseLong(compID));
			if (company.isPresent()) {
				bcv.setCompany(company.get());
			}

			bcv.setResellerTaxId(c.getTexID());
			bcv.setVendorOpenDebit(Double.parseDouble(oBal));
			bcv.setVendorAllowedCredit(Double.parseDouble(exCredit));
			bcv.setDetail(c.getMemo());
			if (c.getIsclient() != null && !c.getIsclient().isEmpty())
				bcv.setCvtypeId(Integer.valueOf(c.getIsclient()));
			
			if (null != c.getTaxAble() && !c.getTaxAble().isEmpty())
				bcv.setTaxable(Long.parseLong(removeLast2Digit(c.getTaxAble())));
			
			if (null != c.getType() && !c.getType().isEmpty())
				bcv.setCvcategoryId(Integer.parseInt(removeLast2Digit(c.getType())));
			
			bcv.setCvcategoryName(vcName);
			bcv.setActive(1);
			bcv.setDeleted(0);
			bcv.setStatus(status);
			bcv.setMiddleName(c.getMiddleName());
			Date dateInput = (c.getDateInput() == null || c.getDateInput().trim().equals("")) ? null : string2date(c.getDateInput());
			bcv.setDateInput(DateHelper.convertDateToOffsetDateTime(dateInput));
			int termId = c.getTerm() == null || c.getTerm().trim().equals("") ? 0 : Integer.parseInt(removeLast2Digit(c.getTerm()));
			bcv.setDbaname(c.getDbaName());
			Optional<BcaTerm> term = bcaTermRepository.findById(termId);
			if (term.isPresent())
				bcv.setTerm(term.get());
			int salesRepId = (c.getRep() == null || c.getRep().trim().equals("")) ? 0 : Integer.parseInt(removeLast2Digit(c.getRep()));
			Optional<BcaSalesrep> salesRep = bcaSalesrepRepository.findById(salesRepId);
			if (salesRep.isPresent())
				bcv.setSalesRep(salesRep.get());
			if (c.getShipping() != null) {
				Optional<BcaShipcarrier> shipCarrier = bcaShipcarrierRepository.findById(Integer.parseInt(removeLast2Digit(c.getShipping())));	
				if (shipCarrier.isPresent())
					bcv.setShipCarrier(shipCarrier.get());
			}
			
			int paymentTypeId = (c.getPaymentType() == null || c.getPaymentType().trim().equals("")) ? 0
					: Integer.parseInt(removeLast2Digit(c.getPaymentType()));
			Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository.findById(paymentTypeId);
			if (paymentType.isPresent())
				bcv.setPaymentType(paymentType.get());
			if (null != c.getCcType() && !c.getCcType().trim().isEmpty())
				bcv.setCctypeId(Integer.parseInt(c.getCcType()));
			bcv.setLeadDirectory(bcaLeadDirectory);
			
			if (c.getSourceName() != null && !c.getSourceName().isEmpty()) {
				Optional<BcaLeadSource> bcaLeadSource = bcaLeadSourceRepository.getLeadSourceByName(removeLast2Digit(c.getSourceName()));	
				if (bcaLeadSource.isPresent()) {
					bcv.setLeadSource(bcaLeadSource.get());
				} else {
					BcaLeadSource saveLeadSource = leadSourceService.insertLeadSource(removeLast2Digit(c.getSourceName()), bcv.getCompany());
					bcv.setLeadSource(saveLeadSource);	
				}
			}
			
			BcaLeadNew cvSaved = bcaLeadNewRepository.save(bcv);
			if (null != cvSaved) {
				insertedleadID = cvSaved.getLeadID();
				bcv.setLeadID(insertedleadID);
				ret = true;
			}
		} catch (Exception ee) {
			Loger.log(2, "SQLException in Class LeadDAOImpl,  method -insertLead " + ee.toString());

		}
		return ret;
	}
	
	public java.sql.Date string2date(String d) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
		java.util.Date d1 = null;
		try {
			d1 = sdf.parse(d);
		} catch (ParseException e) {
			Loger.log(2, "ParseException" + e.getMessage());

		}
		return (d1 != null ? new java.sql.Date(d1.getTime()) : new java.sql.Date(new java.util.Date().getTime()));
	}
	
	public static String removeLast2Digit(String str) {
		if (str != null && !str.isEmpty() && str.length() > 2 && str.substring(str.length() - 2).equals(".0")) {
			str = str.substring(0, str.length() - 2);	
		}
		return str;
	}
	
}
