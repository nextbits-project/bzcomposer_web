package com.avibha.bizcomposer.configuration.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.StringTokenizer;
import java.util.stream.Collectors;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.util.LabelValueBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.MyUtility;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaFootnote;
import com.nxsol.bzcomposer.company.domain.BcaInvoicestyle;
import com.nxsol.bzcomposer.company.domain.BcaJobcategory;
import com.nxsol.bzcomposer.company.domain.BcaLabel;
import com.nxsol.bzcomposer.company.domain.BcaLineofcreditterm;
import com.nxsol.bzcomposer.company.domain.BcaLocation;
import com.nxsol.bzcomposer.company.domain.BcaMasterrmareason;
import com.nxsol.bzcomposer.company.domain.BcaMessage;
import com.nxsol.bzcomposer.company.domain.BcaPostyle;
import com.nxsol.bzcomposer.company.domain.BcaPreference;
import com.nxsol.bzcomposer.company.domain.BcaPreferenceHubs;

import com.nxsol.bzcomposer.company.domain.BcaRefundreason;
import com.nxsol.bzcomposer.company.domain.BcaRmareason;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.domain.BcaSalestax;
import com.nxsol.bzcomposer.company.domain.BcaServicetype;
import com.nxsol.bzcomposer.company.domain.BcaStates;
import com.nxsol.bzcomposer.company.domain.BcaTerm;
import com.nxsol.bzcomposer.company.domain.BcaUsergroup;
import com.nxsol.bzcomposer.company.domain.BcpJobcode;
import com.nxsol.bzcomposer.company.domain.nonmanaged.BcaFootnoteResult2;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCountriesRepository;
import com.nxsol.bzcomposer.company.repos.BcaFootnoteRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoicestyleRepository;
import com.nxsol.bzcomposer.company.repos.BcaJobcategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaLabelRepository;
import com.nxsol.bzcomposer.company.repos.BcaLineofcredittermRepository;
import com.nxsol.bzcomposer.company.repos.BcaLocationRepository;
import com.nxsol.bzcomposer.company.repos.BcaMasterrmareasonRepository;
import com.nxsol.bzcomposer.company.repos.BcaMessageRepository;
import com.nxsol.bzcomposer.company.repos.BcaPostyleRepository;
import com.nxsol.bzcomposer.company.repos.BcaPreferenceHubsRepository;
import com.nxsol.bzcomposer.company.repos.BcaPreferenceRepository;
import com.nxsol.bzcomposer.company.repos.BcaRefundreasonRepository;
import com.nxsol.bzcomposer.company.repos.BcaRmareasonRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalestaxRepository;
import com.nxsol.bzcomposer.company.repos.BcaServicetypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaStatesRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;
import com.nxsol.bzcomposer.company.repos.BcaUserRepository;
import com.nxsol.bzcomposer.company.repos.BcaUsergroupRepository;
import com.nxsol.bzcomposer.company.repos.BcpJobcodeRepository;

@Service
public class ConfigurationInfo {

	@Autowired
	private BcaLabelRepository bcaLabelRepository;

	@Autowired
	private BcaUsergroupRepository bcaUsergroupRepository;

	@Autowired
	private BcaCompanyRepository bcaCompanyRepository;

	@Autowired
	private BcaInvoicestyleRepository bcaInvoicestyleRepository;

	@Autowired
	private BcpJobcodeRepository bcpJobcodeRepository;
	@Autowired
	private  BcaPreferenceHubsRepository bcaPreferenceHubsRepository; 

	@Autowired
	private BcaSalestaxRepository bcaSalestaxRepository;

	@Autowired
	private BcaServicetypeRepository bcaServicetypeRepository;

	private static HttpServletRequest request;

	@Autowired
	private BcaLabelRepository bcaLabelRepo;

	@Autowired
	private BcaUsergroupRepository bcaUserGroupRepo;

	@Autowired
	private BcaInvoicestyleRepository bcaInvoiceStyleRepo;

	public void setCurrentRequest(HttpServletRequest req) {
		request = req;
	}

	public ConfigurationDto getDefaultCongurationDataBySession() {
		HttpSession sess = null;
		if (request != null) {
			sess = request.getSession();
		}

		String companyID = "";
		Long companyIdL = 1L;
		ConfigurationDto configDto = null;
		if (sess != null) {
			if (request.getSession().getAttribute("DefaultCongurationData") != null) {
				configDto = (ConfigurationDto) request.getSession().getAttribute("DefaultCongurationData");
			} else {
				companyID = (String) request.getSession().getAttribute("CID");
				companyIdL = Long.valueOf(companyID);
				configDto = getDefaultCongurationData(companyIdL, request);

			}

		} else {
			companyID = "1";
			configDto = getDefaultCongurationData(companyID);
		}

//		
		return configDto;
	}
//	public ConfigurationDto getDefaultCongurationDataBySession() {
//		// HttpSession sess = request.getSession();
//		String companyID = "1";// (String) request.getSession().getAttribute("CID");
//		ConfigurationDto configDto = null;
////        if(request.getSession().getAttribute("DefaultCongurationData") != null) {
////            configDto = (ConfigurationDto)request.getSession().getAttribute("DefaultCongurationData");
////        }else{
////            configDto = getDefaultCongurationData(companyID);
////        }
//		configDto = getDefaultCongurationData(companyID);
//		return configDto;
//	}

	/* Label List with id & name */

//	public ArrayList labelInfo() {
//		Connection con = null;
//		ArrayList<LabelValueBean> labelList = new ArrayList<LabelValueBean>();
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmtLabel = null;
//		ResultSet rsLabel = null;
//		if (executor == null)
//			return null;
//		con = executor.getConnection();
//		if (con == null)
//			return null;
//		try {
//			String labelQuery = "select ID,LabelType from bca_label";
//			pstmtLabel = con.prepareStatement(labelQuery);
//			rsLabel = pstmtLabel.executeQuery();

//			while (rsLabel.next()) {
//				labelList.add(new LabelValueBean(rsLabel.getString("LabelType"), rsLabel.getString("ID")));
//			}
//			pstmtLabel.close();
//			rsLabel.close();

//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "labelInfo " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//
//		return labelList;
//	}
	public List<LabelValueBean> labelInfo() {
		List<BcaLabel> labels = bcaLabelRepo.findAll();

		return labels.stream().map(label -> new LabelValueBean(label.getLabelType(), label.getId().toString()))
				.collect(Collectors.toList());
	}

	/* User group information with id & name */
//	public ArrayList userGroupInfo(String compId) {
//		Connection con = null;
//		ArrayList<ConfigurationDto> labelList = new ArrayList<ConfigurationDto>();
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmtGroup = null;
//		ResultSet rsGroup = null;
//		if (executor == null)
//			return null;
//		con = executor.getConnection();
//		if (con == null)
//			return null;
//		try {
//			String groupQuery = "select GroupID,UserGroupName from bca_usergroup where CompanyID=? and Active=1 ";
//			pstmtGroup = con.prepareStatement(groupQuery);
//			pstmtGroup.setString(1, compId);
//			rsGroup = pstmtGroup.executeQuery();
//			while (rsGroup.next()) {
//				ConfigurationDto cForm = new ConfigurationDto();
//				cForm.setGroupID(rsGroup.getInt("GroupID"));
//				cForm.setGroupNm(rsGroup.getString("UserGroupName"));
//				labelList.add(cForm);
//			}
//			pstmtGroup.close();
//			rsGroup.close();

//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "userGroupInfo " + ex.toString());
//		}
//
//		finally {
//			executor.close(con);
//		}
//		return labelList;
//	}
	public List<ConfigurationDto> userGroupInfo(String compId) {
		List<BcaUsergroup> groups = bcaUserGroupRepo.findByCompany_CompanyIdAndActive(Long.valueOf(compId), true);

		return groups.stream().map(group -> {
			ConfigurationDto cForm = new ConfigurationDto();
			cForm.setGroupID(group.getGroupId());
			cForm.setGroupNm(group.getUserGroupName());
			return cForm;
		}).collect(Collectors.toList());
	}

	/* Invoice Style List with id & name */
	public List<LabelValueBean> invoiceStyleList() {
		List<BcaInvoicestyle> invoiceStyles = bcaInvoiceStyleRepo.findByActive(1);

		return invoiceStyles.stream()
				.map(style -> new LabelValueBean(style.getName(), style.getInvoiceStyleId().toString()))
				.collect(Collectors.toList());
	}

//	public ArrayList invoiceStyleList() {
//		Connection con = null;
//		ArrayList<LabelValueBean> invStyleList = new ArrayList<LabelValueBean>();
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmtLabel = null;
//		ResultSet rsLabel = null;
//		if (executor == null)
//			return null;
//		con = executor.getConnection();
//		if (con == null)
//			return null;
//		try {
//			String labelQuery = "select InvoiceStyleID,Name from bca_invoicestyle where Active=1";
//			pstmtLabel = con.prepareStatement(labelQuery);
//			rsLabel = pstmtLabel.executeQuery();
//			while (rsLabel.next()) {
//				invStyleList.add(new LabelValueBean(rsLabel.getString("Name"), rsLabel.getString("InvoiceStyleID")));
//			}
//			pstmtLabel.close();
//			rsLabel.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "invoiceStyleList " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//
//		return invStyleList;
//	}

	@Autowired
	private BcaFootnoteRepository bcaFootnoteRepository;

	/* Footnote List with id & name */
	public List<LabelValueBean> footnoteList(String compId) {
		List<BcaFootnote> footnotes = bcaFootnoteRepository
				.findByCompany_CompanyIdAndActiveOrderByName(Long.valueOf(compId), 1);

		return footnotes.stream()
				.map(footnote -> new LabelValueBean(footnote.getName(), footnote.getFootNoteId().toString()))
				.collect(Collectors.toList());
	}
//	public ArrayList footnoteList(String compId) {
//		Connection con = null;
//		ArrayList<LabelValueBean> footnoteList = new ArrayList<LabelValueBean>();
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmtFootnote = null;
//		ResultSet rsFootnote = null;
//		if (executor == null)
//			return null;
//		con = executor.getConnection();
//		if (con == null)
//			return null;
//		try {
//			String footnoteQuery = "select FootNoteID,Name,Description from bca_footnote where CompanyID=? and Active=1 order by Name"; // JPA
//																																		// Check
//																																		// logical
//																																		// error
//																																		// description
//																																		// not
//																																		// required
//			pstmtFootnote = con.prepareStatement(footnoteQuery);
//
//			pstmtFootnote.setString(1, compId);
////          List<FootNoteQueryResult> footNoteQueryResults = bcaFootnoteRepository.findByCompanyIdAndactive(compId,1);
//			rsFootnote = pstmtFootnote.executeQuery();
//			while (rsFootnote.next()) {
//				footnoteList.add(new LabelValueBean(rsFootnote.getString("Name"), rsFootnote.getString("FootNoteID")));
//			}
////          for ( FootNoteQueryResult footNoteQueryResult: footNoteQueryResults )
////          {
////          	 footnoteList.add(new LabelValueBean(footNoteQueryResult.getName(), footNoteQueryResult.getFootNoteID()));
////          }
//			pstmtFootnote.close();
//			rsFootnote.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "footnoteList " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//
//		return footnoteList;
//	}

//    public ArrayList footnoteList(String compId) {
////        Connection con = null ;
//        ArrayList<LabelValueBean> footnoteList = new ArrayList<LabelValueBean>();
////        SQLExecutor executor = new SQLExecutor();
////        PreparedStatement pstmtFootnote = null;
////        ResultSet rsFootnote = null;
////        if (executor == null)
////            return null;
////        con = executor.getConnection();
////        if (con == null)
////            return null;
////        try {
////            String footnoteQuery = "select FootNoteID,Name,Description from bca_footnote where CompanyID=? and Active=1 order by Name"; // JPA Check logical error description not required
////            pstmtFootnote = con.prepareStatement(footnoteQuery);
//        
//        
////            pstmtFootnote.setString(1, compId);
//            List<FootNoteQueryResult> footNoteQueryResults = bcaFootnoteRepository.findByCompanyIdAndactive(compId,1);
////            rsFootnote = pstmtFootnote.executeQuery();
////            while (rsFootnote.next()) {
////                footnoteList.add(new LabelValueBean(rsFootnote.getString("Name"), rsFootnote.getString("FootNoteID")));
////            }
//            for ( FootNoteQueryResult footNoteQueryResult: footNoteQueryResults )
//            {
//            	 footnoteList.add(new LabelValueBean(footNoteQueryResult.getName(), footNoteQueryResult.getFootNoteID()));
//            }
////            pstmtFootnote.close();
////            rsFootnote.close();
////        } catch (SQLException ex) {
////            Loger.log("Exception in the class ConfigurationInfo and in method "
////                    + "footnoteList " + ex.toString());
////        } finally {
////            executor.close(con);
////        }
//
//        return footnoteList;
//    }

	@Autowired
	private BcpJobcodeRepository jobCodeRepository;

	/* Job code List with id,name,cost & description */
	public List<ConfigurationDto> jobCodeList(String compId) {
		List<BcpJobcode> jobCodes = jobCodeRepository.findByCompany_CompanyIdOrderByName(Long.valueOf(compId));

		return jobCodes.stream().map(jobCode -> {
			ConfigurationDto configForm = new ConfigurationDto();
			configForm.setJobCodeID(jobCode.getJobId());
			configForm.setJob(jobCode.getName());
			configForm.setCost(jobCode.getCost().doubleValue());
			configForm.setDescription(jobCode.getDescription());
			return configForm;
		}).collect(Collectors.toList());
	}
//	public ArrayList jobCodeList(String compId) {
//		Connection con = null;
//		ArrayList<ConfigurationDto> jobCodeList = new ArrayList<ConfigurationDto>();
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmtJobCode = null;
//		ResultSet rsJobCode = null;
//		if (executor == null)
//			return null;
//		con = executor.getConnection();
//		if (con == null)
//			return null;
//		try {
//			String jobCodeQuery = "select JobID,Name,Cost,Description from bcp_jobcode where CompanyID=?"
//					+ "order by Name";
//			pstmtJobCode = con.prepareStatement(jobCodeQuery);
//			pstmtJobCode.setString(1, compId);
//			rsJobCode = pstmtJobCode.executeQuery();
//			while (rsJobCode.next()) {
//				ConfigurationDto configForm = new ConfigurationDto();
//				configForm.setJobCodeID(rsJobCode.getInt("JobID"));
//				configForm.setJob(rsJobCode.getString("Name"));
//				configForm.setCost(rsJobCode.getDouble("Cost"));
//				configForm.setDescription(rsJobCode.getString("Description"));
//				jobCodeList.add(configForm);
//			}
//			pstmtJobCode.close();
//			rsJobCode.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "jobCodeList " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//
//		return jobCodeList;
//	}

	/* Sales Tax List with id & name */

	@Autowired
	private BcaSalestaxRepository salesTaxRepository;

	public List<LabelValueBean> salesTaxList(String compId) {
		List<BcaSalestax> salesTaxes = salesTaxRepository.findByCompany_CompanyIdAndActive(Long.valueOf(compId), 1);

		return salesTaxes.stream().map(tax -> new LabelValueBean(tax.getState(), tax.getSalesTaxId().toString()))
				.collect(Collectors.toList());
	}
//	public ArrayList salesTaxList(String compId) {
//		Connection con = null;
//		ArrayList<LabelValueBean> taxList = new ArrayList<LabelValueBean>();
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmtTax = null;
//		ResultSet rsTax = null;
//		if (executor == null)
//			return null;
//		con = executor.getConnection();
//		if (con == null)
//			return null;
//		try {
//			String footnoteQuery = "select SalesTaxID,State from bca_salestax where Active=1 and CompanyID=?";
//			pstmtTax = con.prepareStatement(footnoteQuery);
//			pstmtTax.setString(1, compId);
//			rsTax = pstmtTax.executeQuery();
//			while (rsTax.next()) {
//				taxList.add(new LabelValueBean(rsTax.getString("State"), rsTax.getString("SalesTaxID")));
//			}
//			pstmtTax.close();
//			rsTax.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "salesTaxList " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//
//		return taxList;
//	}

	/* Service Type List with id,name,invoicestyle id */

	@Autowired
	private BcaServicetypeRepository serviceTypeRepository;
	@Autowired
	private BcaInvoicestyleRepository invoiceStyleRepository;

	public List<ConfigurationDto> serviceTypeList(HttpServletRequest request) {
		List<BcaServicetype> serviceTypes = serviceTypeRepository.findAllByOrderByServiceName();
		StringBuilder serviceListBuilder = new StringBuilder();

		List<ConfigurationDto> serviceTypeList = serviceTypes.stream().map(serviceType -> {
			ConfigurationDto configForm = new ConfigurationDto();
			configForm.setServiceID(serviceType.getServiceId());
			configForm.setServiceName(serviceType.getServiceName());
			configForm.setInvStyleID(serviceType.getInvoiceStyle().getInvoiceStyleId());

			BcaInvoicestyle invoiceStyle = invoiceStyleRepository
					.findByInvoiceStyleIdAndActive(serviceType.getInvoiceStyle().getInvoiceStyleId(), 1);
			configForm.setInvName(invoiceStyle != null ? invoiceStyle.getName() : "");

			serviceListBuilder.append(configForm.getServiceID()).append("/*/").append(configForm.getServiceName())
					.append("/*/");
			return configForm;
		}).collect(Collectors.toList());

		request.setAttribute("ServList", serviceListBuilder.toString());
		return serviceTypeList;
	}
//	public ArrayList serviceTypeList(HttpServletRequest request) {
//		String serviceList = "";
//		Connection con = null;
//		ArrayList<ConfigurationDto> serviceTypeList = new ArrayList<ConfigurationDto>();
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmtServiceType = null;
//		PreparedStatement pstmtInvStyle = null;
//		ResultSet rsServiceType = null;
//		ResultSet rsInvStyle = null;
//		if (executor == null)
//			return null;
//		con = executor.getConnection();
//		if (con == null)
//			return null;
//		try {
//			String serviceTypeQuery = "select * from bca_servicetype order by ServiceName";
//			pstmtServiceType = con.prepareStatement(serviceTypeQuery);
//			rsServiceType = pstmtServiceType.executeQuery();
//			String invStyleQuery = "select Name from bca_invoicestyle where InvoiceStyleID=? and Active=1";
//			while (rsServiceType.next()) {
//				ConfigurationDto configForm = new ConfigurationDto();
//				configForm.setServiceID(rsServiceType.getInt("ServiceID"));
//				configForm.setServiceName(rsServiceType.getString("ServiceName"));
//				configForm.setInvStyleID(rsServiceType.getInt("InvoiceStyleID"));
//
//				pstmtInvStyle = con.prepareStatement(invStyleQuery);
//				pstmtInvStyle.setInt(1, configForm.getInvStyleID());
//				rsInvStyle = pstmtInvStyle.executeQuery();
//				if (rsInvStyle.next()) {
//					configForm.setInvName(rsInvStyle.getString("Name"));
//
//				} else
//					configForm.setInvName("");
//				pstmtInvStyle.close();
//				rsInvStyle.close();
//				serviceTypeList.add(configForm);
//				serviceList += configForm.getServiceID() + "/*/" + configForm.getServiceName() + "/*/";
//			}
//			request.setAttribute("ServList", serviceList);
//			pstmtServiceType.close();
//			rsServiceType.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "jobCodeList " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//
//		return serviceTypeList;
//	}

	@Autowired
	private BcaPreferenceRepository preferenceRepository;
	
	@Autowired
	private BcaPreferenceHubsRepository preferencehubsRepository;

