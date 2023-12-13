package com.nxsol.bzcomposer.company;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.struts.util.LabelValueBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.configuration.forms.DeductionListDto;
import com.avibha.bizcomposer.configuration.forms.ScheduleDateDto;
import com.avibha.bizcomposer.email.forms.MailTemplateDto;
import com.avibha.bizcomposer.employee.forms.CompanyTaxOptionDto;
import com.avibha.bizcomposer.employee.forms.StateIncomeTaxDto;
import com.avibha.bizcomposer.sales.dao.CustomerInfo;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.DateInfo;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.domain.BcaAccount;
import com.nxsol.bzcomposer.company.domain.BcaAccttype;
import com.nxsol.bzcomposer.company.domain.BcaBusinessmodules;
import com.nxsol.bzcomposer.company.domain.BcaCategory;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaCreditcardtype;
import com.nxsol.bzcomposer.company.domain.BcaCustomerType;
import com.nxsol.bzcomposer.company.domain.BcaFeatures;
import com.nxsol.bzcomposer.company.domain.BcaInvoiceTemplate;
import com.nxsol.bzcomposer.company.domain.BcaInvoicestyle;
import com.nxsol.bzcomposer.company.domain.BcaJobcategory;
import com.nxsol.bzcomposer.company.domain.BcaLineofcreditterm;
import com.nxsol.bzcomposer.company.domain.BcaLocation;
import com.nxsol.bzcomposer.company.domain.BcaMailtemplate;
import com.nxsol.bzcomposer.company.domain.BcaMastercustomergroup;
import com.nxsol.bzcomposer.company.domain.BcaMasterrmareason;
import com.nxsol.bzcomposer.company.domain.BcaMastershippingcontainer;
import com.nxsol.bzcomposer.company.domain.BcaMastershippingmailtype;
import com.nxsol.bzcomposer.company.domain.BcaMastershippingpackagesize;
import com.nxsol.bzcomposer.company.domain.BcaMasterstartingmodule;
import com.nxsol.bzcomposer.company.domain.BcaMessage;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.BcaPreference;
import com.nxsol.bzcomposer.company.domain.BcaRealtimeshippingservice;
import com.nxsol.bzcomposer.company.domain.BcaReceivedtype;
import com.nxsol.bzcomposer.company.domain.BcaRefundreason;
import com.nxsol.bzcomposer.company.domain.BcaRmareason;
import com.nxsol.bzcomposer.company.domain.BcaSalesrep;
import com.nxsol.bzcomposer.company.domain.BcaSalestax;
import com.nxsol.bzcomposer.company.domain.BcaScheduletimes;
import com.nxsol.bzcomposer.company.domain.BcaSettings;
import com.nxsol.bzcomposer.company.domain.BcaShipcarrier;
import com.nxsol.bzcomposer.company.domain.BcaShippingrate;
import com.nxsol.bzcomposer.company.domain.BcaShippingservice;
import com.nxsol.bzcomposer.company.domain.BcaStates;
import com.nxsol.bzcomposer.company.domain.BcaStore;
import com.nxsol.bzcomposer.company.domain.BcaStoretype;
import com.nxsol.bzcomposer.company.domain.BcaTerm;
import com.nxsol.bzcomposer.company.domain.BcaUnitofmeasure;
import com.nxsol.bzcomposer.company.domain.BcaUser;
import com.nxsol.bzcomposer.company.domain.BcaUsergroup;
import com.nxsol.bzcomposer.company.domain.BcaUsermapping;
import com.nxsol.bzcomposer.company.domain.BcpDeductionlist;
import com.nxsol.bzcomposer.company.domain.BcpEmployee;
import com.nxsol.bzcomposer.company.domain.BcpFedperallowance;
import com.nxsol.bzcomposer.company.domain.BcpJobtitle;
import com.nxsol.bzcomposer.company.domain.BcpTaxCompany;
import com.nxsol.bzcomposer.company.domain.SmdEbaycategory;
import com.nxsol.bzcomposer.company.domain.SmdGatewaydetails;
import com.nxsol.bzcomposer.company.domain.SmdShipdetails;
import com.nxsol.bzcomposer.company.repos.BcaAccountRepository;
import com.nxsol.bzcomposer.company.repos.BcaAccttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaBusinessmodulesRepository;
import com.nxsol.bzcomposer.company.repos.BcaCategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCountriesRepository;
import com.nxsol.bzcomposer.company.repos.BcaCreditcardtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaCustomerTypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaFeaturesRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoiceTemplateRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoicestyleRepository;
import com.nxsol.bzcomposer.company.repos.BcaIteminventoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaJobcategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaLineofcredittermRepository;
import com.nxsol.bzcomposer.company.repos.BcaLocationRepository;
import com.nxsol.bzcomposer.company.repos.BcaMailtemplateRepository;
import com.nxsol.bzcomposer.company.repos.BcaMastercustomergroupRepository;
import com.nxsol.bzcomposer.company.repos.BcaMasterrmareasonRepository;
import com.nxsol.bzcomposer.company.repos.BcaMastershippingcontainerRepository;
import com.nxsol.bzcomposer.company.repos.BcaMastershippingmailtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaMastershippingpackagesizeRepository;
import com.nxsol.bzcomposer.company.repos.BcaMasterstartingmoduleRepository;
import com.nxsol.bzcomposer.company.repos.BcaMessageRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaPreferenceRepository;
import com.nxsol.bzcomposer.company.repos.BcaRealtimeshippingserviceRepository;
import com.nxsol.bzcomposer.company.repos.BcaReceivedtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaRefundreasonRepository;
import com.nxsol.bzcomposer.company.repos.BcaRmareasonRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalesrepRepository;
import com.nxsol.bzcomposer.company.repos.BcaSalestaxRepository;
import com.nxsol.bzcomposer.company.repos.BcaScheduletimesRepository;
import com.nxsol.bzcomposer.company.repos.BcaSettingsRepository;
import com.nxsol.bzcomposer.company.repos.BcaShipcarrierRepository;
import com.nxsol.bzcomposer.company.repos.BcaShippingrateRepository;
import com.nxsol.bzcomposer.company.repos.BcaShippingserviceRepository;
import com.nxsol.bzcomposer.company.repos.BcaStatesRepository;
import com.nxsol.bzcomposer.company.repos.BcaStoreRepository;
import com.nxsol.bzcomposer.company.repos.BcaStoretypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaTermRepository;
import com.nxsol.bzcomposer.company.repos.BcaUnitofmeasureRepository;
import com.nxsol.bzcomposer.company.repos.BcaUserRepository;
import com.nxsol.bzcomposer.company.repos.BcaUsergroupRepository;
import com.nxsol.bzcomposer.company.repos.BcaUsermappingRepository;
import com.nxsol.bzcomposer.company.repos.BcpDeductionlistRepository;
import com.nxsol.bzcomposer.company.repos.BcpEmployeeRepository;
import com.nxsol.bzcomposer.company.repos.BcpFedperallowanceRepository;
import com.nxsol.bzcomposer.company.repos.BcpJobtitleRepository;
import com.nxsol.bzcomposer.company.repos.BcpTaxCompanyRepository;
import com.nxsol.bzcomposer.company.repos.SmdEbaycategoryRepository;
import com.nxsol.bzcomposer.company.repos.SmdGatewaydetailsRepository;
import com.nxsol.bzcomposer.company.repos.SmdShipdetailsRepository;

@Service
public class ConfigurationDAO {

	ConfigurationDto pojo = null;
	SimpleDateFormat formatterMMDDYYYY = new SimpleDateFormat("yyyy-MM-dd");

	@Autowired
	private BcaFeaturesRepository featureRepository;

	public ArrayList<ConfigurationDto> getModules(String cId, HttpServletRequest request, ConfigurationDto form) {
		List<BcaFeatures> features = featureRepository.findByBusinessId(1); // Assuming BusinessID is a Long
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		for (BcaFeatures feature : features) {
			if (!("Daily Sales Summary".equals(feature.getFeatureName())
					|| "Daily Item Summary".equals(feature.getFeatureName()))) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setFeatureName(feature.getFeatureName());
				pojo.setSelectedModules(feature.getModulee().getModuleId());
				pojo.setSelectedModuleId(feature.getModulee().getModuleId()); // Adjust according to your entity fields
				listPOJOs.add(pojo);
			}
		}