	public ConfigurationDto getDefaultCongurationData(Long companyId, HttpServletRequest request) {
		Optional<BcaPreference> preferenceOpt = preferenceRepository.findByCompany_CompanyIdAndActive(companyId, 1);

		ConfigurationDto cForm = new ConfigurationDto();
		if (preferenceOpt.isPresent()) {
			BcaPreference preference = preferenceOpt.get();

			// Map fields from preference to cForm
			cForm.setPreferenceID(preference.getPreferenceId());
			cForm.setAddressSettings(preference.getCopyAddress() ? "on" : "off");
			cForm.setCustDefaultCountryID(preference.getCustomerCountry().getId());
			cForm.setSelectedStateId(preference.getCustomerState().getId());
			cForm.setCustTaxable(preference.getCustomerTaxable() == 1 ? "on" : "off");
			cForm.setSelectedTermId(preference.getSalesTermId());
			cForm.setSelectedSalesRepId(preference.getSalesRepId());
			cForm.setSelectedPaymentId(preference.getSalesPayMethodId());
			cForm.setCustomerShippingId(preference.getSalesViaId());
			cForm.setAnnualInterestRate(preference.getChargeInterest());
			cForm.setMinCharge(preference.getChargeMinimum());
			cForm.setGracePeriod(preference.getChargeGrace().intValue());
			cForm.setAssessFinanceCharge(preference.getChargeReassess() ? "on" : "off");
			cForm.setMarkFinanceCharge(preference.getChargeMarkFinance() ? "on" : "off");
			cForm.setProductCategoryID(preference.getProductCategoryId());
			cForm.setLocationID(preference.getLocationId());
			cForm.setReorderPoint(preference.getReOrderPoint());
			cForm.setVendorInvoiceStyleId(preference.getVendorInvoiceStyleId());
			cForm.setCustomerType(preference.getCustomerType());
			cForm.setPriceLevelPriority(preference.getPriceLevelPriority());
			cForm.setPriceLevelDealer(preference.getPriceLevelDealer());
			cForm.setPriceLevelCustomer(preference.getPriceLevelCustomer());
			cForm.setPriceLevelGeneral(preference.getPriceLevelGeneral());
			cForm.setSaleTaxRate(preference.getSalesTaxRate());
			cForm.setShowUSAInBillShipAddress(preference.getShowUsainBillShipAddress());
			cForm.setInvoiceTemplateType(preference.getInvoiceTemplateType());
			cForm.setEstTemplateType(preference.getEstimationTemplateType());
			cForm.setSoTemplateType(preference.getSalesOrderTemplateType());
			cForm.setPoTemplateType(preference.getPurchaseOrderTemplateType());
			cForm.setPsTemplateType(preference.getPackingSlipTemplateType());
			cForm.setDisplayPeriod(preference.getDisplayPeriod());
			cForm.setStartInvoiceNum(preference.getStartingInvoiceNumber().toString());
			cForm.setStartEstimationNum(preference.getStartingEstimationNumber().toString());
			cForm.setStartSalesOrderNum(preference.getStartingSalesOrderNumber().toString());
			cForm.setStartPONum(preference.getStartingPonumber());
			cForm.setEstimationStyleID(preference.getEstimationStyleId());
			cForm.setSoStyleID(preference.getSostyleId());
			cForm.setIsSalePrefix(preference.getIsSalePrefix() ? "on" : "off");
			cForm.setIsPurchasePrefix(preference.getIsPurchasePrefix() ? "on" : "off");
			if (null != preference.getDefaultTitleID())
				cForm.setCustTitleID(preference.getDefaultTitleID());

			request.getSession().setAttribute("DefaultCongurationData", cForm);
		} else {
			// Handle case where preferences are not found
			Loger.log("Preferences not found for Company ID: " + companyId);
		}
		return cForm;
	}

//	public ConfigurationDto getDefaultCongurationData(String companyID) {
//		
//		ConfigurationDto cForm = new ConfigurationDto();
//		try {
//			Optional<BcaPreference> preferenceOpt = preferenceRepository.findByCompany_CompanyIdAndActive(Long.parseLong(companyID), 1);
//			if (preferenceOpt.isPresent()) {
//				BcaPreference preference = preferenceOpt.get();
//
//				// Map fields from preference to cForm
//				cForm.setPreferenceID(preference.getPreferenceId());
//				cForm.setAddressSettings(preference.getCopyAddress() ? "on" : "off");
//				cForm.setCustDefaultCountryID(preference.getCustomerCountry().getId());
//				cForm.setSelectedStateId(preference.getCustomerState().getId());
//				cForm.setCustTaxable(preference.getCustomerTaxable() == 1 ? "on" : "off");
//				cForm.setSelectedTermId(preference.getSalesTermId());
//				cForm.setSelectedSalesRepId(preference.getSalesRepId());
//				cForm.setSelectedPaymentId(preference.getSalesPayMethodId());
//				cForm.setCustomerShippingId(preference.getSalesViaId());
//				cForm.setAnnualInterestRate(preference.getChargeInterest());
//				cForm.setMinCharge(preference.getChargeMinimum());
//				cForm.setGracePeriod(preference.getChargeGrace().intValue());
//				cForm.setAssessFinanceCharge(preference.getChargeReassess() ? "on" : "off");
//				cForm.setMarkFinanceCharge(preference.getChargeMarkFinance() ? "on" : "off");
//				cForm.setProductCategoryID(preference.getProductCategoryId());
//				cForm.setLocationID(preference.getLocationId());
//				cForm.setReorderPoint(preference.getReOrderPoint());
//				cForm.setVendorInvoiceStyleId(preference.getVendorInvoiceStyleId());
//				cForm.setCustomerType(preference.getCustomerType());
//				cForm.setPriceLevelPriority(preference.getPriceLevelPriority());
//				cForm.setPriceLevelDealer(preference.getPriceLevelDealer());
//				cForm.setPriceLevelCustomer(preference.getPriceLevelCustomer());
//				cForm.setPriceLevelGeneral(preference.getPriceLevelGeneral());
//				cForm.setSaleTaxRate(preference.getSalesTaxRate());
//				cForm.setShowUSAInBillShipAddress(preference.getShowUsainBillShipAddress());
//				cForm.setInvoiceTemplateType(preference.getInvoiceTemplateType());
//				cForm.setEstTemplateType(preference.getEstimationTemplateType());
//				cForm.setSoTemplateType(preference.getSalesOrderTemplateType());
//				cForm.setPoTemplateType(preference.getPurchaseOrderTemplateType());
//				cForm.setPsTemplateType(preference.getPackingSlipTemplateType());
//				cForm.setDisplayPeriod(preference.getDisplayPeriod());
//				cForm.setStartInvoiceNum(preference.getStartingInvoiceNumber().toString());
//				cForm.setStartEstimationNum(preference.getStartingEstimationNumber().toString());
//				cForm.setStartSalesOrderNum(preference.getStartingSalesOrderNumber().toString());
//				cForm.setStartPONum(preference.getStartingPonumber());
//				cForm.setEstimationStyleID(preference.getEstimationStyleId());
//				cForm.setSoStyleID(preference.getSostyleId());
//				cForm.setIsSalePrefix(preference.getIsSalePrefix() ? "on" : "off");
//				cForm.setIsPurchasePrefix(preference.getIsPurchasePrefix() ? "on" : "off");
//				if (null != preference.getDefaultTitleID())
//					cForm.setCustTitleID(preference.getDefaultTitleID());
//			}
//			
//		} catch (Exception ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method getCongurationRecord " + ex.toString());
//		}
//		return cForm;
//	}

	public ConfigurationDto getDefaultCongurationData(String companyID) {
		SQLExecutor executor = new SQLExecutor();
		Connection con = executor.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConfigurationDto cForm = new ConfigurationDto();
		try {
			String recordQuery = "select PreferenceID,copyAddress,CustomerCountryID,CustomerStateID,CustomerTaxable,SalesTermID,SalesRepID,SalesPayMethodID,SalesViaID,"
					+ "Charge_interest,Charge_minimum,Charge_grace,Charge_reassess,Charge_MarkFinance,ProductCategoryID,LocationID,ReOrderPoint,VendorInvoiceStyleId,"
					+ "CustomerType,PriceLevelPriority,PriceLevelDealer,PriceLevelCustomer,PriceLevelGeneral,SalesTaxRate,ShowUSAInBillShipAddress,"
					+ "InvoiceTemplateType,EstimationTemplateType,SalesOrderTemplateType,PurchaseOrderTemplateType,PackingSlipTemplateType,DisplayPeriod,"
					+ "StartingInvoiceNumber,StartingEstimationNumber,StartingSalesOrderNumber,StartingPONumber,EstimationStyleID,SOStyleID, IsSalePrefix, IsPurchasePrefix, DefaultTitleID "
					+ " FROM bca_preference WHERE Active=1 AND CompanyID=" + companyID;
			pstmt = con.prepareStatement(recordQuery);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cForm.setPreferenceID(rs.getInt("PreferenceID"));
				cForm.setAddressSettings("1".equals(rs.getString("copyAddress")) ? "on" : "off");
				cForm.setCustDefaultCountryID(rs.getInt("CustomerCountryID"));
				cForm.setSelectedStateId(rs.getInt("CustomerStateID"));
				cForm.setCustTaxable("1".equals(rs.getString("CustomerTaxable")) ? "on" : "off");
				cForm.setSelectedTermId(rs.getInt("SalesTermID"));
				cForm.setSelectedSalesRepId(rs.getInt("SalesRepID"));
				cForm.setSelectedPaymentId(rs.getInt("SalesPayMethodID"));
				cForm.setCustomerShippingId(rs.getInt("SalesViaID"));
				cForm.setAnnualInterestRate(rs.getDouble("Charge_interest"));
				cForm.setMinCharge(rs.getDouble("Charge_minimum"));
				cForm.setGracePeriod(rs.getInt("Charge_grace"));
				cForm.setAssessFinanceCharge("1".equals(rs.getString("Charge_reassess")) ? "on" : "off");
				cForm.setMarkFinanceCharge("1".equals(rs.getString("Charge_MarkFinance")) ? "on" : "off");
				cForm.setProductCategoryID(rs.getInt("ProductCategoryID"));
				cForm.setLocationID(rs.getInt("LocationID"));
				cForm.setReorderPoint(rs.getInt("ReOrderPoint"));
				cForm.setVendorInvoiceStyleId(rs.getInt("VendorInvoiceStyleId"));
				cForm.setCustomerType(rs.getInt("CustomerType"));
				cForm.setPriceLevelPriority(rs.getInt("PriceLevelPriority"));
				cForm.setPriceLevelDealer(rs.getInt("PriceLevelDealer"));
				cForm.setPriceLevelCustomer(rs.getInt("PriceLevelCustomer"));
				cForm.setPriceLevelGeneral(rs.getInt("PriceLevelGeneral"));
				cForm.setSaleTaxRate(rs.getDouble("SalesTaxRate"));
				cForm.setShowUSAInBillShipAddress(rs.getBoolean("ShowUSAInBillShipAddress"));
				cForm.setInvoiceTemplateType(rs.getInt("InvoiceTemplateType"));
				cForm.setEstTemplateType(rs.getInt("EstimationTemplateType"));
				cForm.setSoTemplateType(rs.getInt("SalesOrderTemplateType"));
				cForm.setPoTemplateType(rs.getInt("PurchaseOrderTemplateType"));
				cForm.setPsTemplateType(rs.getInt("PackingSlipTemplateType"));
				cForm.setDisplayPeriod(rs.getInt("DisplayPeriod"));
				cForm.setStartInvoiceNum(rs.getString("StartingInvoiceNumber"));
				cForm.setStartEstimationNum(rs.getString("StartingEstimationNumber"));
				cForm.setStartSalesOrderNum(rs.getString("StartingSalesOrderNumber"));
				cForm.setStartPONum(rs.getString("StartingPONumber"));
				cForm.setEstimationStyleID(rs.getInt("EstimationStyleID"));
				cForm.setSoStyleID(rs.getInt("SOStyleID"));
				cForm.setIsSalePrefix("1".equals(rs.getString("IsSalePrefix")) ? "on" : "off");
				cForm.setIsPurchasePrefix("1".equals(rs.getString("IsPurchasePrefix")) ? "on" : "off");
				cForm.setCustTitleID(rs.getInt("DefaultTitleID"));
			}
			pstmt.close();
			rs.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			Loger.log("Exception in the class ConfigurationInfo and in method getCongurationRecord " + ex.toString());
		} finally {
			executor.close(con);
		}
		return cForm;
	}

	/*
	 * Invoke all the records required for configuration i.e:- information related
	 * to networking,sales & customer,etc.
	 */
	@Autowired
	private BcaPreferenceRepository bcaPreferenceRepository;
	

	public void getCongurationRecord(String companyID, ConfigurationDto cForm, HttpServletRequest request) {
		Optional<BcaPreference> preferenceOpt = bcaPreferenceRepository
				.findByCompany_CompanyId(Long.valueOf(companyID));
		BcaPreference preference = preferenceOpt.get();
		if (preference != null) {
			// Map fields from preference to cForm
			// Example: cForm.setCurrencyID(preference.getCurrencyID());
			String logoPath = preference.getCompanyLogoPath();
			cForm.setFileName(logoPath);
			request.setAttribute("Image", logoPath);
			Loger.log("Image =>" + logoPath);

			// Continue mapping other fields
			/* General */
			cForm.setCurrencyID(preference.getCurrencyId());
			cForm.setWeightID(preference.getWeightId());
			cForm.setDefaultLabelID(preference.getLabelSizeId());
			cForm.setModuleID(preference.getDefaultModule());
			cForm.setFilterOption(preference.getFilterOption());

			/* Estimation */
			cForm.setStartEstimationNum(preference.getStartingEstimationNumber().toString());
			cForm.setStartSalesOrderNum(preference.getStartingSalesOrderNumber().toString());

			/* Billing */
			cForm.setStartingBillNumber(preference.getStartingBillNumber());
			cForm.setPrintBills(preference.getPrintBills().equals(1) ? "on" : "off");
			cForm.setMailToCustomer(preference.getMailToCustomer().equals(1) ? "on" : "off");
			cForm.setShowCombinedBilling(preference.getShowCombinedBilling().equals(1) ? "on" : "off");
			cForm.setShowBillingStatStyle(preference.getShowBillingStatStyle());

			/* RMA */
			cForm.setSelectedAccountId(preference.getDefaultRmacheckingBankId());

			/* Account&Payment */
			// cForm.setSelectedCategoryId(rs.getInt("defaultARCategoryID"));
			cForm.setDefaultPaymentMethodId(preference.getDefaultBankTransferAccId());
			cForm.setDefaultDepositToId(preference.getDefaultBankTransferAccId());
			cForm.setDefaultCategoryId(preference.getDefaultArcategoryId());
			cForm.setDefaultDepositToId(preference.getDefaultBankTransferAccId());
			cForm.setArCategory(
					preference.getDefaultArcategoryIdforac() != null ? preference.getDefaultArcategoryIdforac() : -1);
			cForm.setPoCategory(
					preference.getDefaultArcategoryIdforpo() != null ? preference.getDefaultArcategoryIdforpo() : -1);
			cForm.setBpCategory(
					preference.getDefaultArcategoryIdforbp() != null ? preference.getDefaultArcategoryIdforbp() : -1);
			cForm.setArDepositTo(
					preference.getDefaultdepositoforac() != null ? preference.getDefaultdepositoforac() : -1);
			cForm.setPoDepositTo(
					preference.getDefaultdepositoforpo() != null ? preference.getDefaultdepositoforpo() : -1);
			cForm.setBpDepositTo(
					preference.getDefaultdepositoforbp() != null ? preference.getDefaultdepositoforbp() : -1);
			cForm.setArReceivedType(
					preference.getDefaultReceivedforac() != null ? preference.getDefaultReceivedforac() : -1);
			cForm.setPoReceivedType(
					preference.getDefaultReceivedforpo() != null ? preference.getDefaultReceivedforpo() : -1);
			cForm.setBpReceivedType(
					preference.getDefaultReceivedforbp() != null ? preference.getDefaultReceivedforbp() : -1);
			cForm.setScheduleDays(preference.getAutoPaymentDuration());
			cForm.setReimbursementSettings(preference.getDefaultReimbusrementSetting());
			/* Inventory Setting */
			cForm.setShowReorderPointList(preference.getShowReorderPointList().equals(1) ? "on" : "off");
			cForm.setShowReorderPointWarning(preference.getShowReorderPointWarring().equals(1) ? "on" : "off");
			cForm.setReservedQuantity(preference.getReservedQuantity().equals(1) ? "on" : "off");
			cForm.setSalesOrderQty(preference.getSalesOrderQty().equals(1) ? "on" : "off");

			/* Networking & Security */
			cForm.setPassword(preference.getAdminPassword());
			cForm.setMultiUserConnection(preference.getMultimode());

			/* Sales & Customer */
			cForm.setSortBy(preference.getDefaultCustomerSortId());
			cForm.setCustomerGroup(preference.getDefaultCustomerGroupId());
			cForm.setCustDefaultCountryID(preference.getCustomerCountry().getId());
			cForm.setCustTaxable(preference.getCustomerTaxable().equals(1) ? "on" : "off");
			cForm.setIsSalesOrder(preference.getShowSalesOrder().equals(1) ? "on" : "off");
			cForm.setCustomerProvince(preference.getCustomerProvience());
			cForm.setCustomerShippingId((preference.getSalesViaId()));

			cForm.setStartInvoiceNum(preference.getStartingInvoiceNumber().toString());
			cForm.setAddressSettings(preference.getCopyAddress().equals(1) ? "on" : "off");
			cForm.setSelectedStateId(preference.getCustomerState().getId());
			cForm.setSelectedShippingId(preference.getShippingFeeMethod());
			cForm.setSelectedSalesRepId(preference.getSalesRepId());
			cForm.setSelectedPaymentId(preference.getSalesPayMethodId());

			cForm.setPackingSlipTemplateId(preference.getDefaultPackingSlipStyleId());
			cForm.setPoNumPrefix(preference.getSalesPoprefix());
			// added by tulsi
			cForm.setInvStyleID(preference.getInvoiceStyle().getInvoiceStyleId());
			cForm.setSelectedMessageId(preference.getInvoiceFootnoteId());
			cForm.setSaleShowCountry(preference.getSaleShowCountry() ? "on" : "off");
			cForm.setRatePriceChangable(preference.getIsRatePriceChangeble() ? "on" : "off");
			cForm.setSaleShowTelephone(preference.getSaleShowTelephone() ? "on" : "off");
			cForm.setIsSalePrefix(preference.getIsSalePrefix() ? "on" : "off");
			cForm.setExtraChargeApplicable(preference.getExtraCharge() ? "on" : "off");
			cForm.setChargeAmount(preference.getChargeAmount());
			cForm.setOrderAmount(preference.getOrderAmount());
			cForm.setHowOftenSalestax(preference.getHowOftenSalestax());
			cForm.setDropShipCharge(preference.getDropShipCharge());
			cForm.setSalesTaxCode(preference.getSalesTaxCode());
			cForm.setSaleTaxRate(preference.getSalesTaxRate());
			cForm.setIsShowDropShipItems(preference.getShowDropShipItems() ? 1 : 0);
			cForm.setIsRefundAllowed("1".equals(preference.getIsRefundAllowed().toString()) ? "on" : "off");
			/* Purchase & Vendor */
			/*
			 * cForm.setVendorDefaultCountryID(preference.getInt("VendorCountryID"));
			 * cForm.setStartPONum(preference.getLong("StartingPONumber"));
			 * cForm.setPoStyleID(preference.getInt("POStyleID"));
			 * cForm.setVendorDefaultFootnoteID(preference.getInt("POFootnoteID"));
			 * cForm.setInvStyleID(preference.getInt("InvoiceStyleID"));
			 * cForm.setDefaultFootnoteID(preference.getInt("InvoiceFootnoteID"));
			 * cForm.setVendorDefaultFootnoteID(preference.getInt("InvoiceFootnoteID"));
			 * cForm.setIsProductWeight(preference.getString("UseProductWeight").equals("1")
			 * ? "true" : "false");
			 * cForm.setIsCompanyName(preference.getString("UseShippingTable").equals("1") ?
			 * "true" : "false");
			 */

			cForm.setSortBy(preference.getDefaultVendorrSortId());
			cForm.setSelectedCountryId1(preference.getVendorCountry().getId());
			cForm.setSelectedStateId1(preference.getVendorState().getId());
			cForm.setVendorProvience(preference.getVendorProvience());
			cForm.setStartPONum(preference.getStartingPonumber());
			cForm.setVendorDefaultFootnoteID(preference.getPofootnoteId());
			cForm.setShipCarrierId(preference.getPoviaId());
			cForm.setSelectedTermId(preference.getPotermId());
			cForm.setSelectedSalesRepId(preference.getPorepId());
			cForm.setSelectedPaymentId(preference.getPopayMethodId());
			cForm.setSelectedActiveEmployeeId(preference.getEmployeeInChargeId());
			cForm.setPoShowCountry(preference.getPoshowCountry() ? "on" : "off");
			cForm.setPoShowTelephone(preference.getPoshowTelephone() ? "on" : "off");
			cForm.setIsPurchasePrefix(preference.getIsPurchasePrefix() ? "on" : "off");

			/* Inventory */
			cForm.setStartRINum(Long.valueOf(preference.getStartingRinumber()));
			cForm.setProductTaxable(preference.getProductTaxable().equals(1) ? "on" : "off");

			/* Employee */
			cForm.setEmpStateID(preference.getEmployeeState().getId());
			request.setAttribute("EmpState", String.valueOf(cForm.getEmpStateID()));

			cForm.setEmpCountryID(preference.getEmployeeCountry().getId());
			cForm.setTimeSheet(preference.getTimeSheetSet());

			/* Tax */
			cForm.setChargeSalesTax(preference.getChargeSalestax().equals(1) ? "true" : "false");
			cForm.setHowOftenSalesTax(preference.getHowOftenSalestax());
			cForm.setSalesTaxID(preference.getSalesTax().getSalesTaxId());

			/* Reminders */
			cForm.setShowReminder(preference.getShowReminder().equals(1) ? "on" : "off");
			cForm.setInvoiceMemo(preference.getInvoiceMemo());
			cForm.setInvoiceMemoDays(preference.getInvoiceMemoDays());
			cForm.setOverdueInvoice(preference.getOverdueInvoice());
			cForm.setOverdueInvoiceDays(preference.getOverdueinvoiceDays());
			cForm.setInventoryOrder(preference.getInventoryOrder());
			cForm.setInventoryOrderDays(preference.getInventoryOrderDays());
			cForm.setBillsToPay(preference.getBillstoPay());
			cForm.setBillsToPayDays(preference.getBillstoPayDays());
			cForm.setMemorizeEstimation(preference.getEstimationMemo());
			cForm.setMemorizeEstimationDays(preference.getEstimationMemoDays());
			cForm.setMemorizeBill(preference.getMemobill());
			cForm.setMemorizeBillDays(preference.getMemobillDays());
			cForm.setMemorizePurchaseOrder(preference.getPomemo());
			cForm.setMemorizePurchaseOrderDays(preference.getPomemoDays());
			cForm.setServiceBilling(preference.getServiceBillsMemo());
			cForm.setServiceBillingDays(preference.getServiceBillsMemoDays());

			/* Finance Charge */
			cForm.setAnnualInterestRate(preference.getChargeInterest());
			cForm.setMinCharge(preference.getChargeMinimum());
			cForm.setGracePeriod(preference.getChargeGrace().intValue());
			cForm.setAssessFinanceCharge(preference.getChargeReassess() ? "on" : "off");
			cForm.setMarkFinanceCharge(preference.getChargeMarkFinance() ? "on" : "off");
			cForm.setStartMonth(preference.getBudgetStartMonth());
			cForm.setEndMonth(preference.getBudgetEndMonth());

			/* Performance */
			long perform = Long.valueOf(preference.getPerformance());
			if (perform != 2000 && perform != 5000 && perform != 10000) {
				cForm.setPerformance(1);
				cForm.setUserDefinePerform(perform);
			} else {
				cForm.setPerformance((int) perform);
				cForm.setUserDefinePerform(20000);
			}

			/* SMTP setup */
			cForm.setSenderEmail(preference.getMailSenderEmail());
			cForm.setMailServer(preference.getMailserver());
			cForm.setMailUserName(preference.getMailUsername());
			cForm.setMailPassword(preference.getMailPassword());
			cForm.setMailAuth(preference.getMailAuth() ? "true" : "false");

			/* Dashboard */
			cForm.setPoboard(preference.getPoboard().equals(1) ? "on" : "off");
			cForm.setItemReceivedBoard(preference.getItemsReceivedBoard().equals(1) ? "on" : "off");
			cForm.setItemShippedBoard(preference.getItemsShippedBoard().equals(1) ? "on" : "off");
			cForm.setSalesOrderBoard(preference.getSalesOrderBoard().equals(1) ? "on" : "off");
			cForm.setProductCategoryID(preference.getProductCategoryId());
			cForm.setLocationID(preference.getLocationId());
			cForm.setReorderPoint(preference.getReOrderPoint());
			cForm.setVendorBusinessTypeID(preference.getVendorBusinessTypeId());
			cForm.setVendorInvoiceStyleId(preference.getVendorInvoiceStyleId());
			cForm.setCustomerType(preference.getCustomerType());
			cForm.setPriceLevelPriority(preference.getPriceLevelPriority());
			cForm.setPriceLevelDealer(preference.getPriceLevelDealer());
			cForm.setPriceLevelCustomer(preference.getPriceLevelCustomer());
			cForm.setPriceLevelGeneral(preference.getPriceLevelGeneral());
			cForm.setShowUSAInBillShipAddress(preference.getShowUsainBillShipAddress());
			cForm.setInvoiceTemplateType(preference.getInvoiceTemplateType());
			cForm.setEstTemplateType(preference.getEstimationTemplateType());
			cForm.setSoTemplateType(preference.getSalesOrderTemplateType());
			cForm.setPoTemplateType(preference.getPurchaseOrderTemplateType());
			cForm.setPsTemplateType(preference.getPackingSlipTemplateType());
			cForm.setDisplayPeriod(preference.getDisplayPeriod());
			cForm.setEstimationStyleID(preference.getEstimationStyleId());
			cForm.setSoStyleID(preference.getSostyleId());
			cForm.setSaleTaxRate2(preference.getSalesTaxRate2());
			cForm.setBackOrderNeeded(preference.getIsBackOrderNeeded() ? "on" : "off");
			cForm.setRecurringServiceBill(preference.getIsRecurringServiceBill() ? "on" : "off");
			cForm.setServiceBillName(preference.getServiceBillName());
			
			
			//version tab configration 
			
			Optional<BcaPreferenceHubs> preferencehubsOpt = bcaPreferenceHubsRepository.findByCompany_CompanyIdAndActive(Long.parseLong(companyID), 1);
			//marketting 		
			BcaPreferenceHubs preferenceHubs= preferencehubsOpt.get();
			cForm.setLeadsIsActive(preferenceHubs.getIsLeadsEnable());
			//sales
			cForm.setInvoiceIsActive(preferenceHubs.getIsInvoiceEnable());
			cForm.setEstimationIsActive(preferenceHubs.getIsEstimationEnable());
			cForm.setSalesOrderIsActive(preferenceHubs.getIsSalesOrderEnable());
			cForm.setRmaIsActive(preferenceHubs.getIsRmaEnable());
			cForm.setDataManagarIsActive(preferenceHubs.getIsDataManagarEnable());
			//crm
			cForm.setContactIsActive(preferenceHubs.getIsContactEnable());
			cForm.setEventsIsActive(preferenceHubs.getIsEventsEnable());
			cForm.setCalendarIsActive(preferenceHubs.getIsCalendarEnable());
			cForm.setOpportunitiesIsActive(preferenceHubs.getIsOpportunitiesEnable());
			request.getSession().setAttribute("versionConfigDetails", preferenceHubs);
		}
	}

//	public void getCongurationRecord(String companyID, ConfigurationDto cForm, HttpServletRequest request) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			String recordQuery = "SELECT CompanyLogoPath,CurrencyID,WeightID,LabelSizeID,defaultModule,FilterOption,StartingEstimationNumber,StartingSalesOrderNumber,"
//					+ "StartingBillNumber,PrintBills,MailToCustomer,showCombinedBilling,showBillingStatStyle,DEFAULTRMACheckingBankID,DefaultBankTransferAccID,"
//					+ "defaultARCategoryID,defaultARCategoryIDforac,defaultARCategoryIDforpo,defaultARCategoryIDforbp,defaultdepositoforac,defaultdepositoforpo,"
//					+ "defaultdepositoforbp,defaultReceivedforac,defaultReceivedforpo,defaultReceivedforbp,AutoPaymentDuration,DefaultReimbusrementSetting,"
//					+ "showReorderPointList,showReorderPointWarring,reservedQuantity,salesOrderQty,AdminPassword,Multimode,DEFAULTCustomerSortID,DEFAULTCustomerGroupID,"
//					+ "CustomerCountryID,CustomerTaxable,showSalesOrder,CustomerProvience,SalesViaID,SalesTermID,SalesRepID,SalesPayMethodID,"
//					+ "StartingInvoiceNumber,copyAddress,CustomerStateID,ShippingFeeMethod,"
//					+ "DefaultPackingSlipStyleID,SalesPOPrefix,InvoiceFootnoteID,SaleShowCountry,IsRatePriceChangeble,"
//					+ "SaleShowTelephone,IsSalePrefix,ExtraCharge,ChargeAmount,OrderAmount,HowOftenSalestax,DropShipCharge,SalesTaxCode,SalesTaxRate,"
//					+ "DropShipCharge,ShowDropShipItems,isRefundAllowed,"
//					+ "VendorCountryID,StartingPONumber,POStyleID,InvoiceStyleID,InvoiceFootnoteID,UseProductWeight,UseShippingTable,"
//					+ "DefaultVendorrSortID,VendorCountryID,VendorStateID,VendorProvience,StartingPONumber,POFootnoteID,POViaID,POTermID,PORepID,POPayMethodID,EmployeeInChargeID,"
//					+ "POShowCountry,POShowTelephone,IsPurchasePrefix,"
//					+ "StartingRINumber,ProductTaxable,EmployeeStateID,EmployeeCountryID,TimeSheetSet,ChargeSalestax,HowOftenSalestax,SalesTaxID,ShowReminder,"
//					+ "InvoiceMemo,InvoiceMemoDays,OverdueInvoice,OverdueInvoiceDays,InventoryOrder,InventoryOrderDays,BillstoPay,BillstoPayDays,"
//					+ "EstimationMemo,EstimationMemoDays,POMemo,PoMemoDays,ServiceBillsMemo,ServiceBillsMemoDays,MemoBill,MemoBillDays,Charge_interest,"
//					+ "Charge_minimum,Charge_grace,Charge_reassess,Charge_MarkFinance,BudgetStartMonth,BudgetEndMonth,Performance,Mail_senderEmail,Mailserver,"
//					+ "Mail_username,Mail_password,Mail_Auth,poboard,itemsReceivedBoard,itemsShippedBoard,SalesOrderBoard,ProductCategoryID,LocationID,ReOrderPoint,"
//					+ "VendorBusinessTypeID,VendorInvoiceStyleId,CustomerType,PriceLevelPriority,PriceLevelDealer,PriceLevelCustomer,PriceLevelGeneral,ShowUSAInBillShipAddress,"
//					+ "InvoiceTemplateType,EstimationTemplateType,SalesOrderTemplateType,PurchaseOrderTemplateType,PackingSlipTemplateType,DisplayPeriod, EstimationStyleID,SOStyleID,"
//					+ "SalesTaxRate2,isBackOrderNeeded,isRecurringServiceBill,serviceBillName "
//					+ " FROM bca_preference WHERE CompanyID=" + companyID;
//			pstmt = con.prepareStatement(recordQuery);
////			pstmt.setString(1, compId);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				String logoPath = rs.getString("CompanyLogoPath");
//				cForm.setFileName(logoPath);
//				request.setAttribute("Image", logoPath);
//				Loger.log("Image =>" + logoPath);
//				/* General */
//				cForm.setCurrencyID(rs.getInt("CurrencyID"));
//				cForm.setWeightID(rs.getInt("WeightID"));
//				cForm.setDefaultLabelID(rs.getInt("LabelSizeID"));
//				cForm.setModuleID(rs.getInt("defaultModule"));
//				cForm.setFilterOption(rs.getString("FilterOption"));
//
//				/* Estimation */
//				cForm.setStartEstimationNum(rs.getString("StartingEstimationNumber"));
//				cForm.setStartSalesOrderNum(rs.getString("StartingSalesOrderNumber"));
//
//				/* Billing */
//				cForm.setStartingBillNumber(rs.getInt("StartingBillNumber"));
//				cForm.setPrintBills("1".equals(rs.getString("PrintBills")) ? "on" : "off");
//				cForm.setMailToCustomer("1".equals(rs.getString("MailToCustomer")) ? "on" : "off");
//				cForm.setShowCombinedBilling("1".equals(rs.getString("showCombinedBilling")) ? "on" : "off");
//				cForm.setShowBillingStatStyle(rs.getInt("showBillingStatStyle"));
//
//				/* RMA */
//				cForm.setSelectedAccountId(rs.getInt("DEFAULTRMACheckingBankID"));
//
//				/* Account&Payment */
//				// cForm.setSelectedCategoryId(rs.getInt("defaultARCategoryID"));
//				cForm.setDefaultPaymentMethodId(rs.getInt("DefaultBankTransferAccID"));
//				cForm.setDefaultDepositToId(rs.getInt("DefaultBankTransferAccID"));
//				cForm.setDefaultCategoryId(rs.getInt("defaultARCategoryID"));
//				cForm.setDefaultDepositToId(rs.getInt("DefaultBankTransferAccID"));
//				cForm.setArCategory(rs.getInt("defaultARCategoryIDforac"));
//				cForm.setPoCategory(rs.getInt("defaultARCategoryIDforpo"));
//				cForm.setBpCategory(rs.getInt("defaultARCategoryIDforbp"));
//				cForm.setArDepositTo(rs.getInt("defaultdepositoforac"));
//				cForm.setPoDepositTo(rs.getInt("defaultdepositoforpo"));
//				cForm.setBpDepositTo(rs.getInt("defaultdepositoforbp"));
//				cForm.setArReceivedType(rs.getInt("defaultReceivedforac"));
//				cForm.setPoReceivedType(rs.getInt("defaultReceivedforpo"));
//				cForm.setBpReceivedType(rs.getInt("defaultReceivedforbp"));
//				cForm.setScheduleDays(rs.getInt("AutoPaymentDuration"));
//				cForm.setReimbursementSettings(rs.getInt("DefaultReimbusrementSetting"));
//				/* Inventory Setting */
//				cForm.setShowReorderPointList("1".equals(rs.getString("showReorderPointList")) ? "on" : "off");
//				cForm.setShowReorderPointWarning("1".equals(rs.getString("showReorderPointWarring")) ? "on" : "off");
//				cForm.setReservedQuantity("1".equals(rs.getString("reservedQuantity")) ? "on" : "off");
//				cForm.setSalesOrderQty("1".equals(rs.getString("salesOrderQty")) ? "on" : "off");
//
//				/* Networking & Security */
//				cForm.setPassword(rs.getString("AdminPassword"));
//				cForm.setMultiUserConnection(rs.getInt("Multimode"));
//
//				/* Sales & Customer */
//				cForm.setSortBy(rs.getInt("DEFAULTCustomerSortID"));
//				cForm.setCustomerGroup(rs.getInt("DEFAULTCustomerGroupID"));
//				cForm.setCustDefaultCountryID(rs.getInt("CustomerCountryID"));
//				cForm.setCustTaxable("1".equals(rs.getString("CustomerTaxable")) ? "on" : "off");
//				cForm.setIsSalesOrder("1".equals(rs.getString("showSalesOrder")) ? "on" : "off");
//				cForm.setCustomerProvince(rs.getString("CustomerProvience"));
//				cForm.setCustomerShippingId((rs.getInt("SalesViaID")));
//
//				cForm.setStartInvoiceNum(rs.getString("StartingInvoiceNumber"));
//				cForm.setAddressSettings("1".equals(rs.getString("copyAddress")) ? "on" : "off");
//				cForm.setSelectedStateId(rs.getInt("CustomerStateID"));
//				cForm.setSelectedShippingId(rs.getInt("ShippingFeeMethod"));
//				cForm.setSelectedSalesRepId(rs.getInt("SalesRepID"));
//				cForm.setSelectedPaymentId(rs.getInt("SalesPayMethodID"));
//
//				cForm.setPackingSlipTemplateId(rs.getInt("DefaultPackingSlipStyleID"));
//				cForm.setPoNumPrefix(rs.getString("SalesPOPrefix"));
//				// added by tulsi
//				cForm.setInvStyleID(rs.getInt("InvoiceStyleID"));
//				cForm.setSelectedMessageId(rs.getInt("InvoiceFootnoteID"));
//				cForm.setSaleShowCountry("1".equals(rs.getString("SaleShowCountry")) ? "on" : "off");
//				cForm.setRatePriceChangable("1".equals(rs.getString("IsRatePriceChangeble")) ? "on" : "off");
//				cForm.setSaleShowTelephone("1".equals(rs.getString("SaleShowTelephone")) ? "on" : "off");
//				cForm.setIsSalePrefix("1".equals(rs.getString("IsSalePrefix")) ? "on" : "off");
//				cForm.setExtraChargeApplicable("1".equals(rs.getString("ExtraCharge")) ? "on" : "off");
//				cForm.setChargeAmount(rs.getInt("ChargeAmount"));
//				cForm.setOrderAmount(rs.getInt("OrderAmount"));
//				cForm.setHowOftenSalestax(rs.getInt("HowOftenSalestax"));
//				cForm.setDropShipCharge(rs.getInt("DropShipCharge"));
//				cForm.setSalesTaxCode(rs.getString("SalesTaxCode"));
//				cForm.setSaleTaxRate(rs.getDouble("SalesTaxRate"));
//				cForm.setDropShipCharge(rs.getInt("DropShipCharge"));
//				cForm.setIsShowDropShipItems(rs.getInt("ShowDropShipItems"));
//				cForm.setIsRefundAllowed("1".equals(rs.getString("isRefundAllowed")) ? "on" : "off");
//				/* Purchase & Vendor */
//				/*
//				 * cForm.setVendorDefaultCountryID(rs.getInt("VendorCountryID"));
//				 * cForm.setStartPONum(rs.getLong("StartingPONumber"));
//				 * cForm.setPoStyleID(rs.getInt("POStyleID"));
//				 * cForm.setVendorDefaultFootnoteID(rs.getInt("POFootnoteID"));
//				 * cForm.setInvStyleID(rs.getInt("InvoiceStyleID"));
//				 * cForm.setDefaultFootnoteID(rs.getInt("InvoiceFootnoteID"));
//				 * cForm.setVendorDefaultFootnoteID(rs.getInt("InvoiceFootnoteID"));
//				 * cForm.setIsProductWeight(rs.getString("UseProductWeight").equals("1") ?
//				 * "true" : "false");
//				 * cForm.setIsCompanyName(rs.getString("UseShippingTable").equals("1") ? "true"
//				 * : "false");
//				 */
//
//				cForm.setSortBy(rs.getInt("DefaultVendorrSortID"));
//				cForm.setSelectedCountryId1(rs.getInt("vendorCountryID"));
//				cForm.setSelectedStateId1(rs.getInt("vendorStateID"));
//				cForm.setVendorProvience(rs.getString("VendorProvience"));
//				cForm.setStartPONum(rs.getString("StartingPONumber"));
//				cForm.setVendorDefaultFootnoteID(rs.getInt("POFootnoteID"));
//				cForm.setShipCarrierId(rs.getInt("POViaID"));
//				cForm.setSelectedTermId(rs.getInt("POTermID"));
//				cForm.setSelectedSalesRepId(rs.getInt("PORepID"));
//				cForm.setSelectedPaymentId(rs.getInt("POPayMethodID"));
//				cForm.setSelectedActiveEmployeeId(rs.getInt("EmployeeInChargeID"));
//				cForm.setPoShowCountry("1".equals(rs.getString("POShowCountry")) ? "on" : "off");
//				cForm.setPoShowTelephone("1".equals(rs.getString("POShowTelephone")) ? "on" : "off");
//				cForm.setIsPurchasePrefix("1".equals(rs.getString("IsPurchasePrefix")) ? "on" : "off");
//
//				/* Inventory */
//				cForm.setStartRINum(rs.getLong("StartingRINumber"));
//				cForm.setProductTaxable("1".equals(rs.getString("ProductTaxable")) ? "on" : "off");
//
//				/* Employee */
//				cForm.setEmpStateID(rs.getInt("EmployeeStateID"));
//				request.setAttribute("EmpState", String.valueOf(cForm.getEmpStateID()));
//
//				cForm.setEmpCountryID(rs.getInt("EmployeeCountryID"));
//				cForm.setTimeSheet(rs.getLong("TimeSheetSet"));
//
//				/* Tax */
//				cForm.setChargeSalesTax("1".equals(rs.getString("ChargeSalestax")) ? "true" : "false");
//				cForm.setHowOftenSalesTax(rs.getInt("HowOftenSalestax"));
//				cForm.setSalesTaxID(rs.getInt("SalesTaxID"));
//
//				/* Reminders */
//				cForm.setShowReminder("1".equals(rs.getString("ShowReminder")) ? "on" : "off");
//				cForm.setInvoiceMemo(rs.getInt("InvoiceMemo"));
//				cForm.setInvoiceMemoDays(rs.getInt("InvoiceMemoDays"));
//				cForm.setOverdueInvoice(rs.getInt("OverdueInvoice"));
//				cForm.setOverdueInvoiceDays(rs.getInt("OverdueInvoiceDays"));
//				cForm.setInventoryOrder(rs.getInt("InventoryOrder"));
//				cForm.setInventoryOrderDays(rs.getInt("InventoryOrderDays"));
//				cForm.setBillsToPay(rs.getInt("BillstoPay"));
//				cForm.setBillsToPayDays(rs.getInt("BillstoPayDays"));
//				cForm.setMemorizeEstimation(rs.getInt("EstimationMemo"));
//				cForm.setMemorizeEstimationDays(rs.getInt("EstimationMemoDays"));
//				cForm.setMemorizeBill(rs.getInt("MemoBill"));
//				cForm.setMemorizeBillDays(rs.getInt("MemoBillDays"));
//				cForm.setMemorizePurchaseOrder(rs.getInt("POMemo"));
//				cForm.setMemorizePurchaseOrderDays(rs.getInt("PoMemoDays"));
//				cForm.setServiceBilling(rs.getInt("ServiceBillsMemo"));
//				cForm.setServiceBillingDays(rs.getInt("ServiceBillsMemoDays"));
//
//				/* Finance Charge */
//				cForm.setAnnualInterestRate(rs.getDouble("Charge_interest"));
//				cForm.setMinCharge(rs.getDouble("Charge_minimum"));
//				cForm.setGracePeriod(rs.getInt("Charge_grace"));
//				cForm.setAssessFinanceCharge("1".equals(rs.getString("Charge_reassess")) ? "on" : "off");
//				cForm.setMarkFinanceCharge("1".equals(rs.getString("Charge_MarkFinance")) ? "on" : "off");
//				cForm.setStartMonth(rs.getInt("BudgetStartMonth"));
//				cForm.setEndMonth(rs.getInt("BudgetEndMonth"));
//
//				/* Performance */
//				long perform = rs.getLong("Performance");
//				if (perform != 2000 && perform != 5000 && perform != 10000) {
//					cForm.setPerformance(1);
//					cForm.setUserDefinePerform(perform);
//				} else {
//					cForm.setPerformance((int) perform);
//					cForm.setUserDefinePerform(20000);
//				}
//
//				/* SMTP setup */
//				cForm.setSenderEmail(rs.getString("Mail_senderEmail"));
//				cForm.setMailServer(rs.getString("Mailserver"));
//				cForm.setMailUserName(rs.getString("Mail_username"));
//				cForm.setMailPassword(rs.getString("Mail_password"));
//				cForm.setMailAuth("1".equals(rs.getString("Mail_Auth")) ? "true" : "false");
//
//				/* Dashboard */
//				cForm.setPoboard(rs.getString("poboard").equals("1") ? "on" : "off");
//				cForm.setItemReceivedBoard(rs.getString("itemsReceivedBoard").equals("1") ? "on" : "off");
//				cForm.setItemShippedBoard(rs.getString("itemsShippedBoard").equals("1") ? "on" : "off");
//				cForm.setSalesOrderBoard(rs.getString("SalesOrderBoard").equals("1") ? "on" : "off");
//				cForm.setProductCategoryID(rs.getInt("ProductCategoryID"));
//				cForm.setLocationID(rs.getInt("LocationID"));
//				cForm.setReorderPoint(rs.getInt("ReOrderPoint"));
//				cForm.setVendorBusinessTypeID(rs.getInt("VendorBusinessTypeID"));
//				cForm.setVendorInvoiceStyleId(rs.getInt("VendorInvoiceStyleId"));
//				cForm.setCustomerType(rs.getInt("CustomerType"));
//				cForm.setPriceLevelPriority(rs.getInt("PriceLevelPriority"));
//				cForm.setPriceLevelDealer(rs.getInt("PriceLevelDealer"));
//				cForm.setPriceLevelCustomer(rs.getInt("PriceLevelCustomer"));
//				cForm.setPriceLevelGeneral(rs.getInt("PriceLevelGeneral"));
//				cForm.setShowUSAInBillShipAddress(rs.getBoolean("ShowUSAInBillShipAddress"));
//				cForm.setInvoiceTemplateType(rs.getInt("InvoiceTemplateType"));
//				cForm.setEstTemplateType(rs.getInt("EstimationTemplateType"));
//				cForm.setSoTemplateType(rs.getInt("SalesOrderTemplateType"));
//				cForm.setPoTemplateType(rs.getInt("PurchaseOrderTemplateType"));
//				cForm.setPsTemplateType(rs.getInt("PackingSlipTemplateType"));
//				cForm.setDisplayPeriod(rs.getInt("DisplayPeriod"));
//				cForm.setEstimationStyleID(rs.getInt("EstimationStyleID"));
//				cForm.setSoStyleID(rs.getInt("SOStyleID"));
//				cForm.setSaleTaxRate2(rs.getDouble("SalesTaxRate2"));
//				cForm.setBackOrderNeeded("1".equals(rs.getString("isBackOrderNeeded")) ? "on" : "off");
//				cForm.setRecurringServiceBill("1".equals(rs.getString("isRecurringServiceBill")) ? "on" : "off");
//				cForm.setServiceBillName(rs.getString("serviceBillName"));
//			}
//			pstmt.close();
//			rs.close();
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			Loger.log("Exception in the class ConfigurationInfo and in method getCongurationRecord " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//	}

	@Autowired
	private BcaUserRepository userRepository;

	public void updateAdministratorPassword(Long compId, String emailAddress, String newPassword) {
//		String hashedPassword = hashPassword(newPassword); // Implement this method to hash the password

		bcaCompanyRepository.findById(compId).ifPresent(company -> {
			userRepository.findByCompanyAndEmailAddress(company, emailAddress).ifPresent(user -> {
				user.setPassword(newPassword);
				userRepository.save(user);
			});
		});
	}

	/*
	 * private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	 * 
	 * private String hashPassword(String password) { return
	 * passwordEncoder.encode(password); }
	 */
//	public void getAdministratorDetails(String compId, String emailAddress, String modalNewPassword) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		con = executor.getConnection();
//		try {
//			String recordQuery = "update bca_user set Password='" + modalNewPassword + "' where Email_Address='"
//					+ emailAddress + "'  and CompanyID  = '" + compId + "'";
//			pstmt = con.prepareStatement(recordQuery);
//			int Check = pstmt.executeUpdate();
//			pstmt.close();
//		} catch (Exception e) {
//			// TODO: handle exception
//			Loger.log(e.toString());
//		} finally {
//			executor.close(con);
//		}
//	}

	public void getAdministratorDetails(Long companyId, ConfigurationDto cForm, String emailAddress) {
		bcaCompanyRepository.findById(companyId).ifPresent(company -> {
			userRepository.findByCompanyAndEmailAddress(company, emailAddress).ifPresent(user -> {
				cForm.setPassword(user.getPassword());
				cForm.setUserName(user.getLoginId());
				cForm.setEmailAddress(user.getEmailAddress());
			});
		});

	}
//	public void getAdministratorDetails(String compId, ConfigurationDto cForm, String emailAddress) {
//		System.out.println("cid=" + compId);
//		System.out.println("emailAddress=" + emailAddress);
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		con = executor.getConnection();
//		try {
//			String recordQuery = "Select * from bca_user where Email_Address= ?";
//			pstmt = con.prepareStatement(recordQuery);
//			pstmt.setString(1, emailAddress);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				cForm.setPassword(rs.getString("Password"));
//				cForm.setUserName(rs.getString("LoginID"));
//				cForm.setEmailAddress(rs.getString("Email_Address"));
//			}
//			pstmt.close();
//			rs.close();
//		} catch (Exception e) {
//			// TODO: handle exception
//			Loger.log(e.toString());
//		} finally {
//			executor.close(con);
//		}
//
//	}

	/*
	 * Saves the information required for the application configuration to the
	 * database.
	 */
	@Autowired
	BcaCountriesRepository countriesRepository;

	@Autowired
	BcaInvoicestyleRepository invoicestyleRepository;

	@Autowired
	BcaPostyleRepository postyleRepository;

	@Autowired
	BcaStatesRepository stateRepository;

	public boolean saveConfigurationRecord(ConfigurationDto cForm, Long compId, HttpServletRequest request) {
		boolean isSaved = false;
		Optional<BcaCountries> country = null;
		Optional<BcaInvoicestyle> invoiceStyle = null;
		Optional<BcaPostyle> poStyle = null;
		Optional<BcaStates> state = null;
		Optional<BcaSalestax> salesTax = null;

		Optional<BcaPreference> preferenceOpt = preferenceRepository.findByCompany_CompanyId(compId);

		if (preferenceOpt.isPresent()) {
			BcaPreference preference = preferenceOpt.get();
			// Update fields from cForm to preference entity
			preference.setCurrencyId(cForm.getCurrencyID());
			preference.setCurrencyText("");
			preference.setWeightId(cForm.getWeightID());
			preference.setWeight("");
			preference.setLabelSizeId(cForm.getDefaultLabelID());
			preference.setLabelSize(cForm.getLabelName());
			preference.setAdminUsername("Admin");
			preference.setAdminPassword(cForm.getPassword());
			preference.setMultimode(cForm.getMultiUserConnection());

			country = countriesRepository.findById(cForm.getCustDefaultCountryID());

			preference.setCustomerCountry(country.get());
			preference.setCustomerTaxable("on".equals(cForm.getCustTaxable()) ? 1 : 0);
			preference.setStartingInvoiceNumber(Integer.valueOf(cForm.getStartInvoiceNum()));

			invoiceStyle = invoicestyleRepository.findById(cForm.getInvStyleID());

			preference.setInvoiceStyle(invoiceStyle.get());
			preference.setInvoiceFootnoteId(cForm.getDefaultFootnoteID());
			preference.setUseProductWeight("on".equals(cForm.getIsProductWeight()) ? 1 : 0);
			preference.setUseShippingTable("on".equals(cForm.getIsCompanyName()) ? 1 : 0);

			country = countriesRepository.findById(cForm.getVendorDefaultCountryID());

			preference.setVendorCountry(country.get());
			preference.setStartingPonumber(cForm.getStartPONum());

			poStyle = postyleRepository.findById(cForm.getPoStyleID());
			preference.setPostyle(poStyle.get());
			preference.setPofootnoteId(cForm.getVendorDefaultFootnoteID());
			preference.setStartingRinumber(String.valueOf(cForm.getStartRINum()));
			preference.setProductTaxable("on".equals(cForm.getProductTaxable()) ? 1 : 0);

			state = stateRepository.findById(cForm.getEmpStateID());

			preference.setEmployeeState(state.get());

			country = countriesRepository.findById(cForm.getEmpCountryID());
			preference.setEmployeeCountry(country.get());
			preference.setChargeSalestax("on".equals(cForm.getChargeSalesTax()) ? 1 : 0);
			preference.setHowOftenSalestax(cForm.getHowOftenSalesTax());

			salesTax = salesTaxRepository.findById(cForm.getSalesTaxID());

			preference.setSalesTax(salesTax.get());
			preference.setShowReminder("on".equals(cForm.getShowReminder()) ? 1 : 0);
			preference.setInvoiceMemo(cForm.getInvoiceMemo());
			preference.setInvoiceMemoDays(cForm.getInvoiceMemoDays());
			preference.setOverdueInvoice(cForm.getOverdueInvoice());
			preference.setOverdueinvoiceDays(cForm.getOverdueInvoiceDays());
			preference.setInventoryOrder(cForm.getInventoryOrder());
			preference.setInventoryOrderDays(cForm.getInventoryOrderDays());
			preference.setBillstoPay(cForm.getBillsToPay());
			preference.setBillstoPayDays(cForm.getBillsToPayDays());

			preference.setCompanyLogoPath("");
			preference.setChargeInterest(cForm.getAnnualInterestRate());
			preference.setChargeMinimum(cForm.getMinCharge());
			preference.setChargeGrace(Double.valueOf(cForm.getGracePeriod()));
			preference.setChargeReassess("on".equals(cForm.getAssessFinanceCharge()) ? true : false);
			preference.setChargeNameDisplay(3);
			preference.setTimeSheetSet((int) cForm.getTimeSheet());

			// Performance
			if (cForm.getPerformance() == 1) {
				preference.setPerformance(String.valueOf(cForm.getUserDefinePerform()));
			} else {
				preference.setPerformance(String.valueOf(cForm.getPerformance()));
			}

			// SMTP
			preference.setMailserver(cForm.getMailServer());
			preference.setMailUsername(cForm.getMailUserName());
			preference.setMailPassword(cForm.getMailPassword());
			preference.setMailAuth("on".equals(cForm.getMailAuth()) ? true : false);
			preference.setMailSenderEmail(cForm.getSenderEmail());

			preferenceRepository.save(preference);

			// Assuming uploadImage method handles the image uploading part
			uploadImage(cForm, request);

			isSaved = true;
		}

		return isSaved;
	}
//	public boolean saveConfigurationRecord(ConfigurationDto cForm, long compId, HttpServletRequest request) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String insertRecord = "update bca_preference set  CurrencyID = ?,CurrencyText = ?,WeightID = ?,"
//					+ "Weight = ?,LabelSizeID = ?,LabelSize = ?,AdminUsername = ?,"
//					+ "AdminPassword = ?,Multimode = ?,CustomerCountryID = ?,CustomerCountry = ?,"
//					+ "CustomerTaxable = ?,StartingInvoiceNumber = ?,InvoiceStyleID = ?,InvoiceFootnoteID = ?,"
//					+ "UseProductWeight = ?,UseShippingTable = ?,VendorCountry = ?,VendorCountryID = ?,"
//					+ "StartingPONumber = ?,POStyleID = ?,POFootnoteID = ?,POUseCountry = ?,"
//					+ "StartingRINumber = ?,ProductTaxable = ?,EmployeeState = ?,EmployeeStateID = ?,"
//					+ "EmployeeCountry = ?,EmployeeCountryID = ?,ChargeSalestax = ?,HowOftenSalestax = ?,"
//					+ "SalesTaxID = ?,ShowReminder = ?,InvoiceMemo = ?,InvoiceMemoDays = ?,OverdueInvoice = ?,"
//					+ "OverdueInvoiceDays = ?,InventoryOrder = ?,InventoryOrderDays = ?,BillstoPay = ?,"
//					+ "BillstoPayDays = ?,CompanyLogoPath = ?,"
//					+ "Charge_interest = ?,Charge_minimum =  ?,Charge_grace =  ?,Charge_reassess =  ?,"
//					+ "Charge_name_display =  ?,TimeSheetSet = ? ,Performance=? ,"
//					+ "Mailserver = ?, Mail_username = ?, Mail_password = ?,Mail_Auth = ?, Mail_senderEmail =? "
//					+ " where CompanyID = ?";
//
//			pstmt = con.prepareStatement(insertRecord);
//			pstmt.setInt(1, cForm.getCurrencyID());
//			pstmt.setString(2, "");
//			pstmt.setInt(3, cForm.getWeightID());
//			pstmt.setString(4, "");
//			pstmt.setInt(5, cForm.getDefaultLabelID());
//			pstmt.setString(6, cForm.getLabelName());
//			pstmt.setString(7, "Admin");
//			pstmt.setString(8, cForm.getPassword());
//			pstmt.setInt(9, cForm.getMultiUserConnection());
//			pstmt.setInt(10, cForm.getCustDefaultCountryID());
//			pstmt.setString(11, "");
//			pstmt.setString(12, "on".equals(cForm.getCustTaxable()) ? "1" : "0");
//			pstmt.setString(13, cForm.getStartInvoiceNum());
//			pstmt.setInt(14, cForm.getInvStyleID());
//			pstmt.setInt(15, cForm.getDefaultFootnoteID());
//			pstmt.setString(16, "on".equals(cForm.getIsProductWeight()) ? "1" : "0");
//			pstmt.setString(17, "on".equals(cForm.getIsCompanyName()) ? "1" : "0");
//			pstmt.setString(18, "");
//			pstmt.setInt(19, cForm.getVendorDefaultCountryID());
//			pstmt.setString(20, cForm.getStartPONum());
//			pstmt.setInt(21, cForm.getPoStyleID());
//			pstmt.setInt(22, cForm.getVendorDefaultFootnoteID());
//			pstmt.setInt(23, -1);
//			pstmt.setLong(24, cForm.getStartRINum());
//			pstmt.setString(25, "on".equals(cForm.getProductTaxable()) ? "1" : "0");
//			pstmt.setString(26, "");
//			pstmt.setInt(27, cForm.getEmpStateID());
//			pstmt.setString(28, "");
//			pstmt.setInt(29, cForm.getEmpCountryID());
//			pstmt.setString(30, "on".equals(cForm.getChargeSalesTax()) ? "1" : "0");
//			pstmt.setInt(31, cForm.getHowOftenSalesTax());
//			pstmt.setInt(32, cForm.getSalesTaxID());
//			pstmt.setString(33, "on".equals(cForm.getShowReminder()) ? "1" : "0");
//			pstmt.setInt(34, cForm.getInvoiceMemo());
//			pstmt.setInt(35, cForm.getInvoiceMemoDays());
//			pstmt.setInt(36, cForm.getOverdueInvoice());
//			pstmt.setInt(37, cForm.getOverdueInvoiceDays());
//			pstmt.setInt(38, cForm.getInventoryOrder());
//			pstmt.setInt(39, cForm.getInventoryOrderDays());
//			pstmt.setInt(40, cForm.getBillsToPay());
//			pstmt.setInt(41, cForm.getBillsToPayDays());
//
//			pstmt.setString(42, "");
//			pstmt.setDouble(43, cForm.getAnnualInterestRate());
//			pstmt.setDouble(44, cForm.getMinCharge());
//			pstmt.setLong(45, cForm.getGracePeriod());
//			pstmt.setString(46, "on".equals(cForm.getAssessFinanceCharge()) ? "1" : "0");
//			pstmt.setInt(47, 3);
//			pstmt.setLong(48, cForm.getTimeSheet());
//
//			// Performance
//			if (cForm.getPerformance() == 1) {
//				pstmt.setLong(49, cForm.getUserDefinePerform());
//			} else {
//				pstmt.setInt(49, cForm.getPerformance());
//			}
//
//			// SMTP
//			pstmt.setString(50, cForm.getMailServer());
//			pstmt.setString(51, cForm.getMailUserName());
//			pstmt.setString(52, cForm.getMailPassword());
//			pstmt.setString(53, "on".equals(cForm.getMailAuth()) ? "1" : "0");
//			pstmt.setString(54, cForm.getSenderEmail());
//			pstmt.setLong(55, compId);
//
//			int saved = pstmt.executeUpdate();
//			if (saved > 0) {
//				isSaved = true;
//				uploadImage(cForm, request);
//			}
//			pstmt.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "saveConfigurationRecord "
//					+ ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public void saveformCustomization(ConfigurationDto cForm) {
		// Activating styles
		for (String styleId : cForm.getListOfActiveInvoiceStyle()) {
			invoiceStyleRepository.findById(Integer.parseInt(styleId)).ifPresent(style -> {
				style.setActive(1);
				invoiceStyleRepository.save(style);
			});
		}

		// Deactivating styles
		for (String styleId : cForm.getListOfDeActiveInvoiceStyle()) {
			invoiceStyleRepository.findById(Integer.parseInt(styleId)).ifPresent(style -> {
				style.setActive(0);
				invoiceStyleRepository.save(style);
			});
		}
	}