		form.setListOfExistingModules(listPOJOs);
		request.setAttribute("companyname", form.getCompanyName());
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getModules(String cId, HttpServletRequest request, ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("SELECT * FROM bca_features WHERE BusinessID=" + 1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setFeatureName(rs.getString(1));
//				pojo.setSelectedModules(rs.getInt("ModuleID"));
//				pojo.setSelectedModuleId(rs.getInt(4));
//				if (!(pojo.getFeatureName().equals("Daily Sales Summary")
//						|| pojo.getFeatureName().equals("Daily Item Summary"))) {
//					listPOJOs.add(pojo);
//				}
//				pojo = null;
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingModules(listPOJOs);
//		request.setAttribute("companyname", form.getCompanyName());
//		return listPOJOs;
//	}

	@Autowired
	private BcaBusinessmodulesRepository moduleRepository;

	public ArrayList<ConfigurationDto> getSelectedModules(Long cId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaBusinessmodules> modules = moduleRepository.findByCompany_CompanyIdAndActive(cId, 1);
			for (BcaBusinessmodules module : modules) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedModuleId(module.getModulee().getModuleId());
				pojo.setSelectedModules(module.getModulee().getModuleId());
				pojo.setFeatureName(module.getModuleName());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingselectedModules(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getSelectedModules(String cId, HttpServletRequest request,
//			ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//
//		String dateBetween = "";
//		DateInfo dInfo = new DateInfo();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		ArrayList<Date> selectedRange = new ArrayList<>();
//		CustomerInfo cInfo = new CustomerInfo();
//
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//
//			String sql1 = "SELECT * FROM bca_businessmodules WHERE CompanyID = " + cId + " AND Active=1";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedModuleId(rs.getInt("ModuleID"));
//				pojo.setSelectedModules(rs.getInt("ModuleID"));
//				pojo.setFeatureName(rs.getString("ModuleName"));
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingselectedModules(listPOJOs);
//		return listPOJOs;
//
//	}

	/**/
	@Autowired
	private BcaCategoryRepository categoryRepository;

	public ArrayList<ConfigurationDto> getCategory(Long cId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> roots = new ArrayList<>();

		try {
			List<BcaCategory> categories = categoryRepository
					.findByCompany_CompanyIdAndIsActiveOrderByCategoryTypeIdAscNameAsc(cId, true);
			for (BcaCategory category : categories) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setArCategory(category.getCategoryId());
				pojo.setPoCategory(category.getCategoryId());
				pojo.setBpCategory(category.getCategoryId());
				pojo.setSelectedCategoryId(category.getCategoryId());
				pojo.setCategoryName(category.getName());
				pojo.setCategoryNumber(category.getCateNumber());
				roots.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingCategory(roots);
		return roots;
	}

//	public ArrayList<ConfigurationDto> getCategory(String cId, HttpServletRequest request, ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> roots = new ArrayList<>();
//		try {
//			String sql1 = "Select * from bca_category where CompanyID=" + cId
//					+ " and isActive=1 order by CategoryTypeID,Name ";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setArCategory(rs.getInt("CategoryID"));
//				pojo.setPoCategory(rs.getInt("CategoryID"));
//				pojo.setBpCategory(rs.getInt("CategoryID"));
//				pojo.setSelectedCategoryId(rs.getInt("CategoryID"));
//				pojo.setCategoryName(rs.getString("Name"));
//				pojo.setCategoryNumber(rs.getString("CateNumber"));
//				roots.add(pojo);
//			}
//		} catch (SQLException e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingCategory(roots);
//		return roots;
//	}

	@Autowired
	private BcaAccountRepository accountRepository;

	@Autowired
	private BcaAccttypeRepository accttypeRepository;

	public ArrayList<ConfigurationDto> getAccount(Long cId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			BcaCompany company = companyRepository.findByCompanyId(cId);
			BcaAccttype acctType = accttypeRepository.findByacctTypeId(2);
			List<BcaAccount> accounts = accountRepository
					.findByCompanyAndAcctTypeAndActiveOrderByAcctTypeAscNameAsc(company, acctType, 1);
			for (BcaAccount account : accounts) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setArDepositTo(account.getAccountId());
				pojo.setPoDepositTo(account.getAccountId());
				pojo.setBpDepositTo(account.getAccountId());
				pojo.setDefaultDepositToId(account.getAccountId());
				pojo.setDefaultPaymentMethodId(account.getAccountId());
				pojo.setAccountNumber(account.getAccountId()); // Ensure this is correct as account numbers are
																// typically not the same as account IDs
				pojo.setAccountName(account.getName());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingAccounts(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getAccount(String cId, HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		// TODO Auto-generated method stub
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		con = db.getConnection();
//
//		String sql = "SELECT * FROM bca_account" + " WHERE CompanyID = " + cId + " AND AcctTypeID = 2"
//				+ " AND Active = 1" +
//				" ORDER BY Name ASC";
//
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//
//				pojo.setArDepositTo(rs.getInt("AccountID"));
//				pojo.setPoDepositTo(rs.getInt("AccountID"));
//				pojo.setBpDepositTo(rs.getInt("AccountID"));
//
//				// pojo.setSelectedAccountId(rs.getInt("AccountID"));
//
//				pojo.setDefaultDepositToId(rs.getInt("AccountID"));
//				pojo.setDefaultPaymentMethodId(rs.getInt("AccountID"));
//				pojo.setAccountNumber(rs.getInt("AccountID"));
//				pojo.setAccountName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingAccounts(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaReceivedtypeRepository receivedTypeRepository;

	public ArrayList<ConfigurationDto> getPaymentType(Long cId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> paymentType = new ArrayList<>();

		try {

			List<BcaReceivedtype> receivedTypes = receivedTypeRepository
					.findByCompany_CompanyIdAndActiveAndTypeCategoryOrderByNameAsc(cId, 1, 1);
			for (BcaReceivedtype receivedType : receivedTypes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setPaymentTypeId(receivedType.getPaymentTypeId());
				pojo.setPaymentName(receivedType.getName());
				pojo.setDefaultPaymentTypeId(receivedType.getIsDefault());
				paymentType.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingPayment(paymentType);
		return paymentType;
	}
//	public ArrayList<ConfigurationDto> getPaymentType(String cId, HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> paymentType = new ArrayList<>();
//		try {
//			String sql = "select PaymentTypeID,Name,IsDefault from bca_receicedtype where CompanyID='" + cId
//					+ "' and Active=1 and TypeCategory=1 ORDER BY Name";
//			// String sql = "SELECT * FROM bca_paymenttype WHERE CompanyID = "+cId+" AND
//			// Active =1 AND TypeCategory=1 ORDER BY Name";
//			pstmt = con.prepareStatement(sql);
//			Loger.log(sql);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setPaymentTypeId(rs.getInt(1));
//				pojo.setPaymentName(rs.getString(2));
//				pojo.setDefaultPaymentTypeId(rs.getBoolean(3));
//				paymentType.add(pojo);
//			}
//		} catch (SQLException e) {
//			Loger.log(e.toString());
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
//		form.setListOfExistingPayment(paymentType);
//		return paymentType;
//	}

	@Autowired
	private BcaPaymenttypeRepository paymentTypeRepository;

	public ArrayList<ConfigurationDto> getPaymentTypeGeneralAccount(Long cId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> paymentType = new ArrayList<>();

		try {
			BcaCompany company = companyRepository.findByCompanyId(cId);
			List<BcaPaymenttype> paymentTypes = paymentTypeRepository
					.findByCompanyAndActiveAndTypeCategoryOrderByName(company, 1, 0);
			for (BcaPaymenttype paymentTypeEntity : paymentTypes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setBpReceivedType(paymentTypeEntity.getPaymentTypeId());
				pojo.setPoReceivedType(paymentTypeEntity.getPaymentTypeId());
				// pojo.setSelectedPaymentId(paymentTypeEntity.getPaymentTypeId());
				pojo.setPaymentId(paymentTypeEntity.getPaymentTypeId());
				pojo.setPaymentName(paymentTypeEntity.getName());
				paymentType.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingPaymentGeneralAccount(paymentType);
		return paymentType;
	}

//	public ArrayList<ConfigurationDto> getPaymentTypeGeneralAccount(String cId, HttpServletRequest request,
//			ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> paymentType = new ArrayList<>();
//
//		String sql = "SELECT distinct PaymentTypeID,Name,Type " + " FROM bca_paymenttype " + " WHERE CompanyID = " + cId
//				+ " AND Active = 1 " + " AND TypeCategory = 0" + " ORDER BY Name";
//		/*
//		 * String sql =
//		 * "SELECT PaymentTypeID,Name,Type,CCTypeID,Active,BankAcctID,TypeCategory FROM bca_paymenttype WHERE CompanyID = "
//		 * +cId+ " AND Active =1 AND TypeCategory = 0 ORDER BY Name"; //Added on
//		 * 08-05-2019
//		 */
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//
//				pojo.setBpReceivedType(rs.getInt("PaymentTypeID"));
//				pojo.setPoReceivedType(rs.getInt("PaymentTypeID"));
//				// pojo.setSelectedPaymentId(rs.getInt("PaymentTypeID"));
//				pojo.setPaymentId(rs.getInt("PaymentTypeID"));
//				pojo.setPaymentName(rs.getString("Name"));
//
//				paymentType.add(pojo);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingPaymentGeneralAccount(paymentType);
//		return paymentType;
//	}

	@Autowired
	private BcaCountriesRepository countriesRepository;

	public ArrayList<ConfigurationDto> getCountry(ConfigurationDto form) {
		ArrayList<ConfigurationDto> cList = new ArrayList<>();

		try {
			List<BcaCountries> countries = countriesRepository.findAllByOrderByName();
			for (BcaCountries country : countries) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setCountryId(country.getId());
				pojo.setSelectedCountryId1(country.getId());
				pojo.setCountryName(country.getName());
				pojo.setCountryName1(country.getName());
				cList.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingCountry(cList);
		form.setListOfExistingCountry1(cList);
		return cList;
	}

//	public ArrayList<ConfigurationDto> getCountry(String cId, HttpServletRequest request, ConfigurationDto form) {
//
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> cList = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("select * from country order by CountryName ASC ");
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setCountryId(rs.getInt("CountryID"));
//				pojo.setSelectedCountryId1(rs.getInt("CountryID"));
//				pojo.setCountryName(rs.getString("CountryName"));
//				pojo.setCountryName1(rs.getString("CountryName"));
//				cList.add(pojo);
//			}
//		} catch (SQLException e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingCountry(cList);
//		form.setListOfExistingCountry1(cList);
//		return cList;
//	}

	@Autowired
	private BcaStatesRepository stateRepository;

	public ArrayList<ConfigurationDto> getStates(Integer countryId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> sList = new ArrayList<>();

		try {
			List<BcaStates> states = stateRepository.findByCountry_Id(countryId);
			for (BcaStates state : states) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedStateId(state.getId());
				pojo.setSelectedStateId1(state.getId());
				pojo.setStateId1(state.getId());
				pojo.setStateName(state.getName());
				pojo.setStateName1(state.getName());
				sList.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}

		form.setListOfExistingState(sList);
		form.setListOfExistingState1(sList);
		return sList;
	}

//	public ArrayList<ConfigurationDto> getStates(String cid, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//
//		ArrayList<ConfigurationDto> sList = new ArrayList<ConfigurationDto>();
//		try {
//			con = db.getConnection();
//			String sqlString = "select *  from state where CountryID = ? ";
//			PreparedStatement pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, cid);
//
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedStateId(rs.getInt("StateID"));
//				pojo.setSelectedStateId1(rs.getInt("StateID"));
//				pojo.setStateId1(rs.getInt("StateID"));
//				pojo.setStateName(rs.getString("StateName"));
//				pojo.setStateName1(rs.getString("StateName"));
//				sList.add(pojo);
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingState(sList);
//		form.setListOfExistingState1(sList);
//		return sList;
//	}

	public ArrayList<ConfigurationDto> getActiveJobTitle(Integer countryId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> sList = new ArrayList<>();

		try {
			List<BcaStates> states = stateRepository.findByCountry_Id(countryId);
			for (BcaStates state : states) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedStateId(state.getId());
				pojo.setSelectedStateId1(state.getId());
				pojo.setStateId1(state.getId());
				pojo.setStateName(state.getName());
				pojo.setStateName1(state.getName());
				sList.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingState(sList);
		return sList;
	}

//	public ArrayList<ConfigurationDto> getActiveJobTitle(String cid, ConfigurationDto form) {
//		ArrayList<ConfigurationDto> sList = new ArrayList<ConfigurationDto>();
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			String sqlString = "select *  from state where CountryID = ? ";
//			PreparedStatement pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, cid);
//
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedStateId(rs.getInt("StateID"));
//				pojo.setSelectedStateId1(rs.getInt("StateID"));
//				pojo.setStateId1(rs.getInt("StateID"));
//				pojo.setStateName(rs.getString("StateName"));
//				pojo.setStateName1(rs.getString("StateName"));
//				sList.add(pojo);
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingState(sList);
//		return sList;
//	}

	public ArrayList<ConfigurationDto> getShipping(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaShipcarrier> shipcarriers = shipcarrierRepository.findByCompany_CompanyIdAndActive(companyId, 1);
			for (BcaShipcarrier shipcarrier : shipcarriers) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedShippingId(shipcarrier.getShipCarrierId());
				pojo.setShippingName(shipcarrier.getName());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingShipping(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getShipping(String cId, HttpServletRequest request, ConfigurationDto form) {
//		// TODO Auto-generated method stub
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		String sql = "SELECT * FROM bca_shipcarrier" + " WHERE CompanyID = " + cId;
//
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedShippingId(rs.getInt(("ShipCarrierID")));
//				pojo.setShippingName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingShipping(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaTermRepository termRepository;

	public ArrayList<ConfigurationDto> getTerm(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaTerm> terms = termRepository.findByCompany_CompanyIdAndActive(companyId, 1);
			for (BcaTerm term : terms) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedTermId(term.getTermId());
				pojo.setTermName(term.getName());
				pojo.setDays(term.getDays());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingTerm(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getTerm(String cId, HttpServletRequest request, ConfigurationDto form) {
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		String sql = "SELECT * FROM bca_term" + " WHERE CompanyID = " + cId + " and Active = 1";
//
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedTermId(rs.getInt("TermID"));
//				pojo.setTermName(rs.getString("Name"));
//				pojo.setDays(rs.getInt("Days"));
//				listPOJOs.add(pojo);
//			}
//		} catch (SQLException e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingTerm(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaMastercustomergroupRepository customerGroupRepository;

	public ArrayList<ConfigurationDto> getCustomerGroup(ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaMastercustomergroup> customerGroups = customerGroupRepository.findAll();
			for (BcaMastercustomergroup customerGroup : customerGroups) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setCustomerGroup(customerGroup.getCustomerGroupId());
				pojo.setSelectedCustomerGroupId(customerGroup.getCustomerGroupId());
				pojo.setGroupName(customerGroup.getCustomerGroupName());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		form.setListOfExistingCustomerGroup(listPOJOs);
		return listPOJOs;
	}
//	public ArrayList<ConfigurationDto> getCustomerGroup(ConfigurationDto form) {
//		// TODO Auto-generated method stub
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		String sql = "SELECT * FROM bca_mastercustomergroup";
//
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setCustomerGroup(rs.getInt("CustomerGroupID"));
//				pojo.setSelectedCustomerGroupId(rs.getInt("CustomerGroupID"));
//				pojo.setGroupName(rs.getString("CustomerGroupName"));
//				listPOJOs.add(pojo);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingCustomerGroup(listPOJOs);
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> getDetails(String cId, HttpServletRequest request, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = db.getConnection();
			stmt = con.createStatement();

			String sql1 = "" + "SELECT a.*,b.* ,c.AccessPermissions "
					+ "FROM bca_user a, bca_usermapping b,bca_usergroup c " + "WHERE b.Deleted=0 "
					+ "AND a.ID=b.UserID " + "AND b.UserGroupID=c.GroupID " + "AND b.Role <> 'SuperAdmin' "
					+ "AND b.CompanyID  = " + cId;

			rs = stmt.executeQuery(sql1);
			while (rs.next()) {
				pojo = new ConfigurationDto();
				pojo.setUserName(rs.getString("LoginID"));
				pojo.setPassword(rs.getString("Password"));
				listPOJOs.add(pojo);
			}

		} catch (Exception e) {
			Loger.log(e.toString());
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
		form.setListOfExistingModules(listPOJOs);
		request.setAttribute("companyname", form.getCompanyName());

		return listPOJOs;
	}

	@Autowired
	BcaUserRepository userRepository;

	public String checkPassword(Long companyId) {
		try {
			String adminPassword = userRepository.findAdminPasswordByCompanyId(companyId);
			return adminPassword;
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception
		}
		return null;
	}
//	public String checkPassword(String companyID, HttpServletRequest request) {
//		String AdminPassword = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//
//			// String sql1 =" select count(*) from bca_user where CompanyID="+companyID+"
//			// and Active=1";
//			String sql1 = "select * FROM bca_user as U join bca_usermapping as UM on U.ID = UM.UserID  WHERE UM.Role='Admin' and U.CompanyID="
//					+ companyID + " and U.Active=1";
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				AdminPassword = rs.getString("Password");
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return AdminPassword;
//	}

	public int getNumberOfUser(Long companyId, ConfigurationDto form) {
		try {
			return userRepository.countActiveUsersByCompany(companyId);
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}
		return 0;
	}
//	public int getNumberOfUser(String companyID, HttpServletRequest request, ConfigurationDto companyInfoForm) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		int usercount = 0;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//
//			// String sql1 =" select count(*) from bca_user where CompanyID="+companyID+"
//			// and Active=1";
//			String sql1 = "select count(*) FROM bca_user as U join bca_usermapping as UM on U.ID = UM.UserID  WHERE UM.Role='User' and U.CompanyID="
//					+ companyID + " and U.Active=1";
//
//			rs = stmt.executeQuery(sql1);
//			if (rs.next()) {
//				usercount = rs.getInt("count(*)");
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return usercount;
//	}

	public ArrayList<ConfigurationDto> getUserListDetails(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
		try {
			List<ConfigurationDto> userDetails = userRepository.findUserDetailsByCompanyId(companyId);
			for (ConfigurationDto userDetail : userDetails) {
//	            String status = userDetail.getActive() == 1 ? "Active" : "Inactive";
//	            userDetail.setStatus(status);
				listPOJOs.add(userDetail);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}
		form.setListOfExistingUserList(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getUserListDetails(String cId, HttpServletRequest request,
//			ConfigurationDto form) {
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sql1 = "select U.ID,U.LoginID,U.Password,U.Email_Address,U.Active,UG.GroupID,UG.UserGroupName "
//					+ " FROM bca_user as U join bca_usermapping as UM on U.ID = UM.UserID join bca_usergroup as UG on UG.GroupID = UM.UserGroupID "
//					+ " WHERE UM.Role='User' and U.CompanyID=" + cId + " and U.Active=1";
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setUpsUserId(rs.getString("ID"));
//				pojo.setUserName(rs.getString("LoginID"));
//				pojo.setPassword(rs.getString("Password"));
//				pojo.setEmailAddress(rs.getString("Email_Address"));
//				pojo.setGroupID(rs.getInt("GroupID"));
//				pojo.setGroupName(rs.getString("UserGroupName"));
//				String status = rs.getInt("Active") == 1 ? "Active" : "Inactive";
//				pojo.setStatus(status);
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingUserList(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaUsermappingRepository userMappingRepository;

	public boolean updateSelectedUser(Long companyId, int selectedUserId, String userEmail, String password,
			int groupId) {
		boolean isUpdated = false;
		try {
			Optional<BcaUser> userOpt = userRepository.findById(selectedUserId);
			if (userOpt.isPresent()) {
				BcaUser user = userOpt.get();
				user.setEmailAddress(userEmail);
				user.setPassword(password);
				user.setConfirmPassword(password);
				userRepository.save(user);

				Optional<BcaUsermapping> userMappingOpt = userMappingRepository
						.findByUserIdAndCompany_CompanyId(selectedUserId, companyId);
				Optional<BcaUsergroup> userGroup = bcaUsergroupRepository.findById(groupId);
				if (userMappingOpt.isPresent()) {
					BcaUsermapping userMapping = userMappingOpt.get();
					userMapping.setUserGroup(userGroup.get());
					userMappingRepository.save(userMapping);
					isUpdated = true;
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}
		return isUpdated;
	}
//	public boolean updateSelctedUser(String companyID, String selectedUserId, String userEmail, String password1,
//			String groupID, HttpServletRequest request) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null, pstmt2 = null;
//		boolean isUpdated = false;
//		con = db.getConnection();
//		try {
//			String sql1 = "update bca_user set Email_Address= ? , Password=?, "
//					+ "Confirm_Password =?  where ID=? and CompanyID=?";
//			pstmt = con.prepareStatement(sql1);
//			pstmt.setString(1, userEmail);
//			pstmt.setString(2, password1);
//			pstmt.setString(3, password1);
//			pstmt.setString(4, selectedUserId);
//			pstmt.setString(5, companyID);
//
//			int updatedRows = pstmt.executeUpdate();
//			if (updatedRows > 0) {
//				String sql2 = "update bca_usermapping set UserGroupID=? where UserId=? and CompanyID=?";
//				pstmt2 = con.prepareStatement(sql2);
//				pstmt2.setString(1, groupID);
//				pstmt2.setString(2, selectedUserId);
//				pstmt2.setString(3, companyID);
//				isUpdated = pstmt2.executeUpdate() > 0 ? true : false;
//				return isUpdated;
//			}
//		} catch (SQLException ee) {
//			Loger.log("Exception" + ee.toString());
//		} finally {
//			try {
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (pstmt2 != null) {
//					db.close(pstmt2);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return isUpdated;
//	}

	public boolean addNewUser(Long companyId, HttpServletRequest request) {
		boolean isAdded = false;
		HttpSession session = request.getSession();
		String emailAddress = (String) session.getAttribute("Email_Address");
		String LoginID = (String) session.getAttribute("LoginID");
		String userEmail = request.getParameter("userName");
		String userName = userEmail.substring(0, userEmail.indexOf("@"));
		String userPassword = request.getParameter("userpassword");
		String groupIDStr = request.getParameter("groupID");

		if (groupIDStr == null) {
			return false;
		}
		Long groupID = Long.parseLong(groupIDStr);

		try {
			// Getting membershipLevel - Assuming you have a method to get this
			String membershipLevel = getMembershipLevel(emailAddress, LoginID, companyId);

			BcaCompany company = companyRepository.findByCompanyId(companyId);
			// Creating new user
			BcaUser newUser = new BcaUser();
			newUser.setLoginId(userName);
			newUser.setEmailAddress(userEmail);
			newUser.setPassword(userPassword);
			newUser.setCompany(company);
			newUser.setMembershipLevel(membershipLevel);
			newUser.setJobPosition(""); // Assuming job position is empty as per your SQL
			newUser.setActive(true);

			BcaUser savedUser = userRepository.save(newUser);

			// Creating new user mapping
			Optional<BcaUsergroup> userGroup = bcaUsergroupRepository.findById(groupID.intValue());

			BcaUsermapping newUserMapping = new BcaUsermapping();
			newUserMapping.setUserGroup(userGroup.get());
			newUserMapping.setUser(savedUser);
			newUserMapping.setRole("User");
			newUserMapping.setCompany(company);
			newUserMapping.setActive(true);
			newUserMapping.setDeleted(false);
			userMappingRepository.save(newUserMapping);

			isAdded = true;
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		return isAdded;
	}

	public String getMembershipLevel(String emailAddress, String loginId, Long companyId) {
		return userRepository.findMembershipLevelByEmailOrLoginIdAndCompanyId(emailAddress, loginId, companyId)
				.orElse(null); // Returns null if membershipLevel is not found
	}

//	public boolean addNewUser(String companyID, HttpServletRequest request) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null, stmt1 = null, stmt2 = null;
//		ResultSet rs = null, rs2 = null;
//		PreparedStatement ps, ps2;
//		boolean check = false;
//		con = db.getConnection();
//		String membershipLevel = null;
//		int NewUserID = 0;
//		HttpSession session = request.getSession();
//		String emailAddress = (String) session.getAttribute("Email_Address");
//		String LoginID = (String) session.getAttribute("LoginID");
//		String userEmail = request.getParameter("userName");
//		String userName = userEmail.substring(0, userEmail.indexOf("@"));
//		String userPassword = request.getParameter("userpassword");
//		String groupID = request.getParameter("groupID");
//		if (groupID == null)
//			return false;
//		try {
//			// Getting membershipLevel
//			String sql1 = "select membershipLevel from bca_user where Email_Address='" + emailAddress
//					+ "' OR LoginID= '" + LoginID + "' and CompanyID=" + companyID;
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
//			if (rs.next()) {
//				membershipLevel = rs.getString("membershipLevel");
//			}
//			// inserting new user
//			String sql = "insert into bca_user(LoginID, Email_Address, Password, CompanyID,membershipLevel,jobPosition,Active) "
//					+ "values ('" + userName + "','" + userEmail + "','" + userPassword + "'," + companyID + ",'"
//					+ membershipLevel + "','" + "" + "'," + 1 + ")";
//			ps = con.prepareStatement(sql);
//			Loger.log(sql);
//			ps.execute();
//			check = true;
//
//			// getting new user id
//			String sql2 = "select * from bca_user where Email_Address='" + userEmail + "' and Password= '"
//					+ userPassword + "' and CompanyID=" + companyID;
//			stmt2 = con.createStatement();
//			rs2 = stmt.executeQuery(sql2);
//			if (rs2.next()) {
//				NewUserID = rs2.getInt("ID");
//			}
//
//			// insert new user role in mapping table
//			String sql3 = "insert into bca_usermapping(UserGroupID, UserID, Role, CompanyID, Active, Deleted) values ('"
//					+ groupID + "','" + NewUserID + "','User'," + companyID + ",1,0)";
//			ps2 = con.prepareStatement(sql3);
//			Loger.log(sql3);
//			ps2.execute();
//			check = true;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//			check = false;
//		} finally {
//			try {
//				if (rs != null)
//					db.close(rs);
//				if (stmt != null)
//					db.close(stmt);
//				if (stmt1 != null)
//					db.close(stmt1);
//				if (con != null)
//					db.close(con);
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return check;
//	}
	public boolean deleteSelectedUser(int userId, int groupId, Long companyId) {
		try {
			// Updating BcaUser entity
			Optional<BcaUser> userOpt = userRepository.findById(userId);
			if (userOpt.isPresent()) {
				BcaUser user = userOpt.get();
				user.setActive(false); // Assuming setActive method exists to set the active state
				userRepository.save(user);
			}

			// Updating BcaUserMapping entity
			Optional<BcaUsermapping> userMappingOpt = userMappingRepository
					.findByUserIdAndUserGroup_groupIdAndCompany_CompanyId(userId, groupId, companyId);
			if (userMappingOpt.isPresent()) {
				BcaUsermapping userMapping = userMappingOpt.get();
				userMapping.setActive(false);
				userMapping.setDeleted(true);
				userMappingRepository.save(userMapping);
			}

			return true;
		} catch (Exception e) {
			Loger.log(e.toString());
			return false;
		}
	}

//	public boolean deleteSelectedUser(String userID, String groupID, String companyID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null, stmt1 = null;
//		ResultSet rs = null;
//		PreparedStatement ps;
//		con = db.getConnection();
//		try {
//			String sql1 = "update bca_user set Active=0 where ID=" + userID + " and CompanyID=" + companyID;
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql1);
//
//			sql1 = "update bca_usermapping set Active=0,Deleted=1 where UserGroupID=" + groupID + " and UserID="
//					+ userID + " and CompanyID=" + companyID;
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql1);
//			return true;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//			return false;
//		}
//	}

	@Autowired
	private BcaClientvendorRepository clientVendorRepository;

	public String getNumberOfCustomer(Long companyId) {
		try {
			int customerCount = clientVendorRepository
					.countByCompany_CompanyIdAndStatusInAndDeletedIsFalseAndActiveIsTrue(companyId,
							Arrays.asList("U", "N"));
			return String.valueOf(customerCount);
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}
		return null;
	}
//	public String getNumberOfCustomer(String companyID, HttpServletRequest request) {
//		String CustomerSize = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		String membershipLevel = null;
//		HttpSession session = request.getSession();
//		String emailAddress = (String) session.getAttribute("Email_Address");
//		String LoginID = (String) session.getAttribute("LoginID");
//
//		try {
//			// String sql1 = "select membershipLevel from bca_user where
//			// Email_Address='"+emailAddress+"' OR LoginID= '"+LoginID+"' and
//			// CompanyID="+companyID;
//			String sql1 = "SELECT COUNT(*) FROM bca_clientvendor WHERE CompanyID = " + companyID
//					+ " AND Status IN ('U', 'N' ) AND Deleted = 0 AND Active = 1 ORDER BY Name";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
//			if (rs.next()) {
//				CustomerSize = rs.getString("COUNT(*)");
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//			// TODO: handle exception
//		}
//		return CustomerSize;
//	}

	@Autowired
	private BcaIteminventoryRepository itemInventoryRepository;

	public String getNumberOfItem(Long companyId) {
		try {
			int itemCount = itemInventoryRepository.countByCompany_CompanyIdAndActiveAndItemTypeIdNot(companyId, 1, 0);
			return String.valueOf(itemCount);
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}
		return null;
	}
//	public String getNumberOfItem(String companyID, HttpServletRequest request) {
//		String itemSize = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sql1 = "select COUNT(*) from bca_iteminventory where CompanyID like " + companyID
//					+ " and Active like '1' and ItemtypeId not like '0' order by parentid";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
//			if (rs.next()) {
//				itemSize = rs.getString("COUNT(*)");
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//			// TODO: handle exception
//		}
//		return itemSize;
//	}

	public String getmembershipLevel(String companyId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String emailAddress = (String) session.getAttribute("Email_Address");
		String loginId = (String) session.getAttribute("LoginID");
		return userRepository
				.findMembershipLevelByEmailOrLoginIdAndCompanyId(emailAddress, loginId, Long.valueOf(companyId))
				.orElse(null); // Returns null if membershipLevel is not found
	}

//	public String getmembershipLevel(String companyID, HttpServletRequest request) {
//
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		String membershipLevel = null;
//		HttpSession session = request.getSession();
//		String emailAddress = (String) session.getAttribute("Email_Address");
//		String LoginID = (String) session.getAttribute("LoginID");
//
//		try {
//			String sql1 = "select membershipLevel from bca_user where Email_Address='" + emailAddress
//					+ "' OR LoginID= '" + LoginID + "' and CompanyID=" + companyID;
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
//			if (rs.next()) {
//				membershipLevel = rs.getString("membershipLevel");
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//			// TODO: handle exception
//		}
//		return membershipLevel;
//
//	}

	@Autowired
	private BcaUsergroupRepository usergroupRepository;

	public boolean saveUserGroupDetails(Long companyId, ConfigurationDto configDto) {
		boolean result = false;

		try {
			BcaUsergroup userGroup;
			if (configDto.getSelectedGroupId() > 0) {
				// Update existing user group
				Optional<BcaUsergroup> userGroupOpt = usergroupRepository.findById(configDto.getSelectedGroupId());
				if (userGroupOpt.isPresent()) {
					userGroup = userGroupOpt.get();
					userGroup.setDescription(configDto.getDescription());
					userGroup.setAccessPermissions(configDto.getGroupPermissions());
					// other fields to update...
				} else {
					return false; // or handle the absence of the group appropriately
				}
			} else {
				// Create new user group
				BcaCompany company = companyRepository.findByCompanyId(companyId);
				userGroup = new BcaUsergroup();
				userGroup.setUserGroupName(configDto.getGroupName());
				userGroup.setLevel(0);
				userGroup.setDescription(configDto.getDescription());
				userGroup.setActive(true);
				userGroup.setDeleted(false);
				userGroup.setAccessPermissions(configDto.getGroupPermissions());
				userGroup.setCompany(company);
				// other fields to set...
			}

			usergroupRepository.save(userGroup);
			result = true;
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		return result;
	}
//	public boolean saveUserGroupDetails(String companyID, ConfigurationDto configDto) {
//		boolean result = false;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		if (db == null)
//			return result;
//		con = db.getConnection();
//		if (con == null)
//			return result;
//		try {
//			if (configDto.getSelectedGroupId() > 0) {
//				String sqlString = "Update bca_usergroup set Description=?,AccessPermissions=? where GroupID=?";
//				pstmt = con.prepareStatement(sqlString);
//				pstmt.setString(1, configDto.getDescription());
//				pstmt.setString(2, configDto.getGroupPermissions());
//				pstmt.setInt(3, configDto.getSelectedGroupId());
//			} else {
//				String sqlString = "insert into bca_usergroup(UserGroupName,Level,Description,Active,Deleted,AccessPermissions,CompanyID) values(?,?,?,?,?,?,?)";
//				pstmt = con.prepareStatement(sqlString);
//				pstmt.setString(1, configDto.getGroupName());
//				pstmt.setString(2, "0");
//				pstmt.setString(3, configDto.getDescription());
//				pstmt.setString(4, "1");
//				pstmt.setString(5, "0");
//				pstmt.setString(6, configDto.getGroupPermissions());
//				pstmt.setString(7, companyID);
//			}
//			int num = pstmt.executeUpdate();
//			if (num > 0) {
//				result = true;
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, "SQLException in Class ConfigurationDAO,  method -saveUserGroupDetails " + ee.toString());
//		} finally {
//			try {
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
//		return result;
//	}

	public int saveUserGroupDetailsID(Long companyId, ConfigurationDto configDto) {
		try {
			BcaUsergroup userGroup = new BcaUsergroup();
			BcaCompany company = companyRepository.findByCompanyId(companyId);

			userGroup.setUserGroupName(configDto.getGroupName());
			userGroup.setLevel(0);
			userGroup.setDescription(configDto.getDescription());
			userGroup.setActive(true);
			userGroup.setDeleted(false);
			userGroup.setAccessPermissions(configDto.getGroupPermissions());
			userGroup.setCompany(company);

			userGroup = usergroupRepository.save(userGroup);

			return userGroup.getGroupId();
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}
		return -1;
	}

//	public int saveUserGroupDetailsID(String companyID, ConfigurationDto configDto) {
//		int groupID = -1;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		if (db == null)
//			return groupID;
//		con = db.getConnection();
//		if (con == null)
//			return groupID;
//		try {
//			String sqlString = "insert into bca_usergroup(UserGroupName,Level,Description,Active,Deleted,AccessPermissions,CompanyID) values(?,?,?,?,?,?,?)";
//			pstmt = con.prepareStatement(sqlString, Statement.RETURN_GENERATED_KEYS);
//			pstmt.setString(1, configDto.getGroupName());
//			pstmt.setString(2, "0");
//			pstmt.setString(3, configDto.getDescription());
//			pstmt.setString(4, "1");
//			pstmt.setString(5, "0");
//			pstmt.setString(6, configDto.getGroupPermissions());
//			pstmt.setString(7, companyID);
//
//			pstmt.executeUpdate();
//			// Retrieve the inserted ID
//			// int insertedId = -1;
//			ResultSet generatedKeys = pstmt.getGeneratedKeys();
//			if (generatedKeys.next()) {
//				groupID = generatedKeys.getInt(1);
//			}
//
//		} catch (SQLException ee) {
//			Loger.log(2, "SQLException in Class ConfigurationDAO,  method -saveUserGroupDetails " + ee.toString());
//		} finally {
//			try {
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
//		return groupID;
//	}

	public boolean deleteUserGroupDetails(Integer groupId) {
		boolean result = false;
		try {
			Optional<BcaUsergroup> userGroupOpt = usergroupRepository.findById(groupId);
			if (userGroupOpt.isPresent()) {
				BcaUsergroup userGroup = userGroupOpt.get();
				userGroup.setDeleted(true); // Assuming there's a method setDeleted in BcaUsergroup entity
				usergroupRepository.save(userGroup);
				result = true;
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return result;
	}

//	public boolean deleteUserGroupDetails(String groupId) {
//		boolean result = false;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		if (db == null)
//			return result;
//		con = db.getConnection();
//		if (con == null)
//			return result;
//		try {
//			String sqlString = "Update bca_usergroup set Deleted=1 where GroupID=" + groupId;
//			pstmt = con.prepareStatement(sqlString);
//			int num = pstmt.executeUpdate();
//			if (num > 0) {
//				result = true;
//			}
//		} catch (SQLException ee) {
//			Loger.log(2, "SQLException in Class ConfigurationDAO,  method -deleteUserGroupDetails " + ee.toString());
//		} finally {
//			try {
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
//		return result;
//	}

	@Autowired
	private BcaUsergroupRepository bcaUsergroupRepository;

	public void getUserGroupDetails(String groupId, ConfigurationDto configDto) {
//		String sql = "SELECT * FROM bca_usergroup where GroupID  = " + groupId;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
		Integer groupIds = Integer.parseInt(groupId);
		List<Integer> groupIdList = Collections.singletonList(groupIds);

		List<BcaUsergroup> bcaUsergroups = bcaUsergroupRepository.findAllById(groupIdList); // JPA Check groupId is
																							// primary key or not. If
																							// groupId is primary , add
																							// new primary key
//			while (rs.next()) {
//				configDto.setSelectedGroupId(rs.getInt("GroupID"));
//				configDto.setGroupName(rs.getString("UserGroupName"));
//				configDto.setGroupPermissions(rs.getString("AccessPermissions"));
//				configDto.setDescription(rs.getString("Description"));
//				int active = Integer.parseInt(rs.getString("Active"));
//				if (active == 1) {
//					configDto.setStatus("Active");
//				} else {
//					configDto.setStatus("InActive");
//				}
//			}

		for (BcaUsergroup bcaUsergroup : bcaUsergroups) {

			configDto.setSelectedGroupId(bcaUsergroup.getGroupId());

			configDto.setGroupName(bcaUsergroup.getUserGroupName());

			configDto.setGroupPermissions(bcaUsergroup.getAccessPermissions());

			configDto.setDescription(bcaUsergroup.getDescription());

			if (bcaUsergroup.getActive()) {

				configDto.setStatus("Active");

			} else

				configDto.setStatus("InActive");

		}
//			

//		} catch (SQLException e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
	}

	public ArrayList<ConfigurationDto> getUserGroup(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaUsergroup> userGroups = usergroupRepository
					.findByDeletedFalseAndUserGroupNameNotAndCompany_CompanyId("Admin", companyId);
			for (BcaUsergroup group : userGroups) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedGroupId(group.getGroupId());
				pojo.setGroupName(group.getUserGroupName());
				pojo.setStatus(group.getActive() ? "Active" : "InActive");
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingGroup(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getUserGroup(String cId, HttpServletRequest request, ConfigurationDto form) {
//		// TODO Auto-generated method stub bca_usergroup
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "SELECT * FROM bca_usergroup where Deleted=0 AND UserGroupName <> 'Admin' AND CompanyID  = " + cId;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedGroupId(rs.getInt("GroupID"));
//				pojo.setGroupName((rs.getString("UserGroupName")));
//				int active = Integer.parseInt(rs.getString("Active"));
//				if (active == 1) {
//					pojo.setStatus("Active");
//				} else {
//					pojo.setStatus("InActive");
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingGroup(listPOJOs);
//		return listPOJOs;
//	}

	/*
	 * public Set<ConfigurationDto> getPaymentGateways(String cId,HttpServletRequest
	 * request,ConfigurationDto form) {
	 * 
	 * ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
	 * HashSet<ConfigurationDto> listPOJOs = new HashSet<ConfigurationDto>();
	 * 
	 * con = db.getConnection();
	 * 
	 * String sql = "SELECT * FROM smd_gatewaydetails where CompanyID= " +
	 * cId+" order by GatewayType" ; String sql =
	 * "Select * From smd_gatewaydetails ORDER BY GatewayType ASC";
	 * 
	 * try { stmt = con.createStatement(); rs = stmt.executeQuery(sql);
	 * 
	 * while(rs.next()) { pojo = new ConfigurationDto();
	 * //pojo.setSelectedPaymentGatewayId(rs.getInt("GatewayID"));
	 * pojo.setGateWayId(rs.getInt("GatewayID"));
	 * pojo.setGatewayName(rs.getString("GatewayType"));
	 * pojo.setFieldName1(rs.getString("Field1"));
	 * pojo.setFieldName2(rs.getString("Field2"));
	 * pojo.setFieldName3(rs.getString("Field3"));
	 * pojo.setFieldName4(rs.getString("Field4")); listPOJOs.add(pojo); } } catch
	 * (SQLException e) { // TODO Auto-generated catch block
	 * Loger.log(e.toString()); } finally { db.close(con);
	 * 
	 * try { if (stmt != null) { stmt.close(); } if(rs != null) { rs.close(); } }
	 * catch (Exception e2) { e2.printStackTrace(); } }
	 * form.setListOfExistingPaymentGateways(listPOJOs); return listPOJOs; }
	 */

	@Autowired
	private SmdGatewaydetailsRepository gatewayDetailsRepository;

	public ArrayList<ConfigurationDto> getPaymentGateways(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<SmdGatewaydetails> gateways = gatewayDetailsRepository
					.findByCompany_CompanyIdOrderByGatewayType(companyId);
			for (SmdGatewaydetails gateway : gateways) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedPaymentGatewayId(gateway.getGatewayId());
				pojo.setGateWayId(gateway.getGatewayId());
				pojo.setGatewayName(gateway.getGatewayType());
				// Set other fields from gateway to pojo
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}

		form.setListOfExistingPaymentGateways(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getPaymentGateways(String cId, HttpServletRequest request,
//			ConfigurationDto form) {
//
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		String sql = "SELECT * FROM smd_gatewaydetails where CompanyID= " + cId + " order by GatewayType";
//
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedPaymentGatewayId(rs.getInt("GatewayID"));
//				pojo.setGateWayId(rs.getInt("GatewayID"));
//				pojo.setGatewayName(rs.getString("GatewayType"));
//				pojo.setFieldName1(rs.getString("Field1"));
//				pojo.setFieldName2(rs.getString("Field2"));
//				pojo.setFieldName3(rs.getString("Field3"));
//				pojo.setFieldName4(rs.getString("Field4"));
//				listPOJOs.add(pojo);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingPaymentGateways(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaInvoicestyleRepository invoiceStyleRepository;

	public ArrayList<ConfigurationDto> getInvoiceStyle(ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaInvoicestyle> invoiceStyles = invoiceStyleRepository.findByActive(1);
			for (BcaInvoicestyle style : invoiceStyles) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setInvoiceStyle(style.getName());
				pojo.setSelectedInvoiceStyleId(style.getInvoiceStyleId());
				pojo.setInvoiceStyleId(style.getInvoiceStyleId());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingInvoiceStyle(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getInvoiceStyle(String cId, HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("select * from bca_invoicestyle where Active=1");
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setInvoiceStyle(rs.getString("Name"));
//				pojo.setSelectedInvoiceStyleId(rs.getInt("InvoiceStyleID"));
//				pojo.setInvoiceStyleId(rs.getInt("InvoiceStyleID"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingInvoiceStyle(listPOJOs);
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> getInvoiceStyle1(ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs1 = new ArrayList<>();

		try {
			List<BcaInvoicestyle> invoiceStyles = invoiceStyleRepository.findByActive(0);
			for (BcaInvoicestyle style : invoiceStyles) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setInvoiceStyle1(style.getName());
				pojo.setInvoiceStyleId1(style.getInvoiceStyleId());
				listPOJOs1.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingInvoiceStyle1(listPOJOs1);
		return listPOJOs1;
	}

//	public ArrayList<ConfigurationDto> getInvoiceStyle1(String cId, HttpServletRequest request, ConfigurationDto form) {
//		ArrayList<ConfigurationDto> listPOJOs1 = new ArrayList<>();
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sql2 = "select * from bca_invoicestyle where Active=0";
//			rs = stmt.executeQuery(sql2);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setInvoiceStyle1(rs.getString("Name"));
//				pojo.setInvoiceStyleId1(rs.getInt("InvoiceStyleID"));
//				listPOJOs1.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingInvoiceStyle1(listPOJOs1);
//		return listPOJOs1;
//	}

	@Autowired
	private BcaInvoiceTemplateRepository invoiceTemplateRepository;

	public ArrayList<ConfigurationDto> getBillingTemplate(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaInvoiceTemplate> templates = invoiceTemplateRepository.findCustomTemplates(companyId);
			for (BcaInvoiceTemplate template : templates) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedBillingTypeId(template.getBaseTemplateId());
				// Set other relevant fields from template to pojo
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingBillingType(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getBillingTemplate(String cId, HttpServletRequest request,
//			ConfigurationDto form) {
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//
//			String sql1 = "select * from bca_invoice_template " + "LEFT JOIN bca_invoice_activetemplates "
//					+ "ON bca_invoice_activetemplates.TemplateId = bca_invoice_template.BaseTemplateID "
//					+ "WHERE TemplateStyleTypeID = 6" + " AND bca_invoice_template.TemplateTypeId = 9"
//					+ " AND (CompanyID = " + cId + " OR CompanyID = -1 ) " + "order by TemplateName";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedBillingTypeId(rs.getInt("BaseTemplateId"));
//				pojo.setShowBillingStatStyle(rs.getInt("BaseTemplateId"));
//				// pojo.setBillingTypeId(rs.getInt("TemplateId"));
//				pojo.setBillingTypeName(rs.getString("TemplateName"));
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingBillingType(listPOJOs);
//		/* form.setListOfExistingBillingType(listPOJOs); */
//		return listPOJOs;
//	}

	@Autowired
	private BcaSalesrepRepository salesRepRepository;

	public ArrayList<ConfigurationDto> getSalesRepresentative(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(companyId);
			if (companyOpt.isPresent()) {
				List<BcaSalesrep> salesReps = salesRepRepository.findByCompanyAndActive(companyOpt.get(), 1);
				for (BcaSalesrep salesRep : salesReps) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setSelectedSalesRepId(salesRep.getSalesRepId());
					pojo.setSalesRepName(salesRep.getName());
					listPOJOs.add(pojo);
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingSalesRep(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getSalesRepresentative(String cId, HttpServletRequest request,
//			ConfigurationDto form) {
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//
//			String sql1 = "SELECT SalesRepID,Name " + "FROM bca_salesrep " + "WHERE CompanyID = " + cId
//					+ " AND Active =1 ORDER BY Name";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedSalesRepId(rs.getInt("SalesRepID"));
//				pojo.setSalesRepName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingSalesRep(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaMessageRepository messageRepository;

	public ArrayList<ConfigurationDto> getMessages(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(companyId);
			if (companyOpt.isPresent()) {
				List<BcaMessage> messages = messageRepository.findByCompanyAndActive(companyOpt.get(), 1);
				for (BcaMessage message : messages) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setSelectedMessageId(message.getMessageId());
					pojo.setMessageName(message.getName());
					listPOJOs.add(pojo);
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setMessages(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getMessages(String cId, HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			String sql1 = "SELECT * FROM bca_message WHERE CompanyID=" + cId + " AND Active=1 ORDER BY Name";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedMessageId(rs.getInt("MessageID"));
//				pojo.setMessageName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setMessages(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaLocationRepository locationRepository;

	public ArrayList<ConfigurationDto> getExistingLocation(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(companyId);
			if (companyOpt.isPresent()) {
				List<BcaLocation> locations = locationRepository.findByCompany_CompanyIdAndActive(companyId, 1);
				for (BcaLocation location : locations) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setSelectedLocationId(location.getLocationId());
					pojo.setLocationName(location.getName());
					listPOJOs.add(pojo);
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingLocation(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getExistingLocation(String cId, HttpServletRequest request,
//			ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			String sql1 = "SELECT LocationID,Name FROM bca_location WHERE CompanyID=" + cId
//					+ " AND Active=1 ORDER BY Name";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedLocationId(rs.getInt("LocationID"));
//				pojo.setLocationName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingLocation(listPOJOs);
//		return listPOJOs;
//	}
	@Autowired
	private BcaSalestaxRepository salesTaxRepository;

	public ArrayList<ConfigurationDto> getSalesTax(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(companyId);
			if (companyOpt.isPresent()) {
				List<BcaSalestax> salesTaxes = salesTaxRepository.findByCompanyAndActive(companyOpt.get(), 1);
				for (BcaSalestax tax : salesTaxes) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setSelectedSalesTaxId(tax.getSalesTaxId());
					pojo.setSalesTaxName(tax.getState());
					pojo.setSalesTaxRate(tax.getRate().floatValue());
					listPOJOs.add(pojo);
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingSalesTax(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getSalesTax(String cId, HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		try {
//			stmt = con.createStatement();
//
//			String sql1 = "SELECT SalesTaxID,State,Rate " + "FROM bca_salestax " + "WHERE CompanyID = " + cId
//					+ " AND Active =1 ORDER BY State";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedSalesTaxId(rs.getInt("SalesTaxID"));
//				pojo.setSalesTaxName(rs.getString("State"));
//				pojo.setSalesTaxRate(rs.getFloat("Rate"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingSalesTax(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaLineofcredittermRepository creditTermRepository;

	public ArrayList<ConfigurationDto> getCreditTerm(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(companyId);
			if (companyOpt.isPresent()) {
				List<BcaLineofcreditterm> creditTerms = creditTermRepository.findByCompanyAndActive(companyOpt.get(),
						1);
				for (BcaLineofcreditterm term : creditTerms) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setSelectedCreditTermId(term.getCreditTermId());
					pojo.setDays(term.getDays());
					pojo.setCreditTermName(term.getName());
					pojo.setIsDefault(term.getIsDefault() == 1 ? "on" : "off");
					listPOJOs.add(pojo);
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingCreditTerm(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getCreditTerm(String cId, HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		try {
//			stmt = con.createStatement();
//
//			String sql1 = "SELECT CreditTermId,Name,Days,isDefault " + "FROM bca_lineofcreditterm "
//					+ "WHERE CompanyID =" + cId + " " + "AND Active =1 ORDER BY Name";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedCreditTermId(rs.getInt("CreditTermId"));
//				pojo.setDays(rs.getInt("Days"));
//				pojo.setCreditTermName(rs.getString("Name"));
//				int checked = rs.getInt("isDefault");
//				if (checked == 1) {
//					pojo.setIsDefault("on");
//				} else {
//					pojo.setIsDefault("off");
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingCreditTerm(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaRefundreasonRepository refundReasonRepository;

	public ArrayList<ConfigurationDto> getRefundReason(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(companyId);
			if (companyOpt.isPresent()) {
				List<BcaRefundreason> refundReasons = refundReasonRepository.findByCompanyAndActive(companyOpt.get(),
						true);
				for (BcaRefundreason reason : refundReasons) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setSelectedRefundReasonId(reason.getReasonId());
					pojo.setRefundReason(reason.getRefundReason());
					pojo.setIsDefaultRefundReason(reason.getIsDefaultReason() ? 1 : 0);
					listPOJOs.add(pojo);
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingRefundReason(listPOJOs);
		return listPOJOs;
	}
//	public ArrayList<ConfigurationDto> getRefundReason(String cId, HttpServletRequest request, ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("SELECT * FROM bca_refundreason WHERE Active = 1 AND CompanyID =" + cId);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedRefundReasonId(rs.getInt("ReasonID"));
//				pojo.setRefundReason(rs.getString("RefundReason"));
//				pojo.setIsDefaultRefundReason(rs.getInt("IsDefaultReason"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingRefundReason(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaSettingsRepository settingsRepository;

	public ArrayList<ConfigurationDto> getExistingPrinter(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(companyId);
			if (companyOpt.isPresent()) {
				List<BcaSettings> settings = settingsRepository.findByCompany(companyOpt.get());
				for (BcaSettings setting : settings) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setPrinterName(setting.getDefaultPrinter());
					listPOJOs.add(pojo);
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingDefaultPrinter(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getExistingPrinter(String cId, HttpServletRequest request,
//			ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		try {
//			stmt = con.createStatement();
//
//			String sql1 = "select * from bca_settings where CompanyID =" + cId;
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setPrinterName(rs.getString("DEFAULTPrinter"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingDefaultPrinter(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaMasterrmareasonRepository masterRmaReasonRepository;

	public ArrayList<ConfigurationDto> getMasterReason(ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaMasterrmareason> masterReasons = masterRmaReasonRepository.findByActive(1);
			for (BcaMasterrmareason reason : masterReasons) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setReasonTypeId(reason.getRmaReasonId());
				pojo.setReasonType(reason.getName());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingReasonType(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getMasterReason(ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		try {
//			stmt = con.createStatement();
//
//			String sql1 = "Select * from bca_masterrmareason where Active = 1";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setReasonTypeId(rs.getInt("rmaReasonID"));
//				pojo.setReasonType(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingReasonType(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaRmareasonRepository rmaReasonRepository;

	public ArrayList<ConfigurationDto> getMasterReason1(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			Optional<BcaCompany> companyOpt = companyRepository.findById(companyId);
			if (companyOpt.isPresent()) {
				List<BcaMasterrmareason> masterReasons = masterRmaReasonRepository.findByActive(1);
				for (BcaMasterrmareason masterReason : masterReasons) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setParentReasonId(masterReason.getRmaReasonId());
					pojo.setReasonType(masterReason.getName());
					listPOJOs.add(pojo);

					List<BcaRmareason> childReasons = rmaReasonRepository
							.findByCompanyAndParentReasonAndActive(companyOpt.get(), masterReason, 1);
					for (BcaRmareason childReason : childReasons) {
						pojo = new ConfigurationDto();
						pojo.setParentReasonId(childReason.getParentReason().getRmaReasonId());
						pojo.setReasonId(childReason.getReason().getReasonId());
						pojo.setReason(childReason.getRmaReason());
						pojo.setActive(childReason.getActive());
						listPOJOs.add(pojo);
					}
				}
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingMasterReasonType(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getMasterReason1(String companyID, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ResultSet rs1 = null;
//		Statement stmt1 = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			stmt1 = con.createStatement();
//			String sql1 = "Select * from bca_masterrmareason where Active = 1";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setParentReasonId(rs.getInt("rmaReasonID"));
//				pojo.setReasonType(rs.getString("Name"));
//				listPOJOs.add(pojo);
//
//				String sql2 = " Select * from bca_rmareason " + " where CompanyID = " + companyID + " and Active = 1 "
//						+ " and parentReasonID = " + pojo.getParentReasonId();
//
//				rs1 = stmt1.executeQuery(sql2);
//				while (rs1.next()) {
//					pojo = new ConfigurationDto();
//					pojo.setParentReasonId(rs.getInt("rmaReasonID"));
//					pojo.setReasonId(rs1.getInt("ReasonID"));
//					pojo.setReason(rs1.getString("rmaReason"));
//					pojo.setParentReasonId(rs1.getInt("parentReasonID"));
//					pojo.setActive(rs1.getInt("Active"));
//					listPOJOs.add(pojo);
//				}
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingMasterReasonType(listPOJOs);
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> getDefaultBank(int accCategoryId, Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaAccount> accounts = accountRepository
					.findByAcctType_acctTypeIdAndActiveAndCompany_CompanyIdAndAcctCategory_AcctCategoryId(2, 1,
							companyId, accCategoryId);
			for (BcaAccount account : accounts) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedAccountId(account.getAccountId());
				pojo.setSelectedBankAccountId(account.getAccountId());
				pojo.setSelectedAccountName(account.getName());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingBankAccount(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getDefaultBank(int accCategoryId, HttpServletRequest request,
//			ConfigurationDto form, String comID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		String dateBetween = "";
//		DateInfo dInfo = new DateInfo();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		ArrayList<Date> selectedRange = new ArrayList<>();
//		CustomerInfo cInfo = new CustomerInfo();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//
//			if (accCategoryId == 1) {
//				sql = "SELECT * FROM bca_account WHERE AcctTypeID = 2 AND Active = 1 AND CompanyID = " + comID
//						+ " AND AcctCategoryID = " + accCategoryId + " ORDER BY Name ASC";
//			}
//
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedAccountId(rs.getInt("AccountID"));
//				pojo.setSelectedBankAccountId(rs.getInt("AccountID"));
//				pojo.setSelectedAccountName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingBankAccount(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaCreditcardtypeRepository creditCardTypeRepository;

	public ArrayList<ConfigurationDto> getAllCreditCards(int accCategoryId, Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaCreditcardtype> creditCardTypes = creditCardTypeRepository
					.findByActiveAndTypeCategoryAndCompany_CompanyId(1, accCategoryId, companyId);
			for (BcaCreditcardtype cardType : creditCardTypes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setCreditCardName(cardType.getName());
				pojo.setCreditCardTypeId(cardType.getCctypeId());
				pojo.setIsActive(cardType.getActive() == 1 ? true : false);
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingCreditCard(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getAllCreditCards(int accCategoryId, HttpServletRequest request,
//			ConfigurationDto form, String comID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		String dateBetween = "";
//		DateInfo dInfo = new DateInfo();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		ArrayList<Date> selectedRange = new ArrayList<>();
//		CustomerInfo cInfo = new CustomerInfo();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//
//			sql = "SELECT DISTINCT CCTypeID, Name, CVV2, Active FROM bca_creditcardtype " + "WHERE Active <> -1 "
//					+ "AND TypeCategory = " + accCategoryId + " " + "AND CompanyID = " + comID + " ORDER BY Name";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setCreditCardName(rs.getString("Name"));
//				pojo.setCreditCardTypeId(rs.getInt("CCTypeID"));
//				int active = rs.getInt("Active");
//				if (active == 1) {
//					pojo.setIsActive(true);
//				} else {
//					pojo.setIsActive(false);
//				}
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingCreditCard(listPOJOs);
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> getAllCreditCardsType(int typeCategoryId, Long companyId,
			ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaPaymenttype> paymentTypes = paymentTypeRepository
					.findByCompany_CompanyIdAndActiveAndTypeCategoryOrderByType(companyId, 1, typeCategoryId);
			for (BcaPaymenttype paymentType : paymentTypes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setCreditCardName(paymentType.getType());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingCreditCardType(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getAllCreditCardsType(int typeCategoryId, HttpServletRequest request,
//			ConfigurationDto form, String comID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			if (typeCategoryId == 0) {
//				sql = "SELECT DISTINCT Type FROM bca_paymenttype WHERE Active = 1 AND TypeCategory = " + typeCategoryId
//						+ "  AND CompanyID = " + comID + " ORDER BY Type";
//			}
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setCreditCardName(rs.getString("Type"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingCreditCardType(listPOJOs);
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> getAllPaymentTypeId(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaPaymenttype> paymentTypes = paymentTypeRepository
					.findByCompany_CompanyIdAndActiveAndTypeCategoryOrderByName(companyId, 1, 1);
			for (BcaPaymenttype paymentType : paymentTypes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setPaymentTypeId(paymentType.getPaymentTypeId());
				pojo.setPaymentName(paymentType.getName());
				pojo.setPaymentType(paymentType.getType());
				pojo.setAcctID(paymentType.getBankAcctId());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingPaymentType(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getAllPayemntTypeId(HttpServletRequest request, ConfigurationDto form,
//			String comID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			String sql = "SELECT * FROM bca_paymenttype Where Active=1 AND TypeCategory=1 AND CompanyID =" + comID
//					+ " ORDER BY Name";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setPaymentTypeId(rs.getInt("PaymentTypeID"));
//				pojo.setPaymentName(rs.getString("Name"));
//				pojo.setPaymentType(rs.getString("Type"));
//				pojo.setAcctID(rs.getInt("BankAcctID"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingPaymentType(listPOJOs);
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> getAllReceivedTypeId(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaReceivedtype> receivedTypes = receivedTypeRepository
					.findByCompany_CompanyIdAndActiveAndTypeCategoryOrderByNameAsc(companyId, 1, 1);
			for (BcaReceivedtype receivedType : receivedTypes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setPaymentTypeId(receivedType.getPaymentTypeId());
				pojo.setPaymentName(receivedType.getName());
				pojo.setPaymentType(receivedType.getType());
				pojo.setAcctID(receivedType.getBankAcctId());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingReceivedType(listPOJOs);
		return listPOJOs;
	}
//	public ArrayList<ConfigurationDto> getAllReceicedTypeId(HttpServletRequest request, ConfigurationDto form,
//			String comID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			String sql = "SELECT * FROM bca_receicedtype Where Active=1 AND TypeCategory=1 AND CompanyID =" + comID
//					+ " ORDER BY Name";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setPaymentTypeId(rs.getInt("PaymentTypeID"));
//				pojo.setPaymentName(rs.getString("Name"));
//				pojo.setPaymentType(rs.getString("Type"));
//				pojo.setAcctID(rs.getInt("BankAcctID"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingReceivedType(listPOJOs);
//		return listPOJOs;
//	}

//	public void initStoreTypesModel(boolean b) {
//		if (b) {
//			// SELECT * FROM bca_storetype Where StoreTypeID NOT IN (10,12) Order By
//			// StoreTypeName ASC
//			// getStoreTypes();
//		} else {
//
//		}
//
//	}

	public ArrayList<String> getState(Integer countryId) {
		ArrayList<String> listPOJOs = new ArrayList<>();
		listPOJOs.add(0, "");
		try {
			List<BcaStates> states = stateRepository.findByCountry_Id(countryId);
			for (BcaStates state : states) {
				listPOJOs.add(state.getId(), state.getName());
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		return listPOJOs;
	}
//	public ArrayList<String> getState() {
//		ArrayList<String> listPOJOs = new ArrayList<>();
//		listPOJOs.add(0, "");
//		listPOJOs.add(1, "AK");
//		listPOJOs.add(2, "AL");
//		listPOJOs.add(3, "AR");
//		listPOJOs.add(4, "AZ");
//		listPOJOs.add(5, "CA");
//		listPOJOs.add(6, "CO");
//		listPOJOs.add(7, "CT");
//		listPOJOs.add(8, "DC");
//		listPOJOs.add(9, "DE");
//		listPOJOs.add(10, "FL");
//		listPOJOs.add(11, "GA");
//		listPOJOs.add(12, "HI");
//		listPOJOs.add(13, "IA");
//		listPOJOs.add(14, "ID");
//		listPOJOs.add(15, "IL");
//		listPOJOs.add(16, "IN");
//		listPOJOs.add(17, "KS");
//		listPOJOs.add(18, "KY");
//		return listPOJOs;
//	}

	@Autowired
	private BcaStoretypeRepository storeTypeRepository;

	public ArrayList<ConfigurationDto> getStoreTypes(ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<Integer> excludedIds = Arrays.asList(10, 12); // Store type IDs to exclude
			List<BcaStoretype> storeTypes = storeTypeRepository.findByStoreTypeIdNotIn(excludedIds,
					Sort.by("storeTypeName").ascending());
			for (BcaStoretype storeType : storeTypes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setStoreTypeId(storeType.getStoreTypeId());
				pojo.setStoreTypeName(storeType.getStoreTypeName());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingStoreType(listPOJOs);
		return listPOJOs;
	}
//	public ArrayList<ConfigurationDto> getStoreTypes(HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT * FROM bca_storetype Where StoreTypeID NOT IN (10,12) Order By StoreTypeName ASC";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setStoreTypeId(rs.getInt("StoreTypeID"));
//				pojo.setStoreTypeName(rs.getString("StoreTypeName"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingStoreType(listPOJOs);
//		return listPOJOs;
//
//	}

	public ArrayList<ConfigurationDto> getStores(int storeTypeID, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaStore> stores;
			if (storeTypeID == 15) {
				stores = storeRepository.findByCompany_CompanyIdAndDeleted(ConstValue.companyIdLong, 1);
			} else {
				stores = storeRepository.findByCompany_CompanyIdAndDeletedAndStoreType_StoreTypeId(
						ConstValue.companyIdLong, 1, storeTypeID);
			}
			for (BcaStore store : stores) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setStoreId(store.getStoreId());
				pojo.setStoreName(store.getStoreName());
				pojo.setReturnPolicy(store.getPackingReturnPolicy());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingStores(listPOJOs);
		return listPOJOs;
	}
//	public ArrayList<ConfigurationDto> getStores(int storeTypeID, HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//
//			if (storeTypeID == 15) {
//				sql = "SELECT * FROM bca_store " + " WHERE CompanyID=" + ConstValue.companyId + " AND Deleted = 1";
//			} else {
//				sql = "SELECT * FROM bca_store " + " WHERE CompanyID=" + ConstValue.companyId + " AND StoreTypeID = "
//						+ storeTypeID + " AND Deleted = 1";
//			}
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setStoreId(rs.getInt("StoreID"));
//				pojo.setStoreName(rs.getString("StoreName"));
//				pojo.setReturnPolicy(rs.getString("PackingReturnPolicy"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingStores(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaMailtemplateRepository mailTemplateRepository;

	public ArrayList<MailTemplateDto> getEmailActiveTemplates(int templateId) {
		ArrayList<MailTemplateDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaMailtemplate> templates;
			if (templateId != 0) {
				templates = new ArrayList<>();
				templates.add(mailTemplateRepository.findByTemplateIdAndActive(templateId, 1));
			} else {
				templates = mailTemplateRepository.findByActive(1);
			}

			for (BcaMailtemplate template : templates) {
				if (template != null) {
					MailTemplateDto pojo = new MailTemplateDto();
					pojo.setTemplateID(template.getTemplateId());
					pojo.setTemplateName(template.getTemplateName());
					pojo.setSubject(template.getSubject());
					pojo.setContent(template.getTemplateContent());
					listPOJOs.add(pojo);
				}
			}
		} catch (Exception e) {
			// Log and handle exception
		}
		return listPOJOs;
	}

//	public ArrayList<MailTemplateDto> getEmailActiveTemplates(int templateId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<MailTemplateDto> listPOJOs = new ArrayList<>();
//		try {
//			String sql;
//			if (templateId != 0) {
//				sql = "SELECT TemplateID,TemplateName,TemplateContent,Subject,Active FROM bca_mailtemplate WHERE Active=1 and TemplateID="
//						+ templateId;
//			} else {
//				sql = "SELECT TemplateID,TemplateName,TemplateContent,Subject,Active FROM bca_mailtemplate WHERE Active=1";
//			}
//
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				MailTemplateDto pojo = new MailTemplateDto();
//				pojo.setTemplateID(rs.getInt("TemplateID"));
//				pojo.setTemplateName(rs.getString("TemplateName"));
//				pojo.setSubject(rs.getString("Subject"));
//				pojo.setContent(rs.getString("TemplateContent"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return listPOJOs;
//	}

	@Transactional
	public void addNewTemplates(String templateName, String subject, String content) {
		try {
			BcaMailtemplate newTemplate = new BcaMailtemplate();
			newTemplate.setTemplateName(templateName);
			newTemplate.setSubject(subject);
			newTemplate.setTemplateContent(content);
			newTemplate.setActive(1); // Active status

			mailTemplateRepository.save(newTemplate);
			// rowAdded logic can be handled here if needed
		} catch (Exception e) {
			// Log error and handle exception
			e.printStackTrace();
		}
	}
//	public void addNewTemplates(String templateName, String subject, String content) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			String sql = "INSERT INTO bca_mailtemplate(TemplateName, Subject, TemplateContent, Active) Values(?,?,?,?)";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, templateName);
//			pstmt.setString(2, subject);
//			pstmt.setString(3, content);
//			pstmt.setInt(4, 1);
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//	}

	@Transactional
	public boolean updateSelectedTemplate(String selectedTemplateId, String templateName, String subject,
			String content) {
		try {
			Optional<BcaMailtemplate> optTemplate = mailTemplateRepository
					.findById(Integer.valueOf(selectedTemplateId));
			if (optTemplate.isPresent()) {
				BcaMailtemplate template = optTemplate.get();
				template.setTemplateName(templateName);
				template.setSubject(subject);
				template.setTemplateContent(content);

				mailTemplateRepository.save(template);
				return true; // Row updated successfully
			} else {
				// Template not found, handle accordingly
				return false;
			}
		} catch (Exception e) {
			// Log error and handle exception
			e.printStackTrace();
			return false; // Update failed
		}
	}
//	public void updateSelectedTemplate(String selectedTemplateId, String templateName, String subject, String content) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowUpdated = false;
//		try {
//			String sql = "update bca_mailtemplate SET TemplateName = ?, Subject = ?, TemplateContent = ? where TemplateID = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, templateName);
//			pstmt.setString(2, subject);
//			pstmt.setString(3, content);
//			pstmt.setString(4, selectedTemplateId);
//			rowUpdated = pstmt.executeUpdate() > 0 ? true : false;
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//	}

	@Transactional
	public boolean deleteUserTemplate(String selectedTemplateId) {
		try {
			Optional<BcaMailtemplate> optTemplate = mailTemplateRepository
					.findById(Integer.valueOf(selectedTemplateId));
			if (optTemplate.isPresent()) {
				BcaMailtemplate template = optTemplate.get();
				template.setActive(0); // Deactivate the template

				mailTemplateRepository.save(template);
				return true; // Row updated (deactivated) successfully
			} else {
				// Template not found, handle accordingly
				return false;
			}
		} catch (Exception e) {
			// Log error and handle exception
			e.printStackTrace();
			return false; // Operation failed
		}
	}
//	public void deleteUserTemplate(String selectedTemplateId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowDeleted = false;
//		try {
//			String sql = "update bca_mailtemplate SET Active = ? where TemplateID = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, 0);
//			pstmt.setString(2, selectedTemplateId);
//			rowDeleted = pstmt.executeUpdate() > 0 ? true : false;
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//	}

	public ArrayList<ConfigurationDto> getActiveTemplates(int templateId, HttpServletRequest request,
			ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaMailtemplate> templates;
			if (templateId == 1) {
				templates = mailTemplateRepository.findByActive(1);
			} else {
				templates = new ArrayList<>();
				BcaMailtemplate template = mailTemplateRepository.findByTemplateIdAndActive(templateId, 1);
				if (template != null) {
					templates.add(template);
				}
			}

			for (BcaMailtemplate template : templates) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setTemplateId(template.getTemplateId());
				pojo.setTemplateName(template.getTemplateName());
				pojo.setTemplateSubject(template.getSubject());
				pojo.setTemplateContent(template.getTemplateContent());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			// Log and handle exception
		}
		form.setListOfExistingTemplates(listPOJOs);
		return listPOJOs;
	}
//	public ArrayList<ConfigurationDto> getActiveTemplates(int templateId, HttpServletRequest request,
//			ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			String sql = "";
//			if (templateId == 1) {
//				sql = "SELECT TemplateID,TemplateName,TemplateContent,Subject,Active FROM bca_mailtemplate WHERE Active=1";
//			} else {
//				sql = "SELECT TemplateID,TemplateName,TemplateContent,Subject,Active FROM bca_mailtemplate WHERE Active=1 and TemplateID="
//						+ templateId;
//			}
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setTemplateId(rs.getInt("TemplateID"));
//				pojo.setTemplateName(rs.getString("TemplateName"));
//				pojo.setTemplateSubject(rs.getString("Subject"));
//				pojo.setTemplateContent(rs.getString("TemplateContent"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingTemplates(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaMastershippingmailtypeRepository mastershippingmailtypeRepository;

	public ArrayList<ConfigurationDto> getActiveMailType(HttpServletRequest request, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaMastershippingmailtype> mailTypes = mastershippingmailtypeRepository.findByActive(1);

			for (BcaMastershippingmailtype mailType : mailTypes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setMailTypeId(mailType.getMailTypeId());
				pojo.setMailType(mailType.getName());
				pojo.setActive(mailType.getActive());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		form.setListOfExistingMailType(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getActiveMailType(HttpServletRequest request, ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("SELECT * FROM bca_mastershippingmailtype WHERE Active = 1");
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				// pojo.setSelectedMailTypeId(rs.getInt("MailTypeID"));
//				pojo.setMailTypeId(rs.getInt("MailTypeID"));
//				pojo.setMailType(rs.getString("Name"));
//				if (rs.getInt("Active") == 1) {
//					pojo.setActive(1);
//				} else {
//					pojo.setActive(0);
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingMailType(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaMastershippingpackagesizeRepository mastershippingpackagesizeRepository;

	public ArrayList<ConfigurationDto> getActivePackageSize(HttpServletRequest request, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaMastershippingpackagesize> packageSizes = mastershippingpackagesizeRepository.findByActive(1);

			for (BcaMastershippingpackagesize packageSize : packageSizes) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setPackageSizeId(packageSize.getPackageSizeId());
				pojo.setPackageSize(packageSize.getName());
				pojo.setPackageSizeActive(packageSize.getActive());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		form.setListOfExistingPackageSize(listPOJOs);
		return listPOJOs;
	}
//	public ArrayList<ConfigurationDto> getActivePackageSize(HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT * FROM bca_mastershippingpackagesize WHERE Active = 1";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				// pojo.setSelectedPackageSizeId(rs.getInt("PackageSizeID"));
//				pojo.setPackageSizeId(rs.getInt("PackageSizeID"));
//				pojo.setPackageSize(rs.getString("Name"));
//				if (rs.getInt("Active") == 1) {
//					pojo.setPackageSizeActive(1);
//				} else {
//					pojo.setPackageSizeActive(0);
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingPackageSize(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaMastershippingcontainerRepository mastershippingcontainerRepository;

	public ArrayList<ConfigurationDto> getActiveContainer(HttpServletRequest request, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaMastershippingcontainer> containers = mastershippingcontainerRepository.findByActive(1);

			for (BcaMastershippingcontainer container : containers) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setContainerId(container.getContainerId());
				pojo.setContainer(container.getName());
				pojo.setContainerActive(container.getActive());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		form.setListOfExistingContainer(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getActiveContainer(HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT * FROM bca_mastershippingcontainer WHERE Active = 1";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				// pojo.setSelectedContainerId(rs.getInt("ContainerID"));
//				pojo.setContainerId(rs.getInt("ContainerID"));
//				pojo.setContainer(rs.getString("Name"));
//				if (rs.getInt("Active") == 1) {
//					pojo.setContainerActive(1);
//				} else {
//					pojo.setContainerActive(0);
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingContainer(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaRealtimeshippingserviceRepository realtimeshippingserviceRepository;

	public ConfigurationDto getSelectedUSPSShippingService(int shippingServiceId) {
		ConfigurationDto configurationDto = new ConfigurationDto();

		try {
			Optional<BcaRealtimeshippingservice> optService = realtimeshippingserviceRepository
					.findByShippingServiceIdAndActive(shippingServiceId, 1);

			if (optService.isPresent()) {
				BcaRealtimeshippingservice service = optService.get();
				configurationDto.setRealTimeShippingServiceId(service.getShippingServiceId());
				configurationDto.setRealTimeShippingService(service.getShippingService());
				configurationDto.setRealTimeShippingPrice(service.getPrice());
				configurationDto.setRealTimeShippingActive(service.getActive());
			}
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}

		return configurationDto;
	}

//	public ConfigurationDto getSelectedUSPSShippingService(int shippingServiceId) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ConfigurationDto configurationDto = new ConfigurationDto();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT ShippingServiceID,ShippingType,ShippingService,Price,Active "
//					+ "FROM bca_realtimeshippingservice " + " WHERE ShippingServiceID = " + shippingServiceId
//					+ " AND Active = 1 ";
//			rs = stmt.executeQuery(sql);
//			if (rs.next()) {
//				configurationDto.setRealTimeShippingServiceId(rs.getInt("ShippingServiceID"));
//				configurationDto.setRealTimeShippingService(rs.getString("ShippingService"));
//				configurationDto.setRealTimeShippingPrice(rs.getDouble("Price"));
//				if (rs.getInt("Active") == 1) {
//					configurationDto.setRealTimeShippingActive(1);
//				} else {
//					configurationDto.setRealTimeShippingActive(0);
//				}
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return configurationDto;
//	}

	public ArrayList<ConfigurationDto> getActiveRealTimeShippingServices(int shippingType, HttpServletRequest request,
			ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaRealtimeshippingservice> services = realtimeshippingserviceRepository
					.findByShippingTypeAndActive(shippingType, 1);

			for (BcaRealtimeshippingservice service : services) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setRealTimeShippingServiceId(service.getShippingServiceId());
				pojo.setRealTimeShippingService(service.getShippingService());
				pojo.setRealTimeShippingPrice(service.getPrice());
				pojo.setRealTimeShippingActive(service.getActive());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}

		switch (shippingType) {
		case 1:
			form.setListOfExistingRealTimeShippingServices(listPOJOs);
			break;
		case 2:
			form.setListOfExistingRealTimeShippingServices1(listPOJOs);
			break;
		case 3:
			form.setListOfExistingRealTimeShippingServices2(listPOJOs);
			break;
		// Add more cases if needed
		}

		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getActiveRealTimeShippingServices(int shippingType, HttpServletRequest request,
//			ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT ShippingServiceID,ShippingType,ShippingService,Price,Active "
//					+ " FROM bca_realtimeshippingservice " + " WHERE ShippingType= " + shippingType
//					+ " AND Active = 1 ";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				// pojo.setSelectedRealTimeShippingServiceId(rs.getInt("ShippingServiceID"));
//				pojo.setRealTimeShippingServiceId(rs.getInt("ShippingServiceID"));
//				pojo.setRealTimeShippingService(rs.getString("ShippingService"));
//				pojo.setRealTimeShippingPrice(rs.getDouble("Price"));
//				if (rs.getInt("Active") == 1) {
//					pojo.setRealTimeShippingActive(1);
//				} else {
//					pojo.setRealTimeShippingActive(0);
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		if (shippingType == 1) {
//			form.setListOfExistingRealTimeShippingServices(listPOJOs);
//		} else if (shippingType == 2) {
//			form.setListOfExistingRealTimeShippingServices1(listPOJOs);
//		} else if (shippingType == 3) {
//			form.setListOfExistingRealTimeShippingServices2(listPOJOs);
//		}
//		return listPOJOs;
//	}

	@Autowired
	private BcaShipcarrierRepository shipcarrierRepository;

	public ArrayList<ConfigurationDto> getActiveUserdefinedShippingType(Long companyId, HttpServletRequest request,
			ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			// Fetch the parent carriers first
			List<BcaShipcarrier> parentCarriers = shipcarrierRepository
					.findByCompany_CompanyIdAndActiveAndParentId(companyId, 1, 0);
			for (BcaShipcarrier parentCarrier : parentCarriers) {
				// For each parent, fetch the active child carriers
				List<BcaShipcarrier> childCarriers = shipcarrierRepository
						.findByCompany_CompanyIdAndParentIdAndActive(companyId, parentCarrier.getShipCarrierId(), 1);
				for (BcaShipcarrier childCarrier : childCarriers) {
					ConfigurationDto pojo = new ConfigurationDto();
					pojo.setSelectedUserDefinedShippingTypeId(childCarrier.getShipCarrierId());
					pojo.setUserDefinedShippingTypeId(childCarrier.getShipCarrierId());
					pojo.setUserDefinedShipping(childCarrier.getName());
					pojo.setUserDefinedShppingActive(childCarrier.getActive());
					listPOJOs.add(pojo);
				}
			}
			form.setListOfExistingUserDefiedShippingType(listPOJOs);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getActiveUserdefinedShippingType(String companyId, HttpServletRequest request,
//			ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		ResultSet rs1 = null;
//		Statement stmt1 = null;
//		ConfigurationDto pojo1 = null;
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT ShipCarrierID,Name FROM bca_shipcarrier WHERE Name ='User Defined' AND CompanyID=" + companyId
//					+ " AND Active=1 AND ParentID= 0 ORDER BY ShipCarrierID";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				int shipId = rs.getInt("ShipCarrierID");
//				stmt1 = con.createStatement();
//				sql = "SELECT ShipCarrierID,Name FROM bca_shipcarrier WHERE CompanyID =" + companyId + " AND ParentID ="
//						+ shipId + " AND Active =1 ORDER BY Name";
//			}
//			rs1 = stmt1.executeQuery(sql);
//			while (rs1.next()) {
//				pojo1 = new ConfigurationDto();
//				pojo1.setSelectedUserDefinedShippingTypeId(rs1.getInt("ShipCarrierID"));
//				pojo1.setUserDefinedShippingTypeId(rs1.getInt("ShipCarrierID"));
//				pojo1.setUserDefinedShipping(rs1.getString("Name"));
//				pojo1.setUserDefinedShppingActive(1);
//				listPOJOs.add(pojo1);
//			}
//			form.setListOfExistingUserDefiedShippingType(listPOJOs);
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return listPOJOs;
//	}

	@Autowired
	private BcaShippingrateRepository shippingrateRepository;

	public ArrayList<ConfigurationDto> getUserDefinedShippingWeightAndPrice(int shipId, HttpServletRequest request,
			ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaShippingrate> shippingRates = shippingrateRepository.findByShipCarrier_ShipCarrierId(shipId);

			for (BcaShippingrate shippingRate : shippingRates) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setUserDefinedShippingId(shippingRate.getShippingRateId());
				pojo.setSelectedUserDefinedShippingTypeId(shippingRate.getShipCarrier().getShipCarrierId());
				pojo.setUserDefinedShippingTypeId(shippingRate.getShipCarrier().getShipCarrierId());
				pojo.setUserDefinedShippingWeight(shippingRate.getWeight());
				pojo.setUserDefinedShippingPrice(shippingRate.getPrice().doubleValue());
				listPOJOs.add(pojo);
			}
			form.setListOfExistingUserDefiedShippingWeightAndPrice(listPOJOs);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return listPOJOs;
	}
//	public ArrayList<ConfigurationDto> getUserDefinedShippingWeightAndPrice(int shipId, HttpServletRequest request,
//			ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("select * from bca_shippingrate where ShipCarrierID =" + shipId);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setUserDefinedShippingId(rs.getInt("ShippingRateID"));
//				pojo.setSelectedUserDefinedShippingTypeId(rs.getInt("ShipCarrierID"));
//				pojo.setUserDefinedShippingTypeId(rs.getInt("ShipCarrierID"));
//				pojo.setUserDefinedShippingWeight(rs.getInt("Weight"));
//				pojo.setUserDefinedShippingPrice(rs.getDouble("Price"));
//				listPOJOs.add(pojo);
//			}
//			form.setListOfExistingUserDefiedShippingWeightAndPrice(listPOJOs);
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return listPOJOs;
//	}

//    @Autowired
//    BcaShipcarrierRepository shipcarrierRepository;

	@Transactional
	public boolean addUserDefinedShippingWeightAndPrice(ConfigurationDto form) {
		try {
			Optional<BcaShipcarrier> shipCarrie = shipcarrierRepository.findById(form.getUserDefinedShippingTypeId());

			BcaShippingrate shippingRate = new BcaShippingrate();
			shippingRate.setShipCarrier(shipCarrie.get());
			shippingRate.setWeight(form.getUserDefinedShippingWeight());
			shippingRate.setPrice(BigDecimal.valueOf(form.getUserDefinedShippingPrice())); // Convert double to
																							// BigDecimal if needed

			shippingrateRepository.save(shippingRate);
			return true; // Row added successfully
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
			return false; // Operation failed
		}
	}
//	public boolean addUserDefinedShippingWeightAndPrice(ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			pstmt = con.prepareStatement("INSERT INTO bca_shippingrate(ShipCarrierID, Weight, Price) Values(?,?,?)");
//			pstmt.setInt(1, form.getUserDefinedShippingTypeId());
//			pstmt.setDouble(2, form.getUserDefinedShippingWeight());
//			pstmt.setDouble(3, form.getUserDefinedShippingPrice());
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}
	//////////////////////////////////////////////////////

	@Transactional
	public boolean addUpsServiceNameandPrice(ConfigurationDto form) {
		try {
			BcaRealtimeshippingservice service = new BcaRealtimeshippingservice();
			service.setShippingType(form.getRealTimeShippingServiceId()); // Assuming this is shippingType, not ID
			service.setShippingService(form.getRealTimeShippingService());
			service.setPrice(form.getRealTimeShippingPrice());
			service.setActive(1); // Active is set to 1 as per your SQL query

			realtimeshippingserviceRepository.save(service);
			return true; // Row added successfully
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
			return false; // Operation failed
		}
	}

//	public boolean addUpsServiceNameandPrice(ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			pstmt = con.prepareStatement(
//					"INSERT INTO bca_realtimeshippingservice(ShippingType,ShippingService, Price, Active) Values(?,?,?,?)");
//			pstmt.setInt(1, form.getRealTimeShippingServiceId());
//			pstmt.setString(2, form.getRealTimeShippingService());
//			pstmt.setDouble(3, form.getRealTimeShippingPrice());
//			pstmt.setInt(4, 1);
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}

	//////////////////
	@Autowired
	private BcaShippingserviceRepository shippingserviceRepository;

	@Transactional
	public boolean addValueAddedService(ConfigurationDto form) {
		try {
			Optional<BcaShipcarrier> shipCarrierOpt = shipcarrierRepository.findById(form.getShipCarrierId());
			Optional<BcaMastershippingcontainer> shipContainerOpt = mastershippingcontainerRepository
					.findById(form.getContainerId());
			Optional<BcaMastershippingmailtype> mailTypeOpt = mastershippingmailtypeRepository
					.findById(form.getMailTypeId());
			Optional<BcaMastershippingpackagesize> packageSizeOpt = mastershippingpackagesizeRepository
					.findById(form.getPackageSizeId());

			if (!shipCarrierOpt.isPresent() || !shipContainerOpt.isPresent() || !mailTypeOpt.isPresent()
					|| !packageSizeOpt.isPresent()) {
				return false; // One or more entities not found
			}

			BcaShippingservice service = new BcaShippingservice();
			service.setShipCarrier(shipCarrierOpt.get());
			service.setContainer(shipContainerOpt.get());
			service.setMailType(mailTypeOpt.get());
			service.setPackageSize(packageSizeOpt.get());
			service.setHandlingFee((double) form.getSpecialHandlingfee1());

			shippingserviceRepository.save(service);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
//	public boolean addValueAddedService(ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			pstmt = con.prepareStatement(
//					"INSERT INTO bca_shippingservice(ContainerID, MailTypeID, PackageSizeID, HandlingFee) Values(?,?,?,?)");
//			pstmt.setInt(1, form.getContainerId());
//			pstmt.setInt(2, form.getMailTypeId());
//			pstmt.setInt(3, form.getPackageSizeId());
//			pstmt.setInt(4, form.getSpecialHandlingfee1());
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}

	@Transactional
	public boolean updateUserDefinedShippingWeightAndPrice(ConfigurationDto form) {
		Optional<BcaShippingrate> shippingRateOpt = shippingrateRepository.findById(form.getUserDefinedShippingId());
		if (shippingRateOpt.isPresent()) {
			BcaShippingrate shippingRate = shippingRateOpt.get();
			shippingRate.setWeight(form.getUserDefinedShippingWeight());
			shippingRate.setPrice(BigDecimal.valueOf(form.getUserDefinedShippingPrice()));
			shippingrateRepository.save(shippingRate);
			return true;
		} else {
			return false; // ShippingRateID not found
		}
	}

//	public boolean updateUserDefinedShippingWeightAndPrice(ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			pstmt = con.prepareStatement("UPDATE bca_shippingrate SET Weight=?, Price=? WHERE ShippingRateID=?");
//			pstmt.setDouble(1, form.getUserDefinedShippingWeight());
//			pstmt.setDouble(2, form.getUserDefinedShippingPrice());
//			pstmt.setInt(3, form.getUserDefinedShippingId());
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}

	///////////////////
	@Transactional
	public boolean editUpsServiceNameandPrice(ConfigurationDto form) {
		Optional<BcaRealtimeshippingservice> serviceOpt = realtimeshippingserviceRepository
				.findById(form.getRealTimeShippingServiceId());
		if (serviceOpt.isPresent()) {
			BcaRealtimeshippingservice service = serviceOpt.get();
			service.setShippingService(form.getRealTimeShippingService());
			service.setPrice(form.getRealTimeShippingPrice());
			service.setActive(1); // Assuming Active is always set to 1

			realtimeshippingserviceRepository.save(service);
			return true; // Row updated successfully
		} else {
			return false; // ShippingServiceID not found
		}
	}
//	public boolean editUpsServiceNameandPrice(ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			pstmt = con.prepareStatement(
//					"UPDATE bca_realtimeshippingservice SET ShippingService=?, Price=?, Active =? WHERE ShippingServiceID=?");
//			/* pstmt.setInt(1, form.getRealTimeShippingServiceId()); */
//			pstmt.setString(1, form.getRealTimeShippingService());
//			pstmt.setDouble(2, form.getRealTimeShippingPrice());
//			pstmt.setInt(3, 1);
//			pstmt.setInt(4, form.getRealTimeShippingServiceId());
//
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}

	/////////////////
	/**
	 * Deletes a real-time shipping service by its ID.
	 * 
	 * This method first checks if a shipping service with the given ID exists. If
	 * it exists, the method proceeds to delete the service from the database. The
	 * operation is transactional, ensuring data integrity.
	 * 
	 * @param udShippingRateID The ID of the shipping service to be deleted.
	 * @return true if the shipping service was successfully deleted, false
	 *         otherwise.
	 */
	@Transactional
	public boolean deleteeditUpsServiceNameandPrice(int udShippingRateID) {
		try {
			Optional<BcaRealtimeshippingservice> serviceOpt = realtimeshippingserviceRepository
					.findById(udShippingRateID);
			if (serviceOpt.isPresent()) {
				realtimeshippingserviceRepository.deleteById(udShippingRateID);
				return true; // Successfully deleted
			} else {
				return false; // ID not found
			}
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
			return false; // Operation failed
		}
	}
//	public boolean deleteeditUpsServiceNameandPrice(int udShippingRateID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			pstmt = con.prepareStatement(
//					"DELETE FROM bca_realtimeshippingservice WHERE ShippingServiceID=" + udShippingRateID);
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}
	////////////

	/**
	 * Deletes a user-defined shipping rate by its ID.
	 *
	 * @param udShippingRateID The ID of the shipping rate to be deleted.
	 * @return true if the shipping rate was successfully deleted, false otherwise.
	 */
	@Transactional
	public boolean deleteUserDefinedShippingWeightAndPrice(int udShippingRateID) {
		try {
			if (shippingrateRepository.existsById(udShippingRateID)) {
				shippingrateRepository.deleteById(udShippingRateID);
				return true; // Successfully deleted
			} else {
				return false; // ShippingRateID not found
			}
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
			return false; // Operation failed
		}
	}
//	public boolean deleteUserDefinedShippingWeightAndPrice(int udShippingRateID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			pstmt = con.prepareStatement("DELETE FROM bca_shippingrate WHERE ShippingRateID=" + udShippingRateID);
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}

	/**
	 * Updates printing template preferences for a given company.
	 * 
	 * @param companyID The ID of the company whose preferences are being updated.
	 * @param form      The data transfer object containing updated preference
	 *                  values.
	 * @return true if the update was successful, false otherwise.
	 */
	@Autowired
	private BcaPreferenceRepository preferenceRepository;

	@Transactional
	public boolean setPrintingTemplates(String companyID, ConfigurationDto form) {
		try {
			Optional<BcaPreference> preferenceOpt = preferenceRepository.findById(Integer.valueOf(companyID));
			if (preferenceOpt.isPresent()) {
				BcaPreference preference = preferenceOpt.get();
				preference.setInvoiceTemplateType(form.getInvoiceTemplateType());
				preference.setEstimationTemplateType(form.getEstTemplateType());
				preference.setSalesOrderTemplateType(form.getSoTemplateType());
				preference.setPurchaseOrderTemplateType(form.getPoTemplateType());
				preference.setPackingSlipTemplateType(form.getPsTemplateType());

				preferenceRepository.save(preference);
				return true;
			} else {
				return false; // Company ID not found
			}
		} catch (Exception e) {
			// Log and handle the exception
			e.printStackTrace();
			return false;
		}
	}

//	public boolean setPrintingTemplates(String companyID, ConfigurationDto form) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		try {
//			String sql = "UPDATE bca_preference SET InvoiceTemplateType=?, EstimationTemplateType=?, SalesOrderTemplateType=?, "
//					+ "PurchaseOrderTemplateType=?, PackingSlipTemplateType=? WHERE CompanyID=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, form.getInvoiceTemplateType());
//			pstmt.setInt(2, form.getEstTemplateType());
//			pstmt.setInt(3, form.getSoTemplateType());
//			pstmt.setInt(4, form.getPoTemplateType());
//			pstmt.setInt(5, form.getPsTemplateType());
//			pstmt.setString(6, companyID);
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}
	@Autowired
	private SmdShipdetailsRepository smdShipdetailsRepository;

	public ArrayList<ConfigurationDto> getUPSUserDetails(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<SmdShipdetails> shipDetails = smdShipdetailsRepository.findByCompany_CompanyIdAndShippType(companyId,
					"UPS");

			for (SmdShipdetails detail : shipDetails) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setUpsUserId(detail.getField1());
				pojo.setUpsPassword(detail.getField2());
				pojo.setAccesskey(detail.getField3());
				pojo.setUpsAccountNo(detail.getField4());
				pojo.setIsUPSActive(detail.getActive() ? 1 : 0);

				listPOJOs.add(pojo);
			}
			form.setListOfExistingUpsUSers(listPOJOs);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getUPSUserDetails(String companyId, HttpServletRequest request,
//			ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(
//					"select * from smd_shipdetails where CompanyID =" + companyId + " and shippType = 'UPS'");
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setUpsUserId(rs.getString("Field1"));
//				pojo.setUpsPassword(rs.getString("Field2"));
//				pojo.setAccesskey(rs.getString("Field3"));
//				pojo.setUpsAccountNo(rs.getString("Field4"));
//				int active = Integer.parseInt(rs.getString("active"));
//				if (active == 1) {
//					System.out.println("UPS is active");
//					pojo.setIsUPSActive(1);
//				} else {
//					System.out.println("UPS is not active");
//					pojo.setIsUPSActive(0);
//				}
//				listPOJOs.add(pojo);
//			}
//			form.setListOfExistingUpsUSers(listPOJOs);
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> getUSPSUserDetails(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<SmdShipdetails> shipDetails = smdShipdetailsRepository.findByCompany_CompanyIdAndShippType(companyId,
					"USPS");

			for (SmdShipdetails detail : shipDetails) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setUspsUserId(detail.getField1());
				// Set other fields as necessary
				pojo.setIsUSPSActive(detail.getActive() ? 1 : 0); // Assuming getActive() returns a boolean

				listPOJOs.add(pojo);
			}
			form.setListOfExistingUspsUSers(listPOJOs);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getUSPSUserDetails(String companyId, HttpServletRequest request,
//			ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "select * from smd_shipdetails where CompanyID =" + companyId + " and shippType = 'USPS'";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setUspsUserId(rs.getString("Field1"));
//				int active = Integer.parseInt(rs.getString("active"));
//				/*
//				 * pojo.setUpsPassword(rs.getString("Field2"));
//				 * pojo.setAccesskey(rs.getString("Field3"));
//				 * pojo.setUpsAccountNo(rs.getString("Field4"));
//				 */
//				if (active == 1) {
//					System.out.println("USPS is active");
//					pojo.setIsUSPSActive(1);
//				} else {
//					System.out.println("USPS is not active");
//					pojo.setIsUSPSActive(0);
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingUspsUSers(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	BcaCompanyRepository companyRepository;

	@Transactional
	public void addShippingTypeValue(String shippingtype, Long companyID) {
		try {
			Optional<BcaCompany> bcaCom = companyRepository.findById(companyID);

			BcaShipcarrier shipcarrier = new BcaShipcarrier();
			shipcarrier.setName(shippingtype);
			shipcarrier.setCompany(bcaCom.get());
			shipcarrier.setParentId(29); // Assuming 29 is a constant value for ParentID

			shipcarrierRepository.save(shipcarrier);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
	}

//	public void addShippingTypeValue(HttpServletRequest request, String shippingtype, String companyID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		PreparedStatement ps;
//		con = db.getConnection();
//		int ParentID = 29;
//		try {
//			String sql = "insert into bca_shipcarrier(Name, CompanyID, ParentID) values ('" + shippingtype + "',"
//					+ companyID + "," + ParentID + ")";
//			ps = con.prepareStatement(sql);
//			Loger.log(sql);
//			ps.execute();
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//			// TODO: handle exception
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//	}

	@Transactional
	public boolean editShippingTypeValue(String oldVal, Long companyID, String oldId) {
		try {
			Optional<BcaShipcarrier> shipcarrierOpt = shipcarrierRepository.findById(Integer.valueOf(oldId));
			if (shipcarrierOpt.isPresent()) {
				BcaShipcarrier shipcarrier = shipcarrierOpt.get();
				shipcarrier.setName(oldVal);
				// Assuming companyId is not changing. If it changes, add
				// shipcarrier.setCompanyId(companyID);

				shipcarrierRepository.save(shipcarrier);
				return true; // Update successful
			} else {
				return false; // ShipCarrierID not found
			}
		} catch (Exception e) {
			// Log and handle the exception
			e.printStackTrace();
			return false; // Operation failed
		}
	}

//	public void editShippingTypeValue(HttpServletRequest request, String oldVal, String companyID, String oldId) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		boolean valid = false;
//		con = db.getConnection();
//		try {
//			String sql = "update bca_shipcarrier set Name='" + oldVal + "' where ShipCarrierID = " + oldId;
//			pstmt = con.prepareStatement(sql);
//			Loger.log(sql);
//			int count = pstmt.executeUpdate();
//			if (count > 0)
//				valid = true;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//			// TODO: handle exception
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
//	}

	@Transactional
	public boolean deleteShippingTypeValue(String companyID, String oldId) {
		try {
			Optional<BcaShipcarrier> shipcarrierOpt = shipcarrierRepository.findById(Integer.valueOf(oldId));
			if (shipcarrierOpt.isPresent()) {
				BcaShipcarrier shipcarrier = shipcarrierOpt.get();
				shipcarrier.setActive(0); // Assuming you have a field 'active' in your entity

				shipcarrierRepository.save(shipcarrier);
				return true; // Soft delete successful
			} else {
				return false; // ShipCarrierID not found
			}
		} catch (Exception e) {
			// Log and handle the exception
			e.printStackTrace();
			return false; // Operation failed
		}
	}

//	public void deleteShippingTypeValue(HttpServletRequest request, String companyID, String oldId) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		boolean valid = false;
//		con = db.getConnection();
//		try {
//			String sql = "update bca_shipcarrier set Active=0 where ShipCarrierID = " + oldId;
//			pstmt = con.prepareStatement(sql);
//			Loger.log(sql);
//			int count = pstmt.executeUpdate();
//			if (count > 0)
//				valid = true;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//			// TODO: handle exception
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
//	}

	public ArrayList<ConfigurationDto> getFedExUserDetails(String companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<SmdShipdetails> shipDetails = smdShipdetailsRepository
					.findByCompany_CompanyIdAndShippType(Long.valueOf(companyId), "FEDEX");

			for (SmdShipdetails detail : shipDetails) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setFedexAccountNumber(detail.getField1());
				pojo.setFedexMeterNumber(detail.getField2());
				// Set other fields as necessary
				pojo.setIsFeDexActive(detail.getActive() ? 1 : 0); // Assuming getActive() returns a boolean

				listPOJOs.add(pojo);
			}
			form.setListOfExistingFedexUSers(listPOJOs);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getFedExUserDetails(String companyId, HttpServletRequest request,
//			ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "select * from smd_shipdetails where CompanyID =" + companyId + " and shippType = 'FEDEX'";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setFedexAccountNumber(rs.getString("Field1"));
//				pojo.setFedexMeterNumber(rs.getString("Field2"));
//				pojo.setFedexPassword(rs.getString("Field3"));
//				pojo.setFedexTestKey(rs.getString("Field4"));
//				int active = Integer.parseInt(rs.getString("active"));
//				if (active == 1) {
//					System.out.println("fedex is active");
//					pojo.setIsFeDexActive(1);
//				} else {
//					System.out.println("fedex is not active");
//					pojo.setIsFeDexActive(0);
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingFedexUSers(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcaStoreRepository storeRepository;

	public ArrayList<ConfigurationDto> geteSalesStore(ConfigurationDto form, Long companyId) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaStore> stores = storeRepository.findByCompany_CompanyIdAndActiveAndDeleted(companyId, 1, 1);

			for (BcaStore store : stores) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedStoreId(store.getStoreId());
				pojo.setStoreName(store.getStoreName());
				// Set other fields as necessary

				listPOJOs.add(pojo);
			}
			form.setListOfExistingStores(listPOJOs);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> geteSalesStore(HttpServletRequest request, ConfigurationDto form,
//			String companyId) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT * FROM bca_store WHERE CompanyID = " + companyId + " AND Active = 1 AND Deleted = 1";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedStoreId(rs.getInt("StoreID"));
//				pojo.setStoreId(rs.getInt("StoreID"));
//				pojo.setStoreName(rs.getString("StoreName"));
//				pojo.setStoreTypeId(rs.getInt("StoreTypeID"));
//				pojo.setStoreTypeName(rs.getString("StoreTypeName"));
//				pojo.setAbbreviation(rs.getString("Abbreviation"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingStores(listPOJOs);
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> geteActiveStore(ConfigurationDto form, Long companyId) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<Integer> storeTypeIds = Arrays.asList(3, 9); // Store Type IDs
			List<BcaStore> stores = storeRepository
					.findByCompany_CompanyIdAndStoreType_StoreTypeIdInAndActiveAndDeleted(companyId, storeTypeIds, 1,
							1);

			for (BcaStore store : stores) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedStoreTypeId(store.getStoreType().getStoreTypeId());
				pojo.setStoreId(store.getStoreId());
				pojo.setStoreName(store.getStoreName());
				pojo.setStoreTypeId(store.getStoreType().getStoreTypeId());
				// Set other fields as necessary

				listPOJOs.add(pojo);
			}
			form.setListOfExistingActiveStores(listPOJOs);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> geteActiveStore(HttpServletRequest request, ConfigurationDto form,
//			String companyId) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT * FROM  bca_store WHERE CompanyID = " + companyId
//					+ " AND StoreTypeId IN (3,9) AND Active = 1 AND Deleted = 1";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedStoreTypeId(rs.getInt("StoreTypeID"));
//				pojo.setStoreId(rs.getInt("StoreID"));
//				pojo.setStoreName(rs.getString("StoreName"));
//				pojo.setStoreTypeId(rs.getInt("StoreTypeID"));
//				pojo.setStoreTypeName(rs.getString("StoreTypeName"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingActiveStores(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private SmdEbaycategoryRepository ebayCategoryRepository;

	public ArrayList<ConfigurationDto> geteBayCategories(ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<SmdEbaycategory> ebayCategories = ebayCategoryRepository.findAll();

			for (SmdEbaycategory category : ebayCategories) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedeBayCategoryId(category.getEBayCategoryId());
				pojo.setIsLeaf(category.getIsleaf());
				pojo.seteBayCategoryName(category.getSmdcategoryName());
				// Additional logic for category name based on level can be added here

				listPOJOs.add(pojo);
			}
			form.setListOfExistingeBayCategories(listPOJOs);
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> geteBayCategories(HttpServletRequest request, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT * FROM smd_ebaycategory";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedeBayCategoryId(rs.getInt("eBayCategoryID"));
//				pojo.seteBayCategoryId(rs.getInt("eBayCategoryID"));
//				pojo.setIsLeaf(rs.getInt("isleaf"));
//				int level = rs.getInt("level");
//				/*
//				 * if(level == 1) {
//				 * pojo.seteBayCategoryName("  "+rs.getString("smdcategoryName")); } else
//				 * if(level == 2) {
//				 * pojo.seteBayCategoryName("   "+rs.getString("smdcategoryName")); } else
//				 * if(level == 3) {
//				 * pojo.seteBayCategoryName("    "+rs.getString("smdcategoryName")); } else {
//				 */
//				pojo.seteBayCategoryName(rs.getString("smdcategoryName"));
//				// }
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingeBayCategories(listPOJOs);
//		return listPOJOs;
//	}

//	@Autowired
//	private BcpFedperallowanceRepository fedperallowanceRepository;
//
//	public ArrayList<ConfigurationDto> getAvailableTaxYear(ConfigurationDto form) {
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//
//		try {
//			List<BcpFedperallowance> taxYears = fedperallowanceRepository.findDistinctEYear();
//
//			for (BcpFedperallowance year : taxYears) {
//				ConfigurationDto pojo = new ConfigurationDto();
//				pojo.setSelectedTaxYear(year.getEyear());
//				pojo.setAvailableTaxYear(year.getEyear());
//				listPOJOs.add(pojo);
//			}
//			form.setListOfExistingTaxYear(listPOJOs);
//		} catch (Exception e) {
//			// Log and handle exception
//			e.printStackTrace();
//		}
//		return listPOJOs;
//	}

	@Autowired
	private BcpFedperallowanceRepository fedPerAllowanceRepository;

	public ArrayList<ConfigurationDto> getAvailableTaxYear(ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<Integer> taxYears = fedPerAllowanceRepository.findDistinctTaxYears();
			for (Integer taxYear : taxYears) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedTaxYear(taxYear);
				pojo.setAvailableTaxYear(taxYear);
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingTaxYear(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getAvailableTaxYear(ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "SELECT DISTINCT(EYear) as TaxYear FROM bcp_fedperallowance GROUP BY EYear ORDER BY EYear DESC";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedTaxYear(rs.getInt("TaxYear"));
//				pojo.setAvailableTaxYear(rs.getInt("TaxYear"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingTaxYear(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcpTaxCompanyRepository taxCompanyRepository;

	public List<CompanyTaxOptionDto> loadCompanyTaxOption(String compId) {
		List<CompanyTaxOptionDto> dtos = new ArrayList<>();

		try {
			List<BcpTaxCompany> taxCompanies = taxCompanyRepository
					.findByCompany_CompanyIdAndActive(Long.valueOf(compId), 1);

			for (BcpTaxCompany taxCompany : taxCompanies) {
				CompanyTaxOptionDto compTax = new CompanyTaxOptionDto();
				compTax.setDaily(taxCompany.getDaily().toString());
				compTax.setWeekly(taxCompany.getWeekly().toString());
				compTax.setSemiMonthly(taxCompany.getSemiMonthly().toString());
				compTax.setMonthly(taxCompany.getMonthly().toString());
				compTax.setQuarterly(taxCompany.getQuarterly().toString());
				compTax.setSemiAnnually(taxCompany.getSemiAnnually().toString());
				compTax.setAnnually(taxCompany.getAnnually().toString());
				compTax.setDayOfWeekVal(taxCompany.getUsePayrollDayWeek().toString());
				compTax.setDayOfWeek(taxCompany.getPayrollDayWeek().toString());
				compTax.setDayOfMonthVal(taxCompany.getUsePayrollDayMonth().toString());
				compTax.setDayOfMonth(taxCompany.getPayrollDayMonth().toString());
				compTax.setDailyOverVal(taxCompany.getUseOvertimeDailyHour().toString());
				compTax.setDailyOver(taxCompany.getOvertimeDailyHour().toString());
				compTax.setWeeklyOverVal(taxCompany.getUseOvertimeWeeklyHour().toString());
				compTax.setWeeklyOver(taxCompany.getOvertimeWeeklyHour().toString());
				compTax.setOvertimeRate(taxCompany.getOvertimeRate().toString());
				compTax.setWendSt(taxCompany.getUseSaturdayRate().toString());
				compTax.setWendStRate(taxCompany.getSaturdayRate().toString());
				compTax.setWendSn(taxCompany.getUseSundayRate().toString());
				compTax.setWendSnRate(taxCompany.getSundayRate().toString());
				compTax.setHoliday(taxCompany.getUseHolidayRate().toString());
				compTax.setHolidayRate(taxCompany.getHolidayRate().toString());
				compTax.setBiweekly(taxCompany.getBiWeekly().toString());
				compTax.setOptionId(taxCompany.getOptionId());

				Date date = taxCompany.getStartingDate();
				if (date != null) {
					compTax.setStartingDate(formatterMMDDYYYY.format(date));
				}
				date = taxCompany.getDateAdded();
				if (date != null) {
					compTax.setCreatedAt(formatterMMDDYYYY.format(date));
				}
				dtos.add(compTax);
			}
		} catch (Exception e) {
			// Log and handle exception
			e.printStackTrace();
		}
		return dtos;
	}
//	public List<CompanyTaxOptionDto> loadCompanyTaxOption(String compId) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		CompanyTaxOptionDto compTax = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		List<CompanyTaxOptionDto> dtos = new ArrayList<>();
//
//		try {
//			String sqlString = "select "
//					+ "Daily,Weekly,SemiMonthly,Monthly,Quarterly,SemiAnnually,Annually,UsePayrollDayWeek,"
//					+ "PayrollDayWeek,UsePayrollDayMonth,PayrollDayMonth,UseOvertimeDailyHour,OvertimeDailyHour,"
//					+ "UseOvertimeWeeklyHour,OvertimeWeeklyHour,OvertimeRate,UseSaturdayRate,SaturdayRate,UseSundayRate,"
//					+ "SundayRate,UseHolidayRate,HolidayRate,BiWeekly, OptionId, StartingDate, DateAdded"
//					+ " from bcp_tax_company where CompanyID =? and Active not like '0' ";
//
//			Loger.log(sqlString);
//			pstmt = con.prepareStatement(sqlString);
//			pstmt.setString(1, compId);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				compTax = new CompanyTaxOptionDto();
//				compTax.setDaily(rs.getString(1));
//				compTax.setWeekly(rs.getString(2));
//				compTax.setSemiMonthly(rs.getString(3));
//				compTax.setMonthly(rs.getString(4));
//				compTax.setQuarterly(rs.getString(5));
//				compTax.setSemiAnnually(rs.getString(6));
//				compTax.setAnnually(rs.getString(7));
//				compTax.setDayOfWeekVal(rs.getString(8));
//				compTax.setDayOfWeek(rs.getString(9));
//				compTax.setDayOfMonthVal(rs.getString(10));
//				compTax.setDayOfMonth(rs.getString(11));
//				compTax.setDailyOverVal(rs.getString(12));
//				compTax.setDailyOver(rs.getString(13));
//				compTax.setWeeklyOverVal(rs.getString(14));
//				compTax.setWeeklyOver(rs.getString(15));
//				compTax.setOvertimeRate(rs.getString(16));
//				compTax.setWendSt(rs.getString(17));
//				compTax.setWendStRate(rs.getString(18));
//				compTax.setWendSn(rs.getString(19));
//				compTax.setWendSnRate(rs.getString(20));
//				compTax.setHoliday(rs.getString(21));
//				compTax.setHolidayRate(rs.getString(22));
//				compTax.setBiweekly(rs.getString(23));
//				compTax.setOptionId(rs.getInt(24));
//
//				Date date = rs.getDate(25);
//				if (date != null) {
//					compTax.setStartingDate(formatterMMDDYYYY.format(date));
//				}
//				date = rs.getDate(26);
//				if (date != null) {
//					compTax.setCreatedAt(formatterMMDDYYYY.format(date));
//				}
//
//				dtos.add(compTax);
//			}
//
//		} catch (SQLException ee) {
//			Loger.log(2, " SQL Error in Class TaxInfo and  method -getCompanyTax " + " " + ee.toString());
//		} finally {
//			try {
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return dtos;
//	}

	public StateIncomeTaxDto loadSID(String compId, Long stateId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		StateIncomeTaxDto dto = null;

		try {
			// the table conf_tax_state is not available in the DB, need to fix this one.
			// 20231212
			String sqlString = "select * from conf_tax_state where CompanyID =? and StateID = ?";

			pstmt = con.prepareStatement(sqlString);
			pstmt.setString(1, compId);
			pstmt.setLong(2, stateId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new StateIncomeTaxDto();
				dto.setStateTaxId(rs.getLong("StateTaxID"));
				dto.setStateId(rs.getLong("StateId"));
				dto.setPitRate(rs.getDouble("PITRate"));
				dto.setUpToSdi(rs.getDouble("SDILimit"));
				dto.setSdiRate(rs.getDouble("SDIRate"));
				dto.setUiRate(rs.getDouble("UILimit"));
				dto.setUpToui(rs.getDouble("UIRate"));
				dto.setUpToEtt(rs.getDouble("ETTLimit"));
				dto.setEttRate(rs.getDouble("ETTRate"));

				dto.setOtherStateChck1(rs.getInt("UseOtherStateTaxName1"));
				dto.setOtherStateInput1(rs.getString("OtherStateTaxName1"));
				dto.setOtherStateUpto1(rs.getDouble("OtherStateTaxLimit1"));
				dto.setOtherStateTaxRate1(rs.getDouble("OtherStateTaxRate1"));

				dto.setOtherStateChck2(rs.getInt("UseOtherStateTaxName2"));
				dto.setOtherStateInput2(rs.getString("OtherStateTaxName2"));
				dto.setOtherStateUpto2(rs.getDouble("OtherStateTaxLimit2"));
				dto.setOtherStateTaxRate2(rs.getDouble("OtherStateTaxRate2"));

				dto.setOtherStateChck3(rs.getInt("UseOtherStateTaxName3"));
				dto.setOtherStateInput3(rs.getString("OtherStateTaxName3"));
				dto.setOtherStateUpto3(rs.getDouble("OtherStateTaxLimit3"));
				dto.setOtherStateTaxRate3(rs.getDouble("OtherStateTaxRate3"));

				Integer active = rs.getInt("Active");
				if (active == 1) {
					dto.setActive(true);
				} else {
					dto.setActive(false);
				}

				Integer asDefault = rs.getInt("SetAsDefault");
				if (asDefault == 1) {
					dto.setAsDefault(true);
				} else {
					dto.setAsDefault(false);
				}

			}

		} catch (SQLException ee) {
			Loger.log(2, " SQL Error in Class TaxInfo and  method -getCompanyTax " + " " + ee.toString());
		} finally {
			try {
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return dto;
	}

	public void loadCompanyTaxProperties(Long companyID, ConfigurationDto form) {
		Optional<BcaCompany> companyOptional = companyRepository.findById(companyID);
		if (companyOptional.isPresent()) {
			BcaCompany company = companyOptional.get();

			form.setFiscalMonth(company.getFiscalMonth());
			form.setFederalTaxID(company.getFederalTaxId());
			form.setSalesTaxID(company.getSalesTax().getSalesTaxId());
		}
	}

//	public void loadCompanyTaxProperties(String companyID, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			String sql = "select FiscalMonth,  FederalTaxId, SalesTaxId from bca_company where CompanyID =" + companyID;
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				form.setFiscalMonth(rs.getString("FiscalMonth"));
//				form.setFederalTaxID(rs.getInt("FederalTaxId"));
//				form.setSalesTaxID(rs.getInt("SalesTaxId"));
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//	}

	// Tax Section is not Converted due to table/entity is not available.. need to
	// understand the requirement #STARTS

	public void saveFIDCompanyTaxInfo(String companyID, ConfigurationDto configForm) {
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		PreparedStatement pstmt = null;
		con = db.getConnection();
		String sql = "";
		try {
			sql = "select count(*) from bcp_tax_fica_sdi where CompanyID = ? and FITYear= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, companyID);
			pstmt.setInt(2, configForm.getYearFIT());

			ResultSet resultSet = pstmt.executeQuery();
			int count = 0;
			while (resultSet.next()) {
				count = resultSet.getInt(1);
			}
			if (count > 0) {
				// sql = " insert into
				// bcp_tax_fica_sdi(CompanyID,FITYear,autoFIT,FICARate,SocialTaxRate,SocialTaxLimit,MedicareTaxRate,FITRate,FUTARate)"
				// + "Values("+companyID+","+configForm.getYearFIT()+"," +
				// configForm.getAutoFIT()+ "," +configForm.getRateSocialTax() + "," +
				// configForm.getRateSocialTax()+ "," + configForm.getSocialTaxLimit()+ "," +
				// configForm.getRateMedicareTax()+ "," + configForm.getRateFIT()+ "," +
				// configForm.getRateFUTA() + ")";
				sql = "update  bcp_tax_fica_sdi set autoFIT = ?, FICARate = ?, SocialTaxRate = ?, SocialTaxLimit = ?, MedicareTaxRate = ?, FITRate = ?, FUTARate = ?  where CompanyID = ? and FITYear= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, configForm.getAutoFIT());
				pstmt.setDouble(2, configForm.getRateFICA());
				pstmt.setDouble(3, configForm.getRateSocialTax());
				pstmt.setDouble(4, configForm.getSocialTaxLimit());
				pstmt.setDouble(5, configForm.getRateMedicareTax());
				pstmt.setDouble(6, configForm.getRateFIT());
				pstmt.setDouble(7, configForm.getRateFUTA());
				pstmt.setString(8, companyID);
				pstmt.setInt(9, configForm.getYearFIT());
			} else {
				sql = " insert into bcp_tax_fica_sdi(autoFIT,FICARate,SocialTaxRate, SocialTaxLimit,MedicareTaxRate,FITRate,FUTARate,CompanyID,FITYear,Active) "
						+ " Values(?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, configForm.getAutoFIT());
				pstmt.setDouble(2, configForm.getRateFICA());
				pstmt.setDouble(3, configForm.getRateSocialTax());
				pstmt.setDouble(4, configForm.getSocialTaxLimit());
				pstmt.setDouble(5, configForm.getRateMedicareTax());
				pstmt.setDouble(6, configForm.getRateFIT());
				pstmt.setDouble(7, configForm.getRateFUTA());
				pstmt.setString(8, companyID);
				pstmt.setInt(9, configForm.getYearFIT());
				pstmt.setInt(10, 1);

			}

			// sql = " insert into bcp_jobtitle(JobTitle,Active,CompanyID)" + "Values( " +
			// "'" + jobTitle+ "'," + 1 + "," + companyID + ")";
			// sql = "update into bcp_tax_fica_sdi set autoFIT ="+configForm.getAutoFIT()+",
			// FICARate"+configForm.getRateFICA()+",
			// SocialTaxRate"+configForm.getRateSocialTax()+",
			// SocialTaxLimit"+configForm.getSocialTaxLimit()+",
			// MedicareTaxRate"+configForm.getRateMedicareTax()+",
			// FITRate"+configForm.getRateFIT()+", FUTARate="+configForm.getRateFUTA()+"
			// where CompanyID ="+companyID+" and FITYear="+configForm.getYearFIT();

			int rs = pstmt.executeUpdate();
			if (rs > 0) {
				System.out.println("**********Successfully Inserted**********");
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		} finally {
			try {

				if (con != null) {
					con.close();
				}

			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
	}

	public List<DeductionListDto> saveFIDCompanyTaxOptionDeduction(String companyID, DeductionListDto dto) {
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		PreparedStatement pstmt = null;
		con = db.getConnection();
		String sql = "";
		List<DeductionListDto> dtos = null;
		try {
			sql = "select count(*) from bcp_deductionlist where CompanyID = ? and DeductionListID= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, companyID);
			pstmt.setLong(2, dto.getDeductionListId());

			ResultSet resultSet = pstmt.executeQuery();
			int count = 0;
			while (resultSet.next()) {
				count = resultSet.getInt(1);
			}
			if (count > 0) {
				// sql = " insert into
				// bcp_tax_fica_sdi(CompanyID,FITYear,autoFIT,FICARate,SocialTaxRate,SocialTaxLimit,MedicareTaxRate,FITRate,FUTARate)"
				// + "Values("+companyID+","+configForm.getYearFIT()+"," +
				// configForm.getAutoFIT()+ "," +configForm.getRateSocialTax() + "," +
				// configForm.getRateSocialTax()+ "," + configForm.getSocialTaxLimit()+ "," +
				// configForm.getRateMedicareTax()+ "," + configForm.getRateFIT()+ "," +
				// configForm.getRateFUTA() + ")";
				sql = "update  bcp_deductionlist set DeductionList = ?, DeductionAmount = ?, DeductionRate = ?, IsTaxExempt = ? where CompanyID = ? and DeductionListID= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getDeductionListName());
				pstmt.setDouble(2, dto.getDeductionAmount());
				pstmt.setDouble(3, dto.getDeductionRate());
				pstmt.setDouble(4, dto.getIsTaxExempt());
				pstmt.setString(5, companyID);
				pstmt.setLong(6, dto.getDeductionListId());
			} else {
				sql = " insert into bcp_deductionlist(DeductionList,DeductionAmount,DeductionRate, IsTaxExempt,DateAdded, CompanyID) "
						+ " Values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getDeductionListName());
				pstmt.setDouble(2, dto.getDeductionAmount());
				pstmt.setDouble(3, dto.getDeductionRate());
				pstmt.setDouble(4, dto.getIsTaxExempt());
				pstmt.setDate(5, java.sql.Date.valueOf(java.time.LocalDate.now()));
				pstmt.setString(6, companyID);
			}

			// sql = " insert into bcp_jobtitle(JobTitle,Active,CompanyID)" + "Values( " +
			// "'" + jobTitle+ "'," + 1 + "," + companyID + ")";
			// sql = "update into bcp_tax_fica_sdi set autoFIT ="+configForm.getAutoFIT()+",
			// FICARate"+configForm.getRateFICA()+",
			// SocialTaxRate"+configForm.getRateSocialTax()+",
			// SocialTaxLimit"+configForm.getSocialTaxLimit()+",
			// MedicareTaxRate"+configForm.getRateMedicareTax()+",
			// FITRate"+configForm.getRateFIT()+", FUTARate="+configForm.getRateFUTA()+"
			// where CompanyID ="+companyID+" and FITYear="+configForm.getYearFIT();

			int rs = pstmt.executeUpdate();
			if (rs > 0) {
				// System.out.println("**********Successfully Inserted**********");
			}

			dtos = getDeductionListDtos(Long.valueOf(companyID));

		} catch (Exception e) {
			Loger.log(e.toString());
		} finally {
			try {

				if (con != null) {
					con.close();
				}

			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return dtos;
	}

	public List<CompanyTaxOptionDto> saveFIDCompanyTaxOption(String companyID, CompanyTaxOptionDto dto) {

		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		boolean valid = false;
		// ResultSet rs = null;

		PreparedStatement pstmt = null;

		try {

			if (StringUtils.isEmpty(dto.getDaily())) {
				dto.setDaily("0");
			}
			if (StringUtils.isEmpty(dto.getWeekly())) {
				dto.setWeekly("0");
			}
			if (StringUtils.isEmpty(dto.getAnnually())) {
				dto.setAnnually("0");
			}
			if (StringUtils.isEmpty(dto.getBiweekly())) {
				dto.setBiweekly("0");
			}
			if (StringUtils.isEmpty(dto.getQuarterly())) {
				dto.setQuarterly("0");
			}
			if (StringUtils.isEmpty(dto.getSemiAnnually())) {
				dto.setSemiAnnually("0");
			}
			if (StringUtils.isEmpty(dto.getSemiMonthly())) {
				dto.setSemiMonthly("0");
			}
			if (StringUtils.isEmpty(dto.getMonthly())) {
				dto.setMonthly("0");
			}
			if (StringUtils.isEmpty(dto.getDailyOverVal())) {
				dto.setDailyOverVal("0");
			}
			if (StringUtils.isEmpty(dto.getWeeklyOverVal())) {
				dto.setWeeklyOverVal("0");
			}
			if (StringUtils.isEmpty(dto.getWendSt())) {
				dto.setWendSt("0");
			}
			if (StringUtils.isEmpty(dto.getWendSn())) {
				dto.setWendSn("0");
			}
			if (StringUtils.isEmpty(dto.getDayOfWeekVal())) {
				dto.setDayOfWeekVal("0");
			}
			if (StringUtils.isEmpty(dto.getDayOfMonthVal())) {
				dto.setDayOfMonthVal("0");
			}
			if (StringUtils.isEmpty(dto.getHoliday())) {
				dto.setHoliday("0");
			}

			con = db.getConnection();

			String sql = "select count(*) from bcp_tax_company where CompanyID = ? and OptionId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, companyID);
			pstmt.setLong(2, dto.getOptionId());

			ResultSet resultSet = pstmt.executeQuery();
			int count = 0;
			while (resultSet.next()) {
				count = resultSet.getInt(1);
			}
			if (count > 0) {
				// sql = " insert into
				// bcp_tax_fica_sdi(CompanyID,FITYear,autoFIT,FICARate,SocialTaxRate,SocialTaxLimit,MedicareTaxRate,FITRate,FUTARate)"
				// + "Values("+companyID+","+configForm.getYearFIT()+"," +
				// configForm.getAutoFIT()+ "," +configForm.getRateSocialTax() + "," +
				// configForm.getRateSocialTax()+ "," + configForm.getSocialTaxLimit()+ "," +
				// configForm.getRateMedicareTax()+ "," + configForm.getRateFIT()+ "," +
				// configForm.getRateFUTA() + ")";
				sql = "UPDATE bcp_tax_company  set Daily= ? ,Weekly= ? ,SemiMonthly= ? ," + "Monthly= ? ,Quarterly= ? ,"
						+ "SemiAnnually= ? ,Annually= ? ,UsePayrollDayWeek= ? , "
						+ "PayrollDayWeek= ? ,UsePayrollDayMonth= ? ,PayrollDayMonth= ? ,"
						+ "UseOvertimeDailyHour= ? ,OvertimeDailyHour= ? ,UseOvertimeWeeklyHour= ? ,"
						+ "OvertimeWeeklyHour= ? ,OvertimeRate= ? ,UseSaturdayRate= ? ,SaturdayRate= ? ,"
						+ "UseSundayRate= ? ,SundayRate= ? ,UseHolidayRate= ? ,HolidayRate= ? ,"
						+ "BiWeekly= ? , StartingDate = ? where CompanyID = ?  and OptionID = ?  and Active not like '0' ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getDaily());
				pstmt.setString(2, dto.getWeekly());
				pstmt.setString(3, dto.getSemiMonthly());
				pstmt.setString(4, dto.getMonthly());
				pstmt.setString(5, dto.getQuarterly());
				pstmt.setString(6, dto.getSemiAnnually());
				pstmt.setString(7, dto.getAnnually());
				pstmt.setString(8, dto.getDayOfWeekVal());
				pstmt.setString(9, dto.getDayOfWeek());
				pstmt.setString(10, dto.getDayOfMonthVal());
				pstmt.setString(11, dto.getDayOfMonth());
				pstmt.setString(12, dto.getDailyOverVal());
				pstmt.setString(13, dto.getDailyOver());
				pstmt.setString(14, dto.getWeeklyOverVal());
				pstmt.setString(15, dto.getWeeklyOver());
				pstmt.setString(16, dto.getOvertimeRate());
				pstmt.setString(17, dto.getWendSt());
				pstmt.setString(18, dto.getWendStRate());
				pstmt.setString(19, dto.getWendSn());
				pstmt.setString(20, dto.getWendSnRate());
				pstmt.setString(21, dto.getHoliday());
				pstmt.setString(22, dto.getHolidayRate());
				pstmt.setString(23, dto.getBiweekly());
				pstmt.setString(24, dto.getStartingDate());
				pstmt.setString(25, companyID);
				pstmt.setLong(26, dto.getOptionId());

			} else {
				sql = " insert into bcp_tax_company(Daily,Weekly,SemiMonthly, Monthly,Quarterly,SemiAnnually,Annually, UsePayrollDayWeek,"
						+ " PayrollDayWeek,UsePayrollDayMonth, PayrollDayMonth,UseOvertimeDailyHour, OvertimeDailyHour, UseOvertimeWeeklyHour, "
						+ " OvertimeWeeklyHour, OvertimeRate, UseSaturdayRate,SaturdayRate,UseSundayRate, SundayRate,UseHolidayRate,HolidayRate,BiWeekly,"
						+ " CompanyID, Active,StartingDate,DateAdded) "
						+ " Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, now())";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getDaily());
				pstmt.setString(2, dto.getWeekly());
				pstmt.setString(3, dto.getSemiMonthly());
				pstmt.setString(4, dto.getMonthly());
				pstmt.setString(5, dto.getQuarterly());
				pstmt.setString(6, dto.getSemiAnnually());
				pstmt.setString(7, dto.getAnnually());
				pstmt.setString(8, dto.getDayOfWeekVal());
				pstmt.setString(9, dto.getDayOfWeek());
				pstmt.setString(10, dto.getDayOfMonthVal());
				pstmt.setString(11, dto.getDayOfMonth());
				pstmt.setString(12, dto.getDailyOverVal());
				pstmt.setString(13, dto.getDailyOver());
				pstmt.setString(14, dto.getWeeklyOverVal());
				pstmt.setString(15, dto.getWeeklyOver());
				pstmt.setString(16, dto.getOvertimeRate());
				pstmt.setString(17, dto.getWendSt());
				pstmt.setString(18, dto.getWendStRate());
				pstmt.setString(19, dto.getWendSn());
				pstmt.setString(20, dto.getWendSnRate());
				pstmt.setString(21, dto.getHoliday());
				pstmt.setString(22, dto.getHolidayRate());
				pstmt.setString(23, dto.getBiweekly());
				pstmt.setString(24, companyID);
				pstmt.setInt(25, 1);
				pstmt.setString(26, dto.getStartingDate());

			}

			int rs = pstmt.executeUpdate();
			if (rs > 0) {

			}

		} catch (SQLException ee) {
			Loger.log(2, "Error in editCompanyTaxOption() " + ee);
		} finally {
			try {
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

		return loadCompanyTaxOption(companyID);
	}

	public StateIncomeTaxDto saveSID(String companyID, StateIncomeTaxDto dto) {

		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		boolean valid = false;
		// ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {

			con = db.getConnection();

			String sql = "select count(*) from conf_tax_state where CompanyID = ? and StateId = ? and Active not like '0'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, companyID);
			pstmt.setLong(2, dto.getStateId());

			ResultSet resultSet = pstmt.executeQuery();
			int count = 0;
			while (resultSet.next()) {
				count = resultSet.getInt(1);
			}
			if (count > 0) {
				// sql = " insert into
				// bcp_tax_fica_sdi(CompanyID,FITYear,autoFIT,FICARate,SocialTaxRate,SocialTaxLimit,MedicareTaxRate,FITRate,FUTARate)"
				// + "Values("+companyID+","+configForm.getYearFIT()+"," +
				// configForm.getAutoFIT()+ "," +configForm.getRateSocialTax() + "," +
				// configForm.getRateSocialTax()+ "," + configForm.getSocialTaxLimit()+ "," +
				// configForm.getRateMedicareTax()+ "," + configForm.getRateFIT()+ "," +
				// configForm.getRateFUTA() + ")";
				sql = "UPDATE conf_tax_state  set StateTaxID= ?  , PITRate = ? ,"
						+ " SDILimit = ? , SDIRate = ? , UILimit = ? , UIRate = ? , " + " ETTLimit = ? , ETTRate = ? , "
						+ " UseOtherStateTaxName1 = ? , OtherStateTaxName1 = ? , "
						+ " OtherStateTaxRate1 = ? , OtherStateTaxLimit1 = ? , "
						+ " UseOtherStateTaxName2 = ? , OtherStateTaxName2 = ? , "
						+ " OtherStateTaxRate2 = ? , OtherStateTaxLimit2 = ? , "
						+ " UseOtherStateTaxName3 = ? , OtherStateTaxName3 = ? , "
						+ " OtherStateTaxRate3 = ? , OtherStateTaxLimit3 = ?"
						+ " where CompanyID = ?  and StateId = ?  and Active not like '0' ";
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, dto.getStateTaxId());
				pstmt.setDouble(2, dto.getPitRate() != null ? dto.getPitRate() : 0);
				pstmt.setDouble(3, dto.getUpToSdi() != null ? dto.getUpToSdi() : 0);
				pstmt.setDouble(4, dto.getSdiRate() != null ? dto.getSdiRate() : 0);
				pstmt.setDouble(5, dto.getUpToui() != null ? dto.getUpToui() : 0);
				pstmt.setDouble(6, dto.getUiRate() != null ? dto.getUiRate() : 0);
				pstmt.setDouble(7, dto.getUpToEtt() != null ? dto.getUpToEtt() : 0);
				pstmt.setDouble(8, dto.getEttRate() != null ? dto.getEttRate() : 0);

				pstmt.setInt(9, dto.getOtherStateChck1());
				pstmt.setString(10, dto.getOtherStateInput1());
				pstmt.setDouble(11, dto.getOtherStateTaxRate1() != null ? dto.getOtherStateTaxRate1() : 0);
				pstmt.setDouble(12, dto.getOtherStateUpto1() != null ? dto.getOtherStateUpto1() : 0);

				pstmt.setInt(13, dto.getOtherStateChck2());
				pstmt.setString(14, dto.getOtherStateInput2());
				pstmt.setDouble(15, dto.getOtherStateTaxRate2() != null ? dto.getOtherStateTaxRate2() : 0);
				pstmt.setDouble(16, dto.getOtherStateUpto2() != null ? dto.getOtherStateUpto2() : 0);

				pstmt.setInt(17, dto.getOtherStateChck3());
				pstmt.setString(18, dto.getOtherStateInput3());
				pstmt.setDouble(19, dto.getOtherStateTaxRate3() != null ? dto.getOtherStateTaxRate3() : 0);
				pstmt.setDouble(20, dto.getOtherStateUpto3() != null ? dto.getOtherStateUpto3() : 0);

				pstmt.setString(21, companyID);
				pstmt.setLong(22, dto.getStateId());

			} else {
				sql = " insert into conf_tax_state(StateTaxID,PITRate,SDILimit , SDIRate , UILimit,UIRate, ETTLimit, ETTRate, UseOtherStateTaxName1, OtherStateTaxName1, OtherStateTaxRate1, OtherStateTaxLimit1,UseOtherStateTaxName2, OtherStateTaxName2, OtherStateTaxRate2, OtherStateTaxLimit2 , UseOtherStateTaxName3, OtherStateTaxName3, OtherStateTaxRate3, OtherStateTaxLimit3,CompanyID, StateId, Active ) "
						+ " Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)";

				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, dto.getStateTaxId());
				pstmt.setDouble(2, dto.getPitRate() != null ? dto.getPitRate() : 0);
				pstmt.setDouble(3, dto.getUpToSdi() != null ? dto.getUpToSdi() : 0);
				pstmt.setDouble(4, dto.getSdiRate() != null ? dto.getSdiRate() : 0);
				pstmt.setDouble(5, dto.getUpToui() != null ? dto.getUpToui() : 0);
				pstmt.setDouble(6, dto.getUiRate() != null ? dto.getUiRate() : 0);
				pstmt.setDouble(7, dto.getUpToEtt() != null ? dto.getUpToEtt() : 0);
				pstmt.setDouble(8, dto.getEttRate() != null ? dto.getEttRate() : 0);

				pstmt.setInt(9, dto.getOtherStateChck1());
				pstmt.setString(10, dto.getOtherStateInput1());
				pstmt.setDouble(11, dto.getOtherStateTaxRate1() != null ? dto.getOtherStateTaxRate1() : 0);
				pstmt.setDouble(12, dto.getOtherStateUpto1() != null ? dto.getOtherStateUpto1() : 0);

				pstmt.setInt(13, dto.getOtherStateChck2());
				pstmt.setString(14, dto.getOtherStateInput2());
				pstmt.setDouble(15, dto.getOtherStateTaxRate2() != null ? dto.getOtherStateTaxRate2() : 0);
				pstmt.setDouble(16, dto.getOtherStateUpto2() != null ? dto.getOtherStateUpto2() : 0);

				pstmt.setInt(17, dto.getOtherStateChck3());
				pstmt.setString(18, dto.getOtherStateInput3());
				pstmt.setDouble(19, dto.getOtherStateTaxRate3() != null ? dto.getOtherStateTaxRate3() : 0);
				pstmt.setDouble(20, dto.getOtherStateUpto3() != null ? dto.getOtherStateUpto3() : 0);

				pstmt.setString(21, companyID);
				pstmt.setLong(22, dto.getStateId());

			}

			int rs = pstmt.executeUpdate();
			if (rs > 0) {

			}

		} catch (SQLException ee) {

			Loger.log(2, "Error in editCompanyTaxOption() " + ee);
		} finally {
			try {
				if (con != null) {
					con.close();
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

		return dto;
	}

	public StateIncomeTaxDto saveSIDStateSetAsDefault(String companyID, StateIncomeTaxDto dto) {

		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		boolean valid = false;
		// ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {

			con = db.getConnection();

			String sql = "UPDATE conf_tax_state set SetAsDefault = 0 where CompanyID = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, companyID);

			int result = pstmt.executeUpdate();

			sql = "UPDATE conf_tax_state set SetAsDefault = 1 where CompanyID = ?  and StateId = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, companyID);
			pstmt.setLong(2, dto.getStateId());

			result = pstmt.executeUpdate();

		} catch (SQLException ee) {

			Loger.log(2, "Error in editCompanyTaxOption() " + ee);
		} finally {
			try {
				if (con != null) {
					con.close();
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

		return loadSID(companyID, dto.getStateId());
	}

	public StateIncomeTaxDto saveSIDStateSetActive(String companyID, StateIncomeTaxDto dto) {

		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		boolean valid = false;
		// ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {

			con = db.getConnection();

			String sql = "UPDATE conf_tax_state set Active = ? where CompanyID = ?  and StateId = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getActive() != null && dto.getActive() ? 1 : 0);
			pstmt.setString(2, companyID);
			pstmt.setLong(3, dto.getStateId());

			int result = pstmt.executeUpdate();

		} catch (SQLException ee) {

			Loger.log(2, "Error in editCompanyTaxOption() " + ee);
		} finally {
			try {
				if (con != null) {
					con.close();
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

		return loadSID(companyID, dto.getStateId());
	}
//Tax Section is not Converted due to table/entity is not available.. need to understand the requirement #ENDS

	@Autowired
	private BcpDeductionlistRepository deductionListRepository;

	public List<DeductionListDto> deleteFIDCompanyTaxOptionDeduction(Long companyID, DeductionListDto dto) {
		deductionListRepository.findByCompany_CompanyIdAndDeductionListId(companyID, dto.getDeductionListId())
				.ifPresent(deductionList -> {
					deductionList.setActive(0);
					deductionListRepository.save(deductionList);
				});

		List<DeductionListDto> dtos = null;
		dtos = getDeductionListDtos(companyID);
		return dtos;
	}

//	public List<DeductionListDto> deleteFIDCompanyTaxOptionDeduction(String companyID, DeductionListDto dto) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		PreparedStatement pstmt = null;
//		con = db.getConnection();
//		String sql = "";
//		List<DeductionListDto> dtos = null;
//		try {
//			sql = "update  bcp_deductionlist set Active = 0 where CompanyID = ? and DeductionListID= ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, companyID);
//			pstmt.setLong(2, dto.getDeductionListId());
//
//			int rs = pstmt.executeUpdate();
//			if (rs > 0) {
//				// System.out.println("**********Successfully Inserted**********");
//			}
//
//			dtos = getDeductionListDtos(companyID, con.createStatement());
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//
//				if (con != null) {
//					con.close();
//				}
//
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return dtos;
//	}

	public List<CompanyTaxOptionDto> deleteFIDCompanyTaxOption(String companyID, CompanyTaxOptionDto dto) {
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		PreparedStatement pstmt = null;
		con = db.getConnection();
		String sql = "";
		try {
			sql = "update  bcp_tax_company set Active = 0 where CompanyID = ? and OptionId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, companyID);
			pstmt.setLong(2, dto.getOptionId());

			int rs = pstmt.executeUpdate();
			if (rs > 0) {
				// System.out.println("**********Successfully Inserted**********");
			}

		} catch (Exception e) {
			Loger.log(e.toString());
		} finally {
			try {

				if (con != null) {
					con.close();
				}

			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return loadCompanyTaxOption(companyID);
	}

	public void loadTaxProperties(String companyID, int fitYear, ConfigurationDto form) {
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		Statement stmt = null;
		ResultSet rs = null;
		con = db.getConnection();
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
		try {
			stmt = con.createStatement();
			String sql = "select autoFIT, FITYear, FICARate, SocialTaxRate, SocialTaxLimit, MedicareTaxRate, FITRate, FUTARate from bcp_tax_fica_sdi where CompanyID ="
					+ companyID + " and FITYear=" + fitYear + " and Active not like '0'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				form.setAutoFIT(rs.getInt("autoFIT"));
				form.setYearFIT(rs.getInt("FITYear"));
				form.setRateFICA(rs.getDouble("FICARate"));
				form.setRateSocialTax(rs.getDouble("SocialTaxRate"));
				form.setSocialTaxLimit(rs.getDouble("SocialTaxLimit"));
				form.setRateMedicareTax(rs.getDouble("MedicareTaxRate"));
				form.setRateFUTA(rs.getDouble("FUTARate"));
				form.setRateFIT(rs.getDouble("FITRate"));
			}
			List<DeductionListDto> dtos = getDeductionListDtos(Long.valueOf(companyID));
			form.setDeductionList(dtos);
		} catch (Exception e) {
			Loger.log(e.toString());
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
	}

	private List<DeductionListDto> getDeductionListDtos(Long companyID) {
		return deductionListRepository.findByActiveAndCompany_CompanyId(1, companyID).stream()
				.map(this::convertToDeductionListDto).collect(Collectors.toList());
	}

	private DeductionListDto convertToDeductionListDto(BcpDeductionlist entity) {
		DeductionListDto dto = new DeductionListDto();
		dto.setDeductionListId(entity.getDeductionListId().longValue());
		dto.setDeductionListName(entity.getDeductionList());
		dto.setDeductionAmount(entity.getDeductionAmount());
		dto.setDeductionRate(entity.getDeductionRate());
		dto.setIsTaxExempt(entity.getIsTaxExempt() ? 1 : 0);
		dto.setCreatedAt(entity.getDateAdded().toString());
		dto.setUseRate(entity.getUseRate() ? 1 : 0);
		return dto;
	}

//	private List<DeductionListDto> getDeductionListDtos(String companyID, Statement stmt) throws SQLException {
//		String sql;
//		ResultSet rs;
//		sql = "select  DeductionListID, DeductionList, DeductionAmount, DeductionRate, IsTaxExempt, DateAdded , UseRate from bcp_deductionlist where Active=1 and CompanyID ="
//				+ companyID;
//		rs = stmt.executeQuery(sql);
//		List<DeductionListDto> dtos = new ArrayList<DeductionListDto>();
//		while (rs.next()) {
//			DeductionListDto dto = new DeductionListDto();
//			dto.setDeductionListId(rs.getLong("DeductionListID"));
//			dto.setDeductionListName(rs.getString("DeductionList"));
//			dto.setDeductionAmount(rs.getInt("DeductionAmount"));
//			dto.setDeductionRate(rs.getInt("DeductionRate"));
//			dto.setIsTaxExempt(rs.getInt("IsTaxExempt"));
//			dto.setCreatedAt(rs.getDate("DateAdded").toString());
//			dto.setUseRate(rs.getInt("UseRate"));
//
//			dtos.add(dto);
//		}
//		return dtos;
//	}

	@Autowired
	private BcpJobtitleRepository jobTitleRepository;

	public ArrayList<ConfigurationDto> getJobTitle(Long companyId, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcpJobtitle> jobTitles = jobTitleRepository.findByCompany_CompanyIdAndActive(companyId, 1);
			for (BcpJobtitle jobTitle : jobTitles) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelecctedJobTitleId(jobTitle.getJobTitleId());
				pojo.setJobTitleId(jobTitle.getJobTitleId());
				pojo.setJobTitleName(jobTitle.getJobTitle());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfJobTitle(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getJobTitle(HttpServletRequest request, ConfigurationDto form,
//			String companyID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = "Select * from bcp_jobtitle where CompanyID = " + companyID + " AND Active = 1";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelecctedJobTitleId(rs.getInt("JobTitleID"));
//				pojo.setJobTitleId(rs.getInt("JobTitleID"));
//				pojo.setJobTitleName(rs.getString("JobTitle"));
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfJobTitle(listPOJOs);
//		return listPOJOs;
//	}

	// not updated
	public ArrayList<ConfigurationDto> getAccessPermissions(String companyID, HttpServletRequest request,
			ConfigurationDto configForm) {
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		Statement stmt = null;
		ResultSet rs = null;
		con = db.getConnection();
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
		String sql = "";
		Statement stmt1 = null;
		Statement stmt2 = null;
		Statement stmt3 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		try {
			stmt = con.createStatement();
			sql = " SELECT * from bca_usermodules LEFT JOIN bca_businessmodules ON "
					+ " bca_usermodules.ModuleID = bca_businessmodules.ModuleID" + " WHERE "
					+ " (bca_businessmodules.Active is null " + " OR bca_businessmodules.Active =1 and companyID ="
					+ companyID + ") and ParentID=0";

			stmt1 = con.createStatement();
			rs1 = stmt1.executeQuery(sql);

			while (rs1.next()) {
				pojo = new ConfigurationDto();
				pojo.setModuleID(rs1.getInt("ModuleID"));
				pojo.setModuleName(rs1.getString("ModuleName"));
				pojo.setParentID(rs1.getInt("ParentID"));
				listPOJOs.add(pojo);
				stmt2 = con.createStatement();
				String sql2 = "SELECT * FROM bca_usermodules WHERE ParentID=" + pojo.getModuleID();
				rs2 = stmt2.executeQuery(sql2);

				while (rs2.next()) {
					pojo = new ConfigurationDto();
					pojo.setModuleID(rs2.getInt("ModuleID"));
					pojo.setModuleName(rs2.getString("ModuleName"));
					pojo.setParentID(rs2.getInt("ParentID"));
					listPOJOs.add(pojo);
					stmt3 = con.createStatement();
					String sql3 = "SELECT * FROM bca_usermodules " + "WHERE ParentID=" + pojo.getModuleID();
					rs3 = stmt3.executeQuery(sql3);

					while (rs3.next()) {
						pojo = new ConfigurationDto();
						pojo.setModuleID(rs3.getInt("ModuleID"));
						pojo.setModuleName(rs3.getString("ModuleName"));
						pojo.setParentID(rs3.getInt("ParentID"));
						listPOJOs.add(pojo);
					}

				}
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			Loger.log(e.toString());
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
		configForm.setListOfExistingModule(listPOJOs);
		return listPOJOs;
	}

	public void saveJobTitle(Long companyID, HttpServletRequest request, ConfigurationDto configForm, String jobTitle) {
		try {
			BcpJobtitle newJobTitle = new BcpJobtitle();
			newJobTitle.setJobTitle(jobTitle);
			newJobTitle.setActive(1);

			// Fetch the company entity by companyID
			companyRepository.findById(companyID).ifPresent(newJobTitle::setCompany);

			jobTitleRepository.save(newJobTitle);
			System.out.println("**********Successfully Inserted**********");
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}
	}
//	public void saveJobTitle(String companyID, HttpServletRequest request, ConfigurationDto configForm,
//			String jobTitle) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		con = db.getConnection();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = " insert into bcp_jobtitle(JobTitle,Active,CompanyID)" + "Values( " + "'" + jobTitle + "'," + 1 + ","
//					+ companyID + ")";
//			int rs = stmt.executeUpdate(sql);
//			if (rs > 0) {
//				System.out.println("**********Successfully Inserted**********");
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//
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
//	}

	public void editJobTitle(String companyID, ConfigurationDto configForm, String jobTitle, int id) {
		try {
			jobTitleRepository.findById(id).ifPresent(jobTitleEntity -> {
				jobTitleEntity.setJobTitle(jobTitle);
				// Optionally, you can also verify and set the company again
				jobTitleRepository.save(jobTitleEntity);
				System.out.println("**********Successfully Updated**********");
			});
		} catch (Exception e) {
			Loger.log(e.toString());
		}
	}

//	public void editJobTitle(String companyID, HttpServletRequest request, ConfigurationDto configForm, String jobTitle,
//			int id) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//
//		con = db.getConnection();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = " update bcp_jobtitle set JobTitle ='" + jobTitle + "' WHERE CompanyID = " + companyID
//					+ " AND JobTitleID = " + id;
//			int rs = stmt.executeUpdate(sql);
//			if (rs > 0) {
//				System.out.println("**********Successfully Updated**********");
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//
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
//	}

	public void deleteJobTitle(Long companyID, ConfigurationDto configForm, int id) {
		try {
			jobTitleRepository.findById(id).ifPresent(jobTitle -> {
				if (jobTitle.getCompany() != null && jobTitle.getCompany().getCompanyId().equals(companyID)) {
					jobTitle.setActive(0); // Setting Active to false instead of deleting
					jobTitleRepository.save(jobTitle);
					System.out.println("**********Successfully Deleted**********");
				}
			});
		} catch (Exception e) {
			Loger.log(e.toString());
		}
	}

//	public void deleteJobTitle(String companyID, HttpServletRequest request, ConfigurationDto configForm, int id) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		con = db.getConnection();
//		String sql = "";
//		try {
//			stmt = con.createStatement();
//			sql = " update bcp_jobtitle set Active = 0 WHERE JobTitleID = " + id + " AND CompanyID = " + companyID;
//			int rs = stmt.executeUpdate(sql);
//			if (rs > 0) {
//				System.out.println("**********Successfully Deleted**********");
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//
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
//
//	}
	@Autowired
	private BcaMasterstartingmoduleRepository masterStartingModuleRepository;

	public ArrayList<ConfigurationDto> getModulesName(ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaMasterstartingmodule> modules = masterStartingModuleRepository.findAllByOrderByModuleName();
			for (BcaMasterstartingmodule module : modules) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setModuleName(module.getModuleName());
				pojo.setModuleID(module.getStartModuleId());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingModuleNames(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getModulesName(ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		String dateBetween = "";
//		DateInfo dInfo = new DateInfo();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		ArrayList<Date> selectedRange = new ArrayList<>();
//		CustomerInfo cInfo = new CustomerInfo();
//
//		try {
//			stmt = con.createStatement();
//
//			String sql1 = "SELECT BusinessTypeID,ModuleName,StartModuleID " + "FROM " + "bca_masterstartingmodule "
//					+ "order by ModuleName";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setModuleName(rs.getString("ModuleName"));
//				pojo.setModuleID(rs.getInt("StartModuleID"));
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingModuleNames(listPOJOs);
//		// request.setAttribute("companyname",form.getCompanyName());
//
//		return listPOJOs;
//	}

	public int getdefaultModuleName(Long companyID) {
		try {
			return preferenceRepository.findByCompany_CompanyId(companyID).map(BcaPreference::getDefaultModule)
					.orElse(0); // Default to 0 if not found
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
			return 0;
		}
	}

//	public int getdefaultModuleName(String companyID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//
//		int defaultModule = 0;
//		try {
//			con = db.getConnection();
//			String sql = "SELECT defaultModule FROM bca_preference where CompanyID  =" + companyID;
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			if (rs.next()) {
//				defaultModule = rs.getInt(1);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return defaultModule;
//
//	}

	@Autowired
	private BcaUnitofmeasureRepository unitOfMeasureRepository;

	public ArrayList<ConfigurationDto> getWeight(Long companyID, ConfigurationDto form) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			// Fetch the parent unit for 'Weight'
			unitOfMeasureRepository.findByCompany_CompanyIdAndNameAndParentIdAndActive(companyID, "Weight", 0, 1)
					.ifPresent(parentUnit -> {
						// Fetch all active child units of 'Weight'
						List<BcaUnitofmeasure> weights = unitOfMeasureRepository
								.findByCompany_CompanyIdAndParentIdAndActive(companyID, parentUnit.getUnitCategoryId(),
										1);
						for (BcaUnitofmeasure weight : weights) {
							ConfigurationDto pojo = new ConfigurationDto();
							pojo.setWeightID(weight.getUnitCategoryId());
							pojo.setWeightName(weight.getName());
							listPOJOs.add(pojo);
						}
					});
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		form.setListOfExistingWeights(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getWeight(String companyID, ConfigurationDto form) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		String dateBetween = "";
//		DateInfo dInfo = new DateInfo();
//		int parentID = -1;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		ArrayList<Date> selectedRange = new ArrayList<>();
//		CustomerInfo cInfo = new CustomerInfo();
//
//		try {
//			stmt = con.createStatement();
//
//			String sql1 = "SELECT UnitCategoryID " + " FROM bca_unitofmeasure " + " WHERE CompanyID = " + companyID
//					+ " AND ParentId = 0" + " AND Name='Weight'" + " AND Active = 1 ";
//
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				parentID = rs.getInt("UnitCategoryID");
//			}
//
//			String sql = "SELECT * " + " FROM bca_unitofmeasure " + " WHERE CompanyID = " + companyID
//					+ " AND ParentId = " + parentID + " AND Active = 1 ";
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setWeightID(rs.getInt("UnitCategoryID"));
//				pojo.setWeightName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		form.setListOfExistingWeights(listPOJOs);
//		// request.setAttribute("companyname",form.getCompanyName());
//
//		return listPOJOs;
//	}

	public ArrayList<ConfigurationDto> getPackingSlipTemplate(Long companyID, ConfigurationDto cForm) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaInvoiceTemplate> templates = invoiceTemplateRepository.findCustomTemplates(8, 14, companyID);

			for (BcaInvoiceTemplate template : templates) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setPackingSlipTemplateId(template.getBaseTemplateId()); // Adjust according to your entity
				pojo.setPackingSlipTemplateName(template.getTemplateName());
				// Set other properties as needed
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		cForm.setListOfExistingPackingSlipTemplate(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getPackingSlipTemplate(String companyID, HttpServletRequest request,
//			ConfigurationDto cForm) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//
//			String sql = "select * from bca_invoice_template " + "LEFT JOIN bca_invoice_activetemplates "
//					+ "ON bca_invoice_activetemplates.TemplateId = bca_invoice_template.BaseTemplateID "
//					+ "WHERE TemplateStyleTypeID = 8 " + "AND bca_invoice_template.TemplateTypeId = 14 "
//					+ "AND (CompanyID = " + companyID + " OR CompanyID = -1 )";
//
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setPackingSlipTemplateId(rs.getInt("TemplateId"));
//				pojo.setPackingSlipTemplateName(rs.getString("TemplateName"));
//				pojo.setBaseTemplateId(rs.getInt("BaseTemplateId"));
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		cForm.setListOfExistingPackingSlipTemplate(listPOJOs);
//
//		return listPOJOs;
//	}

	@Autowired
	private BcaJobcategoryRepository jobCategoryRepository;

	public ArrayList<ConfigurationDto> getJobCategory(Long cId, HttpServletRequest request, ConfigurationDto cForm) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaJobcategory> jobCategories = jobCategoryRepository
					.findByCompany_CompanyIdAndActiveAndIsRecurringServiceJob(cId, 1, 1);
			for (BcaJobcategory category : jobCategories) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setJobCategoryId(category.getJobCategoryId());
				pojo.setJobCategory(category.getName());
				pojo.setRecurringServiceBill(category.getIsRecurringServiceJob() == 1 ? "on" : "off");
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		cForm.setListOfExistingJobCategory(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getJobCategory(String cId, HttpServletRequest request, ConfigurationDto cForm) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			String sql1 = "SELECT * FROM bca_jobcategory WHERE CompanyID = " + cId
//					+ " AND Active=1 AND isRecurringServiceJob=1 ORDER BY Name";
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setJobCategoryId(rs.getInt("JobCategoryID"));
//				pojo.setJobCategory(rs.getString("Name"));
//				if (rs.getInt("isRecurringServiceJob") == 1) {
//					pojo.setRecurringServiceBill("on");
//				} else {
//					pojo.setRecurringServiceBill("off");
//				}
//				listPOJOs.add(pojo);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		cForm.setListOfExistingJobCategory(listPOJOs);
//		return listPOJOs;
//	}

	@Autowired
	private BcpEmployeeRepository employeeRepository;

	public ArrayList<ConfigurationDto> getActiveEmployee(Long companyID, HttpServletRequest request,
			ConfigurationDto cForm) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<String> statuses = Arrays.asList("N", "U");
			List<BcpEmployee> employees = employeeRepository.findByCompany_CompanyIdAndStatusInAndActive(companyID,
					statuses, 1);
			for (BcpEmployee employee : employees) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setSelectedActiveEmployeeId(employee.getEmployeeId());
				String fullName = employee.getFirstName() + " " + employee.getLastName();
				pojo.setActiveEmployeeName(fullName);
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		cForm.setListOfExistingActiveEmployee(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getActiveEmployee(String companyID, HttpServletRequest request,
//			ConfigurationDto cForm) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//
//			String sql = "SELECT EmployeeIndexID,EmployeeID,FirstName,LastName,NickName,SSN,Address1,Address2,"
//					+ " City,State,Province,Country,ZipCode,Phone,CellPhone,Email,EmployeeTitleID,"
//					+ " JobTitleID,EmployeeTypeID,Amount,PayrollPeriodID,FilingStatusID,"
//					+ " Allowance,TaxState,DateofBirth,DateAdded,DateStarted,DateTerminated,Detail, Active,"
//					+ " Hourly,Daily,Salary,UseJobCode " + " FROM bcp_employee " + " WHERE CompanyID = " + companyID
//					+ " AND Status IN ('N','U') " + " AND Active = 1 " + " ORDER BY FirstName,LastName ASC";
//
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setSelectedActiveEmployeeId(rs.getInt("EmployeeID"));
//				String fullName = rs.getString("FirstName") + " " + rs.getString("LastName");
//				// System.out.println("Active Employee Name:"+fullName);
//				pojo.setActiveEmployeeName(fullName);
//				listPOJOs.add(pojo);
//			}
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		cForm.setListOfExistingActiveEmployee(listPOJOs);
//
//		return listPOJOs;
//	}

	@Autowired
	private BcaShipcarrierRepository shipCarrierRepository;

	public ArrayList<ConfigurationDto> getShipCarrier(Long companyID, HttpServletRequest request,
			ConfigurationDto cForm) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaShipcarrier> carriers = shipCarrierRepository.findByCompany_CompanyIdAndParentIdAndActive(companyID,
					0, 1);
			for (BcaShipcarrier carrier : carriers) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setShipCarrierId(carrier.getShipCarrierId());
				pojo.setShipCarrierName(carrier.getName());
				listPOJOs.add(pojo);

				if (carrier.getName().equals("User Defined")) {
					List<BcaShipcarrier> childCarriers = shipCarrierRepository
							.findByCompany_CompanyIdAndParentIdAndActive(companyID, carrier.getShipCarrierId(), 1);
					for (BcaShipcarrier child : childCarriers) {
						ConfigurationDto childPojo = new ConfigurationDto();
						childPojo.setShipCarrierId(child.getShipCarrierId());
						childPojo.setShipCarrierName("    " + child.getName());
						childPojo.setShipCarrierParentId(child.getParentId());
						listPOJOs.add(childPojo);
					}
				}
			}
			readSMCAll(cForm, companyID);
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		cForm.setListOfExistingShipCarrier(listPOJOs);
		return listPOJOs;
	}

//	public ArrayList<ConfigurationDto> getShipCarrier(String companyID, HttpServletRequest request,
//			ConfigurationDto cForm) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		// TODO Auto-generated method stub
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		ResultSet rs1 = null;
//		Statement stmt1 = null;
//
//		con = db.getConnection();
//
//		String sql = "SELECT ShipCarrierID,Name " + "FROM bca_shipcarrier WHERE CompanyID =" + companyID + " "
//				+ "AND ParentID = 0 AND Active =1 " + "ORDER BY ShipCarrierID";
//
//		try {
//			stmt = con.createStatement();
//			stmt1 = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setShipCarrierId(rs.getInt(("ShipCarrierID")));
//				int shipCarrierID = rs.getInt(("ShipCarrierID"));
//				pojo.setShipCarrierName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//				if (rs.getString("Name").equals("User Defined")) {
//					sql = "SELECT ShipCarrierID,Name,ParentID " + " FROM bca_shipcarrier " + " WHERE CompanyID = "
//							+ companyID + "" + " AND Active =1 AND ParentID = " + shipCarrierID + " ORDER BY Name";
//					rs1 = stmt1.executeQuery(sql);
//
//					while (rs1.next()) {
//						pojo = new ConfigurationDto();
//						pojo.setShipCarrierId(rs1.getInt(("ShipCarrierID")));
//						pojo.setShipCarrierName("    " + rs1.getString("Name"));
//						pojo.setShipCarrierParentId(rs1.getInt("ParentID"));
//						listPOJOs.add(pojo);
//					}
//				}
//			}
//			readSMCAll(cForm, companyID);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (stmt != null) {
//					db.close(stmt);
//				}
//				db.close(rs1);
//				db.close(stmt1);
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		cForm.setListOfExistingShipCarrier(listPOJOs);
//		return listPOJOs;
//	}

	private ArrayList<ConfigurationDto> readSMCAll(ConfigurationDto cForm, Long companyID) {
		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();

		try {
			List<BcaShipcarrier> carriers = shipCarrierRepository
					.findByCompany_CompanyIdAndParentIdAndActiveAndNameNot(companyID, 0, 1, "User Defined");
			for (BcaShipcarrier carrier : carriers) {
				ConfigurationDto pojo = new ConfigurationDto();
				pojo.setShipCarrierId(carrier.getShipCarrierId());
				pojo.setShipCarrierName(carrier.getName());
				listPOJOs.add(pojo);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		return listPOJOs;
	}
//	private ArrayList<ConfigurationDto> readSMCAll(ConfigurationDto cForm, String companyID) {
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		Statement stmt = null;
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<ConfigurationDto> listPOJOs = new ArrayList<>();
//		try {
//			String sql = "SELECT ShipCarrierID,Name,ParentID FROM bca_shipcarrier " + " WHERE CompanyID = " + companyID
//					+ " AND Active=1 AND ParentID=0 AND Name <> 'User Defined' ORDER BY Name";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				pojo = new ConfigurationDto();
//				pojo.setShipCarrierId(rs.getInt(("ShipCarrierID")));
//				pojo.setShipCarrierName(rs.getString("Name"));
//				listPOJOs.add(pojo);
//			}
//		} catch (SQLException e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return listPOJOs;
//	}

	@Autowired
	private BcaCustomerTypeRepository customerTypeRepository;

	public List<LabelValueBean> getCustomerTypeList(Long companyID) {
		List<LabelValueBean> ctTypeList = new ArrayList<>();

		try {
			List<BcaCustomerType> customerTypes = customerTypeRepository.findByCompany_CompanyIdAndDeleted(companyID,
					0);
			for (BcaCustomerType customerType : customerTypes) {
				ctTypeList.add(new LabelValueBean(customerType.getName(), customerType.getId().toString()));
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		return ctTypeList;
	}

//	public List<LabelValueBean> getCustomerTypeList(String companyID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		List<LabelValueBean> ctTypeList = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("SELECT * FROM bca_customer_type WHERE Deleted=0 AND CompanyID=" + companyID);
//			while (rs.next()) {
//				ctTypeList.add(new LabelValueBean(rs.getString("Name"), rs.getString("ID")));
//			}
//		} catch (SQLException e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return ctTypeList;
//	}

	public void saveCustomerType(String ID, String cTypeName, Long companyID) {
		try {
			BcaCustomerType customerType;
			BcaCompany company = companyRepository.findById(companyID).orElse(null);

			if (company == null) {
				// Handle the case where the company is not found
				return;
			}

			if (!ID.equalsIgnoreCase("0")) {
				// Update existing customer type
				Integer id = Integer.parseInt(ID);
				customerType = customerTypeRepository.findById(id).orElse(null);
				if (customerType != null) {
					customerType.setName(cTypeName);
					customerType.setCompany(company);
				}
			} else {
				// Create new customer type
				customerType = new BcaCustomerType();
				customerType.setName(cTypeName);
				customerType.setCompany(company);
				customerType.setDeleted(0);
			}

			if (customerType != null) {
				customerTypeRepository.save(customerType);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}
	}

//	public void saveCustomerType(String ID, String cTypeName, String companyID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		try {
//			String sql3 = "INSERT INTO bca_customer_type(Name, CompanyID, Deleted) VALUES('" + cTypeName + "',"
//					+ companyID + ",0)";
//			if (!ID.equalsIgnoreCase("0")) {
//				sql3 = "UPDATE bca_customer_type SET Name='" + cTypeName + "',CompanyID=" + companyID + " WHERE ID="
//						+ ID;
//			}
//			pstmt = con.prepareStatement(sql3);
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//	}

	public void deleteCustomerType(String ID) {
		try {
			Integer id = Integer.parseInt(ID);
			customerTypeRepository.deleteById(id);
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}
	}

//	public void deleteCustomerType(String ID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = con.prepareStatement("DELETE FROM bca_customer_type WHERE ID=" + ID);
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//	}

	@Autowired
	private BcaRealtimeshippingserviceRepository shippingServiceRepository;

	public boolean addShippingService(ConfigurationDto configDto, int shippingTypeId) {
		boolean rowAdded = false;
		BcaRealtimeshippingservice service;

		try {
			if (configDto.getRealTimeShippingServiceId() != 0) {
				// Update existing service
				service = shippingServiceRepository.findById(configDto.getRealTimeShippingServiceId()).orElse(null);
				if (service != null) {
					service.setShippingService(configDto.getRealTimeShippingService());
					service.setPrice(configDto.getRealTimeShippingPrice());
				}
			} else {
				// Create new service
				service = new BcaRealtimeshippingservice();
				service.setShippingType(shippingTypeId);
				service.setShippingService(configDto.getRealTimeShippingService());
				service.setPrice(configDto.getRealTimeShippingPrice());
				service.setActive(1);
			}

			if (service != null) {
				shippingServiceRepository.save(service);
				rowAdded = true;
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		return rowAdded;
	}

//	public boolean addShippingService(ConfigurationDto configDto, int shippingTypeId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		String sql = null;
//
//		try {
//			if (configDto.getRealTimeShippingServiceId() != 0) {
//				sql = "update bca_realtimeshippingservice set ShippingService = ?, Price = ? where ShippingServiceID =?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, configDto.getRealTimeShippingService());
//				pstmt.setDouble(2, configDto.getRealTimeShippingPrice());
//				pstmt.setInt(3, configDto.getRealTimeShippingServiceId());
//			} else {
//				sql = "INSERT INTO bca_realtimeshippingservice(ShippingType,ShippingService, Price, Active) Values(?,?,?,?)";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, shippingTypeId);
//				pstmt.setString(2, configDto.getRealTimeShippingService());
//				pstmt.setDouble(3, configDto.getRealTimeShippingPrice());
//				pstmt.setInt(4, 1);
//			}
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}

	public boolean deleteUspsShippingService(int shippingServiceId) {
		boolean rowDeleted = false;
		try {
			BcaRealtimeshippingservice service = shippingServiceRepository.findById(shippingServiceId).orElse(null);
			if (service != null) {
				service.setActive(0);
				shippingServiceRepository.save(service);
				rowDeleted = true;
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		return rowDeleted;
	}

//	public boolean deleteUspsShippingService(int shippingServiceId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowDeleted = false;
//		String sql = null;
//
//		try {
//			sql = "update bca_realtimeshippingservice set Active = ? where ShippingServiceID =?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, 0);
//			pstmt.setInt(2, shippingServiceId);
//			rowDeleted = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowDeleted;
//	}

	@Autowired
	private BcaScheduletimesRepository scheduleTimesRepository;

	public ArrayList<ScheduleDateDto> getScheduleTimes(Long companyID) {
		ArrayList<ScheduleDateDto> scheduleDateDtoArrayList = new ArrayList<>();
		Calendar c = Calendar.getInstance();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");

		try {
			List<BcaScheduletimes> scheduleTimes = scheduleTimesRepository
					.findByCompany_CompanyIdOrderByScheduleIdAsc(companyID);
			for (BcaScheduletimes scheduleTime : scheduleTimes) {
				ScheduleDateDto scheduleDateDto = new ScheduleDateDto();
				String period = "AM";
				int h = scheduleTime.getScheduleTime();
				if (h >= 12) {
					h = h - 12;
					period = "PM";
				}
				c.set(Calendar.HOUR_OF_DAY, h);
				c.set(Calendar.MINUTE, scheduleTime.getScheduleMinute());

				scheduleDateDto.setId(scheduleTime.getScheduleId());
				scheduleDateDto.setDate(c.getTime());
				scheduleDateDto.setStoreID(-1); // Adjust as per your logic
				scheduleDateDto.setType(scheduleTime.getCategeoryType());
				scheduleDateDto.setTime(simpleDateFormat.format(c.getTime()));
				scheduleDateDto.setPeriod(period);
				scheduleDateDtoArrayList.add(scheduleDateDto);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle exception
		}

		return scheduleDateDtoArrayList;
	}

//	public ArrayList<ScheduleDateDto> getScheduleTimes(String companyID) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//
//		Calendar c = Calendar.getInstance();
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
//		ArrayList<ScheduleDateDto> scheduleDateDtoArrayList = new ArrayList<>();
//		try {
//			stmt = con.createStatement();
//			String sql = "Select ScheduleId,ScheduleTime,ScheduleMinute,CategeoryType,StoreID From bca_scheduletimes Where  CompanyID ="
//					+ companyID + " order by ScheduleId asc";
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				ScheduleDateDto scheduleDateDto = new ScheduleDateDto();
//				String period = "AM";
//				int h = rs.getInt("ScheduleTime");
//				if (h >= 12) {
//					h = h - 12;
//					period = "PM";
//				}
//				c.set(Calendar.HOUR_OF_DAY, h);
//				int m = rs.getInt("ScheduleMinute");
//				c.set(Calendar.MINUTE, m);
//				scheduleDateDto.setId(rs.getInt("ScheduleId"));
//				scheduleDateDto.setDate(c.getTime());
//				scheduleDateDto.setStoreID(-1);
//				scheduleDateDto.setType(rs.getInt("CategeoryType"));
//				scheduleDateDto.setTime(simpleDateFormat.format(c.getTime()));
//				scheduleDateDto.setPeriod(period);
//				scheduleDateDtoArrayList.add(scheduleDateDto);
//
//			}
//		} catch (SQLException e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
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
//		return scheduleDateDtoArrayList;
//	}

	public boolean insertScheduleTime(int hour, int min, int type, int storeID, Long companyId) {
		try {
			BcaCompany company = companyRepository.findById(companyId).orElse(null);
			OffsetDateTime offsetDateTime = OffsetDateTime.now(ZoneId.systemDefault());

			BcaScheduletimes scheduleTime = new BcaScheduletimes();
			scheduleTime.setScheduleTime(hour);
			scheduleTime.setScheduleMinute(min);
			scheduleTime.setScheduleDate(offsetDateTime);
			scheduleTime.setCategeoryType(type);
			scheduleTime.setCompany(company);

			scheduleTimesRepository.save(scheduleTime);
			return true;
		} catch (Exception e) {
			Loger.log(e.toString());
			return false;
		}
	}

//	public boolean insertScheduleTime(int hour, int min, int type, int storeID, String companyId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowAdded = false;
//		String sql = null;
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM");
//
//		try {
//			sql = "INSERT INTO bca_scheduletimes(ScheduleTime,ScheduleMinute,ScheduleDate,CategeoryType,CompanyID)"
//					+ " Values (?,?,?,?,?)";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, hour);
//			pstmt.setInt(2, min);
//			pstmt.setString(3, simpleDateFormat.format(new Date()));
//			pstmt.setInt(4, type);
//			pstmt.setString(5, companyId);
//
//			rowAdded = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowAdded;
//	}

	@Autowired
	private BcaScheduletimesRepository scheduleTimeRepository;

	public boolean deleteTimes(int scheduleId) {
		try {
			if (scheduleTimeRepository.existsById(scheduleId)) {
				scheduleTimeRepository.deleteById(scheduleId);
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			Loger.log(e.toString());
			return false;
		}
	}

//	public boolean deleteTimes(int scheduleId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowDeleted = false;
//		String sql = null;
//
//		try {
//			sql = "delete From bca_scheduletimes Where  ScheduleId = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, scheduleId);
//			rowDeleted = pstmt.executeUpdate() > 0 ? true : false;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return rowDeleted;
//	}

	public void updateRemindersInfo(ConfigurationDto cForm, String companyId) {
		Long compId = Long.parseLong(companyId); // Convert to Long if necessary

		Optional<BcaPreference> preferenceOpt = preferenceRepository.findByCompany_CompanyId(compId);

		if (preferenceOpt.isPresent()) {
			BcaPreference preference = preferenceOpt.get();

			// Set the fields from cForm
			preference.setShowReminder(Integer.valueOf(cForm.getShowReminder()));
			preference.setInvoiceMemo(cForm.getInvoiceMemo());
			preference.setInvoiceMemoDays(cForm.getInvoiceMemoDays());
			preference.setOverdueInvoice(cForm.getOverdueInvoice());
			preference.setOverdueinvoiceDays(cForm.getOverdueInvoiceDays());
			preference.setInventoryOrder(cForm.getInventoryOrder());
			preference.setInventoryOrderDays(cForm.getInventoryOrderDays());
			preference.setBillstoPay(cForm.getBillsToPay());
			preference.setBillstoPayDays(cForm.getBillsToPayDays());
			preference.setMemobill(cForm.getMemorizeBill());
			preference.setMemobillDays(cForm.getMemorizeBillDays());
			preference.setEstimationMemo(cForm.getMemorizeEstimation());
			preference.setEstimationMemoDays(cForm.getMemorizeEstimationDays());
			preference.setPomemo(cForm.getMemorizePurchaseOrder());
			preference.setPomemoDays(cForm.getMemorizePurchaseOrderDays());
			preference.setServiceBillsMemo(cForm.getServiceBilling());
			preference.setServiceBillsMemoDays(cForm.getServiceBillingDays());

			preferenceRepository.save(preference); // This will update the record
		} else {
			// Handle the case where the preference does not exist
			Loger.log("Preference not found for Company ID: " + compId);
		}
	}

//	public void updateRemindersInfo(ConfigurationDto cForm, String compId) {
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		boolean rowUpdated = false;
//		try {
//			String sql = "update bca_preference set ShowReminder = ?, InvoiceMemo = ?,InvoiceMemoDays = ?, "
//					+ "OverdueInvoice = ?, OverdueinvoiceDays = ?, InventoryOrder = ?, InventoryOrderDays = ?, "
//					+ "BillstoPay = ?,BillstoPayDays = ?,Memobill = ?,MemobillDays = ?,EstimationMemo = ?,EstimationMemoDays = ?, "
//					+ "POMemo = ?,POMemoDays = ?,ServiceBillsMemo = ?,ServiceBillsMemoDays = ? Where CompanyID = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, cForm.getShowReminder());
//			pstmt.setInt(2, cForm.getInvoiceMemo());
//			pstmt.setInt(3, cForm.getInvoiceMemoDays());
//			pstmt.setInt(4, cForm.getOverdueInvoice());
//			pstmt.setInt(5, cForm.getOverdueInvoiceDays());
//			pstmt.setInt(6, cForm.getInventoryOrder());
//			pstmt.setInt(7, cForm.getInventoryOrderDays());
//			pstmt.setInt(8, cForm.getBillsToPay());
//			pstmt.setInt(9, cForm.getBillsToPayDays());
//			pstmt.setInt(10, cForm.getMemorizeBill());
//			pstmt.setInt(11, cForm.getMemorizeBillDays());
//			pstmt.setInt(12, cForm.getMemorizeEstimation());
//			pstmt.setInt(13, cForm.getMemorizeEstimationDays());
//			pstmt.setInt(14, cForm.getMemorizePurchaseOrder());
//			pstmt.setInt(15, cForm.getMemorizePurchaseOrderDays());
//			pstmt.setInt(16, cForm.getServiceBilling());
//			pstmt.setInt(17, cForm.getServiceBillingDays());
//			pstmt.setString(18, compId);
//
//			rowUpdated = pstmt.executeUpdate() > 0 ? true : false;
//
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//	}
}