//	public void saveformCustomization(ConfigurationDto cForm) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null, pstmt1 = null;
//		String[] ActiveInvoiceStyleList = cForm.getListOfActiveInvoiceStyle();
//		String[] DeActiveInvoiceStyleList = cForm.getListOfDeActiveInvoiceStyle();
//		int i = ActiveInvoiceStyleList.length;
//		int i1 = DeActiveInvoiceStyleList.length;
//		try {
//			con = executor.getConnection();
//
//			for (i = 0; i < ActiveInvoiceStyleList.length; i++) {
//				String updateActiveInvoiceStyle = "update bca_invoicestyle set Active = 1 where InvoiceStyleID='"
//						+ ActiveInvoiceStyleList[i] + "'";
//				pstmt = con.prepareStatement(updateActiveInvoiceStyle);
//				int saved = pstmt.executeUpdate();
//			}
//			for (i1 = 0; i1 < DeActiveInvoiceStyleList.length; i1++) {
//				String updateDeActiveInvoiceStyle = "update bca_invoicestyle set Active = 0 where InvoiceStyleID='"
//						+ DeActiveInvoiceStyleList[i1] + "'";
//				pstmt1 = con.prepareStatement(updateDeActiveInvoiceStyle);
//				int saved = pstmt1.executeUpdate();
//			}
//			pstmt.close();
//			pstmt1.close();
//		} catch (Exception e) {
//			// TODO: handle exception
//			Loger.log(e.toString());
//		} finally {
//			executor.close(con);
//		}
//	}

	public boolean saveConfigurationRecordGeneral(ConfigurationDto cForm, HttpServletRequest request) {
		Optional<BcaCountries> country = null;
		Optional<BcaInvoicestyle> invoiceStyle = null;
		Optional<BcaPostyle> poStyle = null;
		Optional<BcaStates> state = null;
		Optional<BcaSalestax> salesTax = null;
		Optional<BcaCompany> company = null;

		boolean isSaved = false;
		Long companyId = Long.parseLong((String) request.getSession().getAttribute("CID"));

		Optional<BcaPreference> prefOpt = preferenceRepository.findByCompany_CompanyIdAndActive(companyId, 1);
		BcaPreference pref;
		if (prefOpt.isPresent()) {
			pref = prefOpt.get();
			// Update fields in pref using cForm

			pref.setMailserver(cForm.getMailServer());
			pref.setMailUsername(cForm.getMailUserName());
			pref.setMailPassword(cForm.getMailPassword());
			pref.setMailSenderEmail(cForm.getSenderEmail());
			pref.setFilterOption(cForm.getFilterOption());
			pref.setCurrencyId(cForm.getCurrencyID());
			pref.setWeightId(cForm.getWeightID());
			pref.setLabelSizeId(cForm.getDefaultLabelID());
			pref.setDefaultModule(cForm.getModuleID());
			pref.setPoboard("on".equals(cForm.getPoboard()) ? 1 : 0);
			pref.setItemsReceivedBoard("on".equals(cForm.getItemReceivedBoard()) ? 1 : 0);
			pref.setItemsShippedBoard("on".equals(cForm.getItemShippedBoard()) ? 1 : 0);
			pref.setSalesOrderBoard("on".equals(cForm.getSalesOrderBoard()) ? 1 : 0);
			pref.setShowUsainBillShipAddress(cForm.isShowUSAInBillShipAddress());
			pref.setMultimode(cForm.getMultiUserConnection());
		} else {
			pref = new BcaPreference();
			// Set fields in pref using cForm
			company = bcaCompanyRepository.findById(companyId);
			pref.setCompany(company.get());
			pref.setAdminPassword(cForm.getPassword());

			country = countriesRepository.findById(cForm.getCustDefaultCountryID());
			pref.setCustomerCountry(country.get());
			pref.setSalesTaxRate(Double.valueOf(cForm.getSalesTaxRate()));
			pref.setSalesTaxRate2(cForm.getSaleTaxRate2());
			pref.setSalesTaxCode(cForm.getSalesTaxCode());
			pref.setMailserver(cForm.getMailServer());
			pref.setMailUsername(cForm.getMailUserName());
			pref.setMailPassword(cForm.getMailPassword());
			pref.setMailSenderEmail(cForm.getSenderEmail());
			pref.setFilterOption(cForm.getFilterOption());
			pref.setStartingInvoiceNumber(Integer.valueOf(cForm.getStartInvoiceNum()));
			pref.setStartingEstimationNumber(Integer.valueOf(cForm.getStartEstimationNum()));
			pref.setStartingPonumber(cForm.getStartPONum());
			pref.setStartingSalesOrderNumber(Integer.valueOf(cForm.getStartSalesOrderNum()));
			pref.setShowReorderPointList("on".equals(cForm.getShowReorderPointList()) ? 1 : 0);
			pref.setShowReorderPointWarring("on".equals(cForm.getShowReorderPointWarning()) ? 1 : 0);
			pref.setReservedQuantity("on".equals(cForm.getReservedQuantity()) ? 1 : 0);
			pref.setSalesOrderQty("on".equals(cForm.getSalesOrderQty()) ? 1 : 0);

			OffsetDateTime now = OffsetDateTime.now(ZoneOffset.UTC);

			pref.setDateAdded(now);
			pref.setCurrencyId(cForm.getCurrencyID());
			pref.setWeightId(cForm.getWeightID());
			pref.setLabelSizeId(cForm.getDefaultLabelID());
			pref.setDefaultModule(cForm.getModuleID());
			pref.setPoboard("on".equals(cForm.getPoboard()) ? 1 : 0);
			pref.setItemsReceivedBoard("on".equals(cForm.getItemReceivedBoard()) ? 1 : 0);
			pref.setItemsShippedBoard("on".equals(cForm.getItemShippedBoard()) ? 1 : 0);
			pref.setSalesOrderBoard("on".equals(cForm.getSalesOrderBoard()) ? 1 : 0);
			pref.setShowUsainBillShipAddress(cForm.isShowUSAInBillShipAddress());
			pref.setMultimode(cForm.getMultiUserConnection());
		}
		preferenceRepository.save(pref);
		
		
		//version tab configuration 
		BcaPreferenceHubs	preferenceHubs;
		Optional<BcaPreferenceHubs> prefHubs = preferencehubsRepository.findByCompany_CompanyIdAndActive(companyId, 1);
		if (prefHubs.isPresent()) {
				preferenceHubs = prefHubs .get();
			preferenceHubs.setIsLeadsEnable(cForm.getLeadsIsActive());
			preferenceHubs.setIsInvoiceEnable(cForm.getInvoiceIsActive());
			preferenceHubs.setIsEstimationEnable(cForm.getEstimationIsActive());
			preferenceHubs.setIsSalesOrderEnable(cForm.getSalesOrderIsActive());
			preferenceHubs.setIsRmaEnable(cForm.getRmaIsActive());
			preferenceHubs.setIsDataManagarEnable(cForm.getDataManagarIsActive());
			preferenceHubs.setIsContactEnable(cForm.getContactIsActive());
			preferenceHubs.setIsOpportunitiesEnable(cForm.getOpportunitiesIsActive());
			preferenceHubs.setIsCalendarEnable(cForm.getCalendarIsActive());
			preferenceHubs.setIsEventsEnable(cForm.getEventsIsActive());
				
		}
		else
		{
			preferenceHubs = new BcaPreferenceHubs();
			company=bcaCompanyRepository.findById(companyId);
			preferenceHubs.setCompany(company.get());
			preferenceHubs.setIsLeadsEnable(cForm.getLeadsIsActive());
			preferenceHubs.setIsInvoiceEnable(cForm.getInvoiceIsActive());
			preferenceHubs.setIsEstimationEnable(cForm.getEstimationIsActive());
			preferenceHubs.setIsSalesOrderEnable(cForm.getSalesOrderIsActive());
			
			preferenceHubs.setIsRmaEnable(cForm.getRmaIsActive());
			preferenceHubs.setIsDataManagarEnable(cForm.getDataManagarIsActive());
			
			preferenceHubs.setIsContactEnable(cForm.getContactIsActive());
			preferenceHubs.setIsOpportunitiesEnable(cForm.getOpportunitiesIsActive());
			preferenceHubs.setIsCalendarEnable(cForm.getCalendarIsActive());
			preferenceHubs.setIsEventsEnable(cForm.getEventsIsActive());
			preferenceHubs.setActive(1);
			
		}
		preferencehubsRepository.save(preferenceHubs);
		

		// Delete business modules
		// businessModuleRepository.deleteByCompanyId(companyId);

		// Logic to insert new business modules if necessary
		// ...

		isSaved = true; // If no exceptions are thrown
		return isSaved;
	}

//	public boolean saveConfigurationRecordGeneral(ConfigurationDto cForm, HttpServletRequest request) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null, pstmt1 = null, pstmt2 = null;
//		ResultSet rs = null;
//		boolean isSaved = false;
//		String companyID = (String) request.getSession().getAttribute("CID");
//		try {
//			pstmt2 = con.prepareStatement("SELECT PreferenceID FROM bca_preference WHERE CompanyID=" + companyID);
//			rs = pstmt2.executeQuery();
//			if (!rs.next()) {
//				pstmt2 = con.prepareStatement("INSERT INTO bca_preference(CompanyID,AdminPassword,CustomerCountryID,"
//						+ "SalesTaxRate,SalesTaxRate2,SalesTaxCode,Mailserver,Mail_username,Mail_password,Mail_senderEmail,FilterOption,"
//						+ "StartingInvoiceNumber,StartingEstimationNumber,StartingPONumber,StartingSalesOrderNumber,"
//						+ "showReorderPointList,showReorderPointWarring,reservedQuantity,salesOrderQty,DateAdded) "
//						+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
////                LineofCreditTermID,BillingStyleTypeID,POStyleTypeID,SalesOrderStyleTypeID,InvoiceStyleTypeID,PackingSlipStyleTypeID,
//				pstmt2.setString(1, companyID);
//				pstmt2.setString(2, cForm.getPassword());
//				pstmt2.setInt(3, cForm.getCustDefaultCountryID());
//				pstmt2.setFloat(4, cForm.getSalesTaxRate());
//				pstmt2.setDouble(5, cForm.getSaleTaxRate2());
//				pstmt2.setString(6, cForm.getSalesTaxCode());
//				pstmt2.setString(7, cForm.getMailServer());
//				pstmt2.setString(8, cForm.getMailUserName());
//				pstmt2.setString(9, cForm.getMailPassword());
//				pstmt2.setString(10, cForm.getSenderEmail());
//				pstmt2.setString(11, cForm.getFilterOption());
//				pstmt2.setString(12, cForm.getStartInvoiceNum());
//				pstmt2.setString(13, cForm.getStartEstimationNum());
//				pstmt2.setString(14, cForm.getStartPONum());
//				pstmt2.setString(15, cForm.getStartSalesOrderNum());
//				pstmt2.setInt(16, "on".equals(cForm.getShowReorderPointList()) ? 1 : 0);
//				pstmt2.setInt(17, "on".equals(cForm.getShowReorderPointWarning()) ? 1 : 0);
//				pstmt2.setInt(18, "on".equals(cForm.getReservedQuantity()) ? 1 : 0);
//				pstmt2.setInt(19, "on".equals(cForm.getSalesOrderQty()) ? 1 : 0);
//				pstmt2.setDate(20, MyUtility.string2Date("now()"));
//				pstmt2.executeUpdate();
//			}
//
//			String insertRecord = "update bca_preference set CurrencyID=?,WeightID=?,LabelSizeID=?,defaultModule=?,FilterOption=?,poboard=?,"
//					+ "itemsReceivedBoard=?,itemsShippedBoard=?,SalesOrderBoard=?,Mailserver=?,Mail_senderEmail=?,Mail_username=?,Mail_password=?, "
//					+ "ShowUSAInBillShipAddress=?,Multimode=? WHERE CompanyID=?";
//			pstmt = con.prepareStatement(insertRecord);
//			pstmt.setInt(1, cForm.getCurrencyID());
//			pstmt.setInt(2, cForm.getWeightID());
//			pstmt.setInt(3, cForm.getDefaultLabelID());
//			pstmt.setInt(4, cForm.getModuleID());
//			pstmt.setString(5, cForm.getFilterOption());
//			pstmt.setString(6, "on".equals(cForm.getPoboard()) ? "1" : "0");
//			pstmt.setString(7, "on".equals(cForm.getItemReceivedBoard()) ? "1" : "0");
//			pstmt.setString(8, "on".equals(cForm.getItemShippedBoard()) ? "1" : "0");
//			pstmt.setString(9, "on".equals(cForm.getSalesOrderBoard()) ? "1" : "0");
//			pstmt.setString(10, cForm.getMailServer());
//			pstmt.setString(11, cForm.getSenderEmail());
//			pstmt.setString(12, cForm.getMailUserName());
//			pstmt.setString(13, cForm.getMailPassword());
//			pstmt.setBoolean(14, cForm.isShowUSAInBillShipAddress());
//			pstmt.setInt(15, cForm.getMultiUserConnection());
//			pstmt.setString(16, companyID);
//			int saved = pstmt.executeUpdate();
//			if (saved > 0) {
//				isSaved = true;
//			}
//			pstmt.close();
//		} catch (SQLException ex) {
//			Loger.log(
//					"Exception in the class ConfigurationInfo and in method saveConfigurationRecord " + ex.toString());
//			ex.printStackTrace();
//		}
//
//		try {
//			String DeleteModules = "delete FROM bca_businessmodules  where CompanyID=" + companyID;
//			pstmt1 = con.prepareStatement(DeleteModules);
//			int check = pstmt1.executeUpdate();
//			pstmt1.close();
//
////            String[] Modules = cForm.getListOfExistingModules1();
////            for(int i=0;i<Modules.length;i++) {
////                String insertmodules=" insert into bca_businessmodules (ModuleName,Active,CompanyID) values('"+Modules[i]+"',1,"+companyID+")";
////                pstmt2 = con.prepareStatement(insertmodules);
////            }
////            pstmt2.close();
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean saveConfigurationRecordEstimation(ConfigurationDto cForm, Long compId) {

		return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
			preference.setStartingEstimationNumber(Integer.valueOf(cForm.getStartEstimationNum()));
			preferenceRepository.save(preference);
			return true;
		}).orElse(false);
	}

//	public boolean saveConfigurationRecordEstimation(ConfigurationDto cForm, long compId, HttpServletRequest request) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			pstmt = con.prepareStatement("update bca_preference set StartingEstimationNumber=? where CompanyID=?");
//			pstmt.setString(1, cForm.getStartEstimationNum());
//			pstmt.setLong(2, compId);
//			int saved = pstmt.executeUpdate();
//			if (saved > 0) {
//				isSaved = true;
//			}
//			pstmt.close();
//		} catch (SQLException ex) {
//			Loger.log(
//					"Exception in the class ConfigurationInfo and in method saveConfigurationRecord " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean saveConfigurationRecordBilling(ConfigurationDto cForm, Long compId) {
		return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
			preference.setStartingBillNumber(cForm.getStartingBillNumber());
			preference.setShowCombinedBilling("on".equals(cForm.getShowCombinedBilling()) ? 1 : 0);
			preference.setShowBillingStatStyle(cForm.getShowBillingStatStyle());
			preference.setPrintBills("on".equals(cForm.getPrintBills()) ? 1 : 0);
			preference.setMailToCustomer("on".equals(cForm.getMailToCustomer()) ? 1 : 0);
			preferenceRepository.save(preference);
			return true;
		}).orElse(false);
	}

//	public boolean saveConfigurationRecordBilling(ConfigurationDto cForm, long compId) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String insertRecord = "update bca_preference set StartingBillNumber = ?,showCombinedBilling=?,"
//					+ "showBillingStatStyle=?,PrintBills=?,MailToCustomer=?  where CompanyID = ?";
//
//			pstmt = con.prepareStatement(insertRecord);
//			pstmt.setLong(1, cForm.getStartingBillNumber());
//			pstmt.setString(2, "on".equals(cForm.getShowCombinedBilling()) ? "1" : "0");
//			pstmt.setInt(3, cForm.getShowBillingStatStyle());
//			pstmt.setString(4, "on".equals(cForm.getPrintBills()) ? "1" : "0");
//			pstmt.setString(5, "on".equals(cForm.getMailToCustomer()) ? "1" : "0");
//			pstmt.setLong(6, compId);
//			int saved = pstmt.executeUpdate();
//			if (saved > 0) {
//				isSaved = true;
//			}
//			pstmt.close();
//		} catch (SQLException ex) {
//			Loger.log(
//					"Exception in the class ConfigurationInfo and in method saveConfigurationRecord " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	/*
	 * Upload(Saves) the image required for the default invoice logo. Also save the
	 * images to the uploadImages folder of the application.
	 */
	public void uploadImage(ConfigurationDto configFrm, HttpServletRequest request) {
		try {
			MultipartFile f = configFrm.getInvoiceDefaultLogo();
			if (f != null && !f.isEmpty() && f.getContentType().startsWith("image/")) {
				String filename = f.getOriginalFilename();
				Path uploadPath = Paths.get(request.getServletContext().getRealPath("uploadedImages"), filename);

				File toSave = uploadPath.toFile();
				try (FileOutputStream fo = new FileOutputStream(toSave)) {
					fo.write(f.getBytes());
				}
			}
		} catch (IOException e) {
			Loger.log("Error in uploading image: " + e.getMessage());
		}
	}
//	public void uploadImage(ConfigurationDto configFrm, HttpServletRequest request) {
//		String fileSep = System.getProperty("file.separator");
//		FileOutputStream fo = null;
//		try {
//			MultipartFile f = configFrm.getInvoiceDefaultLogo();
//			Loger.log("value of f: " + f);
//			String contentType = "";
//			String filename = "";
//			if (f != null) {
//				contentType = f.getContentType();
//				Loger.log(contentType);
//				filename = f.getOriginalFilename();
//			}
//
//			StringTokenizer st = new StringTokenizer(contentType, "/");
//			if (st.hasMoreTokens()) {
//				String val = st.nextToken("/");
//				if ("image".equals(val) == true) {
//
//					Loger.log(request.getServletContext().getRealPath("/"));
//					if (filename.length() > 0) {
//						String s = request.getServletContext().getRealPath("uploadedImages") + fileSep + filename;
//						byte[] contentArray = f.getBytes();
//
//						if (contentArray != null || contentArray.length > 0) {
//							File tosave = new File(s);
//							fo = new FileOutputStream(tosave);
//							fo.write(contentArray);
//						}
//					}
//
//				}
//			}
//
//		} catch (IOException ee) {
//			Loger.log(2, "error in execute() in PhotoAction class" + ee);
//		} catch (Exception eee) {
//			Loger.log(2, "error in execute() in PhotoAction class" + eee);
//		} finally {
//			try {
//				if (fo != null)
//					fo.close();
//			} catch (Exception eeee) {
//				Loger.log(2, "File Not Stored Properly in PhotoAction class" + eeee);
//			}
//		}
//
//	}

	/*
	 * Invoke(get) the footnote id,name & description. So it is useful for the
	 * manupulation such as update,save new footnote & delete footnote.
	 */
	public void footnoteDetails(HttpServletRequest request) {
//        Connection con = null ;
//        SQLExecutor executor = new SQLExecutor();
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
		ArrayList<ConfigurationDto> list = new ArrayList<ConfigurationDto>();
//        if (executor == null)
//            return;
//        con = executor.getConnection();
//        if (con == null)
//            return;
//
//        try {
		String compId = (String) request.getSession().getAttribute("CID");
//            String footnoteDetail = "select FootNoteID,Name,Description from bca_footnote where Active=1 "
//                    + "and CompanyID=? order by Name";
//            pstmt = con.prepareStatement(footnoteDetail);
//            pstmt.setString(1, compId);
//            rs = pstmt.executeQuery();
		List<BcaFootnoteResult2> bcaFootnoteResult2s = bcaFootnoteRepository.findByActiveCompanyIdOrderByName(1,
				compId);
//            while (rs.next()) {
//                ConfigurationDto cForm = new ConfigurationDto();
//                cForm.setFootnote(rs.getInt("FootNoteID"));
//                cForm.setFootnoteName(rs.getString("Name"));
//                cForm.setDesc(rs.getString("Description"));
//                list.add(cForm);
//            }
		for (BcaFootnoteResult2 bcaFootnoteResult2 : bcaFootnoteResult2s) {
			ConfigurationDto cForm = new ConfigurationDto();
			cForm.setFootnote(bcaFootnoteResult2.getFootNoteID());
			cForm.setFootnoteName(bcaFootnoteResult2.getName());
			cForm.setDesc(bcaFootnoteResult2.getDescription());
			list.add(cForm);

		}
		request.setAttribute("FoootNoteDetails", list);
//        } catch (SQLException ex) {
//            Loger.log("Exception in the class ConfigurationInfo and in method "
//                    + "footnoteDetails " + ex.toString());
//        } finally {
//            executor.close(con);
//        }
	}

	/*
	 * The method deletes the footnote that selected by user It delete the footnote
	 * by footnote id.
	 */
	public boolean deleteFootnote(ConfigurationDto cForm, String compId) {
//        Connection con = null ;
//        SQLExecutor executor = new SQLExecutor();
//        PreparedStatement pstmt = null;

		boolean isRecordDeleted = false;
//        if (executor == null)
//            return isRecordDeleted;
//        con = executor.getConnection();
//        if (con == null)
//            return isRecordDeleted;

//        try {
		// String deleteQuery = "update bca_footnote set Active=0 where FootNoteID=? and
		// CompanyID=?";
//            pstmt = con.prepareStatement(deleteQuery);
//            pstmt.setInt(1, cForm.getFootnote());
//            pstmt.setString(2, compId);
//            int deleted = pstmt.executeUpdate();
		int deleted = bcaFootnoteRepository.updateByFootNotIdAndCompanyId(cForm.getFootnote(), compId);
		if (deleted > 0) {
			isRecordDeleted = true;
		}
//            pstmt.close();

//        } catch (SQLException ex) {
//            Loger.log("Exception in the class ConfigurationInfo and in method "
//                    + "deleteFootnote " + ex.toString());
//
//        } finally {
//            executor.close(con);
//        }
		return isRecordDeleted;
	}

	/*
	 * Save the new footnote to the database. It save the footnote & its description
	 * to the database & generate id for it.
	 */
	public boolean saveFootnote(ConfigurationDto cForm, long compId, String footnotName) {
//        Connection con = null ;
//        SQLExecutor executor = new SQLExecutor();
//        PreparedStatement pstmt = null;

		boolean isSaved = false;
//        if (executor == null)
//            return isSaved;
//        con = executor.getConnection();
//        if (con == null)
//            return isSaved;
//
//        try {
//            String insertQuery = "insert into bca_footnote(CompanyID,Name,Description,Active) values(?,?,?,?)";
//            pstmt = con.prepareStatement(insertQuery);
//            pstmt.setLong(1, compId);
//            pstmt.setString(2, footnotName);
//            pstmt.setString(3, cForm.getDesc());
//            pstmt.setInt(4, 1);
//            int inserted = pstmt.executeUpdate();

		BcaFootnote bcaFootnote = new BcaFootnote();
		BcaCompany bcaCompany = new BcaCompany();
		bcaCompany.setCompanyId(compId);
		bcaFootnote.setCompany(bcaCompany);
		bcaFootnote.setName(footnotName);
		bcaFootnote.setDescription(cForm.getDesc());
		bcaFootnote.setActive(1);
		bcaFootnote = bcaFootnoteRepository.save(bcaFootnote);

		if (bcaFootnote != null) { // JPA Check exception handling if insertion failed
			isSaved = true;
		}

//        } catch (SQLException ex) {
//            Loger.log("Exception in the class ConfigurationInfo and in method "
//                    + "saveFootnote " + ex.toString());
//        } finally {
//            executor.close(con);
//        }
		return isSaved;
	}

	/*
	 * The method update the footnote selected by user in the existing footnote.It
	 * update the footnote name & its description.
	 *
	 */
	public boolean updateFootnote(ConfigurationDto cForm, long compId) {
		return bcaFootnoteRepository.updateByFootNotIdAndCompanyId(cForm.getDesc(), 1, cForm.getFootnote(), compId) > 0;
//        Connection con = null ;
//        SQLExecutor executor = new SQLExecutor();
//        PreparedStatement pstmt = null;

//        boolean isUpdated = false;
//        if (executor == null)
//            return isUpdated;
//        con = executor.getConnection();
//        if (con == null)
//            return isUpdated;

//        try {
//            String updateQuery = "update bca_footnote set Description=?,Active=? where FootNoteID=? and CompanyID=?";
//            pstmt = con.prepareStatement(updateQuery);
//            pstmt.setString(1, cForm.getDesc());
//            pstmt.setInt(2, 1);
//            pstmt.setInt(3, cForm.getFootnote());
//            pstmt.setLong(4, compId);

//            int updated = pstmt.executeUpdate();

//            if (updated > 0) {
//                isUpdated = true;
//            }

//        } catch (SQLException ex) {
//            Loger.log("Exception in the class ConfigurationInfo and in method "
//                    + "updateFootnote " + ex.toString());
//        } finally {
//            executor.close(con);
//        }
//        return isUpdated;
	}

	/*
	 * The method add the new job code to the database with cost & optional
	 * description.
	 */
	public boolean addJobCodeTimesheet(HttpServletRequest request) {
		try {
			String jName = request.getParameter("code");
			String jCost = request.getParameter("cost");
			String jDesc = request.getParameter("desc");
			Long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));

			BcaCompany company = bcaCompanyRepository.findById(compId).orElse(null);
			if (company == null) {
				return false;
			}

			BcpJobcode jobCode = new BcpJobcode();
			jobCode.setName(jName);
			jobCode.setCost(new BigDecimal(jCost)); // Convert String to BigDecimal
			jobCode.setDescription(jDesc);
			jobCode.setCompany(company);

			jobCodeRepository.save(jobCode);
			return true;

		} catch (NumberFormatException e) {
			Loger.log("Number format exception in addJobCodeTimesheet: " + e.toString());
			return false;
		} catch (Exception e) {
			Loger.log("Exception in addJobCodeTimesheet: " + e.toString());
			return false;
		}
	}
//	public boolean addJobCodeTimesheet(HttpServletRequest request) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		boolean added = false;
//		if (executor == null)
//			return added;
//		con = executor.getConnection();
//		if (con == null)
//			return added;
//		try {
//			String jName = request.getParameter("code");
//			String jCost = request.getParameter("cost");
//			String jDesc = request.getParameter("desc");
//			long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));
//			String insertQuery = "insert into bcp_jobcode(Name,Cost,Description,CompanyID) value(?,?,?,?)";
//			pstmt = con.prepareStatement(insertQuery);
//			pstmt.setString(1, jName);
//			pstmt.setString(2, jCost);
//			pstmt.setString(3, jDesc);
//			pstmt.setLong(4, compId);
//			int isAdded = pstmt.executeUpdate();
//			if (isAdded > 0) {
//				added = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log(
//					"Exception in the class ConfigurationInfo and in method " + "addJobCodeTimesheet " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return added;
//	}

	/*
	 * Edit (update) the job code selected by user in existing job code with cost &
	 * optional description.
	 *
	 */
	public boolean editJobCodeTimesheet(HttpServletRequest request) {
		try {
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			String jName = request.getParameter("code");
			String jCost = request.getParameter("cost"); // Consider using BigDecimal for monetary values
			String jDesc = request.getParameter("desc");
			Long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));

			return jobCodeRepository.findByJobIdAndCompany_CompanyId(jobId, compId).map(jobCode -> {
				jobCode.setName(jName);
				jobCode.setCost(new BigDecimal(jCost)); // Convert String to BigDecimal
				jobCode.setDescription(jDesc);
				jobCodeRepository.save(jobCode);
				return true;
			}).orElse(false);

		} catch (NumberFormatException e) {
			Loger.log("Number format exception in editJobCodeTimesheet: " + e.toString());
			return false;
		} catch (Exception e) {
			Loger.log("Exception in editJobCodeTimesheet: " + e.toString());
			return false;
		}
	}
//	public boolean editJobCodeTimesheet(HttpServletRequest request) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		boolean edited = false;
//		if (executor == null)
//			return edited;
//		con = executor.getConnection();
//		if (con == null)
//			return edited;
//		try {
//			int jobId = Integer.parseInt(request.getParameter("jobId"));
//			String jName = request.getParameter("code");
//			String jCost = request.getParameter("cost");
//			String jDesc = request.getParameter("desc");
//			long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));
//			String insertQuery = "update bcp_jobcode set Name=?,Cost=?,Description=? where CompanyID=? and JobID=?";
//			pstmt = con.prepareStatement(insertQuery);
//			pstmt.setString(1, jName);
//			pstmt.setString(2, jCost);
//			pstmt.setString(3, jDesc);
//			pstmt.setLong(4, compId);
//			pstmt.setInt(5, jobId);
//
//			int isupdated = pstmt.executeUpdate();
//			if (isupdated > 0) {
//				edited = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "editJobCodeTimesheet "
//					+ ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return edited;
//	}

	/*
	 * Remove the job code selected by user in existing job code from database.
	 */
	public boolean removeJobCodeTimesheet(HttpServletRequest request) {
		try {
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));

			Optional<BcpJobcode> jobCodeOpt = jobCodeRepository.findByJobIdAndCompany_CompanyId(jobId, compId);
			if (jobCodeOpt.isPresent()) {
				jobCodeRepository.delete(jobCodeOpt.get());
				return true;
			}
			return false;

		} catch (NumberFormatException e) {
			Loger.log("Number format exception in removeJobCodeTimesheet: " + e.toString());
			return false;
		} catch (Exception e) {
			Loger.log("Exception in removeJobCodeTimesheet: " + e.toString());
			return false;
		}
	}
//	public boolean removeJobCodeTimesheet(HttpServletRequest request) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		boolean deleted = false;
//		if (executor == null)
//			return deleted;
//		con = executor.getConnection();
//		if (con == null)
//			return deleted;
//		try {
//			int jobId = Integer.parseInt(request.getParameter("jobId"));
//			long compId = Long.parseLong((String) request.getSession().getAttribute("CID"));
//			String insertQuery = "delete from bcp_jobcode where JobID=? and CompanyID=?";
//			pstmt = con.prepareStatement(insertQuery);
//			pstmt.setInt(1, jobId);
//			pstmt.setLong(2, compId);
//			int isDeleted = pstmt.executeUpdate();
//			if (isDeleted > 0) {
//				deleted = true;
//			}
//			pstmt.close();
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "removeJobCodeTimesheet "
//					+ ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return deleted;
//	}

	/*
	 * Add the new service type to the database with invoice style id.
	 */
	public boolean addServiceType(String sName, int invStyleId) {
		try {
			BcaInvoicestyle invoiceStyle = invoiceStyleRepository.findById(invStyleId)
					.orElseThrow(() -> new EntityNotFoundException("InvoiceStyle not found"));

			BcaServicetype serviceType = new BcaServicetype();
			serviceType.setServiceName(sName);
			serviceType.setInvoiceStyle(invoiceStyle);
			// Set other required fields, like Company, Inventory, etc., as per your logic

			serviceTypeRepository.save(serviceType);
			return true;
		} catch (EntityNotFoundException e) {
			Loger.log("EntityNotFoundException in addServiceType: " + e.toString());
			return false;
		} catch (Exception e) {
			Loger.log("Exception in addServiceType: " + e.toString());
			return false;
		}
	}
//	public boolean addServiceType(String sName, int invStyleId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		boolean added = false;
//		if (executor == null)
//			return added;
//		con = executor.getConnection();
//		if (con == null)
//			return added;
//		try {
//			String insertService = "insert into bca_servicetype(ServiceName,InvoiceStyleID) values(?,?)";
//			pstmt = con.prepareStatement(insertService);
//			pstmt.setString(1, sName);
//			pstmt.setInt(2, invStyleId);
//			int isAdded = pstmt.executeUpdate();
//			if (isAdded > 0) {
//				added = true;
//			}
//			pstmt.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "addServiceType " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return added;
//	}

	/*
	 * Edit the existing service type with invoice style id.
	 */
	public boolean editServiceType(String sName, int invStyleId, int serviceId) {
		try {
			Optional<BcaServicetype> serviceTypeOpt = serviceTypeRepository.findById(serviceId);
			if (!serviceTypeOpt.isPresent()) {
				return false;
			}

			BcaServicetype serviceType = serviceTypeOpt.get();
			serviceType.setServiceName(sName);

			BcaInvoicestyle invoiceStyle = invoiceStyleRepository.findById(invStyleId)
					.orElseThrow(() -> new EntityNotFoundException("InvoiceStyle not found"));
			serviceType.setInvoiceStyle(invoiceStyle);

			serviceTypeRepository.save(serviceType);
			return true;

		} catch (EntityNotFoundException e) {
			Loger.log("EntityNotFoundException in editServiceType: " + e.toString());
			return false;
		} catch (Exception e) {
			Loger.log("Exception in editServiceType: " + e.toString());
			return false;
		}
	}
//	public boolean editServiceType(String sName, int invStyleId, int serviceId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		boolean edited = false;
//
//		if (executor == null)
//			return edited;
//		con = executor.getConnection();
//		if (con == null)
//			return edited;
//
//		try {
//			String editService = "update bca_servicetype set ServiceName=?,InvoiceStyleID=? where ServiceID=?";
//			pstmt = con.prepareStatement(editService);
//			pstmt.setString(1, sName);
//			pstmt.setInt(2, invStyleId);
//			pstmt.setInt(3, serviceId);
//			int isEdited = pstmt.executeUpdate();
//			if (isEdited > 0) {
//				edited = true;
//			}
//			pstmt.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "editServiceType " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return edited;
//	}

	/*
	 * Delete the service type selected by user in the existing service type list
	 * from database. *
	 */
	public boolean deleteServiceType(int serviceId) {
		try {
			Optional<BcaServicetype> serviceTypeOpt = serviceTypeRepository.findById(serviceId);
			if (serviceTypeOpt.isPresent()) {
				serviceTypeRepository.delete(serviceTypeOpt.get());
				return true;
			}
			return false;
		} catch (Exception e) {
			Loger.log("Exception in deleteServiceType: " + e.toString());
			return false;
		}
	}
//	public boolean deleteServiceType(int serviceId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		boolean deleted = false;
//
//		if (executor == null)
//			return deleted;
//		con = executor.getConnection();
//		if (con == null)
//			return deleted;
//
//		try {
//			String deleteService = "delete from bca_servicetype where ServiceID=?";
//			pstmt = con.prepareStatement(deleteService);
//			pstmt.setInt(1, serviceId);
//			int isDeleted = pstmt.executeUpdate();
//			if (isDeleted > 0) {
//				deleted = true;
//			}
//			pstmt.close();
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "deleteServiceType " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return deleted;
//	}

	/*
	 * Get the service type id of newly added service type.
	 */
	public int getServiceId() {
		try {
			Integer maxServiceId = serviceTypeRepository.findMaxServiceId();
			return maxServiceId != null ? maxServiceId : 0;
		} catch (Exception e) {
			Loger.log("Exception in getServiceId: " + e.toString());
			return 0;
		}
	}
//	public int getServiceId() {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int serviceid = 0;
//		if (executor == null)
//			return 0;
//		con = executor.getConnection();
//		if (con == null)
//			return 0;
//		try {
//			String serviceID = "select ServiceID from bca_servicetype order by ServiceID desc";
//			pstmt = con.prepareStatement(serviceID);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				serviceid = rs.getInt("ServiceID");
//			}
//			pstmt.close();
//			rs.close();
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "getServiceId " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return serviceid;
//	}

	@Autowired
	private BcaRmareasonRepository rmaReasonRepository;

	@Autowired
	private BcaMasterrmareasonRepository masterRmaReasonRepository;

	public boolean saveRMAReason(ConfigurationDto cForm, Long compId) {
		try {
			BcaCompany company = bcaCompanyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaMasterrmareason parentReason = masterRmaReasonRepository.findById(cForm.getParentReasonId())
					.orElse(null); // Handling if parent reason is optional

			BcaRmareason newRmaReason = new BcaRmareason();
			newRmaReason.setRmaReason(cForm.getReason());
			newRmaReason.setParentReason(parentReason);
			newRmaReason.setCompany(company);
			newRmaReason.setActive(1); // Assuming active status is set to 1

			rmaReasonRepository.save(newRmaReason);
			return true;
		} catch (EntityNotFoundException e) {
			// Log and handle entity not found exception
			return false;
		} catch (Exception e) {
			Loger.log("Exception in the class ConfigurationInfo and in method saveRMAReason " + e.toString());
			return false;
		}
	}
//	public boolean saveRMAReason(ConfigurationDto cForm, int compId) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String updateQuery = "insert into bca_rmareason(rmaReason,parentReasonID,CompanyID,Active) values(?,?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getReason());
//			pstmt.setInt(2, cForm.getParentReasonId());
//			pstmt.setInt(3, compId);
//			pstmt.setInt(4, 1);
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method saveRMAReason " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean deleteRMAReason(ConfigurationDto cForm) {
		try {
			String rmaReasonStr = cForm.getReason();
			return rmaReasonRepository.findById(rmaReasonStr).map(rmaReason -> {
				rmaReason.setActive(0); // Set Active to 0 for soft delete
				rmaReasonRepository.save(rmaReason);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in deleteRMAReason: " + e.toString());
			return false;
		}
	}

//	public boolean deleteRMAReason(ConfigurationDto cForm) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isUpdated = false;
//		try {
//			pstmt = con.prepareStatement("Update bca_rmareason set Active=0 Where rmaReason=?");
//			pstmt.setString(1, cForm.getReason());
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isUpdated = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method deleteRMAReason " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	public boolean updateRMAReason(ConfigurationDto cForm) {
		try {
			String reasonId = String.valueOf(cForm.getReasonId());
			Optional<BcaRmareason> rmaReasonOpt = rmaReasonRepository.findById(reasonId);
			if (rmaReasonOpt.isPresent()) {
				BcaRmareason rmaReason = rmaReasonOpt.get();
				rmaReason.setRmaReason(cForm.getReason());

				// Assuming parentReasonId corresponds to an entity like BcaMasterrmareason
				BcaMasterrmareason parentReason = masterRmaReasonRepository.findById(cForm.getParentReasonId())
						.orElse(null); // Handling if parent reason is optional
				rmaReason.setParentReason(parentReason);

				rmaReasonRepository.save(rmaReason);
				return true;
			}
			return false;
		} catch (Exception e) {
			Loger.log("Exception in updateRMAReason: " + e.toString());
			return false;
		}
	}

//	public boolean updateRMAReason(ConfigurationDto cForm) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isUpdated = false;
//		try {
//			String updateQuery = "Update bca_rmareason set rmaReason=?, parentReasonId = ? where ReasonID = ?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getReason());
//			pstmt.setInt(2, cForm.getParentReasonId());
//			pstmt.setInt(3, cForm.getReasonId());
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isUpdated = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method updateRMAReason " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	public boolean saveDefaultBankDetails(ConfigurationDto cForm, Long compId) {
		try {
			return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
				preference.setDefaultRmacheckingBankId(cForm.getSelectedBankAccountId());
				preferenceRepository.save(preference);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in saveDefaultBankDetails: " + e.toString());
			return false;
		}
	}
//	public boolean saveDefaultBankDetails(ConfigurationDto cForm, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isUpdated = false;
//		if (executor == null)
//			return isUpdated;
//		con = executor.getConnection();
//		if (con == null)
//			return isUpdated;
//
//		try {
//			String updateQuery = "Update bca_preference set DefaultRMACheckingBankID=? where companyID = ?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, cForm.getSelectedBankAccountId());
//			pstmt.setInt(2, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isUpdated = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "saveDefaultBankDetails "
//					+ ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//
//	}

	public boolean saveConfigurationRecordInventorySetting(ConfigurationDto cForm, Long compId) {
		try {
			return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
				preference
						.setShowReorderPointWarring(convertOnOffToBoolean(cForm.getShowReorderPointWarning()) ? 1 : 0);
				preference.setReservedQuantity(convertOnOffToBoolean(cForm.getReservedQuantity()) ? 1 : 0);
				preference.setSalesOrderQty(convertOnOffToBoolean(cForm.getSalesOrderQty()) ? 1 : 0);
				preference.setProductTaxable(convertOnOffToBoolean(cForm.getProductTaxable()) ? 1 : 0);
				preference.setProductCategoryId(cForm.getProductCategoryID());
				preference.setReOrderPoint(cForm.getReorderPoint());

				preferenceRepository.save(preference);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in saveConfigurationRecordInventorySetting: " + e.toString());
			return false;
		}
	}

	private boolean convertOnOffToBoolean(String onOffValue) {
		return "on".equals(onOffValue);
	}

//	public boolean saveConfigurationRecordInventorySetting(ConfigurationDto cForm, int compId) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null, pstmt1 = null;
//		boolean isUpdated = false;
//		try {
//			String updateQuery = "Update bca_preference SET showReorderPointWarring=?,reservedQuantity=?,salesOrderQty=?,productTaxable=?,"
//					+ "ProductCategoryID=?,ReOrderPoint=? WHERE companyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, "on".equals(cForm.getShowReorderPointWarning()) ? "1" : "0");
//			pstmt.setString(2, "on".equals(cForm.getReservedQuantity()) ? "1" : "0");
//			pstmt.setString(3, "on".equals(cForm.getSalesOrderQty()) ? "1" : "0");
//			pstmt.setString(4, "on".equals(cForm.getProductTaxable()) ? "1" : "0");
//			pstmt.setInt(5, cForm.getProductCategoryID());
//			pstmt.setInt(6, cForm.getReorderPoint());
//			pstmt.setInt(7, compId);
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isUpdated = true;
//			}
//
////			String query = "insert into bca_scheduleTimes(ScheduleDate,CompanyID) values(?,?)";
////			pstmt1 = con.prepareStatement(query);
////			pstmt1.setString(1, cForm.getScheduleTimes());
////			pstmt1.setInt(2,compId);
//			// executor.close(pstmt1);
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method saveConfigurationRecordInventorySettting "
//					+ ex.toString());
//		} finally {
//			executor.close(pstmt);
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	public boolean saveFinanceCharges(ConfigurationDto cForm, Long compId) {
		try {
			return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
				preference.setChargeInterest(cForm.getAnnualInterestRate());
				preference.setChargeMinimum(cForm.getMinCharge());
				preference.setChargeGrace(Double.valueOf(cForm.getGracePeriod()));
				preference.setChargeReassess("on".equals(cForm.getAssessFinanceCharge()) ? true : false);
				preferenceRepository.save(preference);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in saveFinanceCharges: " + e.toString());
			return false;
		}
	}

//	public boolean saveFinanceCharges(ConfigurationDto cForm, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isUpdated = false;
//		if (executor == null)
//			return isUpdated;
//		con = executor.getConnection();
//		if (con == null)
//			return isUpdated;
//
//		try {
//			String updateQuery = "Update bca_preference set Charge_interest=?,Charge_minimum=?,"
//					+ "Charge_grace=?,Charge_reassess=? where companyID = ?";
//
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setDouble(1, cForm.getAnnualInterestRate());
//			pstmt.setDouble(2, cForm.getMinCharge());
//			pstmt.setInt(3, cForm.getGracePeriod());
//			pstmt.setString(4, cForm.getAssessFinanceCharge().equals("on") ? "1" : "0");
//			pstmt.setInt(5, compId);
//
//			int updated = pstmt.executeUpdate();
//
//			if (updated > 0) {
//				isUpdated = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log(
//					"Exception in the class ConfigurationInfo and in method " + "saveFinanceCharges " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	public boolean saveAccountPaymentDetails(ConfigurationDto cForm, Long compId) {
		try {
			return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
				// Set fields based on cForm's data
				preference.setDefaultBankTransferAccId(cForm.getDefaultPaymentMethodId());
				preference.setDefaultArcategoryId(cForm.getDefaultCategoryId());
				preference.setDefaultReimbusrementSetting(cForm.getReimbursementSettings());
				preference.setBudgetStartMonth(cForm.getStartMonth());
				preference.setBudgetEndMonth(cForm.getEndMonth());
				preference.setAutoPaymentDuration(cForm.getScheduleDays());
				preference.setDefaultArcategoryIdforac(cForm.getArCategory());
				preference.setDefaultArcategoryIdforpo(cForm.getPoCategory());
				preference.setDefaultArcategoryIdforbp(cForm.getBpCategory());
				preference.setDefaultdepositoforac(cForm.getArDepositTo());
				preference.setDefaultdepositoforpo(cForm.getPoDepositTo());
				preference.setDefaultdepositoforbp(cForm.getBpDepositTo());
				preference.setDefaultReceivedforac(cForm.getArReceivedType());
				preference.setDefaultReceivedforpo(cForm.getPoReceivedType());
				preference.setDefaultReceivedforbp(cForm.getBpReceivedType());
				preference.setStartingBillNumber(cForm.getStartingBillNumber());

				preferenceRepository.save(preference);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			System.out.println("Exception in saveAccountPaymentDetails: " + e.toString());
			return false;
		}
	}

//	public boolean saveAccountPaymentDetails(ConfigurationDto cForm, int compId) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isUpdated = false;
//		try {
//			// String updateQuery = "Update bca_preference set StartingBillNumber=? where
//			// companyID = ?";
//			String updateQuery = "Update bca_preference set "
//					+ "defaultBankTransferAccID=?,defaultARCategoryID=?,DefaultReimbusrementSetting=?,BudgetStartMonth=?,BudgetEndMonth=?,AutoPaymentDuration=?, "
//					+ "defaultARCategoryIDforac=?,defaultARCategoryIDforpo=?,defaultARCategoryIDforbp=?,defaultdepositoforac=?,defaultdepositoforpo=?,"
//					+ "defaultdepositoforbp=?,defaultReceivedforac=?,defaultReceivedforpo=?,defaultReceivedforbp=?,StartingBillNumber=? where companyID = ?";
//
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, cForm.getDefaultPaymentMethodId());
//			pstmt.setInt(2, cForm.getDefaultCategoryId());
//			pstmt.setInt(3, cForm.getReimbursementSettings());
//			pstmt.setInt(4, cForm.getStartMonth());
//			pstmt.setInt(5, cForm.getEndMonth());
//			pstmt.setInt(6, cForm.getScheduleDays());
//			pstmt.setInt(7, cForm.getArCategory());
//			pstmt.setInt(8, cForm.getPoCategory());
//			pstmt.setInt(9, cForm.getBpCategory());
//			pstmt.setInt(10, cForm.getArDepositTo());
//			pstmt.setInt(11, cForm.getPoDepositTo());
//			pstmt.setInt(12, cForm.getBpDepositTo());
//			pstmt.setInt(13, cForm.getArReceivedType());
//			pstmt.setInt(14, cForm.getPoReceivedType());
//			pstmt.setInt(15, cForm.getBpReceivedType());
//			pstmt.setLong(16, cForm.getStartingBillNumber());
//			pstmt.setInt(17, compId);
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isUpdated = true;
//			}
//		} catch (SQLException ex) {
//			System.out.println("Exception in the class ConfigurationInfo and in method " + "saveAccountPaymentDetails "
//					+ ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	public boolean savePerformance(ConfigurationDto cForm, Long compId) {
		try {
			return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
				preference.setPerformance(String.valueOf(cForm.getPerformance()));
				preferenceRepository.save(preference);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in savePerformance: " + e.toString());
			return false;
		}
	}
//	public boolean savePerformance(ConfigurationDto cForm, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isUpdated = false;
//		if (executor == null)
//			return isUpdated;
//		con = executor.getConnection();
//		if (con == null)
//			return isUpdated;
//
//		try {
//			String updateQuery = "Update bca_preference set Performance=? where companyID = ?";
//
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setDouble(1, cForm.getPerformance());
//			pstmt.setInt(2, compId);
//
//			int updated = pstmt.executeUpdate();
//
//			if (updated > 0) {
//				isUpdated = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "savePerformance " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	public boolean saveDashboard(ConfigurationDto cForm, Long compId) {
		try {
			return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
				preference.setPoboard("on".equals(cForm.getPoboard()) ? 1 : 0);
				preference.setItemsReceivedBoard("on".equals(cForm.getItemReceivedBoard()) ? 1 : 0);
				preference.setItemsShippedBoard("on".equals(cForm.getItemShippedBoard()) ? 1 : 0);
				preference.setSalesOrderBoard("on".equals(cForm.getSalesOrderBoard()) ? 1 : 0);
				preferenceRepository.save(preference);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in saveDashboard: " + e.toString());
			return false;
		}
	}
//	public boolean saveDashboard(ConfigurationDto cForm, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isUpdated = false;
//		if (executor == null)
//			return isUpdated;
//		con = executor.getConnection();
//		if (con == null)
//			return isUpdated;
//
//		try {
//			String updateQuery = "Update bca_preference set poboard=?,itemsReceivedBoard=?,itemsShippedBoard=?,SalesOrderBoard=? where companyID = ?";
//
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getPoboard().equals("on") ? "1" : "0");
//			pstmt.setString(2, cForm.getItemReceivedBoard().equals("on") ? "1" : "0");
//			pstmt.setString(3, cForm.getItemShippedBoard().equals("on") ? "1" : "0");
//			pstmt.setString(4, cForm.getSalesOrderBoard().equals("on") ? "1" : "0");
//			pstmt.setInt(5, compId);
//
//			int updated = pstmt.executeUpdate();
//
//			if (updated > 0) {
//				isUpdated = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "saveDashboard " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	public boolean saveReminder(ConfigurationDto cForm, Long compId) {
		try {
			return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
				preference.setShowReminder("on".equals(cForm.getShowReminder()) ? 1 : 0);
				preference.setInvoiceMemo(cForm.getInvoiceMemo());
				preference.setInvoiceMemoDays(cForm.getInvoiceMemoDays());
				preference.setOverdueInvoice(cForm.getOverdueInvoice()); // overDue Invoice
				preference.setOverdueinvoiceDays(cForm.getOverdueInvoiceDays());
				preference.setInventoryOrder(cForm.getInventoryOrder()); // inventory order
				preference.setInventoryOrderDays(cForm.getInventoryOrderDays());
				preference.setBillstoPay(cForm.getBillsToPay()); // BillsToPay
				preference.setBillstoPayDays(cForm.getBillsToPayDays());
				preference.setEstimationMemo(cForm.getMemorizeEstimation()); // MemorizeEstimation
				preference.setEstimationMemoDays(cForm.getMemorizeEstimationDays());
				preference.setPomemo(cForm.getMemorizePurchaseOrder()); // PoMemo
				preference.setPomemoDays(cForm.getMemorizePurchaseOrderDays());
				preference.setMemobill(cForm.getMemorizeBill()); // MemoBill
				preference.setMemobillDays(cForm.getMemorizeBillDays());
				preference.setServiceBillsMemo(cForm.getServiceBilling()); // Service Billing
				preference.setServiceBillsMemoDays(cForm.getServiceBillingDays());

				preferenceRepository.save(preference);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in saveReminder: " + e.toString());
			return false;
		}
	}

//	public boolean saveReminder(ConfigurationDto cForm, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isUpdated = false;
//		if (executor == null)
//			return isUpdated;
//		con = executor.getConnection();
//		if (con == null)
//			return isUpdated;
//
//		try {
//			String updateQuery = "Update bca_preference set ShowReminder=?,InvoiceMemo=?,InvoiceMemoDays=?,OverdueInvoice=?,OverdueinvoiceDays=?,"
//					+ "InventoryOrder=?,InventoryOrderDays=?,BillstoPay=?,BillstoPayDays=?,EstimationMemo=?,EstimationMemoDays=?,"
//					+ "POMemo=?,POMemoDays=?,MemoBill=?,MemoBillDays=?,ServiceBillsMemo=?,ServiceBillsMemoDays=? where companyID = ?";
//
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getShowReminder().equals("on") ? "1" : "0");
//			pstmt.setInt(2, cForm.getInvoiceMemo()); // InvoiceMemo
//			pstmt.setInt(3, cForm.getInvoiceMemoDays());
//			pstmt.setInt(4, cForm.getOverdueInvoice()); // overDue Invoice
//			pstmt.setInt(5, cForm.getOverdueInvoiceDays());
//			pstmt.setInt(6, cForm.getInventoryOrder()); // inventory order
//			pstmt.setInt(7, cForm.getInventoryOrderDays());
//			pstmt.setInt(8, cForm.getBillsToPay()); // BillsToPay
//			pstmt.setInt(9, cForm.getBillsToPayDays());
//			pstmt.setInt(10, cForm.getMemorizeEstimation()); // MemorizeEstimation
//			pstmt.setInt(11, cForm.getMemorizeEstimationDays());
//			pstmt.setInt(12, cForm.getMemorizePurchaseOrder()); // PoMemo
//			pstmt.setInt(13, cForm.getMemorizePurchaseOrderDays());
//			pstmt.setInt(14, cForm.getMemorizeBill()); // MemoBill
//			pstmt.setInt(15, cForm.getMemorizeBillDays());
//			pstmt.setInt(16, cForm.getServiceBilling()); // Service Billing
//			pstmt.setInt(17, cForm.getServiceBillingDays());
//			pstmt.setInt(18, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isUpdated = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "saveReminder " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	public boolean saveCustomerInvoice(ConfigurationDto cForm, Long compId) {
		try {
			return preferenceRepository.findByCompany_CompanyId(compId).map(preference -> {
				// Update fields based on cForm's data
				preference.setDefaultCustomerSortId(cForm.getSortBy());
				preference.setDefaultCustomerGroupId(cForm.getCustomerGroup());

				BcaCountries country = countriesRepository.findById(cForm.getCustDefaultCountryID()).get();

				preference.setCustomerCountry(country);

				BcaStates state = stateRepository.findById(cForm.getSelectedStateId()).get();
				preference.setCustomerState(state);

				preference.setCustomerTaxable("on".equals(cForm.getCustTaxable()) ? 1 : 0);
				preference.setShowSalesOrder("on".equals(cForm.getIsSalesOrder()) ? 1 : 0);
				preference.setCustomerProvience(cForm.getCustomerProvince());
				preference.setSalesViaId(cForm.getCustomerShippingId());
				preference.setSalesTermId(cForm.getSelectedTermId());
				preference.setSalesRepId(cForm.getSelectedSalesRepId());
				preference.setSalesPayMethodId(cForm.getSelectedPaymentId());
				preference.setCopyAddress("on".equals(cForm.getAddressSettings()) ? true : false);

				preference.setStartingInvoiceNumber(Integer.valueOf(cForm.getStartInvoiceNum()));
				preference.setDefaultPackingSlipStyleId(cForm.getPackingSlipTemplateId());
				preference.setSalesPoprefix(cForm.getPoNumPrefix());
				preference.setInvoiceFootnoteId(cForm.getSelectedMessageId());
				preference.setSaleShowCountry("on".equals(cForm.getSaleShowCountry()) ? true : false);
				preference.setIsRatePriceChangeble("on".equals(cForm.getRatePriceChangable()) ? true : false);
				preference.setSaleShowTelephone("on".equals(cForm.getSaleShowTelephone()) ? true : false);
				preference.setIsSalePrefix("on".equals(cForm.getIsSalePrefix()) ? true : false);
				preference.setExtraCharge("on".equals(cForm.getExtraChargeApplicable()) ? true : false);
				preference.setChargeAmount(cForm.getChargeAmount());
				preference.setOrderAmount(cForm.getOrderAmount());
				preference.setHowOftenSalestax(cForm.getHowOftenSalestax());
				preference.setDropShipCharge(cForm.getDropShipCharge());
				preference.setSalesTaxCode(cForm.getSalesTaxCode());
				preference.setSalesTaxRate(cForm.getSaleTaxRate());
				preference.setShowDropShipItems(cForm.getIsShowDropShipItems() == 1 ? true : false);
				preference.setIsRefundAllowed("on".equals(cForm.getIsRefundAllowed()) ? true : false);
				preference.setStartingEstimationNumber(Integer.valueOf(cForm.getStartEstimationNum()));

				BcaInvoicestyle invoiceStyle = invoicestyleRepository.findById(cForm.getInvStyleID()).get();

				preference.setInvoiceStyle(invoiceStyle);

				preference.setPotermId(cForm.getSelectedTermId());
				preference.setPopayMethodId(cForm.getSelectedPaymentId());
				preference.setChargeInterest(cForm.getAnnualInterestRate());
				preference.setChargeMinimum(cForm.getMinCharge());
				preference.setChargeGrace(Double.valueOf(cForm.getGracePeriod()));
				preference.setChargeReassess("on".equals(cForm.getAssessFinanceCharge()) ? true : false);
				preference.setChargeMarkFinance("on".equals(cForm.getMarkFinanceCharge()) ? true : false);
				preference.setStartingSalesOrderNumber(Integer.valueOf(cForm.getStartSalesOrderNum()));
				preference.setDisplayPeriod(cForm.getDisplayPeriod());
				preference.setEstimationStyleId(cForm.getEstimationStyleID());
				preference.setSostyleId(cForm.getSoStyleID());
				preference.setSalesTaxRate2(cForm.getSaleTaxRate2());
				preference.setIsBackOrderNeeded("on".equals(cForm.getBackOrderNeeded()) ? true : false);
				preference.setIsRecurringServiceBill("on".equals(cForm.getRecurringServiceBill()) ? true : false);
				preference.setServiceBillName(cForm.getServiceBillName());

				preferenceRepository.save(preference);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in saveCustomerInvoice: " + e.toString());
			return false;
		}
	}

//	public boolean saveCustomerInvoice(ConfigurationDto cForm, int compId) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isUpdated = false;
//		try {
//			String updateQuery = "Update bca_preference set DEFAULTCustomerSortID=?,DEFAULTCustomerGroupID=?,CustomerCountryID=?,CustomerStateID=?,"
//					+ "CustomerTaxable=?,showSalesOrder=?,CustomerProvience=?,SalesViaID=?,SalesTermID=?,SalesRepID=?,SalesPayMethodID=?,copyAddress=?,"
//					+ "StartingInvoiceNumber=?,DefaultPackingSlipStyleID=?,SalesPOPrefix=?,InvoiceFootnoteID=?,SaleShowCountry=?,IsRatePriceChangeble=?,"
//					+ "SaleShowTelephone=?,IsSalePrefix=?,ExtraCharge=?,ChargeAmount=?,OrderAmount=?,HowOftenSalestax=?,DropShipCharge=?,SalesTaxCode=?,SalesTaxRate=?,"
//					+ "DropShipCharge=?,ShowDropShipItems=?,isRefundAllowed=?,StartingEstimationNumber=?,InvoiceStyleID =?,POTermID=?, SalesRepID=?, POPayMethodID=?,"
//					+ "Charge_interest=?, Charge_minimum=?, Charge_grace=?, Charge_reassess=?, Charge_MarkFinance=?, StartingSalesOrderNumber=?, DisplayPeriod=?,"
//					+ "EstimationStyleID=?, SOStyleID=?, SalesTaxRate2=?, isBackOrderNeeded=?, isRecurringServiceBill=?,serviceBillName=? "
//					+ " WHERE companyID = ?";
//			int r = cForm.getSortBy();
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, cForm.getSortBy());
//			pstmt.setInt(2, cForm.getCustomerGroup());
//			pstmt.setInt(3, cForm.getCustDefaultCountryID());
//			pstmt.setInt(4, cForm.getSelectedStateId());
//			pstmt.setString(5, "on".equals(cForm.getCustTaxable()) ? "1" : "0");
//			pstmt.setString(6, "on".equals(cForm.getIsSalesOrder()) ? "1" : "0");
//			pstmt.setString(7, cForm.getCustomerProvince());
//			pstmt.setInt(8, cForm.getCustomerShippingId());
//			pstmt.setInt(9, cForm.getSelectedTermId());
//			pstmt.setInt(10, cForm.getSelectedSalesRepId());
//			pstmt.setInt(11, cForm.getSelectedPaymentId());
//			pstmt.setString(12, "on".equals(cForm.getAddressSettings()) ? "1" : "0");
//
//			pstmt.setString(13, cForm.getStartInvoiceNum());
//			pstmt.setInt(14, cForm.getPackingSlipTemplateId());
//			pstmt.setString(15, cForm.getPoNumPrefix());
//			pstmt.setInt(16, cForm.getSelectedMessageId());
//			pstmt.setString(17, "on".equals(cForm.getSaleShowCountry()) ? "1" : "0");
//			pstmt.setString(18, "on".equals(cForm.getRatePriceChangable()) ? "1" : "0");
//			pstmt.setString(19, "on".equals(cForm.getSaleShowTelephone()) ? "1" : "0");
//			pstmt.setString(20, "on".equals(cForm.getIsSalePrefix()) ? "1" : "0");
//			pstmt.setString(21, "on".equals(cForm.getExtraChargeApplicable()) ? "1" : "0");
//			pstmt.setInt(22, cForm.getChargeAmount());
//			pstmt.setInt(23, cForm.getOrderAmount());
//			pstmt.setInt(24, cForm.getHowOftenSalestax());
//			pstmt.setInt(25, cForm.getDropShipCharge());
//			pstmt.setString(26, cForm.getSalesTaxCode());
//			pstmt.setDouble(27, cForm.getSaleTaxRate());
//			pstmt.setInt(28, cForm.getDropShipCharge());
//			pstmt.setInt(29, cForm.getIsShowDropShipItems());
//			pstmt.setString(30, "on".equals(cForm.getIsRefundAllowed()) ? "1" : "0");
//			pstmt.setString(31, cForm.getStartEstimationNum());
//			pstmt.setInt(32, cForm.getInvStyleID());
//			pstmt.setInt(33, cForm.getSelectedTermId());
//			pstmt.setInt(34, cForm.getSelectedSalesRepId());
//			pstmt.setInt(35, cForm.getSelectedPaymentId());
//			pstmt.setDouble(36, cForm.getAnnualInterestRate());
//			pstmt.setDouble(37, cForm.getMinCharge());
//			pstmt.setInt(38, cForm.getGracePeriod());
//			pstmt.setString(39, "on".equals(cForm.getAssessFinanceCharge()) ? "1" : "0");
//			pstmt.setString(40, "on".equals(cForm.getMarkFinanceCharge()) ? "1" : "0");
//			pstmt.setString(41, cForm.getStartSalesOrderNum());
//			pstmt.setInt(42, cForm.getDisplayPeriod());
//			pstmt.setInt(43, cForm.getEstimationStyleID());
//			pstmt.setInt(44, cForm.getSoStyleID());
//			pstmt.setDouble(45, cForm.getSaleTaxRate2());
//			pstmt.setString(46, "on".equals(cForm.getBackOrderNeeded()) ? "1" : "0");
//			pstmt.setString(47, "on".equals(cForm.getRecurringServiceBill()) ? "1" : "0");
//			pstmt.setString(48, cForm.getServiceBillName());
//			pstmt.setInt(49, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isUpdated = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log(
//					"Exception in the class ConfigurationInfo and in method " + "saveCustomerInvoice " + ex.toString());
//			ex.printStackTrace();
//		} finally {
//			executor.close(con);
//		}
//		return isUpdated;
//	}

	@Autowired
	private BcaLocationRepository locationRepository;

	@Autowired
	private BcaCompanyRepository companyRepository; // Assuming you have this for fetching BcaCompany

	public boolean saveDescription(ConfigurationDto cForm, Long compId) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaLocation location = new BcaLocation();
			location.setName(cForm.getDescription());
			location.setCompany(company);
			location.setActive(1);

			locationRepository.save(location);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in saveDescription: " + e.toString());
			return false;
		}
	}

//	public boolean saveDescription(ConfigurationDto cForm, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "insert into bca_location(Name,CompanyID,Active) values(?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, compId);
//			pstmt.setInt(3, 1);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "saveDescription " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean deleteLocation(int descriptionID, Long compId) {
		try {

			Optional<BcaLocation> locationOpt = locationRepository.findByLocationIdAndCompany_CompanyId(descriptionID,
					compId);
			if (locationOpt.isPresent()) {
				BcaLocation location = locationOpt.get();
				location.setActive(0); // Soft delete by setting Active to 0
				locationRepository.save(location);
				return true;
			}
			return false;
		} catch (Exception e) {
			Loger.log("Exception in deleteLocation: " + e.toString());
			return false;
		}
	}

//	public boolean deleteLocation(int descriptionID, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_location set Active=0 where LocationId=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, descriptionID);
//			pstmt.setInt(2, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "deleteDescription " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean updateDescription(ConfigurationDto cForm, Long compId, int locationId) {
		try {
			return locationRepository.findByLocationIdAndCompany_CompanyId(locationId, compId).map(location -> {
				location.setName(cForm.getDescription());
				locationRepository.save(location);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in updateDescription: " + e.toString());
			return false;
		}
	}

//	public boolean updateDescription(ConfigurationDto cForm, int compId, int locationId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_location set  Name=? where LocationId=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, locationId);
//			pstmt.setInt(3, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "updateDescription " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	@Autowired
	private BcaMessageRepository messageRepository;

	public boolean saveMessage(ConfigurationDto cForm, Long compId) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaMessage message = new BcaMessage();
			message.setName(cForm.getDescription());
			message.setCompany(company);
			message.setActive(1);

			messageRepository.save(message);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in saveMessage: " + e.toString());
			return false;
		}
	}

//	public boolean saveMessage(ConfigurationDto cForm, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "insert into bca_message(Name,CompanyID,Active) values(?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, compId);
//			pstmt.setInt(3, 1);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "saveMessage " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	@Autowired
	private BcaSalesrepRepository salesRepRepository;

	public boolean saveSalesRep(ConfigurationDto cForm, Long compId) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaSalesrep salesRep = new BcaSalesrep();
			salesRep.setName(cForm.getDescription());
			salesRep.setCompany(company);
			salesRep.setActive(1);

			salesRepRepository.save(salesRep);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in saveSalesRep: " + e.toString());
			return false;
		}
	}
//	public boolean saveSalesRep(ConfigurationDto cForm, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "insert into bca_salesrep(Name,CompanyID,Active) values(?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, compId);
//			pstmt.setInt(3, 1);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "saveSalesRep " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	@Autowired
	private BcaTermRepository termRepository;

	public boolean saveNewTerm(ConfigurationDto cForm, Long compId, int days) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaTerm term = new BcaTerm();
			term.setName(cForm.getDescription());
			term.setCompany(company);
			term.setActive(1);
			term.setDays(days);

			termRepository.save(term);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in saveNewTerm: " + e.toString());
			return false;
		}
	}

//	public boolean saveNewTerm(ConfigurationDto cForm, int compId, int days) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "insert into bca_term(Name,CompanyID,Active,Days) values(?,?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, compId);
//			pstmt.setInt(3, 1);
//			pstmt.setInt(4, days);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "saveNewTerm " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean saveNewSalesTax(ConfigurationDto cForm, Long compId, float tax) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaSalestax salesTax = new BcaSalestax();
			salesTax.setState(cForm.getDescription());
			salesTax.setCompany(company);
			salesTax.setActive(1);
			salesTax.setRate(Double.valueOf(tax));

			salesTaxRepository.save(salesTax);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in saveNewSalesTax: " + e.toString());
			return false;
		}
	}

//	public boolean saveNewSalesTax(ConfigurationDto cForm, int compId, float tax) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		con = executor.getConnection();
//		try {
//			String updateQuery = "insert into bca_salestax(State,CompanyID,Active,Rate) values(?,?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, compId);
//			pstmt.setInt(3, 1);
//			pstmt.setFloat(4, tax);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method saveNewSalesTax " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	@Autowired
	private BcaLineofcredittermRepository lineOfCreditTermRepository;

	public boolean saveNewCreditTerms(ConfigurationDto cForm, Long compId, int days) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaLineofcreditterm creditTerm = new BcaLineofcreditterm();
			creditTerm.setName(cForm.getDescription());
			creditTerm.setCompany(company);
			creditTerm.setActive(1);
			creditTerm.setDays(days);
			creditTerm.setIsDefault(cForm.getIsDefaultCreditTerm().equals("on") ? 1 : 0);

			lineOfCreditTermRepository.save(creditTerm);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in saveNewCreditTerms: " + e.toString());
			return false;
		}
	}

//	public boolean saveNewCreditTerms(ConfigurationDto cForm, int compId, int days) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "insert into bca_lineofcreditterm(Name,CompanyID,Active,Days,isDefault) values(?,?,?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, compId);
//			pstmt.setInt(3, 1);
//			pstmt.setInt(4, days);
//			pstmt.setInt(5, cForm.getIsDefaultCreditTerm().equals("on") ? 1 : 0);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log(
//					"Exception in the class ConfigurationInfo and in method " + "saveNewCreditTerms " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean updateMessage(ConfigurationDto cForm, Long compId, int messageID) {
		try {
			return messageRepository.findByMessageIdAndCompany_CompanyId(messageID, compId).map(message -> {
				message.setName(cForm.getDescription());
				messageRepository.save(message);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in updateMessage: " + e.toString());
			return false;
		}
	}

//	public boolean updateMessage(ConfigurationDto cForm, int compId, int messageID) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_Message set Name=? where MessageId=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, messageID);
//			pstmt.setInt(3, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "updateMessage " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean updateSalesRep(ConfigurationDto cForm, Long compId, int salesRepID) {
		try {
			return salesRepRepository.findBySalesRepIdAndCompany_CompanyId(salesRepID, compId).map(salesRep -> {
				salesRep.setName(cForm.getDescription());
				salesRepRepository.save(salesRep);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in updateSalesRep: " + e.toString());
			return false;
		}
	}

//	public boolean updateSalesRep(ConfigurationDto cForm, int compId, int salesRepID) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_salesrep set Name=? where SalesRepID=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, salesRepID);
//			pstmt.setInt(3, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "updateSalesRep " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean updateTerm(ConfigurationDto cForm, Long compId, int termID, int days) {
		try {
			return termRepository.findByTermIdAndCompany_CompanyId(termID, compId).map(term -> {
				term.setName(cForm.getDescription());
				term.setDays(days);
				termRepository.save(term);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in updateTerm: " + e.toString());
			return false;
		}
	}

//	public boolean updateTerm(ConfigurationDto cForm, int compId, int termID, int days) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_term set Name=?,Days=? where TermID=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setInt(2, days);
//			pstmt.setInt(3, termID);
//			pstmt.setInt(4, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "updateTerm " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean updateSalesTax(ConfigurationDto cForm, Long compId, int salesTaxID, float tax) {
		try {
			return salesTaxRepository.findBySalesTaxIdAndCompany_CompanyId(salesTaxID, compId).map(salesTax -> {
				salesTax.setState(cForm.getDescription());
				salesTax.setRate(Double.valueOf(tax));
				salesTaxRepository.save(salesTax);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in updateSalesTax: " + e.toString());
			return false;
		}
	}

//	public boolean updateSalesTax(ConfigurationDto cForm, int compId, int salesTaxID, float tax) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_salestax set State=?,Rate=? where SalesTaxID=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setFloat(2, tax);
//			pstmt.setInt(3, salesTaxID);
//			pstmt.setInt(4, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "updateSalesTax " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean updateCreditTerm(ConfigurationDto cForm, Long compId, int creditTermID, int days) {
		try {
			return lineOfCreditTermRepository.findByCreditTermIdAndCompany_CompanyId(creditTermID, compId)
					.map(creditTerm -> {
						creditTerm.setName(cForm.getDescription());
						creditTerm.setDays(days);
						creditTerm.setIsDefault(cForm.getIsDefaultCreditTerm().equals("on") ? 1 : 0);
						lineOfCreditTermRepository.save(creditTerm);
						return true;
					}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in updateCreditTerm: " + e.toString());
			return false;
		}
	}
//	public boolean updateCreditTerm(ConfigurationDto cForm, int compId, int creditTermID, int days) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_lineofcreditterm set Name=?,Days=?,isDefault=? where CreditTermId=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, cForm.getDescription());
//			pstmt.setFloat(2, days);
//			pstmt.setInt(3, cForm.getIsDefaultCreditTerm().equals("on") ? 1 : 0);
//			pstmt.setInt(4, creditTermID);
//			pstmt.setInt(5, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "updateCreditTerm " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean deleteMessage(Long compId, int messageID) {
		try {
			return messageRepository.findByMessageIdAndCompany_CompanyId(messageID, compId).map(message -> {
				message.setActive(0); // Soft delete by setting Active to 0
				messageRepository.save(message);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in deleteMessage: " + e.toString());
			return false;
		}
	}

//	public boolean deleteMessage(int compId, int messageID) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_Message set Active=? where MessageId=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, 0);
//			pstmt.setInt(2, messageID);
//			pstmt.setInt(3, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "deleteMessage " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean deleteSalesRep(Long compId, int salesRepId) {
		try {
			return salesRepRepository.findBySalesRepIdAndCompany_CompanyId(salesRepId, compId).map(salesRep -> {
				salesRep.setActive(0); // Soft delete by setting Active to 0
				salesRepRepository.save(salesRep);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in deleteSalesRep: " + e.toString());
			return false;
		}
	}

//	public boolean deleteSalesRep(int compId, int salesRepId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_salesrep set Active=? where SalesRepID=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, 0);
//			pstmt.setInt(2, salesRepId);
//			pstmt.setInt(3, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "deleteSalesRep " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean deleteTerm(Long compId, int termId) {
		try {
			return termRepository.findByTermIdAndCompany_CompanyId(termId, compId).map(term -> {
				term.setActive(0); // Soft delete by setting Active to 0
				termRepository.save(term);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in deleteTerm: " + e.toString());
			return false;
		}
	}

//	public boolean deleteTerm(int compId, int termId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_term set Active=? where TermID=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, 0);
//			pstmt.setInt(2, termId);
//			pstmt.setInt(3, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "deleteTerm " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean deleteSalesTax(Long compId, int salesTaxId) {
		try {
			return salesTaxRepository.findBySalesTaxIdAndCompany_CompanyId(salesTaxId, compId).map(salesTax -> {
				salesTax.setActive(0); // Soft delete by setting Active to 0
				salesTaxRepository.save(salesTax);
				return true;
			}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in deleteSalesTax: " + e.toString());
			return false;
		}
	}

//	public boolean deleteSalesTax(int compId, int salesTaxId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_salestax set Active=? where SalesTaxID=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, 0);
//			pstmt.setInt(2, salesTaxId);
//			pstmt.setInt(3, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "deleteSalesTax " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean deleteCreditTerm(Long compId, int creditTermId) {
		try {
			return lineOfCreditTermRepository.findByCreditTermIdAndCompany_CompanyId(creditTermId, compId)
					.map(creditTerm -> {
						creditTerm.setActive(0); // Soft delete by setting Active to 0
						lineOfCreditTermRepository.save(creditTerm);
						return true;
					}).orElse(false);
		} catch (Exception e) {
			Loger.log("Exception in deleteCreditTerm: " + e.toString());
			return false;
		}
	}
//	public boolean deleteCreditTerm(int compId, int creditTermId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "update bca_lineofcreditterm set Active=? where CreditTermId=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, 0);
//			pstmt.setInt(2, creditTermId);
//			pstmt.setInt(3, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method " + "deleteCreditTerm " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	@Autowired
	private BcaRefundreasonRepository refundReasonRepository;

	public boolean insertRefundReason(Long compId, String refundReason) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaRefundreason reason = new BcaRefundreason();
			reason.setRefundReason(refundReason);
			reason.setActive(1);
			reason.setIsDefaultReason(false);
			reason.setCompany(company);

			refundReasonRepository.save(reason);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in insertRefundReason: " + e.toString());
			return false;
		}
	}

//	public boolean insertRefundReason(int compId, String refundReason) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String updateQuery = "insert into bca_refundreason (RefundReason,Active,IsDefaultReason,CompanyID) values(?,?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, refundReason);
//			pstmt.setInt(2, 1);
//			pstmt.setInt(3, 0);
//			pstmt.setInt(4, compId);
//			isSaved = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method insertRefundReason " + ex.toString());
//		} finally {
//			if (pstmt != null) {
//				db.close(pstmt);
//			}
//			if (con != null) {
//				db.close(con);
//			}
//		}
//		return isSaved;
//	}

	public boolean updateRefundReason(Long compId, int refundReasonId, String newRefundReason) {
		try {
			BcaRefundreason reason = refundReasonRepository.findById(refundReasonId)
					.orElseThrow(() -> new EntityNotFoundException("Refund reason not found"));

			if (reason.getCompany().getCompanyId().equals(compId)) {
				reason.setRefundReason(newRefundReason);
				reason.setActive(1); // Assuming Active is set to 1 for an update
				reason.setIsDefaultReason(false); // Assuming IsDefaultReason is set to false for an update

				refundReasonRepository.save(reason);
				return true;
			} else {
				Loger.log("Company ID does not match");
				return false;
			}
		} catch (Exception e) {
			Loger.log("Exception in updateRefundReason: " + e.toString());
			return false;
		}
	}

//	public boolean updateRefundReason(int compId, int refundReasonId, String newRefundReason) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String updateQuery = "update bca_refundreason set RefundReason=?,Active=?,IsDefaultReason=? where ReasonID=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, newRefundReason);
//			pstmt.setInt(2, 1);
//			pstmt.setInt(3, 0);
//			pstmt.setInt(4, refundReasonId);
//			pstmt.setInt(5, compId);
//			isSaved = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method updateRefundReason " + ex.toString());
//		} finally {
//			if (pstmt != null) {
//				db.close(pstmt);
//			}
//			if (con != null) {
//				db.close(con);
//			}
//		}
//		return isSaved;
//	}

	public boolean deleteRefundReason(Long compId, int refundReasonId) {
		try {
			BcaRefundreason reason = refundReasonRepository.findById(refundReasonId)
					.orElseThrow(() -> new EntityNotFoundException("Refund reason not found"));

			if (reason.getCompany().getCompanyId().equals(compId)) {
				reason.setActive(0); // Set Active to 0 to indicate a 'soft delete'
				refundReasonRepository.save(reason);
				return true;
			} else {
				Loger.log("Company ID does not match");
				return false;
			}
		} catch (Exception e) {
			Loger.log("Exception in deleteRefundReason: " + e.toString());
			return false;
		}
	}

//	public boolean deleteRefundReason(int compId, int refundReasonId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String updateQuery = "update bca_refundreason set Active=0 where ReasonID=? and CompanyID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, refundReasonId);
//			pstmt.setInt(2, compId);
//			isSaved = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method deleteRefundReason " + ex.toString());
//		} finally {
//			if (pstmt != null) {
//				db.close(pstmt);
//			}
//			if (con != null) {
//				db.close(con);
//			}
//		}
//		return isSaved;
//	}

	@Transactional
	public boolean setDefaultRefundReason(int reasonID, Long compId) {
		try {
			// Set all reasons' isDefaultReason to false
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			List<BcaRefundreason> reasons = refundReasonRepository.findByCompany(company);

			for (BcaRefundreason reason : reasons) {
				reason.setIsDefaultReason(false);
				refundReasonRepository.save(reason);
			}

			// Set the specified reason's isDefaultReason to true
			BcaRefundreason reason = refundReasonRepository.findById(reasonID)
					.orElseThrow(() -> new EntityNotFoundException("Refund reason not found"));
			reason.setIsDefaultReason(true);
			refundReasonRepository.save(reason);

			return true;
		} catch (Exception e) {
			Loger.log("Exception in setDefaultRefundReason: " + e.toString());
			return false;
		}
	}

//	public boolean setDefaultRefundReason(int reasonID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		boolean status = false;
//		try {
//			stmt = con.createStatement();
//			stmt.addBatch("UPDATE bca_refundreason SET IsDefaultReason=0 WHERE IsDefaultReason=1");
//			stmt.addBatch("UPDATE bca_refundreason SET IsDefaultReason=1 WHERE ReasonID=" + reasonID);
//			status = stmt.executeBatch().length > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (stmt != null) {
//					db.close(stmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return status;
//	}

	@Autowired
	private BcaJobcategoryRepository jobCategoryRepository;

	public boolean addJobCategory(ConfigurationDto cForm, Long compId, String jobCategory) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaJobcategory newJobCategory = new BcaJobcategory();
			newJobCategory.setName(jobCategory);
			newJobCategory.setCompany(company);
			newJobCategory.setIsRecurringServiceJob(1);
			newJobCategory.setActive(1);

			jobCategoryRepository.save(newJobCategory);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in addJobCategory: " + e.toString());
			return false;
		}
	}

//	public boolean addJobCategory(ConfigurationDto cForm, int compId, String jobCategory) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String updateQuery = "insert into bca_jobcategory (Name,CompanyID,isRecurringServiceJob,Active) VALUES (?,?,?,?)";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, jobCategory);
//			pstmt.setInt(2, compId);
//			pstmt.setInt(3, 1);
//			pstmt.setInt(4, 1);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method addJobCategory " + ex.toString());
//		} finally {
//			executor.close(pstmt);
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean updateJobCategory(ConfigurationDto cForm, Long compId, int jobCategoryId,
			String newJobCategoryName) {
		try {
			// Find the company by ID
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			// Find the job category by ID and ensure it belongs to the given company
			BcaJobcategory jobCategory = jobCategoryRepository.findByJobCategoryIdAndCompany(jobCategoryId, company)
					.orElseThrow(() -> new EntityNotFoundException("Job category not found"));

			// Update the job category name and isRecurringServiceJob
			jobCategory.setName(newJobCategoryName);
			jobCategory.setIsRecurringServiceJob(1);

			jobCategoryRepository.save(jobCategory);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in updateJobCategory: " + e.toString());
			return false;
		}
	}
//	public boolean updateJobCategory(ConfigurationDto cForm, int compId, int jobCategoryId, String newJobCategoryName) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String updateQuery = "update bca_jobcategory set Name=?,isRecurringServiceJob=? where CompanyID=? and JobCategoryID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, newJobCategoryName);
//			pstmt.setInt(2, 1);
//			pstmt.setInt(3, compId);
//			pstmt.setInt(4, jobCategoryId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method updateJobCategory " + ex.toString());
//		} finally {
//			executor.close(pstmt);
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean deleteJobCategory(int jCategoryId, Long compId) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaJobcategory jobCategory = jobCategoryRepository.findById(jCategoryId)
					.orElseThrow(() -> new EntityNotFoundException("Job Category not found"));

			if (jobCategory.getCompany().getCompanyId().equals(compId)) {
				jobCategory.setActive(0); // Set Active to 0 to indicate a soft delete
				jobCategoryRepository.save(jobCategory);
				return true;
			} else {
				Loger.log("Company ID does not match");
				return false;
			}
		} catch (Exception e) {
			Loger.log("Exception in deleteJobCategory: " + e.toString());
			return false;
		}
	}
//	public boolean deleteJobCategory(int jCategoryId, int compId) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String updateQuery = "update bca_jobcategory set Active=? where CompanyID=? and JobCategoryID=?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, 0);
//			pstmt.setInt(2, compId);
//			pstmt.setInt(3, jCategoryId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method deleteJobCategory " + ex.toString());
//		} finally {
//			executor.close(pstmt);
//			executor.close(con);
//		}
//		return isSaved;
//	}

	@Transactional
	public boolean editServiceBillInfo(int jCategoryId, ConfigurationDto cForm, String billName, Long compId) {
		try {
			boolean isActive = cForm.getRecurringServiceBill().equals("on");

			BcaJobcategory jobCategory = jobCategoryRepository.findById(jCategoryId)
					.orElseThrow(() -> new EntityNotFoundException("Job Category not found"));

			if (jobCategory.getCompany().getCompanyId().equals(compId)) {
				jobCategory.setName(billName);
				jobCategory.setActive(isActive ? 1 : 0); // Set Active to 0 to indicate a soft delete
				jobCategoryRepository.save(jobCategory);
				return true;
			}

			return true;
		} catch (Exception e) {
			Loger.log("Exception in editServiceBillInfo: " + e.toString());
			return false;
		}
	}
//	public boolean editServiceBillInfo(ConfigurationDto cForm, String billName, int compId) {
//		Connection con = null;
//		SQLExecutor executor = new SQLExecutor();
//		PreparedStatement pstmt = null;
//
//		boolean isSaved = false;
//		if (executor == null)
//			return isSaved;
//		con = executor.getConnection();
//		if (con == null)
//			return isSaved;
//
//		try {
//			String updateQuery = "UPDATE bca_jobcategory SET Name = ?,Active = ? WHERE isRecurringServiceJob  = ? "
//					+ " AND JobCategoryID = ?" + " AND CompanyID = ?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setString(1, billName);
//			pstmt.setInt(2, cForm.getRecurringServiceBill().equals("on") ? 1 : 0);
//			pstmt.setInt(3, 1);
//			pstmt.setInt(4, -1);
//			pstmt.setInt(5, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//
//		} catch (SQLException ex) {
//			Loger.log(
//					"Exception in the class ConfigurationInfo and in method " + "editServiceBillInfo " + ex.toString());
//		} finally {
//			executor.close(con);
//		}
//		return isSaved;
//	}

	public boolean saveVendorPurchaseValuesInConfigInfo(ConfigurationDto cForm, Long compId) {
		try {
			BcaCompany company = companyRepository.findById(compId)
					.orElseThrow(() -> new EntityNotFoundException("Company not found"));

			BcaPreference preference = preferenceRepository.findByCompany(company).orElse(new BcaPreference()); // Create
																												// new
																												// if
																												// not
																												// found

			// Set values from ConfigurationDto to BcaPreference entity
			preference.setDefaultVendorrSortId(cForm.getSortBy());

			BcaCountries country = countriesRepository.findById(cForm.getSelectedCountryId1()).get();

			BcaStates state = stateRepository.findById(cForm.getSelectedStateId1()).get();

			preference.setVendorCountry(country);

			preference.setVendorState(state);

			preference.setVendorProvience(cForm.getVendorProvience());
			preference.setStartingPonumber(cForm.getStartPONum());
			preference.setPofootnoteId(cForm.getVendorDefaultFootnoteID());
			preference.setPoviaId(cForm.getShipCarrierId());
			preference.setPotermId(cForm.getSelectedTermId());
			preference.setPorepId(cForm.getSelectedSalesRepId());
			preference.setPopayMethodId(cForm.getSelectedPaymentId());
			preference.setEmployeeInChargeId(cForm.getSelectedActiveEmployeeId());
			preference.setPoshowCountry("on".equals(cForm.getPoShowCountry()) ? true : false);
			preference.setPoshowTelephone("on".equals(cForm.getPoShowTelephone()) ? true : false);
			preference.setIsPurchasePrefix("on".equals(cForm.getIsPurchasePrefix()) ? true : false);
			preference.setDefaultArcategoryId(cForm.getSelectedCategoryId());
			preference.setVendorBusinessTypeId(cForm.getVendorBusinessTypeID());
			preference.setVendorInvoiceStyleId(cForm.getVendorInvoiceStyleId());
			preference.setCustomerType(cForm.getCustomerType());
			preference.setPriceLevelPriority(cForm.getPriceLevelPriority());
			preference.setPriceLevelDealer(cForm.getPriceLevelDealer());
			preference.setPriceLevelCustomer(cForm.getPriceLevelCustomer());
			preference.setPriceLevelGeneral(cForm.getPriceLevelGeneral());

			preferenceRepository.save(preference);
			return true;
		} catch (Exception e) {
			Loger.log("Exception in saveVendorPurchaseValuesInConfigInfo: " + e.toString());
			return false;
		}
	}
//	public boolean saveVendorPurchaseValuesInConfigInfo(ConfigurationDto cForm, int compId) {
//		SQLExecutor executor = new SQLExecutor();
//		Connection con = executor.getConnection();
//		PreparedStatement pstmt = null;
//		boolean isSaved = false;
//		try {
//			String updateQuery = "UPDATE bca_preference SET DefaultVendorrSortID = ?,VendorCountryID = ?,VendorStateID=?,VendorProvience=?,StartingPONumber=?,"
//					+ "POFootnoteID=?,POViaID=?,POTermID=?,PORepID=?,POPayMethodID=?,EmployeeInChargeID=?,POShowCountry=?,POShowTelephone=?,IsPurchasePrefix=?,"
//					+ "DEFAULTARCategoryID=?,VendorBusinessTypeID=?,VendorInvoiceStyleId=?,CustomerType=?,PriceLevelPriority=?,PriceLevelDealer=?,PriceLevelCustomer=?,"
//					+ "PriceLevelGeneral=?  where CompanyID = ?";
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, cForm.getSortBy());
//			pstmt.setInt(2, cForm.getSelectedCountryId1());
//			pstmt.setInt(3, cForm.getSelectedStateId1());
//			pstmt.setString(4, cForm.getVendorProvience());
//			pstmt.setString(5, cForm.getStartPONum());
//			pstmt.setInt(6, cForm.getVendorDefaultFootnoteID());
//			pstmt.setInt(7, cForm.getShipCarrierId());
//			pstmt.setInt(8, cForm.getSelectedTermId());
//			pstmt.setInt(9, cForm.getSelectedSalesRepId());
//			pstmt.setInt(10, cForm.getSelectedPaymentId());
//			pstmt.setInt(11, cForm.getSelectedActiveEmployeeId());
//			pstmt.setString(12, "on".equals(cForm.getPoShowCountry()) ? "1" : "0");
//			pstmt.setString(13, "on".equals(cForm.getPoShowTelephone()) ? "1" : "0");
//			pstmt.setString(14, "on".equals(cForm.getIsPurchasePrefix()) ? "1" : "0");
//			pstmt.setInt(15, cForm.getSelectedCategoryId());
//			pstmt.setInt(16, cForm.getVendorBusinessTypeID());
//			pstmt.setInt(17, cForm.getVendorInvoiceStyleId());
//			pstmt.setInt(18, cForm.getCustomerType());
//			pstmt.setInt(19, cForm.getPriceLevelPriority());
//			pstmt.setInt(20, cForm.getPriceLevelDealer());
//			pstmt.setInt(21, cForm.getPriceLevelCustomer());
//			pstmt.setInt(22, cForm.getPriceLevelGeneral());
//			pstmt.setInt(23, compId);
//
//			int updated = pstmt.executeUpdate();
//			if (updated > 0) {
//				isSaved = true;
//			}
//		} catch (SQLException ex) {
//			Loger.log("Exception in the class ConfigurationInfo and in method saveVendorPurchaseValuesInConfigInfo "
//					+ ex.toString());
//			ex.printStackTrace();
//		} finally {
//			executor.close(pstmt);
//			executor.close(con);
//		}
//		return isSaved;
//	}
}
