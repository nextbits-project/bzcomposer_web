package com.nxsol.bizcomposer.accounting.daoimpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.IntStream;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.swing.tree.DefaultMutableTreeNode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.MyUtility;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.common.BillingStatement;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bizcomposer.common.TblBudgetCategory;
import com.nxsol.bizcomposer.common.TblCategoryType;
import com.nxsol.bizcomposer.common.TblRecurrentPaymentPlan;
import com.nxsol.bizcomposer.common.TblVendorDetail;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcomposer.jasper.pojo.BillingBoardReport;
import com.nxsol.bizcomposer.jasper.pojo.BillingStatementReport;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.nxsol.bizcompser.global.table.TblCategoryDtoLoader;
import com.nxsol.bizcompser.global.table.TblTerm;
import com.nxsol.bizcompser.global.table.TblTermLoader;
import com.nxsol.bzcomposer.company.domain.BcaAccount;
import com.nxsol.bzcomposer.company.domain.BcaAcctcategory;
import com.nxsol.bzcomposer.company.domain.BcaAccttype;
import com.nxsol.bzcomposer.company.domain.BcaBillingstatements;
import com.nxsol.bzcomposer.company.domain.BcaCategory;
import com.nxsol.bzcomposer.company.domain.BcaCategorytype;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaInvoice;
import com.nxsol.bzcomposer.company.domain.BcaInvoicetype;
import com.nxsol.bzcomposer.company.domain.BcaPayment;
import com.nxsol.bzcomposer.company.domain.BcaPaymenttype;
import com.nxsol.bzcomposer.company.domain.BcaPreference;
import com.nxsol.bzcomposer.company.domain.BcaRefundlist;
import com.nxsol.bzcomposer.company.repos.BcaAccountRepository;
import com.nxsol.bzcomposer.company.repos.BcaAccountableRepository;
import com.nxsol.bzcomposer.company.repos.BcaAcctcategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaAccttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaBillRepository;
import com.nxsol.bzcomposer.company.repos.BcaBillingstatementsRepository;
import com.nxsol.bzcomposer.company.repos.BcaCategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaCategorytypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCreditcardtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaCvtypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoiceRepository;
import com.nxsol.bzcomposer.company.repos.BcaInvoicetypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymentRepository;
import com.nxsol.bzcomposer.company.repos.BcaPaymenttypeRepository;
import com.nxsol.bzcomposer.company.repos.BcaPreferenceRepository;
import com.nxsol.bzcomposer.company.repos.BcaRecurrentpaymentRepository;
import com.nxsol.bzcomposer.company.repos.BcaRefundlistRepository;
import com.nxsol.bzcomposer.company.utils.DateHelper;
import com.nxsol.bzcomposer.company.utils.JpaHelper;
import com.pritesh.bizcomposer.accounting.bean.BcaBillDto;
import com.pritesh.bizcomposer.accounting.bean.BcaBillingstatementsDto;
import com.pritesh.bizcomposer.accounting.bean.BcaPaymentDto;
import com.pritesh.bizcomposer.accounting.bean.BcaRecurrentPaymentDto;
import com.pritesh.bizcomposer.accounting.bean.BillingBoardReportDto;
import com.pritesh.bizcomposer.accounting.bean.BillingStatementsDto;
import com.pritesh.bizcomposer.accounting.bean.ClientvendorDto;
import com.pritesh.bizcomposer.accounting.bean.InvoiceDto;
import com.pritesh.bizcomposer.accounting.bean.PoPayableDto;
import com.pritesh.bizcomposer.accounting.bean.ReceivableListDto;
import com.pritesh.bizcomposer.accounting.bean.SalesBillingTable;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblAccountCategory;
import com.pritesh.bizcomposer.accounting.bean.TblAccountable;
import com.pritesh.bizcomposer.accounting.bean.TblPayment;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentDto;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;

@Service
public class ReceivableListImpl implements ReceivableLIst {
	@Autowired
	private EntityManager entityManager;

	public static int pID = 0;
	public static TblPaymentDto p = new TblPaymentDto();
	boolean flag = false;
	Date paidDate = null;
	Date frDate = null;
	Date tdate = null;
	double partialDepositAmount = 0.0;
	String strName = "";
	TblPaymentDto paymentForReceived = null;
	double receivedAmountForRL = 0.00;
	TblAccount payerAccount = null;
	ReceivableListDto inv = null;
	double totalAmount = 0.0;
	int priorityForAddBank = -1;
	String statusForAddBank = "";
	private ArrayList<TblAccount> bankAccounts = new ArrayList<TblAccount>();
	private ArrayList<TblAccount> bankAccountsInFundTransfer = new ArrayList<TblAccount>();
	private ArrayList<TblAccount> bankAccountswithCategory = new ArrayList<TblAccount>();
	private ArrayList<TblAccountCategory> root = new ArrayList<TblAccountCategory>();
	ArrayList<TblAccount> parent = new ArrayList<TblAccount>();
	ArrayList<TblBudgetCategory> vRows = new ArrayList<TblBudgetCategory>();
	TblCategoryDto category = null;
	ConfigurationInfo configInfo = new ConfigurationInfo();
	ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();

//	private TblCategoryTypeRepository tblCategoryTypeRepository;

	@Autowired
	private BcaPreferenceRepository bcaPreferenceRepository;
	@Autowired
	private BcaAcctcategoryRepository bcaAcctcategoryRepository;
	@Autowired
	private BcaCategoryRepository bcaCategoryRepository;
	@Autowired
	private BcaCompanyRepository bcaCompanyRepository;
	@Autowired
	private BcaAccountRepository bcaAccountRepository;
	@Autowired
	private BcaPaymentRepository bcaPaymentRepository;
	@Autowired
	private BcaPaymenttypeRepository bcaPaymenttypeRepository;
	@Autowired
	private BcaAccttypeRepository bcaAccttypeRepository;
	@Autowired
	private BcaClientvendorRepository bcaClientvendorRepository;

	@Autowired
	private BcaBillRepository bcaBillRepository;
	@Autowired
	private BcaRecurrentpaymentRepository bcaRecurrentpaymentRepository;

	@Autowired
	private BcaBillingstatementsRepository bcaBillingstatementsRepository;

	@Autowired
	private BcaInvoicetypeRepository bcaInvoicetypeRepository;

	@Autowired
	private BcaRefundlistRepository bcaRefundlistRepository;

	@Autowired
	private static BcaAccountableRepository accountableRepository;

	@Autowired
	private BcaInvoiceRepository bcaInvoiceRepository;
	@Autowired
	private static BcaInvoiceRepository invoiceRepository;

	@Autowired
	private TblCategoryDtoLoader categoryDtoLoader;

	public double getTotalAmountForLabel() {
		return totalAmount;
	}

	@Override
	public ArrayList<ReceivableListDto> getReceivableList(int companyId) {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
		ArrayList<ReceivableListDto> rlb = new ArrayList<>();
//		con = db.getConnection();
		try {
			List<Object[]> objList = bcaInvoiceRepository.findRecievableList(new Long(companyId));
			List<InvoiceDto> dtos = convertInvoiceDtoToInvoice(objList);
			for (InvoiceDto dto : dtos) {
				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
				ReceivableListDto rb = new ReceivableListDto();
				TblCategoryDto categoryName = null;
				if (null != dto.getCategoryID())
					categoryName = category.getCategoryOf(dto.getCategoryID());
				TblTermLoader termloader = new TblTermLoader();
				TblTerm tblterm = termloader.getObjectOfID(dto.getTermID());
				int cvId = dto.getClientVendorID();

				ClientVendor cv = getClentVendor(cvId, companyId);
				if (null != cv) {
					rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
					rb.setCompanyName(cv.getName());
				}
				rb.setInvoiceID(dto.getInvoiceID());
				rb.setOrderNum(dto.getOrderNum());
				int orderNo = (dto.getOrderNum());
				String yearPart = MyUtility.getYearPart(
						new SimpleDateFormat("dd-mm-yyyy").format(offsetDateTimeToDate(dto.getDateAdded())));

				if (configDto.getIsSalePrefix().equals("on")) {

					rb.setOrderNumStr("IV".concat(yearPart)
							.concat("-" + MyUtility.getOrderNumberByConfigData(Integer.toString(orderNo),
									AppConstants.InvoiceType, configDto, false)));
				} else {
					rb.setOrderNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(orderNo),
							AppConstants.InvoiceType, configDto, false));
				}
				if (null != dto.getPONum()) {
					rb.setPoNum(dto.getPONum());

					int poNo = (dto.getPONum());
					if (configDto.getIsSalePrefix().equals("on")) {
						rb.setPoNumStr("PO".concat(yearPart)
								.concat("-" + MyUtility.getOrderNumberByConfigData(Integer.toString(poNo),
										AppConstants.POType, configDto, false)));
					} else {
						rb.setPoNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(poNo), AppConstants.POType,
								configDto, false));
					}
				}
				if (null != dto.getEmployeeID())
					rb.setEmployeeId(dto.getEmployeeID());
				rb.setRefNum(dto.getRefNum());
				rb.setMemo(dto.getMemo());
				rb.setCvID(cvId);
				rb.setInvoiceTypeID(dto.getInvoiceTypeID());
				rb.setTotal(dto.getTotal());
				rb.setAdjustedTotal(dto.getAdjustedTotal());
				rb.setPaidAmount(dto.getPaidAmount());
				rb.setBalance(dto.getBalance());
				rb.setTermID(dto.getTermID());
				if (null != dto.getPaymentTypeID())
					rb.setPaymentTypeID(dto.getPaymentTypeID());
				if (null != dto.getShipCarrierID())
					rb.setShipCarrierID(dto.getShipCarrierID());
				rb.setSh(dto.getSH()); // new changes
				rb.setSubTotal(dto.getSubTotal());
				rb.setTax(dto.getTax());
				if (null != dto.getShippingMethod())
					rb.setShippingMethod(dto.getShippingMethod());

				if (null != dto.getSalesTaxID())
					rb.setSalesTaxID(dto.getSalesTaxID());
				rb.setTaxable(dto.getTaxable() == 1 ? true : false);
				if (null != dto.getIsReceived())
					rb.setReceived(dto.getIsReceived());
				rb.setPaymentCompleted(dto.getIsPaymentCompleted());
				rb.setDateConfirmed(offsetDateTimeToDate(dto.getDateConfirmed()));
				rb.setDateAdded(offsetDateTimeToDate(dto.getDateAdded()));
				if (null != dto.getCategoryID())
					rb.setCategoryID(dto.getCategoryID());
				rb.setInvoiceStatus(dto.getInvoiceStatus());
				if (null != dto.getServiceID())
					rb.setServiceID(dto.getServiceID());
				if (null != dto.getSalesRepID())
					rb.setSalesRepID(dto.getSalesRepID());
				rb.setShipped(dto.getShipped());
				if (null != dto.getJobCategoryID())
					rb.setJobCategoryID(dto.getJobCategoryID());
				if (null != dto.getBillingAddrID())
					if (null != dto.getBillingAddrID())
						rb.setBillingAddrID(dto.getBillingAddrID());
				if (null != dto.getShippingAddrID())
					rb.setShipToAddrID(dto.getShippingAddrID());
				if (null != dto.getTotalCommission())
					rb.setCommission(dto.getTotalCommission());
				if (null != dto.getBankAccountID())
					rb.setBankAccountID(dto.getBankAccountID());
				rb.setTblcategory(categoryName);
				rb.setTblterm(tblterm);

				totalAmount = totalAmount + dto.getBalance();
				rb.setTotalAmountLabel(totalAmount);
				rlb.add(rb);
			}

//			int size=findRecievableList.size();
//			String sql = "SELECT I.InvoiceID,I.OrderNum,I.PONum,I.SubTotal,I.Tax,I.EmployeeID,I.RefNum,I.Memo,I.ShipCarrierID,I.ShippingMethod,"
//					+ " I.SH,I.ClientVendorID,I.InvoiceTypeID,I.Total,I.AdjustedTotal,I.PaidAmount,I.Balance,"
//					+ "(SELECT Sum(bca_payment.Amount) AS AB FROM bca_payment WHERE bca_payment.InvoiceID=I.InvoiceID AND bca_payment.Deleted != 1) AS PaidAmount12,"
//					+ "I.IsReceived,I.TermID,I.IsPaymentCompleted,I.DateConfirmed,I.DateAdded,I.invoiceStatus,I.PaymentTypeID,"
//					+ "I.CategoryID,I.ServiceID,I.SalesTaxID,I.SalesRepID,I.Taxable,I.Shipped,I.JobCategoryID,t.Days,I.BillingAddrID,"
//					+ "I.ShippingAddrID,I.TotalCommission,I.BankAccountID "
//					+ "FROM bca_invoice AS I LEFT JOIN  bca_term AS t ON I.TermID = t.TermID"
//					+ " WHERE ( ( ( InvoiceTypeID ) IN ( 1, 12 ) AND I.TermID <> 3 ) OR I.InvoiceTypeID = 11 )"
//					+ " AND I.AdjustedTotal > 0 AND I.IsPaymentCompleted = 0 AND I.invoiceStatus = 0 AND I.CompanyID ="
//					+ companyId
//					+ " AND ( I.AdjustedTotal > (SELECT Sum(bca_payment.Amount) FROM bca_payment WHERE bca_payment.InvoiceID=I.InvoiceID AND bca_payment.Deleted != 1)"
//					+ " OR (SELECT Sum(bca_payment.Amount) FROM bca_payment WHERE bca_payment.InvoiceID = I.InvoiceID AND bca_payment.Deleted != 1) IS NULL )"
//					+ "ORDER  BY OrderNum DESC  ";
//
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
//				ReceivableListDto rb = new ReceivableListDto();
//				TblCategoryDto categoryName = category.getCategoryOf(rs.getInt("CategoryID"));
//				TblTermLoader termloader = new TblTermLoader();
//				TblTerm tblterm = termloader.getObjectOfID(rs.getInt("TermID"));
//				int cvId = rs.getInt("ClientVendorID");
//
//				ClientVendor cv = getClentVendor(cvId, companyId);
//				if (null != cv) {
//					rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
//					rb.setCompanyName(cv.getName());
//				}
//				rb.setInvoiceID(rs.getInt("InvoiceID"));
//				rb.setOrderNum(rs.getInt("OrderNum"));
//				int orderNo = (rs.getInt("OrderNum"));
//				String yearPart = MyUtility
//						.getYearPart(new SimpleDateFormat("dd-mm-yyyy").format(rs.getDate("DateAdded")));
//
//				if (configDto.getIsSalePrefix().equals("on")) {
//
//					rb.setOrderNumStr("IV".concat(yearPart)
//							.concat("-" + MyUtility.getOrderNumberByConfigData(Integer.toString(orderNo),
//									AppConstants.InvoiceType, configDto, false)));
//				} else {
//					rb.setOrderNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(orderNo),
//							AppConstants.InvoiceType, configDto, false));
//				}
//
//				rb.setPoNum(rs.getInt("PONum"));
//
//				int poNo = (rs.getInt("PONum"));
//				if (configDto.getIsSalePrefix().equals("on")) {
//					rb.setPoNumStr("PO".concat(yearPart)
//							.concat("-" + MyUtility.getOrderNumberByConfigData(Integer.toString(poNo),
//									AppConstants.POType, configDto, false)));
//				} else {
//					rb.setPoNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(poNo), AppConstants.POType,
//							configDto, false));
//				}
//				rb.setEmployeeId(rs.getInt("EmployeeID"));
//				rb.setRefNum(rs.getString("RefNum"));
//				rb.setMemo(rs.getString("Memo"));
//				rb.setCvID(cvId);
//				rb.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
//				rb.setTotal(rs.getDouble("Total"));
//				rb.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
//				rb.setPaidAmount(rs.getDouble("PaidAmount"));
//				rb.setBalance(rs.getDouble("Balance"));
//				rb.setTermID(rs.getInt("TermID"));
//				rb.setPaymentTypeID(rs.getInt("PaymentTypeID"));
//				rb.setShipCarrierID(rs.getInt("ShipCarrierID"));
//				rb.setSh(rs.getDouble("SH")); // new changes
//				rb.setSubTotal(rs.getDouble("SubTotal"));
//				rb.setTax(rs.getDouble("Tax"));
//				rb.setShippingMethod(rs.getString("ShippingMethod"));
//				rb.setSalesTaxID(rs.getInt("SalesTaxID"));
//				rb.setTaxable(rs.getInt("Taxable") == 1 ? true : false);
//				rb.setReceived(rs.getBoolean("IsReceived"));
//				rb.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
//				rb.setDateConfirmed((java.util.Date) rs.getDate("DateConfirmed"));
//				rb.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
//				rb.setCategoryID(rs.getInt("CategoryID"));
//				rb.setInvoiceStatus(rs.getInt("invoiceStatus"));
//				rb.setServiceID(rs.getLong("ServiceID"));
//				rb.setSalesRepID(rs.getInt("SalesRepID"));
//				rb.setShipped(rs.getInt("Shipped"));
//				rb.setJobCategoryID(rs.getInt("JobCategoryID"));
//				rb.setBillingAddrID(rs.getInt("BillingAddrID"));
//				rb.setShipToAddrID(rs.getInt("ShippingAddrID"));
//				rb.setCommission(rs.getDouble("TotalCommission"));
//				rb.setBankAccountID(rs.getInt("BankAccountID"));
//				rb.setTblcategory(categoryName);
//				rb.setTblterm(tblterm);
//
//				totalAmount = totalAmount + rs.getDouble("Balance");
//				rb.setTotalAmountLabel(totalAmount);
//				rlb.add(rb);
//			}
		} catch (Exception e) {
			e.printStackTrace();
			Loger.log(e.toString());
		}
//		finally {
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
		return rlb;
	}

	@Override
	public ArrayList<ReceivableListDto> getCancelledTableList(int companyId) {
		// TODO Auto-generated method stub
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		ArrayList<ReceivableListDto> rlb = new ArrayList<ReceivableListDto>();
		con = db.getConnection();

		try {
			String sql = "SELECT INV.InvoiceID,INV.OrderNum,INV.PONum,INV.SubTotal,INV.Tax,INV.EmployeeID,INV.RefNum,INV.Memo,INV.ShipCarrierID,INV.ShippingMethod,"
					+ " INV.SH," + "INV.ClientVendorID," + "INV.InvoiceTypeID," + "INV.Total," + "INV.AdjustedTotal,"
					+ "INV.PaidAmount," + "(SELECT Sum(bca_payment.Amount) AS AB" + " FROM bca_payment"
					+ " WHERE bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) AS PaidAmount12,"
					+ "INV.Balance," + "INV.IsReceived," + "INV.TermID," + "INV.IsPaymentCompleted,"
					+ "INV.DateConfirmed," + "INV.DateAdded," + "INV.invoiceStatus," + "INV.PaymentTypeID,"
					+ "INV.CategoryID," + "INV.ServiceID," + "INV.SalesTaxID," + "INV.SalesRepID," + "INV.Taxable,"
					+ "INV.Shipped," + "INV.JobCategoryID," + "term.Days," + "INV.BillingAddrID,"
					+ "INV.ShippingAddrID," + "INV.TotalCommission," + "INV.BankAccountID" + " FROM bca_invoice AS INV"
					+ " LEFT JOIN  bca_term AS term" + " ON INV.TermID = term.TermID"
					+ " WHERE  ( ( ( InvoiceTypeID ) IN ( 1, 12 )" + " AND INV.TermID <> 3 )"
					+ " OR INV.InvoiceTypeID = 11 )" + " AND INV.AdjustedTotal > 0" + " AND INV.IsPaymentCompleted = 0"
					+ " AND INV.invoiceStatus =" + ReceivableListDto.CANCELLED_INVOICE_STATUS + " AND INV.CompanyID ="
					+ companyId + " AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
					+ " WHERE  bca_payment.InvoiceID =" + "INV.InvoiceID" + " AND bca_payment.Deleted != 1)"
					+ " OR (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
					+ " WHERE  bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) IS NULL )"
					+ "ORDER  BY OrderNum DESC  ";

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
				ReceivableListDto rb = new ReceivableListDto();
				TblCategoryDto categoryName = category.getCategoryOf(rs.getInt("CategoryID"));
				TblTermLoader termloader = new TblTermLoader();
				TblTerm tblterm = termloader.getObjectOfID(rs.getInt("TermID"));
				int cvId = rs.getInt("ClientVendorID");
				ClientVendor cv = getClentVendor(cvId, companyId);
				rb.setInvoiceID(rs.getInt("InvoiceID"));
				rb.setOrderNum(rs.getInt("OrderNum"));
				rb.setPoNum(rs.getInt("PONum"));
				rb.setEmployeeId(rs.getInt("EmployeeID"));
				rb.setRefNum(rs.getString("RefNum"));
				rb.setMemo(rs.getString("Memo"));
				rb.setCvID(cvId);
				rb.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
				rb.setTotal(rs.getDouble("Total"));
				rb.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
				rb.setPaidAmount(rs.getDouble("PaidAmount"));
				rb.setBalance(rs.getDouble("Balance"));
				rb.setTermID(rs.getInt("TermID"));
				rb.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				rb.setShipCarrierID(rs.getInt("ShipCarrierID"));
				rb.setSh(rs.getDouble("SH")); // new changes
				rb.setSubTotal(rs.getDouble("SubTotal"));
				rb.setTax(rs.getDouble("Tax"));
				rb.setShippingMethod(rs.getString("ShippingMethod"));
				rb.setSalesTaxID(rs.getInt("SalesTaxID"));
				rb.setTaxable(rs.getInt("Taxable") == 1 ? true : false);
				rb.setReceived(rs.getBoolean("IsReceived"));
				rb.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
				rb.setDateConfirmed((java.util.Date) rs.getDate("DateConfirmed"));
				rb.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
				rb.setCategoryID(rs.getInt("CategoryID"));
				rb.setInvoiceStatus(rs.getInt("invoiceStatus"));
				rb.setServiceID(rs.getLong("ServiceID"));
				rb.setSalesRepID(rs.getInt("SalesRepID"));
				rb.setShipped(rs.getInt("Shipped"));
				rb.setJobCategoryID(rs.getInt("JobCategoryID"));
				rb.setBillingAddrID(rs.getInt("BillingAddrID"));
				rb.setShipToAddrID(rs.getInt("ShippingAddrID"));
				rb.setCommission(rs.getDouble("TotalCommission"));
				rb.setBankAccountID(rs.getInt("BankAccountID"));
				rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
				rb.setCompanyName(cv.getName());
				rb.setTblcategory(categoryName);
				rb.setTblterm(tblterm);
				rlb.add(rb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return rlb;

	}

	public ClientVendor getClentVendor(int cvId, int companyId) {
//		Connection con;
		ClientVendor cv = new ClientVendor();
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		List<String> statusList = Arrays.asList("U", "N");

//		String sql = "SELECT * FROM  bca_clientvendor WHERE CompanyID=" + companyId
//				+ " AND Status IN ('U', 'N' ) AND ClientVendorID=" + cvId;
		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				cv.setCvID(rs.getInt("ClientVendorID"));
//				cv.setName(rs.getString("Name"));
//				cv.setDetail(rs.getString("Detail"));
//				cv.setCustomerTitle(rs.getString("CustomerTitle"));
//				cv.setCustomerTitleID(rs.getInt("CustomerTitleID"));
//				cv.setFirstName(rs.getString("FirstName"));
//				cv.setLastName(rs.getString("LastName"));
//			}
			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(companyId));

			List<BcaClientvendor> bcaClientvendors = bcaClientvendorRepository
					.findByCompanyAndStatusInAndClientVendorId(company, statusList, cvId);

			for (BcaClientvendor bcv : bcaClientvendors) {
				cv.setCvID(bcv.getClientVendorId());
				cv.setName(bcv.getName());
				cv.setDetail(bcv.getDetail());
				cv.setCustomerTitle(bcv.getCustomerTitle());
				if (null != bcv.getCustomerTitleId())
					cv.setCustomerTitleID(bcv.getCustomerTitleId());
				cv.setFirstName(bcv.getFirstName());
				cv.setLastName(bcv.getLastName());
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return cv;

		// @Override
		// public ClientVendor getClientVendor(int cvId) {
		// // TODO Auto-generated method stub
		// return null;
		// }

	}

	@Override
	public ArrayList<ClientVendor> getClientVendorForCombo() {
		// TODO Auto-generated method stub
		ArrayList<ClientVendor> alc = new ArrayList<ClientVendor>();
		ClientVendor cv = null;
//		Connection con;
		int cvId = 0;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;

//		con = db.getConnection();

//		String sql = " SELECT * " + " FROM  bca_clientvendor " + " WHERE CompanyID = " + ConstValue.companyId
//				+ " AND Status IN ('U', 'N' ) AND Active IN (0, 1) AND CVTypeID=2 ORDER BY LastName";
		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				cv = new ClientVendor();
//				cv.setCvID(rs.getInt("ClientVendorID"));
//				cv.setName(rs.getString("Name"));
//				cv.setDetail(rs.getString("Detail"));
//				cv.setCustomerTitle(rs.getString("CustomerTitle"));
//				cv.setCustomerTitleID(rs.getInt("CustomerTitleID"));
//				cv.setFirstName(rs.getString("FirstName"));
//				cv.setLastName(rs.getString("LastName"));
//
//				alc.add(cv);
//			}
			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaClientvendor> clientvendors = bcaClientvendorRepository.findClientVendorForCombo(company);
			for (BcaClientvendor bcv : clientvendors) {
				cv = new ClientVendor();
				cv.setCvID(bcv.getClientVendorId());
				cv.setName(bcv.getName());
				cv.setDetail(bcv.getDetail());
				cv.setCustomerTitle(bcv.getCustomerTitle());
				if (null != bcv.getCustomerTitleId())
					cv.setCustomerTitleID(bcv.getCustomerTitleId());
				cv.setFirstName(bcv.getFirstName());
				cv.setLastName(bcv.getLastName());

				alc.add(cv);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return alc;
	}

	@Override
	public ArrayList<ClientVendor> getAllClientVendorForCombo() {
		// TODO Auto-generated method stub
		ArrayList<ClientVendor> alc = new ArrayList<ClientVendor>();
		ClientVendor cv = null;
//		Connection con;
//		int cvId = 0;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;

//		con = db.getConnection();

//		String sql = " SELECT * " + " FROM  b{ca_clientvendor " + " WHERE CompanyID = " + ConstValue.companyId
//				+ " AND Status IN ('U', 'N' ) AND Active IN (0, 1) ORDER BY LastName";
		try {

			List<BcaClientvendor> bcaClientvendors = bcaClientvendorRepository
					.findAllClientVendorForCombo(new Long(ConstValue.companyId));
			for (BcaClientvendor bcv : bcaClientvendors) {
				cv = new ClientVendor();
				cv.setCvID(bcv.getClientVendorId());
				cv.setName(bcv.getName());
				cv.setDetail(bcv.getDetail());
				cv.setCustomerTitle(bcv.getCustomerTitle());
				if (null != bcv.getCustomerTitleId())
					cv.setCustomerTitleID(bcv.getCustomerTitleId());
				cv.setFirstName(bcv.getFirstName());
				cv.setLastName(bcv.getLastName());

				alc.add(cv);
			}

//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				cv = new ClientVendor();
//				cv.setCvID(rs.getInt("ClientVendorID"));
//				cv.setName(rs.getString("Name"));
//				cv.setDetail(rs.getString("Detail"));
//				cv.setCustomerTitle(rs.getString("CustomerTitle"));
//				cv.setCustomerTitleID(rs.getInt("CustomerTitleID"));
//				cv.setFirstName(rs.getString("FirstName"));
//				cv.setLastName(rs.getString("LastName"));
//
//				alc.add(cv);
//			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			Loger.log(e.toString());
		}
//		
//		finally {
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
		return alc;
	}

	@Override
	public ArrayList<TblPaymentType> getPaymentType() {
		// TODO Auto-generated method stub
		ArrayList<TblPaymentType> paymentType = new ArrayList<TblPaymentType>();
		ClientVendor cv = null;
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;

//		String sql = "SELECT PaymentTypeID,Name,Type,CCTypeID,Active,BankAcctID,TypeCategory "
//				+ " FROM bca_paymenttype " + " WHERE CompanyID = " + ConstValue.companyId + " AND Active =1 "
//				+ " AND TypeCategory =  " + TblPaymentType.RECEIVED_TYPE + " ORDER BY Name";

		try {
			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaPaymenttype> bcaPaymenttypes = bcaPaymenttypeRepository
					.findByCompanyAndActiveAndTypeCategoryOrderByName(company, 1, TblPaymentType.RECEIVED_TYPE);
			for (BcaPaymenttype bpt : bcaPaymenttypes) {
				TblPaymentType tbt = new TblPaymentType();
				tbt.setId(bpt.getPaymentTypeId());
				tbt.setTypeName(bpt.getName());
				tbt.setType(bpt.getType());
				tbt.setCctype_id(bpt.getCctype().getCctypeId());
				tbt.setActive(bpt.getActive() > 0 ? true : false);
				tbt.setBankAcctID(bpt.getBankAcctId());
				tbt.setTypeCategory(bpt.getTypeCategory());

				paymentType.add(tbt);
			}
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				TblPaymentType tbt = new TblPaymentType();
//				tbt.setId(rs.getInt("PaymentTypeID"));
//				tbt.setTypeName(rs.getString("Name"));
//				tbt.setType(rs.getString("Type"));
//				tbt.setCctype_id(rs.getInt("CCTypeID"));
//				tbt.setActive(rs.getBoolean("Active"));
//				tbt.setBankAcctID(rs.getInt("BankAcctID"));
//				tbt.setTypeCategory(rs.getInt("TypeCategory"));
//
//				paymentType.add(tbt);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return paymentType;

	}

	@Override
	public ArrayList<TblAccount> getAccount() {
		// TODO Auto-generated method stub
		ArrayList<TblAccount> accountForCombo = new ArrayList<TblAccount>();
//		ClientVendor cv = null;
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;

//		String sql = "SELECT * FROM bca_account" + " WHERE CompanyID = " + ConstValue.companyId + " AND AcctTypeID = 2"
//				+ " AND Active = 1" + " ORDER BY AcctCategoryID,Name ASC";

//		con = db.getConnection();
		try {
			Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
			BcaCompany bcaCompany = new BcaCompany();
			if (company.isPresent()) {
				bcaCompany = company.get();
			}
			BcaAccttype accttype = bcaAccttypeRepository.getOne(2);
			List<BcaAccount> accounts = bcaAccountRepository
					.findByCompanyAndAcctTypeAndActiveOrderByAcctCategoryAscNameAsc(bcaCompany, accttype, 1);
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);

			for (BcaAccount bca_account : accounts) {
				TblAccount account = new TblAccount();
				account.setAccountID(bca_account.getAccountId());
				account.setParentID(bca_account.getParentId());
				account.setIsCategory(bca_account.getIsCategory());
				account.setName(bca_account.getName());
				account.setDescription(bca_account.getDescription());
				account.setAccountTypeID(bca_account.getAcctType().getAcctTypeId());
				account.setAccountCategoryID(bca_account.getAcctCategory().getAcctCategoryId());
				account.setCvID(bca_account.getClientVendor().getClientVendorId());
				account.setDepositPaymentID(bca_account.getDepositPaymentId());
				account.setCustomerStartingBalance(bca_account.getCustomerStartingBalance());
				account.setCustomerCurrentBalance(bca_account.getCustomerCurrentBalance());
				account.setVendorStartingBalance(bca_account.getVendorStartingBalance());
				account.setVendorCurrentBalance(bca_account.getVendorCurrentBalance());

				account.setDateAdded(offsetDateTimeToDate(bca_account.getDateAdded()));
				account.setFirstCheckNo(bca_account.getFirstCheck());
				account.setLastCheckNo(bca_account.getLastCheck());

				accountForCombo.add(account);
			}

//			while (rs.next()) {
//				TblAccount account = new TblAccount();
//				account.setAccountID(rs.getInt("AccountID"));
//				account.setParentID(rs.getInt("ParentID"));
//				account.setIsCategory(rs.getBoolean("isCategory"));
//				account.setName(rs.getString("Name"));
//				account.setDescription(rs.getString("Description"));
//				account.setAccountTypeID(rs.getInt("AcctTypeID"));
//				account.setAccountCategoryID(rs.getInt("AcctCategoryID"));
//				account.setCvID(rs.getInt("ClientVendorID"));
//				account.setDepositPaymentID(rs.getInt("DepositPaymentID"));
//				account.setCustomerStartingBalance(rs.getDouble("CustomerStartingBalance"));
//				account.setCustomerCurrentBalance(rs.getDouble("CustomerCurrentBalance"));
//				account.setVendorStartingBalance(rs.getDouble("VendorStartingBalance"));
//				account.setVendorCurrentBalance(rs.getDouble("VendorCurrentBalance"));
//				account.setDateAdded(rs.getDate("DateAdded"));
//				account.setFirstCheckNo(rs.getInt("FirstCheck"));
//				account.setLastCheckNo(rs.getInt("LastCheck"));
//
//				accountForCombo.add(account);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return accountForCombo;
	}

	@Override
	public ReceivableListDto getInvoiceByOrderNUm(int ordernum, int companyId) {
		// TODO Auto-generated method stub

		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		ReceivableListDto rb = null;

		try {
			String sql = "SELECT INV.InvoiceID,INV.OrderNum,INV.PONum,INV.SubTotal,INV.Tax,INV.EmployeeID,INV.RefNum,INV.Memo,INV.ShipCarrierID,INV.ShippingMethod,"
					+ " INV.SH," + "INV.ClientVendorID," + "INV.InvoiceTypeID," + "INV.Total," + "INV.AdjustedTotal,"
					+ "INV.PaidAmount," + "(SELECT Sum(bca_payment.Amount) AS AB" + " FROM bca_payment"
					+ " WHERE bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) AS PaidAmount12,"
					+ "INV.Balance," + "INV.IsReceived," + "INV.TermID," + "INV.IsPaymentCompleted,"
					+ "INV.DateConfirmed," + "INV.DateAdded," + "INV.invoiceStatus," + "INV.PaymentTypeID,"
					+ "INV.CategoryID," + "INV.ServiceID," + "INV.SalesTaxID," + "INV.SalesRepID," + "INV.Taxable,"
					+ "INV.Shipped," + "INV.JobCategoryID," + "term.Days," + "INV.BillingAddrID,"
					+ "INV.ShippingAddrID," + "INV.TotalCommission," + "INV.BankAccountID" + " FROM bca_invoice AS INV"
					+ " LEFT JOIN  bca_term AS term" + " ON INV.TermID = term.TermID"
					+ " WHERE  ( ( ( InvoiceTypeID ) IN ( 1, 12 )" + " AND INV.termid <> 3 )"
					+ " OR INV.InvoiceTypeID = 11 )" + " AND INV.AdjustedTotal > 0" + " AND INV.IsPaymentCompleted = 0"
					+ " AND INV.invoiceStatus = 0" + " AND INV.CompanyID =" + companyId + " AND INV.ordernum="
					+ ordernum + " AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
					+ " WHERE  bca_payment.InvoiceID =" + "INV.InvoiceID" + " AND bca_payment.Deleted != 1)"
					+ " OR (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
					+ " WHERE  bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) IS NULL )"
					+ "ORDER  BY ordernum DESC  ";

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
				rb = new ReceivableListDto();
				TblCategoryDto categoryName = category.getCategoryOf(rs.getInt("CategoryID"));
				TblTermLoader termloader = new TblTermLoader();
				TblTerm tblterm = termloader.getObjectOfID(rs.getInt("TermID"));
				int cvId = rs.getInt("ClientVendorID");
				ClientVendor cv = getClentVendor(cvId, companyId);
				rb.setInvoiceID(rs.getInt("InvoiceID"));
				rb.setOrderNum(rs.getInt("OrderNum"));
				rb.setPoNum(rs.getInt("PONum"));
				rb.setEmployeeId(rs.getInt("EmployeeID"));
				rb.setRefNum(rs.getString("RefNum"));
				rb.setMemo(rs.getString("Memo"));
				rb.setCvID(cvId);
				rb.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
				rb.setTotal(rs.getDouble("Total"));
				rb.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
				rb.setPaidAmount(rs.getDouble("PaidAmount"));
				rb.setBalance(rs.getDouble("Balance"));
				rb.setTermID(rs.getInt("TermID"));
				rb.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				rb.setShipCarrierID(rs.getInt("ShipCarrierID"));
				rb.setSh(rs.getDouble("SH")); // new changes
				rb.setSubTotal(rs.getDouble("SubTotal"));
				rb.setTax(rs.getDouble("Tax"));
				rb.setShippingMethod(rs.getString("ShippingMethod"));
				rb.setSalesTaxID(rs.getInt("SalesTaxID"));
				rb.setTaxable(rs.getInt("Taxable") == 1 ? true : false);
				rb.setReceived(rs.getBoolean("IsReceived"));
				rb.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
				rb.setDateConfirmed((java.util.Date) rs.getDate("DateConfirmed"));
				rb.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
				rb.setCategoryID(rs.getInt("CategoryID"));
				rb.setInvoiceStatus(rs.getInt("invoiceStatus"));
				rb.setServiceID(rs.getLong("ServiceID"));
				rb.setSalesRepID(rs.getInt("SalesRepID"));
				rb.setShipped(rs.getInt("Shipped"));
				rb.setJobCategoryID(rs.getInt("JobCategoryID"));
				rb.setBillingAddrID(rs.getInt("BillingAddrID"));
				rb.setShipToAddrID(rs.getInt("ShippingAddrID"));
				rb.setCommission(rs.getDouble("TotalCommission"));
				rb.setBankAccountID(rs.getInt("BankAccountID"));
				rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
				rb.setCompanyName(cv.getName());
				rb.setTblcategory(categoryName);
				rb.setTblterm(tblterm);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return rb;
	}

	@Override
	public ReceivableListDto getInvoiceByPONum(int poNum, int companyId) {
		// TODO Auto-generated method stub

//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		ReceivableListDto rb = null;

		try {
			List<Object[]> list = bcaInvoiceRepository.findInvoiceByPONum(companyId, poNum);
			List<InvoiceDto> invoiceDtos = convertInvoiceDtoToInvoice(list);
			for (InvoiceDto dto : invoiceDtos) {
				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
				rb = new ReceivableListDto();
				TblCategoryDto categoryName = category.getCategoryOf(dto.getCategoryID());
				TblTermLoader termloader = new TblTermLoader();
				TblTerm tblterm = termloader.getObjectOfID(dto.getTermID());
				if (null != dto.getClientVendorID()) {
					int cvId = dto.getClientVendorID();
					ClientVendor cv = getClentVendor(cvId, companyId);
					rb.setCvID(cvId);
					rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
					rb.setCompanyName(cv.getName());
				}
				rb.setInvoiceID(dto.getInvoiceID());
				rb.setOrderNum(dto.getOrderNum());
				rb.setPoNum(dto.getPONum());
				rb.setEmployeeId(dto.getEmployeeID());
				rb.setRefNum(dto.getRefNum());
				rb.setMemo(dto.getMemo());

				rb.setInvoiceTypeID(dto.getInvoiceTypeID());
				rb.setTotal(dto.getTotal());
				rb.setAdjustedTotal(dto.getAdjustedTotal());
				rb.setPaidAmount(dto.getPaidAmount());
				rb.setBalance(dto.getBalance());
				rb.setTermID(dto.getTermID());
				if (null != dto.getPaymentTypeID())
					rb.setPaymentTypeID(dto.getPaymentTypeID());
				if (null != dto.getShipCarrierID())
					rb.setShipCarrierID(dto.getShipCarrierID());
				rb.setSh(dto.getSH()); // new changes
				rb.setSubTotal(dto.getSubTotal());
				rb.setTax(dto.getTax());
				if (null != dto.getShippingMethod())
					rb.setShippingMethod(dto.getShippingMethod());
				if (null != dto.getSalesTaxID())
					rb.setSalesTaxID(dto.getSalesTaxID());
				rb.setTaxable(dto.getTaxable() == 1 ? true : false);
				rb.setReceived(dto.getIsReceived());
				rb.setPaymentCompleted(dto.getIsPaymentCompleted());
				if (null != dto.getDateConfirmed())
					rb.setDateConfirmed(offsetDateTimeToDate(dto.getDateConfirmed()));
				rb.setDateAdded(offsetDateTimeToDate(dto.getDateAdded()));
				if (null != dto.getCategoryID())
					rb.setCategoryID(dto.getCategoryID());
				rb.setInvoiceStatus(dto.getInvoiceStatus());
				if (null != dto.getServiceID())
					rb.setServiceID(dto.getServiceID());
				if (null != dto.getSalesRepID())
					rb.setSalesRepID(dto.getSalesRepID());
				rb.setShipped(dto.getShipped());
				if (null != dto.getJobCategoryID())
					rb.setJobCategoryID(dto.getJobCategoryID());
				if (null != dto.getBillingAddrID())
					rb.setBillingAddrID(dto.getBillingAddrID());
				if (null != dto.getShippingAddrID())
					rb.setShipToAddrID(dto.getShippingAddrID());
				if (null != dto.getTotalCommission())
					rb.setCommission(dto.getTotalCommission());
				rb.setBankAccountID(dto.getBankAccountID());

				rb.setTblcategory(categoryName);
				rb.setTblterm(tblterm);
			}
//			String sql = "SELECT INV.InvoiceID,INV.OrderNum,INV.PONum,INV.SubTotal,INV.Tax,INV.EmployeeID,INV.RefNum,INV.Memo,INV.ShipCarrierID,INV.ShippingMethod,"
//					+ " INV.SH," + "INV.ClientVendorID," + "INV.InvoiceTypeID," + "INV.Total," + "INV.AdjustedTotal,"
//					+ "INV.PaidAmount," + "(SELECT Sum(bca_payment.Amount) AS AB" + " FROM bca_payment"
//					+ " WHERE bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) AS PaidAmount12,"
//					+ "INV.Balance," + "INV.IsReceived," + "INV.TermID," + "INV.IsPaymentCompleted,"
//					+ "INV.DateConfirmed," + "INV.DateAdded," + "INV.invoiceStatus," + "INV.PaymentTypeID,"
//					+ "INV.CategoryID," + "INV.ServiceID," + "INV.SalesTaxID," + "INV.SalesRepID," + "INV.Taxable,"
//					+ "INV.Shipped," + "INV.JobCategoryID," + "term.Days," + "INV.BillingAddrID,"
//					+ "INV.ShippingAddrID," + "INV.TotalCommission," + "INV.BankAccountID" + " FROM bca_invoice AS INV"
//					+ " LEFT JOIN  bca_term AS term" + " ON INV.TermID = term.TermID"
//					+ " WHERE  ( ( ( InvoiceTypeID ) IN ( 2 )" + " AND INV.termid <> 3 )"
//					+ " OR INV.InvoiceTypeID = 11 )" + " AND INV.AdjustedTotal > 0" + " AND INV.IsPaymentCompleted = 0"
//					+ " AND INV.invoiceStatus = 0" + " AND INV.CompanyID =" + companyId + " AND INV.PONum=" + poNum
//					+ " AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
//					+ " WHERE  bca_payment.InvoiceID =" + "INV.InvoiceID" + " AND bca_payment.Deleted != 1)"
//					+ " OR (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
//					+ " WHERE  bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) IS NULL )"
//					+ "ORDER  BY ordernum DESC  ";

//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);

//			while (rs.next()) {
//				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
//				rb = new ReceivableListDto();
//				TblCategoryDto categoryName = category.getCategoryOf(rs.getInt("CategoryID"));
//				TblTermLoader termloader = new TblTermLoader();
//				TblTerm tblterm = termloader.getObjectOfID(rs.getInt("TermID"));
//				int cvId = rs.getInt("ClientVendorID");
//				ClientVendor cv = getClentVendor(cvId, companyId);
//				rb.setInvoiceID(rs.getInt("InvoiceID"));
//				rb.setOrderNum(rs.getInt("OrderNum"));
//				rb.setPoNum(rs.getInt("PONum"));
//				rb.setEmployeeId(rs.getInt("EmployeeID"));
//				rb.setRefNum(rs.getString("RefNum"));
//				rb.setMemo(rs.getString("Memo"));
//				rb.setCvID(cvId);
//				rb.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
//				rb.setTotal(rs.getDouble("Total"));
//				rb.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
//				rb.setPaidAmount(rs.getDouble("PaidAmount"));
//				rb.setBalance(rs.getDouble("Balance"));
//				rb.setTermID(rs.getInt("TermID"));
//				rb.setPaymentTypeID(rs.getInt("PaymentTypeID"));
//				rb.setShipCarrierID(rs.getInt("ShipCarrierID"));
//				rb.setSh(rs.getDouble("SH")); // new changes
//				rb.setSubTotal(rs.getDouble("SubTotal"));
//				rb.setTax(rs.getDouble("Tax"));
//				rb.setShippingMethod(rs.getString("ShippingMethod"));
//				rb.setSalesTaxID(rs.getInt("SalesTaxID"));
//				rb.setTaxable(rs.getInt("Taxable") == 1 ? true : false);
//				rb.setReceived(rs.getBoolean("IsReceived"));
//				rb.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
//				rb.setDateConfirmed((java.util.Date) rs.getDate("DateConfirmed"));
//				rb.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
//				rb.setCategoryID(rs.getInt("CategoryID"));
//				rb.setInvoiceStatus(rs.getInt("invoiceStatus"));
//				rb.setServiceID(rs.getLong("ServiceID"));
//				rb.setSalesRepID(rs.getInt("SalesRepID"));
//				rb.setShipped(rs.getInt("Shipped"));
//				rb.setJobCategoryID(rs.getInt("JobCategoryID"));
//				rb.setBillingAddrID(rs.getInt("BillingAddrID"));
//				rb.setShipToAddrID(rs.getInt("ShippingAddrID"));
//				rb.setCommission(rs.getDouble("TotalCommission"));
//				rb.setBankAccountID(rs.getInt("BankAccountID"));
//				rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
//				rb.setCompanyName(cv.getName());
//				rb.setTblcategory(categoryName);
//				rb.setTblterm(tblterm);
//
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
//			Loger.log(e.toString());
		}
//		finally {
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
		return rb;
	}

	@Override
	public ReceivableListDto getInvoiceForLayawaysByOrderNUm(int ordernum, int companyId) {
		// TODO Auto-generated method stub

//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		ReceivableListDto rb = null;

		try {
			List<Object[]> list = bcaInvoiceRepository.findInvoiceByOrderNum(companyId, ordernum);
			List<InvoiceDto> dtos = convertInvoiceDtoToInvoice(list);
			for (InvoiceDto dto : dtos) {
				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
				rb = new ReceivableListDto();
				TblCategoryDto categoryName = category.getCategoryOf(dto.getCategoryID());
				TblTermLoader termloader = new TblTermLoader();
				TblTerm tblterm = termloader.getObjectOfID(dto.getTermID());
				int cvId = dto.getClientVendorID();
				ClientVendor cv = getClentVendor(cvId, companyId);
				rb.setInvoiceID(dto.getInvoiceID());
				rb.setOrderNum(dto.getOrderNum());
				rb.setPoNum(dto.getPONum());
				rb.setEmployeeId(dto.getEmployeeID());
				rb.setRefNum(dto.getRefNum());
				rb.setMemo(dto.getMemo());
				rb.setCvID(cvId);
				rb.setInvoiceTypeID(dto.getInvoiceTypeID());
				rb.setTotal(dto.getTotal());
				rb.setAdjustedTotal(dto.getAdjustedTotal());
				rb.setPaidAmount(dto.getPaidAmount());
				rb.setBalance(dto.getBalance());
				rb.setTermID(dto.getTermID());
				rb.setPaymentTypeID(dto.getPaymentTypeID());
				rb.setShipCarrierID(dto.getShipCarrierID());
				rb.setSh(dto.getSH()); // new changes
				rb.setSubTotal(dto.getSubTotal());
				rb.setTax(dto.getTax());
				rb.setShippingMethod(dto.getShippingMethod());
				rb.setSalesTaxID(dto.getSalesTaxID());
				rb.setTaxable(dto.getTaxable() == 1 ? true : false);
				rb.setReceived(dto.getIsReceived());
				rb.setPaymentCompleted(dto.getIsPaymentCompleted());
				rb.setDateConfirmed(offsetDateTimeToDate(dto.getDateConfirmed()));
				rb.setDateAdded(offsetDateTimeToDate(dto.getDateAdded()));
				rb.setCategoryID(dto.getCategoryID());
				rb.setInvoiceStatus(dto.getInvoiceStatus());
				rb.setServiceID(dto.getServiceID());
				rb.setSalesRepID(dto.getSalesRepID());
				rb.setShipped(dto.getShipped());
				rb.setJobCategoryID(dto.getJobCategoryID());
				rb.setBillingAddrID(dto.getBillingAddrID());
				rb.setShipToAddrID(dto.getShippingAddrID());
				rb.setCommission(dto.getTotalCommission());
				rb.setBankAccountID(dto.getBankAccountID());
				rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
				rb.setCompanyName(cv.getName());
				rb.setTblcategory(categoryName);
				rb.setTblterm(tblterm);
			}
//			String sql = "SELECT INV.InvoiceID,INV.OrderNum,INV.PONum,INV.SubTotal,INV.Tax,INV.EmployeeID,INV.RefNum,INV.Memo,INV.ShipCarrierID,INV.ShippingMethod,"
//					+ " INV.SH," + "INV.ClientVendorID," + "INV.InvoiceTypeID," + "INV.Total," + "INV.AdjustedTotal,"
//					+ "INV.PaidAmount," + "(SELECT Sum(bca_payment.Amount) AS AB" + " FROM bca_payment"
//					+ " WHERE bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) AS PaidAmount12,"
//					+ "INV.Balance," + "INV.IsReceived," + "INV.TermID," + "INV.IsPaymentCompleted,"
//					+ "INV.DateConfirmed," + "INV.DateAdded," + "INV.invoiceStatus," + "INV.PaymentTypeID,"
//					+ "INV.CategoryID," + "INV.ServiceID," + "INV.SalesTaxID," + "INV.SalesRepID," + "INV.Taxable,"
//					+ "INV.Shipped," + "INV.JobCategoryID," + "term.Days," + "INV.BillingAddrID,"
//					+ "INV.ShippingAddrID," + "INV.TotalCommission," + "INV.BankAccountID" + " FROM bca_invoice AS INV"
//					+ " LEFT JOIN  bca_term AS term" + " ON INV.TermID = term.TermID"
//					+ " WHERE  ( ( ( InvoiceTypeID ) IN ( 1, 12 )" + " AND INV.termid <> 3 )"
//					+ " OR INV.InvoiceTypeID = 18 )" + " AND INV.AdjustedTotal > 0" + " AND INV.IsPaymentCompleted = 0"
//					+ " AND INV.invoiceStatus = 0" + " AND INV.CompanyID =" + companyId + " AND INV.ordernum="
//					+ ordernum + " AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
//					+ " WHERE  bca_payment.InvoiceID =" + "INV.InvoiceID" + " AND bca_payment.Deleted != 1)"
//					+ " OR (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
//					+ " WHERE  bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) IS NULL )"
//					+ "ORDER  BY ordernum DESC  ";

//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);

//			while (rs.next()) {
//				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
//				rb = new ReceivableListDto();
//				TblCategoryDto categoryName = category.getCategoryOf(rs.getInt("CategoryID"));
//				TblTermLoader termloader = new TblTermLoader();
//				TblTerm tblterm = termloader.getObjectOfID(rs.getInt("TermID"));
//				int cvId = rs.getInt("ClientVendorID");
//				ClientVendor cv = getClentVendor(cvId, companyId);
//				rb.setInvoiceID(rs.getInt("InvoiceID"));
//				rb.setOrderNum(rs.getInt("OrderNum"));
//				rb.setPoNum(rs.getInt("PONum"));
//				rb.setEmployeeId(rs.getInt("EmployeeID"));
//				rb.setRefNum(rs.getString("RefNum"));
//				rb.setMemo(rs.getString("Memo"));
//				rb.setCvID(cvId);
//				rb.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
//				rb.setTotal(rs.getDouble("Total"));
//				rb.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
//				rb.setPaidAmount(rs.getDouble("PaidAmount"));
//				rb.setBalance(rs.getDouble("Balance"));
//				rb.setTermID(rs.getInt("TermID"));
//				rb.setPaymentTypeID(rs.getInt("PaymentTypeID"));
//				rb.setShipCarrierID(rs.getInt("ShipCarrierID"));
//				rb.setSh(rs.getDouble("SH")); // new changes
//				rb.setSubTotal(rs.getDouble("SubTotal"));
//				rb.setTax(rs.getDouble("Tax"));
//				rb.setShippingMethod(rs.getString("ShippingMethod"));
//				rb.setSalesTaxID(rs.getInt("SalesTaxID"));
//				rb.setTaxable(rs.getInt("Taxable") == 1 ? true : false);
//				rb.setReceived(rs.getBoolean("IsReceived"));
//				rb.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
//				rb.setDateConfirmed((java.util.Date) rs.getDate("DateConfirmed"));
//				rb.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
//				rb.setCategoryID(rs.getInt("CategoryID"));
//				rb.setInvoiceStatus(rs.getInt("invoiceStatus"));
//				rb.setServiceID(rs.getLong("ServiceID"));
//				rb.setSalesRepID(rs.getInt("SalesRepID"));
//				rb.setShipped(rs.getInt("Shipped"));
//				rb.setJobCategoryID(rs.getInt("JobCategoryID"));
//				rb.setBillingAddrID(rs.getInt("BillingAddrID"));
//				rb.setShipToAddrID(rs.getInt("ShippingAddrID"));
//				rb.setCommission(rs.getDouble("TotalCommission"));
//				rb.setBankAccountID(rs.getInt("BankAccountID"));
//				rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
//				rb.setCompanyName(cv.getName());
//				rb.setTblcategory(categoryName);
//				rb.setTblterm(tblterm);
//
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return rb;
	}

	@Override
	public TblPaymentType getPaymentTypeById(int id) {
		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		TblPaymentType tbt = null;
//
//		String sql = "SELECT * FROM bca_paymenttype WHERE PaymentTypeID = " + id + " AND CompanyID = "
//				+ ConstValue.companyId + " AND Active = 1" + " AND TypeCategory =  " + TblPaymentType.RECEIVED_TYPE;
		try {
			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaPaymenttype> bcaPaymenttypes = bcaPaymenttypeRepository
					.findByPaymentTypeIdAndCompanyAndActiveAndTypeCategory(id, bcaCompany, 1,
							TblPaymentType.RECEIVED_TYPE);
			for (BcaPaymenttype paymenttype : bcaPaymenttypes) {
				tbt = new TblPaymentType();
				tbt.setId(paymenttype.getPaymentTypeId());
				tbt.setTypeName(paymenttype.getName());
				tbt.setType(paymenttype.getType());
				tbt.setCctype_id(paymenttype.getCctype().getCctypeId());
				tbt.setActive(paymenttype.getActive() > 0 ? true : false);
				tbt.setBankAcctID(paymenttype.getBankAcctId());
				tbt.setTypeCategory(paymenttype.getTypeCategory());

			}
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				tbt = new TblPaymentType();
//				tbt.setId(rs.getInt("PaymentTypeID"));
//				tbt.setTypeName(rs.getString("Name"));
//				tbt.setType(rs.getString("Type"));
//				tbt.setCctype_id(rs.getInt("CCTypeID"));
//				tbt.setActive(rs.getBoolean("Active"));
//				tbt.setBankAcctID(rs.getInt("BankAcctID"));
//				tbt.setTypeCategory(rs.getInt("TypeCategory"));
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

		return tbt;
	}

	@Override
	public TblAccount getAccountById(int id) {
		// TODO Auto-generated method stub
		TblAccount account = new TblAccount();
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

//		String sql = "SELECT * FROM bca_account" + " WHERE CompanyID = " + ConstValue.companyId + " AND AcctTypeID = 2"
//				+ " AND Active = 1 AND" + " AccountID = " + id + " ORDER BY AcctCategoryID,Name ASC";

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
			BcaCompany bcaCompany = bcaCompanyRepository.getOne(new Long(ConstValue.companyId));

			BcaAccttype accttype = bcaAccttypeRepository.getOne(2);
			List<BcaAccount> accounts = bcaAccountRepository
					.findByCompanyAndAcctTypeAndActiveAndAccountIdOrderByAcctCategoryAscNameAsc(bcaCompany, accttype, 1,
							id);
//			while (rs.next()) {
//				account.setAccountID(rs.getInt("AccountID"));
//				account.setParentID(rs.getInt("ParentID"));
//				account.setIsCategory(rs.getBoolean("isCategory"));
//				account.setName(rs.getString("Name"));
//				account.setDescription(rs.getString("Description"));
//				account.setAccountTypeID(rs.getInt("AcctTypeID"));
//				account.setAccountCategoryID(rs.getInt("AcctCategoryID"));
//				account.setCvID(rs.getInt("ClientVendorID"));
//				account.setDepositPaymentID(rs.getInt("DepositPaymentID"));
//				account.setCustomerStartingBalance(rs.getDouble("CustomerStartingBalance"));
//				account.setCustomerCurrentBalance(rs.getDouble("CustomerCurrentBalance"));
//				account.setVendorStartingBalance(rs.getDouble("VendorStartingBalance"));
//				account.setVendorCurrentBalance(rs.getDouble("VendorCurrentBalance"));
//				account.setDateAdded(rs.getDate("DateAdded"));
//				account.setFirstCheckNo(rs.getInt("FirstCheck"));
//				account.setLastCheckNo(rs.getInt("LastCheck"));
//			}
			for (BcaAccount bcaAccount : accounts) {
				account.setAccountID(bcaAccount.getAccountId());
				account.setParentID(bcaAccount.getParentId());
				account.setIsCategory(bcaAccount.getIsCategory());
				account.setName(bcaAccount.getName());
				account.setDescription(bcaAccount.getDescription());
				account.setAccountTypeID(bcaAccount.getAcctType().getAcctTypeId());
				account.setAccountCategoryID(bcaAccount.getAcctCategory().getAcctCategoryId());
				account.setCvID(bcaAccount.getClientVendor().getClientVendorId());
				account.setDepositPaymentID(bcaAccount.getDepositPaymentId());
				account.setCustomerStartingBalance(bcaAccount.getCustomerStartingBalance());
				account.setCustomerCurrentBalance(bcaAccount.getCustomerCurrentBalance());
				account.setVendorStartingBalance(bcaAccount.getVendorStartingBalance());
				account.setVendorCurrentBalance(bcaAccount.getVendorCurrentBalance());
				OffsetDateTime offsetDateTime = bcaAccount.getDateAdded();
				Date date = Date.from(offsetDateTime.toInstant());
				account.setDateAdded(date);
				account.setFirstCheckNo(bcaAccount.getFirstCheck());
				account.setLastCheckNo(bcaAccount.getLastCheck());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return account;
	}

	public static TblAccount getAccount(int accountId) {
		TblAccount account = null;
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		String sql = " SELECT * FROM bca_account WHERE AccountID = " + accountId + " AND CompanyID ="
				+ ConstValue.companyId;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				account = new TblAccount();
				account.setAccountID(rs.getInt("AccountID"));
				account.setParentID(rs.getInt("ParentID"));
				account.setIsCategory(rs.getBoolean("isCategory"));
				account.setName(rs.getString("Name"));
				account.setDescription(rs.getString("Description"));
				account.setAccountTypeID(rs.getInt("AcctTypeID"));
				account.setAccountCategoryID(rs.getInt("AcctCategoryID"));
				account.setCvID(rs.getInt("ClientVendorID"));
				account.setDepositPaymentID(rs.getInt("DepositPaymentID"));
				account.setCustomerStartingBalance(rs.getDouble("CustomerStartingBalance"));
				account.setCustomerCurrentBalance(rs.getDouble("CustomerCurrentBalance"));
				account.setVendorStartingBalance(rs.getDouble("VendorStartingBalance"));
				account.setVendorCurrentBalance(rs.getDouble("VendorCurrentBalance"));
				account.setDateAdded(rs.getDate("DateAdded"));
				account.setFirstCheckNo(rs.getInt("FirstCheck"));
				account.setLastCheckNo(rs.getInt("LastCheck"));
				account.setIsitmainaccount(rs.getInt("MAINACCOUNT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

		return account;
	}

	@Override
	public TblPaymentDto getPaymentByPaymentId(int id) {
		// TODO Auto-generated method stub
		TblPaymentDto payment = null;

//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

//		String sql = "SELECT * FROM bca_payment WHERE CompanyID = " + ConstValue.companyId + " AND PaymentID = " + id;

		try {
			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaPayment> bcaPayments = bcaPaymentRepository.findByPaymentIdAndCompany(id, company);
			for (BcaPayment bcaPayment : bcaPayments) {
				payment = new TblPaymentDto();
				payment.setId(bcaPayment.getPaymentId());
				payment.setAmount(bcaPayment.getAmount());
				payment.setPaymentTypeID(bcaPayment.getPaymentType().getPaymentTypeId());
				payment.setPayerID(bcaPayment.getPayerId());
				payment.setPayeeID(bcaPayment.getPayeeId());
				payment.setAccountID(bcaPayment.getAccount().getAccountId());
				payment.setInvoiceID(bcaPayment.getInvoice().getInvoiceId());
				payment.setCategoryId(bcaPayment.getCategory().getCategoryId());
				payment.setCheckNumber(bcaPayment.getCheckNumber());
			}
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				payment = new TblPaymentDto();
//				payment.setId(rs.getInt("PaymentID"));
//				payment.setAmount(rs.getDouble("Amount"));
//				payment.setPaymentTypeID(rs.getInt("PaymentTypeID"));
//				payment.setPayerID(rs.getInt("PayerID"));
//				payment.setPayeeID(rs.getInt("PayeeID"));
//				payment.setAccountID(rs.getInt("AccountID"));
//				payment.setInvoiceID(rs.getInt("InvoiceID"));
//				payment.setCategoryId(rs.getInt("CategoryID"));
//				payment.setCheckNumber(rs.getString("CheckNumber"));
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

		return payment;
	}

	@Override
	public int updateInvoiceByOrderNum(ReceivableListDto receivableListBean) {
		// TODO Auto-generated method stub
		ReceivableListDto rb = getInvoiceByPONum(receivableListBean.getPoNum(), receivableListBean.getCompanyID());
		if (rb == null) {
			try {
				rb = getInvoiceByInvoiceID(receivableListBean.getInvoiceID());
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO Auto-generated catch block
				Loger.log(e.toString());
			}
		}
		double paidAmount = rb.getPaidAmount() + receivableListBean.getBalance();
		// double balance = rb.getAdjustedTotal() - paidAmount;
		double balance = paidAmount - rb.getAdjustedTotal();
		int i = 0;
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		String sql = "";
		try {
			BcaClientvendor clientvendor = bcaClientvendorRepository.getOne(receivableListBean.getCvID());
			BcaCompany company = bcaCompanyRepository.getOne(new Long(receivableListBean.getCompanyID()));
			BcaPaymenttype paymentType = bcaPaymenttypeRepository.getOne(receivableListBean.getPaymentTypeID());
			BcaCategory bcaCategory = bcaCategoryRepository.getOne(receivableListBean.getCategoryID());

			if (receivableListBean.getPoNum() == 0) {

				if (receivableListBean.getInvoiceID() < 0) {
					sql = "update bca_invoice SET PaymentTypeID =" + receivableListBean.getPaymentTypeID() + ","
							+ " BankAccountID=" + receivableListBean.getBankAccountID() + "," + "CategoryID="
							+ receivableListBean.getCategoryID() + "," + " PaidAmount=" + paidAmount + "," + " Balance="
							+ balance + "," + "ClientVendorID=" + receivableListBean.getCvID() + ", Memo='"
							+ receivableListBean.getMemo().trim() + "'" + " Where OrderNum="
							+ receivableListBean.getOrderNum() + " AND CompanyID=" + receivableListBean.getCompanyID();
					bcaInvoiceRepository.updateInvoiceByOrderNum(paymentType, receivableListBean.getBankAccountID(),
							bcaCategory, paidAmount, balance, clientvendor, receivableListBean.getMemo().trim(),
							receivableListBean.getOrderNum(), company);
				} else {
					sql = "update bca_invoice SET PaymentTypeID =" + receivableListBean.getPaymentTypeID() + ","
							+ " BankAccountID=" + receivableListBean.getBankAccountID() + "," + "CategoryID="
							+ receivableListBean.getCategoryID() + "," + " PaidAmount=" + paidAmount + "," + " Balance="
							+ balance + "," + "ClientVendorID=" + receivableListBean.getCvID() + ", Memo='"
							+ receivableListBean.getMemo().trim() + "'" + " Where InvoiceID="
							+ receivableListBean.getInvoiceID() + " AND CompanyID=" + receivableListBean.getCompanyID();
					bcaInvoiceRepository.updateInvoiceByInvoiceId(paymentType, receivableListBean.getBankAccountID(),
							bcaCategory, paidAmount, balance, clientvendor, receivableListBean.getMemo().trim(),
							receivableListBean.getInvoiceID(), company);
				}

			} else {
				sql = "update bca_invoice SET PaymentTypeID =" + receivableListBean.getPaymentTypeID() + ","
						+ " BankAccountID=" + receivableListBean.getBankAccountID() + "," + "CategoryID="
						+ receivableListBean.getCategoryID() + "," + " PaidAmount=" + paidAmount + "," + " Balance="
						+ balance + "," + "ClientVendorID=" + receivableListBean.getCvID() + ", Memo='"
						+ receivableListBean.getMemo().trim() + "'" + " Where PONum=" + receivableListBean.getPoNum()
						+ " AND CompanyID=" + receivableListBean.getCompanyID();
				bcaInvoiceRepository.updateInvoiceByPonum(paymentType, receivableListBean.getBankAccountID(),
						bcaCategory, paidAmount, balance, clientvendor, receivableListBean.getMemo().trim(),
						receivableListBean.getPoNum(), company);
			}
//		if (rb.getPoNum() == 0) {
//			sql = "update bca_invoice SET PaymentTypeID =" + receivableListBean.getPaymentTypeID() + ","
//					+ " BankAccountID=" + receivableListBean.getBankAccountID() + "," + "CategoryID="
//					+ receivableListBean.getCategoryID() + "," + " PaidAmount=" + paidAmount + "," + " Balance="
//					+ balance + "," + "ClientVendorID=" + receivableListBean.getCvID() + ", Memo='"
//					+ receivableListBean.getMemo().trim() + "'" + " Where InvoiceID=" + receivableListBean.getInvoiceID()
//					+ " AND CompanyID=" + receivableListBean.getCompanyID();
//		} else {
//			sql = "update bca_invoice SET PaymentTypeID =" + receivableListBean.getPaymentTypeID() + ","
//					+ " BankAccountID=" + receivableListBean.getBankAccountID() + "," + "CategoryID="
//					+ receivableListBean.getCategoryID() + "," + " PaidAmount=" + paidAmount + "," + " Balance="
//					+ balance + "," + "ClientVendorID=" + receivableListBean.getCvID() + ", Memo='"
//					+ receivableListBean.getMemo().trim() + "'" + " Where InvoiceID=" + rb.getInvoiceID()
//					+ " AND CompanyID=" + receivableListBean.getCompanyID();
//		}

//			stmt = con.createStatement();
//			i = stmt.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
			e.printStackTrace();
		}
//		finally {
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
		return i;
	}

	@Override
	public ArrayList<ReceivableListDto> getInvoiceForUnpaidOpeningbal(int companyId) {
		// TODO Auto-generated method stub
		double openingBalance = 0.0;
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		ArrayList<ReceivableListDto> rlb = new ArrayList<ReceivableListDto>();

//		String sql = "SELECT * " + " FROM bca_clientvendor  WHERE Deleted=0 AND CompanyID =" + copanyId
//				+ " AND CustomerOpenDebit > 0 AND Status = 'N' " + " AND CVTypeID IN(2,1)  ORDER BY   DateAdded DESC";

		try {
//			if (!con.isClosed()) {
//				stmt = con.createStatement();
//
//				rs = stmt.executeQuery(sql);
//
//				while (rs.next()) {
//					ReceivableListDto rb = new ReceivableListDto();
//					openingBalance = rs.getDouble("CustomerOpenDebit");
//					rb.setCvName(rs.getString("FirstName") + " " + rs.getString("LastName"));
//					rb.setCompanyName(rs.getString("Name"));
//					rb.setDateAdded(rs.getDate("DateAdded"));
//					rb.setMemo("Opening Balance");
//					rb.setAdjustedTotal(openingBalance);
//					int cvID = rs.getInt("ClientVendorID");
//					rb.setCvID(cvID);
//					openingBalance = openingBalance - ReceivableListImpl.receiveCustomerOpeningBalance(cvID);
//					rb.setBalance(openingBalance);
//					rb.setInvoiceTypeID(0);
//					rb.setpayFrom(56933);
//					rb.setBankAccountID(56933);
//					rb.setCategoryID(1710319700);
//
//					rlb.add(rb);
//
//				}
//			}
//			Optional<BcaCompany> bcaCompany = bcaCompanyRepository.findById(new Long(companyId));
//			BcaCompany company = null;
//			if (bcaCompany.isPresent()) {
//				company = bcaCompany.get();
//			}
			List<BcaClientvendor> bcaClientvendors = bcaClientvendorRepository
					.findInvoiceForUnpaidOpeningbal(new Long(companyId));
			for (BcaClientvendor bcv : bcaClientvendors) {
				ReceivableListDto rb = new ReceivableListDto();
				openingBalance = bcv.getCustomerOpenDebit();
				rb.setCvName(bcv.getFirstName() + " " + bcv.getLastName());
				rb.setCompanyName(bcv.getName());
				rb.setDateAdded(offsetDateTimeToDate(bcv.getDateAdded()));
				rb.setMemo("Opening Balance");
				rb.setAdjustedTotal(openingBalance);
				int cvID = bcv.getClientVendorId();
				rb.setCvID(cvID);
				openingBalance = openingBalance - ReceivableListImpl.receiveCustomerOpeningBalance(cvID);
				rb.setBalance(openingBalance);
				rb.setInvoiceTypeID(0);
				rb.setpayFrom(56933);
				rb.setBankAccountID(56933);
				rb.setCategoryID(1710319700);

				rlb.add(rb);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Loger.log(e.toString());
		}
//		finally {
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
		return rlb;
	}

	public static double receiveCustomerOpeningBalance(int cvID) {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		double balnace = 0.0;

		String sql = " SELECT Amount FROM bca_payment WHERE ClientVendorID = " + cvID
				+ " AND InvoiceID = -1 and (RmaNo=0 or RmaNo=-1) " + " AND Deleted = 0";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				balnace = balnace + rs.getDouble("Amount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return balnace;
	}

	@Override
	public ArrayList<ReceivableListDto> getUnpaidCreditAmount(int companyId) {
		// TODO Auto-generated method stub
		double openingBalance = 0.0;
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		ArrayList<ReceivableListDto> rlb = new ArrayList<ReceivableListDto>();
		List<Integer> invoiceType = Arrays.asList(ReceivableListDto.PURCHASE_ORDER_INVOICE_TYPE);
		List<Integer> cvTypeId = Arrays.asList(getCustomerTypeId(ConstValue.CUSTOMER),
				getCustomerTypeId(ConstValue.DEALER), getCustomerTypeId(ConstValue.CustVenBoth),
				getCustomerTypeId(ConstValue.DealerVenBoth));
		/*
		 * int cvTypeIdForCustomer = getCustomerTypeId(ConstValue.CUSTOMER); int
		 * cvTypeIdForDealer = getCustomerTypeId(ConstValue.DEALER); int cvTypeIdForBoth
		 * = getCustomerTypeId(ConstValue.DealerVenBoth); int cvTypeIdForDealerVendor =
		 * getCustomerTypeId(ConstValue.DealerVenBoth);
		 */
//		String sql = "SELECT a.RemainingCredit,a.CustomerCreditLine,a.Name,a.FirstName,a.LastName,a.DateAdded,b.DateAdded,"
//				+ " a.ClientVendorID,a.CategoryID,b.InvoiceID,b.Credit,b.Total_Credit ,a.TermID,b.Memo"
//				+ " FROM bca_clientvendor AS a  INNER JOIN bca_invoicecredit AS b ON b.cvId = a.ClientVendorID "
//				+ " WHERE a.Deleted=0 AND b.Deleted = 0 AND b.Credit > 0 " + " AND b.InvoiceTypeID NOT IN("
//				+ ReceivableListDto.PURCHASE_ORDER_INVOICE_TYPE + ") AND CompanyID =" + companyId + " AND Status = 'N'"
//				+ " AND CVTypeID IN(" + getCustomerTypeId(ConstValue.CUSTOMER) + ","
//				+ getCustomerTypeId(ConstValue.DEALER) + "," + getCustomerTypeId(ConstValue.CustVenBoth) + ","
//				+ getCustomerTypeId(ConstValue.DealerVenBoth) + ") ORDER BY b.DateAdded DESC";
		/*
		 * + " AND CVTypeID IN("+cvTypeIdForCustomer+","+cvTypeIdForDealer+","+
		 * cvTypeIdForBoth+","+cvTypeIdForDealerVendor+") ORDER BY b.DateAdded DESC";
		 */

		try {

			List<Object[]> unpaidCreditAmount = bcaClientvendorRepository.findUnpaidCreditAmount(new Long(companyId),
					cvTypeId, invoiceType);
			List<ClientvendorDto> dtos = objectToClienDto(unpaidCreditAmount);

			for (ClientvendorDto obj : dtos) {
				ReceivableListDto uca = new ReceivableListDto();
				openingBalance = obj.getCredit().doubleValue();
				uca.setInvoiceID(obj.getInvoiceId());
//				uca.setPaymentTypeID(paymentTypeID);
				uca.setAdjustedTotal(openingBalance);
				int cvID = obj.getClientVendorId();
				uca.setCvID(cvID);
				uca.setCreditAmount(openingBalance);
				uca.setTotalCreditAmount(obj.getTotalCredit().doubleValue());
				uca.setBalance(openingBalance);
				uca.setInvoiceTypeID(ReceivableListDto.UNPAID_CREDIT_TYPE);
//				uca.setpayFrom(PayFrom);
//				uca.setCategoryID(categoryID);
				uca.setDateAdded(offsetDateTimeToDate(obj.getDateAdded()));
				uca.setCompanyName(obj.getName());
				uca.setCvName(obj.getFirstName() + " " + obj.getLastName());
				uca.setRemainingcreditamount(obj.getRemainingCredit());
				uca.setCustomercreditline(obj.getCustomerCreditLine());

				rlb.add(uca);
			}
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);

//			while (rs.next()) {
//				ReceivableListDto uca = new ReceivableListDto();
//				openingBalance = rs.getDouble("Credit");
//				uca.setInvoiceID(rs.getInt("InvoiceID"));
////				uca.setPaymentTypeID(paymentTypeID);
//				uca.setAdjustedTotal(openingBalance);
//				int cvID = rs.getInt("ClientVendorID");
//				uca.setCvID(cvID);
//				uca.setCreditAmount(openingBalance);
//				uca.setTotalCreditAmount(rs.getDouble("Total_Credit"));
//				uca.setBalance(openingBalance);
//				uca.setInvoiceTypeID(ReceivableListDto.UNPAID_CREDIT_TYPE);
////				uca.setpayFrom(PayFrom);
////				uca.setCategoryID(categoryID);
//				uca.setDateAdded(rs.getDate("DateAdded"));
//				uca.setCompanyName(rs.getString("Name"));
//				uca.setCvName(rs.getString("FirstName" + " " + rs.getString("LastName")));
//				uca.setRemainingcreditamount(rs.getDouble("RemainingCredit"));
//				uca.setCustomercreditline(rs.getDouble("CustomerCreditLine"));
//
//				rlb.add(uca);
//			}
		} catch (Exception e) {
			e.printStackTrace(); // TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return rlb;
	}

	@Autowired
	static private BcaCvtypeRepository bcaCvtypeRepository; // JPA Check Static reposiroty

	public static int getCustomerTypeId(String customerType) {
		int cvTypeId = 0;
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		String sql = "SELECT CVTypeID from bca_cvtype " + " WHERE name='" + customerType + "'";

		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

//		List<Integer> CVTypeIDs = bcaCvtypeRepository.findByName(customerType);
			while (rs.next()) {
				cvTypeId = rs.getInt("CVTypeID");
			}
//		if ( CVTypeIDs.size() > 0  ) {
//			cvTypeId = CVTypeIDs.get(0);
//		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return cvTypeId;
	}

	@Override
	public double getSum(int invoiceId) {
		// TODO Auto-generated method stub
		double amount = 0.0;
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		String sql = "SELECT sum(AMOUNT) as Amount1 FROM bca_payment" // changed by pritesh 22-03-2018 (As Amount actul
																		// value)
				+ " WHERE InvoiceID = " + invoiceId + " AND Deleted = 0";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				amount = rs.getDouble("Amount1");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return amount;
	}

	@Override
	public TblPaymentDto setPayment(ReceivableListDto bean, int InvoiceID, int CompanyID) {
		// TODO Auto-generated method stub
		int cvId = bean.getCvID();
		TblAccount account = getAccountForPayer(cvId, CompanyID);
		TblPaymentDto payment = new TblPaymentDto();
		payment.setAmount(bean.getPaidAmount());
		payment.setPaymentTypeID(bean.getPaymentTypeID());
		payment.setCvID(cvId);
		payment.setInvoiceID(InvoiceID);
		payment.setPayerID(account.getAccountID());
		payment.setCategoryId(bean.getCategoryID());
		payment.setCheckNumber(bean.getCheckNum());
		payment.setBalance(bean.getBalance());
		payment.setOrderNum(bean.getOrderNum());
		payment.setBankAccountID(bean.getBankAccountID());
		payment.setInvoiceAmount(bean.getAdjustedTotal());
		return payment;
	}

	public TblAccount getAccountForPayer(int clientVendorID, int CompanyID) {
		TblAccount account = null;
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

//		String sql = "SELECT * FROM bca_account where ClientVendorID =" + clientVendorID
//				+ " AND Active=1 AND CompanyID =" + CompanyID;
		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				account = new TblAccount();
//				account.setAccountID(rs.getInt("AccountID"));
//				account.setParentID(rs.getInt("ParentID"));
//				account.setIsCategory(rs.getBoolean("isCategory"));
//				account.setName(rs.getString("Name"));
//				account.setDescription(rs.getString("Description"));
//				account.setAccountTypeID(rs.getInt("AcctTypeID"));
//				account.setAccountCategoryID(rs.getInt("AcctCategoryID"));
//				account.setCvID(rs.getInt("ClientVendorID"));
//				account.setDepositPaymentID(rs.getInt("DepositPaymentID"));
//				account.setCustomerStartingBalance(rs.getDouble("CustomerStartingBalance"));
//				account.setCustomerCurrentBalance(rs.getDouble("CustomerCurrentBalance"));
//				account.setVendorStartingBalance(rs.getDouble("VendorStartingBalance"));
//				account.setVendorCurrentBalance(rs.getDouble("VendorCurrentBalance"));
//				account.setDateAdded(rs.getDate("DateAdded"));
//				account.setFirstCheckNo(rs.getInt("FirstCheck"));
//				account.setLastCheckNo(rs.getInt("LastCheck"));
//			}
//			Optional<BcaClientvendor> optional = bcaClientvendorRepository.findById(clientVendorID);
//			Optional<BcaCompany> optional2 = bcaCompanyRepository.findById(new Long(CompanyID));
//			BcaClientvendor bcaClientvendor = null;
//			BcaCompany company = null;
//			if (optional.isPresent() && optional2.isPresent()) {
//				bcaClientvendor = optional.get();
//				company = optional2.get();
//			}
			List<BcaAccount> accounts = bcaAccountRepository.findByClientVendorAndActiveAndCompany(clientVendorID, 1,
					new Long(CompanyID));
			for (BcaAccount bcaAccount : accounts) {
				account = new TblAccount();
				account.setAccountID(bcaAccount.getAccountId());
				account.setParentID(bcaAccount.getParentId());
				account.setIsCategory(bcaAccount.getIsCategory());
				account.setName(bcaAccount.getName());
				account.setDescription(bcaAccount.getDescription());
				if (null != bcaAccount.getAcctType())
					account.setAccountTypeID(bcaAccount.getAcctType().getAcctTypeId());
				if (null != bcaAccount.getAcctCategory())
					account.setAccountCategoryID(bcaAccount.getAcctCategory().getAcctCategoryId());
				if (null != bcaAccount.getClientVendor())
					account.setCvID(bcaAccount.getClientVendor().getClientVendorId());
				if (null != bcaAccount.getDepositPaymentId())
					account.setDepositPaymentID(bcaAccount.getDepositPaymentId());
				account.setCustomerStartingBalance(bcaAccount.getCustomerStartingBalance());
				account.setCustomerCurrentBalance(bcaAccount.getCustomerCurrentBalance());
				account.setVendorStartingBalance(bcaAccount.getVendorStartingBalance());
				account.setVendorCurrentBalance(bcaAccount.getVendorCurrentBalance());
				account.setDateAdded(offsetDateTimeToDate(bcaAccount.getDateAdded()));
				if (null != bcaAccount.getFirstCheck())
					account.setFirstCheckNo(bcaAccount.getFirstCheck());
				if (null != bcaAccount.getLastCheck())
					account.setLastCheckNo(bcaAccount.getLastCheck());
			}
		} catch (Exception e) {
			e.printStackTrace(); // TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return account;
	}

	public TblAccount getAccountByPayerId(int payerId) {
		// TODO Auto-generated method stub
		TblAccount account = null;
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

//		String sql = "SELECT * FROM bca_account" + " WHERE CompanyID = " + ConstValue.companyId + " AND Active = 1 AND"
//				+ " AccountID = " + payerId + " ORDER BY AcctCategoryID,Name ASC";

		try {
			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaAccount> accounts = bcaAccountRepository
					.findByCompanyAndActiveAndAccountIdOrderByAcctCategoryAscNameAsc(company, 1, payerId);
			for (BcaAccount bcaAccount : accounts) {
				account = new TblAccount();
				account.setAccountID(bcaAccount.getAccountId());
				account.setParentID(bcaAccount.getParentId());
				account.setIsCategory(bcaAccount.getIsCategory());
				account.setName(bcaAccount.getName());
				account.setDescription(bcaAccount.getDescription());
				account.setAccountTypeID(bcaAccount.getAcctType().getAcctTypeId());
				account.setAccountCategoryID(bcaAccount.getAcctCategory().getAcctCategoryId());
				account.setCvID(bcaAccount.getClientVendor().getClientVendorId());
				account.setDepositPaymentID(bcaAccount.getDepositPaymentId());
				account.setCustomerStartingBalance(bcaAccount.getCustomerStartingBalance());
				account.setCustomerCurrentBalance(bcaAccount.getCustomerCurrentBalance());
				account.setVendorStartingBalance(bcaAccount.getVendorStartingBalance());
				account.setVendorCurrentBalance(bcaAccount.getVendorCurrentBalance());
				account.setDateAdded(offsetDateTimeToDate(bcaAccount.getDateAdded()));
				account.setFirstCheckNo(bcaAccount.getFirstCheck());
				account.setLastCheckNo(bcaAccount.getLastCheck());
			}
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				account = new TblAccount();
//				account.setAccountID(rs.getInt("AccountID"));
//				account.setParentID(rs.getInt("ParentID"));
//				account.setIsCategory(rs.getBoolean("isCategory"));
//				account.setName(rs.getString("Name"));
//				account.setDescription(rs.getString("Description"));
//				account.setAccountTypeID(rs.getInt("AcctTypeID"));
//				account.setAccountCategoryID(rs.getInt("AcctCategoryID"));
//				account.setCvID(rs.getInt("ClientVendorID"));
//				account.setDepositPaymentID(rs.getInt("DepositPaymentID"));
//				account.setCustomerStartingBalance(rs.getDouble("CustomerStartingBalance"));
//				account.setCustomerCurrentBalance(rs.getDouble("CustomerCurrentBalance"));
//				account.setVendorStartingBalance(rs.getDouble("VendorStartingBalance"));
//				account.setVendorCurrentBalance(rs.getDouble("VendorCurrentBalance"));
//				account.setDateAdded(rs.getDate("DateAdded"));
//				account.setFirstCheckNo(rs.getInt("FirstCheck"));
//				account.setLastCheckNo(rs.getInt("LastCheck"));
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return account;
	}

	public TblAccount getAccountByPayeeId(int payeeId) {
		TblAccount account = null;
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

//		String sql = "SELECT * FROM bca_account" + " WHERE CompanyID = " + ConstValue.companyId + " AND Active = 1 AND"
//				+ " AccountID = " + payeeId + " ORDER BY AcctCategoryID,Name ASC";

		try {
			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaAccount> accounts = bcaAccountRepository
					.findByCompanyAndActiveAndAccountIdOrderByAcctCategoryAscNameAsc(company, 1, payeeId);
			for (BcaAccount bcaAccount : accounts) {
				account = new TblAccount();
				account.setAccountID(bcaAccount.getAccountId());
				account.setParentID(bcaAccount.getParentId());
				account.setIsCategory(bcaAccount.getIsCategory());
				account.setName(bcaAccount.getName());
				account.setDescription(bcaAccount.getDescription());
				account.setAccountTypeID(bcaAccount.getAcctType().getAcctTypeId());
				account.setAccountCategoryID(bcaAccount.getAcctCategory().getAcctCategoryId());
				account.setCvID(bcaAccount.getClientVendor().getClientVendorId());
				account.setDepositPaymentID(bcaAccount.getDepositPaymentId());
				account.setCustomerStartingBalance(bcaAccount.getCustomerStartingBalance());
				account.setCustomerCurrentBalance(bcaAccount.getCustomerCurrentBalance());
				account.setVendorStartingBalance(bcaAccount.getVendorStartingBalance());
				account.setVendorCurrentBalance(bcaAccount.getVendorCurrentBalance());
				account.setDateAdded(offsetDateTimeToDate(bcaAccount.getDateAdded()));
				account.setFirstCheckNo(bcaAccount.getFirstCheck());
				account.setLastCheckNo(bcaAccount.getLastCheck());
			}

//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				account = new TblAccount();
//				account.setAccountID(rs.getInt("AccountID"));
//				account.setParentID(rs.getInt("ParentID"));
//				account.setIsCategory(rs.getBoolean("isCategory"));
//				account.setName(rs.getString("Name"));
//				account.setDescription(rs.getString("Description"));
//				account.setAccountTypeID(rs.getInt("AcctTypeID"));
//				account.setAccountCategoryID(rs.getInt("AcctCategoryID"));
//				account.setCvID(rs.getInt("ClientVendorID"));
//				account.setDepositPaymentID(rs.getInt("DepositPaymentID"));
//				account.setCustomerStartingBalance(rs.getDouble("CustomerStartingBalance"));
//				account.setCustomerCurrentBalance(rs.getDouble("CustomerCurrentBalance"));
//				account.setVendorStartingBalance(rs.getDouble("VendorStartingBalance"));
//				account.setVendorCurrentBalance(rs.getDouble("VendorCurrentBalance"));
//				account.setDateAdded(rs.getDate("DateAdded"));
//				account.setFirstCheckNo(rs.getInt("FirstCheck"));
//				account.setLastCheckNo(rs.getInt("LastCheck"));
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return account;
	}

	@Override
	public void insertAccount(TblPaymentDto payment, ReceivableListDto bean) throws SQLException {
		// TODO Auto-generated method stub
		Savepoint payment_svpt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();

		try {
			con = db.getConnection();
			con.setAutoCommit(false);
			payment_svpt = con.setSavepoint("insertAccount");

			int paymentId = transaction(payment);
			try {
				pID = paymentId;

				System.out.println("P id is :66" + pID);
				p.setpID(pID);
			} catch (Exception e) {
				Loger.log(e.toString());
			}

			invoicePaid(bean, true);

			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException e) {
			throw e;
		}

	}

	public int transaction(TblPaymentDto payment) throws SQLException {
		int paymentId = -1;
		double payFromBalance = 0.00;
		double payToBalance = 0.00;
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		try {
			con = db.getConnection();

			payment.setAccountCategoryId(payment.getCategoryId());
			TblAccount fromAccount = getAccountByPayerId(payment.getPayerID());
			if (fromAccount != null) {
				adjustBankBalance(fromAccount, -payment.getAmount());
				payFromBalance = (fromAccount.getCustomerCurrentBalance());
			}
			TblAccount toAccount = getAccountByPayeeId(payment.getPayeeID());

			String sql = " INSERT INTO bca_payment(Amount,PaymentTypeID,PayerID,PayeeID,AccountID,ClientVendorID,InvoiceID,"
					+ "CategoryID,AccountCategoryID,CompanyID,IsToBePrinted,isNeedtoDeposit,TransactionID,CheckNumber,PayFromBalance,PayToBalance,Priority,RmaNo,RmaItemID,TransactionType) "
					+ " VALUES (" + payment.getAmount() + "," + payment.getPaymentTypeID() + "," + payment.getPayerID()
					+ "," + payment.getPayeeID() + "," + payment.getPayerID() + "," + payment.getCvID() + ","
					+ payment.getInvoiceID() + "," + payment.getCategoryId() + "," + payment.getAccountCategoryId()
					+ "," + ConstValue.companyId + ","
					/*
					 * + (payment.getDateAdded() == null ? null : ("'" +
					 * JProjectUtil.getDateFormater().format(new Date()) + "'")) + ","
					 */
					+ (payment.isToBePrinted() == true ? 1 : 0) + "," + (payment.isNeedToDeposit() == false ? 1 : 0)
					+ ",'" + payment.getTransactionID() + "','" + payment.getCheckNumber() + "'" + "," + payFromBalance
					+ "," + payToBalance + "," + payment.getPriority() + "," + payment.getRmaNo() + ","
					+ payment.getRmaItemID() + "," + payment.getInvoiceTypeID() + ")";

			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			rs = stmt.executeQuery("SELECT MAX(PaymentID) AS LastID FROM bca_payment");

			if (rs.next()) {
				paymentId = rs.getInt("LastID");
				/** payment detail */
			}

			/*
			 * if (payment.getPaymentDetail() != null) {
			 * payment.getPaymentDetail().setPaymentID(paymentId);
			 * TblPaymentDetailLoader.insert(paymentId, payment.getPaymentDetail()); }
			 */
			pID = paymentId;
			p.setpID(pID);
		} catch (Exception e) {
			// TODO: handle exception
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

		return paymentId;
	}

//	public void adjustBankBalance(TblAccount account, double amount) throws SQLException {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
////		String sql_get = "SELECT CustomerCurrentBalance FROM bca_account WHERE AccountID=" + account.getAccountID()
////				+ " AND CompanyID=" + ConstValue.companyId;
//
//		try {
////			stmt = con.createStatement();
////			rs = stmt.executeQuery(sql_get);
//			double currentBalance = 0.0;
////			if (rs.next()) {
////				currentBalance = rs.getDouble("CustomerCurrentBalance");
////			}
////			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
//			Optional<BcaAccount> accounts = bcaAccountRepository
//					.findByAccountIdAndCompany_CompanyId(account.getAccountID(), new Long(ConstValue.companyId));
//			if (accounts.isPresent()) {
//				currentBalance = accounts.get().getCustomerCurrentBalance();
//				
//			}
//
//			String sql_put = "UPDATE bca_account SET CustomerCurrentBalance=" + (currentBalance + amount);
//			if (account.getLastCheckNo() > 0) {
//				sql_put += ", LastCheck=" + account.getLastCheckNo();
//			}
//			sql_put += " WHERE AccountID = " + account.getAccountID();
//			stmt.executeUpdate(sql_put);
//			if (amount < 0) {
//				account.setCustomerCurrentBalance(currentBalance + amount);
//			} else {
//				account.setVendorCurrentBalance(currentBalance + amount);
//			}
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

	public void adjustBankBalance(TblAccount account, double amount) throws SQLException {

//		String sql_get = "SELECT CustomerCurrentBalance FROM bca_account WHERE AccountID=" + account.getAccountID()
//				+ " AND CompanyID=" + ConstValue.companyId;

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql_get);
			double currentBalance = 0.0;
//			if (rs.next()) {
//				currentBalance = rs.getDouble("CustomerCurrentBalance");
//			}
//			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			Optional<BcaAccount> accounts = bcaAccountRepository
					.findByAccountIdAndCompany_CompanyId(account.getAccountID(), new Long(ConstValue.companyId));
			if (accounts.isPresent()) {
				currentBalance = accounts.get().getCustomerCurrentBalance();
				accounts.get().setCustomerCurrentBalance(currentBalance + amount);
				if (account.getLastCheckNo() > 0)
					accounts.get().setLastCheck(account.getLastCheckNo());
				bcaAccountRepository.save(accounts.get());
			}

			if (amount < 0) {
				account.setCustomerCurrentBalance(currentBalance + amount);
			} else {
				account.setVendorCurrentBalance(currentBalance + amount);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}

	}

	public static void invoicePaid(ReceivableListDto invoice, boolean b) throws SQLException {
		boolean paymentCompleted = false;
		double paidAmount = 0.0;

		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		invoice.setInvoiceStatus(ReceivableListDto.NORMAL_INVOICE_STATUS);

		if (b) {
			if (invoice.getBalance() == 0.0) {
				paymentCompleted = true;

			}
			/* paymentCompleted = true; */
			paidAmount = invoice.getAdjustedTotal() - invoice.getBalance();

		} else {
			paymentCompleted = true;
			paidAmount = invoice.getPaidAmount();

		}

		String sql = " UPDATE bca_invoice SET " + " IsPaymentCompleted=" + (paymentCompleted == true ? 1 : 0) + ","
				+ " PaidAmount =" + paidAmount + "," + " Balance=" + invoice.getBalance() + "," + " AdjustedTotal="
				+ invoice.getAdjustedTotal() + "," + " CategoryID=" + invoice.getCategoryID() + "," + " ClientVendorID="
				+ invoice.getCvID() + "," + " BillingAddrID=" + invoice.getBillingAddrId() + "," + " ShippingAddrID="
				+ invoice.getShippingAddrId() + "," + " invoiceStatus = " + invoice.getInvoiceStatus()
				+ " WHERE InvoiceID=" + invoice.getInvoiceID() + " AND CompanyID=" + ConstValue.companyId;
		try {

			stmt = con.createStatement();
			stmt.executeUpdate(sql);

		} catch (SQLException e) {
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

	@Override
	public void getLastId(TblPaymentDto payment) {
		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

//		String sql = "SELECT MAX(PaymentID) AS LastID FROM bca_payment";

		try {
			Optional<Integer> lastId = bcaPaymentRepository.findTopByOrderByPaymentIdDesc();
			if (lastId.isPresent()) {

				payment.setId(lastId.get());
			}
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				int pIDD = rs.getInt("LastID");
//				// System.out.println("Payment ID is at line no: 4327"+pIDD);
//				payment.setId(pIDD);
//
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

	@Override
	public void depositTo(TblPaymentDto payment, TblAccount account, int priority) throws SQLException {
		// TODO Auto-generated method stub
//		boolean state = false;
//		Connection con;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();

		java.util.Date d = Calendar.getInstance().getTime();
		String date = JProjectUtil.getDateFormater().format(d);
		/* priority = getPriority() + 1; */

		try {
//			String sql_working = "UPDATE bca_payment SET " + " isNeedtoDeposit = 0 ," + " PayeeID=?," + " DateAdded=? ,"
//					+ " AccountID = ?," + " Deleted= 0 ," + " Priority=?" + " WHERE CompanyID =?"
//					+ " AND PaymentID =?  ";
			BcaCompany company = bcaCompanyRepository.getOne(new Long(ConstValue.companyId));
			BcaAccount bcaAccount = bcaAccountRepository.getOne(account.getAccountID());
			int updated = bcaPaymentRepository.depositToBcaPayment(account.getAccountID(), date, bcaAccount,
					priority + 1, company, payment.getId());
//			pstmt = con.prepareStatement(sql_working);
			payment.setPayeeID(account.getAccountID());
//			pstmt.setInt(1, account.getAccountID());
//			pstmt.setString(2, date);
//			pstmt.setInt(3, account.getAccountID());
//			pstmt.setInt(4, priority + 1);
//			pstmt.setInt(5, ConstValue.companyId);
//			pstmt.setInt(6, payment.getId());

//			pstmt.addBatch();
			adjustCurrentBalance(payment);
			adjustBankBalance(account, payment.getAmount());

//			pstmt.executeBatch();
//			state = true;
		} catch (Exception e) {
			Loger.log(e.toString());
		}
//		finally {
//			try {
//
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

	}

	public void adjustCurrentBalance(TblPaymentDto payment) throws SQLException {
		double payFromBalance = 0.0;
		double payToBalance = 0.0;
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		String sql_getPayee = "SELECT CustomerCurrentBalance FROM bca_account " + " WHERE AccountID = "
				+ payment.getPayeeID() + " AND CompanyID = " + ConstValue.companyId;
		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql_getPayee);

			if (rs.next()) {
				payToBalance = rs.getDouble("CustomerCurrentBalance");
			}

			String sql_put = "UPDATE bca_payment " + " SET PayToBalance=" + (payToBalance + payment.getAmount())
					+ " WHERE PaymentID = " + payment.getId();

			stmt.executeUpdate(sql_put);

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

	@Override
	public double getAmountByInvoiceId(ReceivableListDto invoice) {
		// TODO Auto-generated method stub
		double amount = 0.0;
		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//
//		String sql = "select sum(Amount) from bca_payment where CompanyID=" + ConstValue.companyId + " and InvoiceID="
//				+ invoice.getInvoiceID();

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				amount = rs.getDouble("sum(Amount)");
//			}
			Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
			Optional<BcaInvoice> inv = bcaInvoiceRepository.findById(invoice.getInvoiceID());
			if (company.isPresent() && inv.isPresent()) {
				amount = bcaPaymentRepository.getSumOfAmount(company.get(), inv.get());
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return amount;
	}

	@Override
	public ArrayList<TblPaymentDto> getReceivedList(int compantId, String dateStr) {
		// TODO Auto-generated method stub
		double amount = 0.0;

		ArrayList<TblPaymentDto> rl = new ArrayList<TblPaymentDto>();

		StringBuffer queryBuffer = new StringBuffer("SELECT  a FROM BcaPayment a "
				+ "LEFT JOIN BcaInvoice b  ON a.invoice.invoiceId = b.invoiceId "
				+ " WHERE a.company.companyId =:companyId AND "
				+ "(a.invoice.invoiceId <> -1 OR a.invoice.invoiceId <> 0) "
				+ " AND a.rmaNo <=0 AND b.invoiceType.invoiceTypeId IN :invoiceTypeId "
				+ " AND a.deleted =0 AND a.transactionType <> :transactionType " + " AND a.category.categoryId <> -11 "
				+ ((!dateStr.equals("")) ? " AND a.dateAdded  " + dateStr : " ") + " ORDER BY b.orderNum DESC");
		List<Integer> invoiceTypeId = Arrays.asList(1, 11, 12, 16, 17, 31);

		try {
			String query = queryBuffer.toString();
			TypedQuery<BcaPayment> typedQuery = this.entityManager.createQuery(query, BcaPayment.class);
			JpaHelper.addParameter(typedQuery, query, "companyId", new Long(compantId));
			JpaHelper.addParameter(typedQuery, query, "invoiceTypeId", invoiceTypeId);
			JpaHelper.addParameter(typedQuery, query, "transactionType", ReceivableListDto.UNPAID_CREDIT_TYPE);
			List<BcaPayment> bcaPayment = typedQuery.getResultList();
			for (BcaPayment bPayment : bcaPayment) {
				TblPaymentDto payment = new TblPaymentDto();
				if (bPayment.getCategory() != null) {
					TblCategoryDto categoryName = categoryDtoLoader
							.getCategoryOf(bPayment.getCategory().getCategoryId());
					payment.setTblcategory(categoryName);

				}
				if (null != bPayment.getClientVendor()) {
					ClientVendor cv = getClentVendor(bPayment.getClientVendor().getClientVendorId(),
							ConstValue.companyId);
					payment.setCvName(cv.getFirstName() + " " + cv.getLastName());
					payment.setCompanyName(cv.getName());

					payment.setCvID(bPayment.getClientVendor().getClientVendorId());
				}
				payment.setId(bPayment.getPaymentId());
				payment.setAmount(bPayment.getAmount());
				if (null != bPayment.getPaymentType()) {
					payment.setPaymentTypeID(bPayment.getPaymentType().getPaymentTypeId());

					payment.setPaymentTypeName(getPaymentTypeName(payment.getPaymentTypeID()));
				}
				payment.setPayerID(bPayment.getPayerId());
				payment.setPayeeID(bPayment.getPayeeId());
				if (null != bPayment.getAccount()) {
					payment.setAccountID(bPayment.getAccount().getAccountId());
					payment.setAccountName(getAccountNameById(payment.getAccountID()));
				}
				if (null != bPayment.getInvoice()) {
					payment.setInvoiceID(bPayment.getInvoice().getInvoiceId());
					long orderNum = getOrderNUmberByInvoiceId(payment.getInvoiceID());
					payment.setOrderNum(orderNum);
					payment.setOrderNumStr(MyUtility.getOrderNumberByConfigData(String.valueOf(orderNum),
							AppConstants.InvoiceType, configDto, false));
				}
				if (null != bPayment.getCategory())
					payment.setCategoryId(bPayment.getCategory().getCategoryId());
				payment.setAccountCategoryId(bPayment.getAccountCategoryId());
				try {
					payment.setDateAdded(offsetDateTimeToDate(bPayment.getDateAdded()));
				} catch (Exception e) {
					Loger.log(e.toString());
				}
				payment.setNeedToDeposit(bPayment.getIsNeedtoDeposit());
				payment.setToBePrinted(bPayment.getIsToBePrinted());
				payment.setCheckNumber(bPayment.getCheckNumber());
				rl.add(payment);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
		return rl;
	}

//	@Override
//	public ArrayList<TblPaymentDto> getReceivedList(int compantId, String dateStr) {
//		// TODO Auto-generated method stub
//		double amount = 0.0;
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//		ArrayList<TblPaymentDto> rl = new ArrayList<TblPaymentDto>();
//
//		String sql = "SELECT a.* " + " FROM bca_payment a , bca_invoice b" + " WHERE a.CompanyID = " + compantId
//				+ " AND ( a.InvoiceID <> -1 OR a.InvoiceID <> 0 )" + " AND a.RmaNo <= 0 "
//				+ " AND b.InvoiceTypeID IN (1,11,12,16,17,31) " + " AND a.InvoiceID=b.InvoiceID " + " AND a.Deleted=0"
//				+ " AND a.TransactionType <> " + ReceivableListDto.UNPAID_CREDIT_TYPE // + " AND a.TransactionType <>
//																						// 19"
//				+ " AND a.CategoryID <> -11";
//
//		if (!dateStr.equals("")) {
//			sql = sql + " AND a.DateAdded " + dateStr;
//		}
//
//		sql += " ORDER BY b.OrderNum DESC ";
//
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				TblPaymentDto payment = new TblPaymentDto();
//				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
//				TblCategoryDto categoryName = category.getCategoryOf(rs.getInt("CategoryID"));
//				ClientVendor cv = getClentVendor(rs.getInt("ClientVendorID"), ConstValue.companyId);
//				payment.setId(rs.getInt("PaymentID"));
//				payment.setAmount(rs.getDouble("Amount"));
//				payment.setPaymentTypeID(rs.getInt("PaymentTypeID"));
//				payment.setPaymentTypeName(getPaymentTypeName(payment.getPaymentTypeID()));
//				payment.setPayerID(rs.getInt("PayerID"));
//				payment.setPayeeID(rs.getInt("PayeeID"));
//				payment.setAccountID(rs.getInt("AccountID"));
//				payment.setAccountName(getAccountNameById(payment.getAccountID()));
//				payment.setCvID(rs.getInt("ClientVendorID"));
//				payment.setInvoiceID(rs.getInt("InvoiceID"));
//				long orderNum = getOrderNUmberByInvoiceId(payment.getInvoiceID());
//				payment.setOrderNum(orderNum);
//				payment.setOrderNumStr(MyUtility.getOrderNumberByConfigData(String.valueOf(orderNum),
//						AppConstants.InvoiceType, configDto, false));
//				payment.setCategoryId(rs.getInt("CategoryID"));
//				payment.setAccountCategoryId(rs.getInt("AccountCategoryID"));
//				payment.setDateAdded(rs.getDate("DateAdded"));
//				payment.setNeedToDeposit(rs.getBoolean("isNeedtoDeposit"));
//				payment.setToBePrinted(rs.getBoolean("IsToBePrinted"));
//				payment.setCheckNumber(rs.getString("CheckNumber"));
//				payment.setTblcategory(categoryName);
//				payment.setCvName(cv.getFirstName() + " " + cv.getLastName());
//				payment.setCompanyName(cv.getName());
//				/*
//				 * payment.setPaymentDetail(tblPaymentDetailLoader.getPaymentDetail(payment.
//				 * getId()));
//				 */
//				rl.add(payment);
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
//		return rl;
//	}
	public TblAccount getAccountNameById(int accId) {
		TblAccount account = null;
		try {
			Optional<BcaAccount> bca_account = bcaAccountRepository.findByAccountIdAndCompany_CompanyId(accId,
					ConstValue.companyIdLong);
			if (bca_account.isPresent()) {
				account = new TblAccount();
				account.setName(bca_account.get().getName());
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
		return account;
	}

//	public TblAccount getAccountNameById(int accId) {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//		TblAccount account = null;
//		String sql = "SELECT Name from bca_account where AccountID=" + accId + " AND CompanyID=" + ConstValue.companyId;
//
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				account = new TblAccount();
//				account.setName(rs.getString("Name"));
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
//		return account;
//	}

	public String getPaymentTypeName(int paymentID) {
		String paymentTypeName = "";
		try {
			Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository
					.findByCompany_CompanyIdAndPaymentTypeId(ConstValue.companyIdLong, paymentID);
			if (paymentType.isPresent()) {
				paymentTypeName = paymentType.get().getName();
			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return paymentTypeName;
	}

//	public String getPaymentTypeName(int paymentID) {
//		String paymentTypeName = "";
//
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//
//		String sql = " SELECT Name FROM bca_paymenttype" + " WHERE PaymentTypeID = " + paymentID + " AND CompanyID = "
//				+ ConstValue.companyId;
//
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				paymentTypeName = rs.getString(1);
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
//		return paymentTypeName;
//	}

	public int getOrderNUmberByInvoiceId(int invId) {

		int orderNum = -1;

		try {

			Optional<BcaInvoice> bca_invoice = bcaInvoiceRepository.findByInvoiceIdAndCompany_CompanyId(invId,
					ConstValue.companyIdLong);
			if (bca_invoice.isPresent()) {
				orderNum = bca_invoice.get().getOrderNum();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}

		return orderNum;
	}
//	public int getOrderNUmberByInvoiceId(int invId) {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		int orderNum = -1;
//		con = db.getConnection();
//
//		String sql = "SELECT OrderNum FROM bca_invoice where CompanyID=" + ConstValue.companyId + " AND InvoiceID = "
//				+ invId;
//
//		try {
//			
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				orderNum = rs.getInt("OrderNum");
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
//
//		return orderNum;
//	}

	@Override
	public ArrayList<Date> getDateRange() {
		// TODO Auto-generated method stub
		Date fromDate = null;
		Date toDate = null;
		ArrayList<Date> al = new ArrayList<Date>();
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		String sql = "SELECT MIN(a.DateAdded),MAX(a.DateAdded)" + " FROM bca_payment as a , bca_invoice as b"
				+ " WHERE a.CompanyID =" + ConstValue.companyId + " AND a.InvoiceID=b.InvoiceID"
				+ " AND ( a.InvoiceID <> -1 OR a.InvoiceID <> 0)" + " AND a.Deleted=0 " /* false */
				+ " AND b.InvoiceTypeID IN (1,11,12)";

		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				fromDate = rs.getDate(1);
				toDate = rs.getDate(2);

				if (toDate != null) {
					if (toDate.before(new Date())) {
						toDate = new Date();
					}
				}
			}
			if (fromDate == null && toDate == null) {
				fromDate = new Date();
				toDate = new Date();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			fromDate = new Date();
			toDate = new Date();
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
		al.add(fromDate);
		al.add(toDate);
		return al;
	}

	@Override
	public String getDateString(Date from, Date to) {
		// TODO Auto-generated method stub
		String sql = "";
		String strFrom = "";
		String strTo = "";

		if (from != null) {
			strFrom = JProjectUtil.getDateFormaterCommon().format(from).concat(" " + "00:00:00");
		}
		if (to != null) {
			strTo = JProjectUtil.getDateFormaterCommon().format(to)
					.concat(" " + JProjectUtil.getcurrentTime().format(new Date()));
		}

		if (from != null && to != null) {
			if (from.equals(to)) {
				strFrom = JProjectUtil.getDateFormater().format(from).concat(" " + "00:00:00");
				strTo = JProjectUtil.getDateFormater().format(to).concat(" " + "23:59:59");
			}
		}
		sql = " BETWEEN " + ConstValue.getTIMESTAMP_START() + "'" + strFrom + "'" + ConstValue.getTIMESTAMP_END()
				+ " AND " + ConstValue.getTIMESTAMP_START() + "'" + strTo + "'" + ConstValue.getTIMESTAMP_END();

		return sql;
	}

	@Override
	public String getPaidOrUnpaid(int invoiceID, int payableId) {
		// TODO Auto-generated method stub
		String PaidOrUnpaid = "Unpaid";
		double total = 0.0;
		double adTotal = 0.0;
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		String sql = "";
		if (payableId <= 0) {
			sql = "SELECT sum(b.Amount) As TotalAmount,a.InvoiceID," + " a.AdjustedTotal from bca_invoice AS a,"
					+ " bca_payment AS b where b.CompanyID=" + ConstValue.companyId
					+ " and a.InvoiceID = b.InvoiceID and b.isNeedtoDeposit=0 and b.InvoiceID=" + invoiceID
					+ " AND b.Deleted != 1" + " GROUP By b.InvoiceID";
		} else {
			sql = "SELECT sum(b.Amount) As TotalAmount,a.InvoiceID," + " a.AdjustedTotal from bca_invoice AS a,"
					+ " bca_payment AS b where b.CompanyID=" + ConstValue.companyId
					+ " and a.InvoiceID = b.InvoiceID and b.InvoiceID=" + invoiceID + " AND b.Deleted !=1"
					+ " GROUP By b.InvoiceID";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				total = rs.getDouble("TotalAmount");
				adTotal = rs.getDouble("AdjustedTotal");
			}
			if (total == adTotal) {
				PaidOrUnpaid = "Paid";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return PaidOrUnpaid;
	}

	@Override
	public void updateInvoice(int invoiceId) {
		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//
//		String sql = "Update bca_invoice " + " SET invoiceStatus=" + ReceivableListDto.CANCELLED_INVOICE_STATUS
//				+ " ,MEMO='Cancelled Payment'" + " WHERE CompanyID=" + ConstValue.companyId + " AND InvoiceID="
//				+ invoiceId;

		try {
//			stmt = con.createStatement();
//			int i = stmt.executeUpdate(sql);
//			System.out.println("Invoice Updated :-----" + i);
			Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
			if (company.isPresent()) {
				int i = bcaInvoiceRepository.updateInvoiceStatusAndMemoByCompanyAndInvoice(company.get(), invoiceId,
						ReceivableListDto.CANCELLED_INVOICE_STATUS, "Cancelled Payment");
				System.out.println("Invoice Updated :-----" + i);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

	}

	@Override
	public void updateInvoiceStatusForCancelled(int invoiceId) {
		// TODO Auto-generated method stub
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "Update bca_invoice " + " SET invoiceStatus=" + ReceivableListDto.NORMAL_INVOICE_STATUS
				+ " ,MEMO='Cancelled Payment'" + " WHERE CompanyID=" + ConstValue.companyId + " AND InvoiceID="
				+ invoiceId;

		try {
			stmt = con.createStatement();
			int i = stmt.executeUpdate(sql);
			System.out.println("Invoice Updated :-----" + i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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

	}

	@Override
	public double getTotalAmountByInvoiceId(int invoiceId) {
		// TODO Auto-generated method stub
		double totalAmount = 0.0;
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		String sql = "Select Total from bca_invoice WHERE CompanyID=" + ConstValue.companyId + " AND InvoiceID="
				+ invoiceId;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				totalAmount = rs.getDouble("Total");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

		return totalAmount;
	}

	@Override
	public TblPaymentDto getObjectOfStoragePayment(int paymentId) {
		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		TblPaymentDto payment = new TblPaymentDto();

//		String sql = "SELECT PaymentID,AccountID,Amount,PayeeID,"
//				+ " PayerID,Deleted,CategoryID,AccountCategoryID,PaymentTypeID,"
//				+ " InvoiceID,PayableID,DateAdded,RmaNo,RmaItemID,"
//				+ " CheckNumber,isNeedtoDeposit,ClientVendorID,BillNum,Priority,TransactionType " + " FROM bca_payment"
//				+ " WHERE PaymentID = " + paymentId + " AND CompanyID = " + ConstValue.companyId;

		try {

			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaPayment> bcaPayments = bcaPaymentRepository.findByPaymentIdAndCompany(paymentId, bcaCompany);
			for (BcaPayment bcaPayment : bcaPayments) {
				payment.setId(bcaPayment.getPaymentId());
				payment.setOldAccountID(bcaPayment.getAccount().getAccountId());
				payment.setAmount(bcaPayment.getAmount());
				payment.setPayeeID(bcaPayment.getPayeeId());
				payment.setPayerID(bcaPayment.getPayerId());
				payment.setDeleted(bcaPayment.getDeleted());
				if (null != bcaPayment.getCategory())
					payment.setCategoryId(bcaPayment.getCategory().getCategoryId());

				payment.setAccountCategoryId(bcaPayment.getAccountCategoryId());
				if (null != bcaPayment.getInvoice())
					payment.setInvoiceID(bcaPayment.getInvoice().getInvoiceId());
				if (null != bcaPayment.getPayable())
					payment.setPayableID(bcaPayment.getPayable().getPayableId());
				payment.setDateAdded(offsetDateTimeToDate(bcaPayment.getDateAdded()));
				payment.setRmaNo(bcaPayment.getRmaNo());
				payment.setRmaUniqueID(bcaPayment.getRmaItemId());
				if (null != bcaPayment.getPaymentType())
					payment.setOldPaymentTypeId(bcaPayment.getPaymentType().getPaymentTypeId());
				payment.setCheckNumber(bcaPayment.getCheckNumber());
				payment.setNeedToDeposit(bcaPayment.getIsNeedtoDeposit());
				/* payment.setCvID(rs.getInt("ClientVendorID")); */ // changed by pritesh 09-08-2018
				if (null != bcaPayment.getClientVendor())
					payment.setOldclientVendorID(bcaPayment.getClientVendor().getClientVendorId());
				payment.setBillNum(bcaPayment.getBillNum());
				payment.setPriority(bcaPayment.getPriority());
				String transactionType = bcaPayment.getTransactionType().toString();
				if (transactionType == null) {
					payment.setTransactionID("0");
				} else {
					payment.setTransactionID(transactionType);
				}
			}
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				payment.setId(rs.getInt("PaymentID"));
//				payment.setOldAccountID(rs.getInt("AccountID"));
//				payment.setAmount(rs.getDouble("Amount"));
//				payment.setPayeeID(rs.getInt("PayeeID"));
//				payment.setPayerID(rs.getInt("PayerID"));
//				payment.setDeleted(rs.getBoolean("Deleted"));
//				payment.setCategoryId(rs.getInt("CategoryID"));
//				payment.setAccountCategoryId(rs.getInt("AccountCategoryID"));
//				payment.setInvoiceID(rs.getInt("InvoiceID"));
//				payment.setPayableID(rs.getInt("PayableID"));
//				payment.setDateAdded(rs.getDate("DateAdded"));
//				payment.setRmaNo(rs.getInt("RmaNo"));
//				payment.setRmaUniqueID(rs.getInt("RmaItemID"));
//				payment.setOldPaymentTypeId(rs.getInt("PaymentTypeID"));
//				payment.setCheckNumber(rs.getString("CheckNumber"));
//				payment.setNeedToDeposit(rs.getBoolean("isNeedtoDeposit"));
//				/* payment.setCvID(rs.getInt("ClientVendorID")); */ // changed by pritesh 09-08-2018
//				payment.setOldclientVendorID(rs.getInt("ClientVendorID"));
//				payment.setBillNum(rs.getInt("BillNum"));
//				payment.setPriority(rs.getInt("Priority"));
//				String transactionType = rs.getString("TransactionType");
//				if (transactionType == null) {
//					payment.setTransactionID("0");
//				} else {
//					payment.setTransactionID(transactionType);
//				}
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

		return payment;
	}

	public static ReceivableListDto getInvoiceByInvoiceID(int invoiceID) throws SQLException {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		BcaCompany company = null;
		ReceivableListDto invoice = new ReceivableListDto();
		try {
//		Optional<BcaCompany> bcaCompany=companyRepository.findById(new Long( ConstValue.companyId));
//		if(bcaCompany.isPresent()) {
//			company=bcaCompany.get();
//		}
//		List<BcaInvoice>bcaInvoices= bcaInvoiceRepository.findByInvoiceIdAndCompany(invoiceID, company);
			String sql = " SELECT * " + " FROM bca_invoice " + " WHERE InvoiceID = " + invoiceID + " AND CompanyID = "
					+ ConstValue.companyId;
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
//		for(BcaInvoice rs:bcaInvoices) {
//			invoice.setInvoiceID(rs.getInvoiceId());
//			invoice.setOrderNum(rs.getOrderNum());
//			invoice.setSoNum(rs.getSonum());
//			invoice.setPoNum(rs.getPonum());
//			invoice.setRcvNum(rs.getRcvNum());
//			invoice.setEstNum(rs.getEstNum());
//			invoice.setEmployeeId(rs.getEmployeeId());
//			invoice.setRefNum(rs.getRefNum());
//			invoice.setMemo(rs.getMemo());
//			invoice.setNote(rs.getNote());
//			invoice.setCvID(rs.getClientVendor().getClientVendorId());
//			invoice.setBillingAddrID(rs.getBillingAddrId());
//			invoice.setShipToAddrID(rs.getShippingAddrId());
//			invoice.setBsaddressID(rs.getBsaddressId());
//			int intValue = rs.getCompany().getCompanyId().intValue();
//			invoice.setCompanyID(intValue);
//			invoice.setInvoiceTypeID(rs.getInvoiceType().getInvoiceTypeId());
//			invoice.setInvoiceStyleID(rs.getInvoiceStyle().getInvoiceStyleId());
//			invoice.setWeight(rs.getWeight());
//			invoice.setSubTotal(rs.getSubTotal());
//			invoice.setTax(rs.getTax());
//			invoice.setSh(rs.getSh());
//			invoice.setTotal(rs.getTotal());
//			invoice.setAdjustedTotal(rs.getAdjustedTotal());
//			invoice.setPaidAmount(rs.getPaidAmount());
//			invoice.setBalance(rs.getBalance());
//			invoice.setSalesRepID(rs.getSalesRepId());
//			invoice.setTermID(rs.getTerm().getTermId());
//			invoice.setPaymentTypeID(rs.getPaymentType().getPaymentTypeId());
//			invoice.setShipCarrierID(rs.getShipCarrier().getShipCarrierId());
//			invoice.setMessageID(rs.getMessage().getMessageId());
//			invoice.setSalesTaxID(rs.getSalesTax().getSalesTaxId());
//			invoice.setTaxable(rs.getTaxable() == 1 ? true : false);
//			invoice.setShipped(rs.getShipped());
//			invoice.setTrackingCode(rs.getTrackingCode());
//			invoice.setShippingMethod(rs.getShippingMethod());
//			invoice.setReceived(rs.getIsReceived());
//			// iD.setPaid(rs.getInt("Paid")==1?true:false);
//			invoice.setPaymentCompleted(rs.getIsPaymentCompleted());
//			invoice.setFromPO(rs.getFromPo());
//			Date dateConfirmed = Date.from(rs.getDateConfirmed().toInstant());
//			invoice.setDateConfirmed(dateConfirmed);
//			invoice.setDateAdded(Date.from(rs.getDateAdded().toInstant()));
//			// iD.setDueDate((java.util.Date)rs.getDate("DueDate"));
//			invoice.setCategoryID(rs.getCategory().getCategoryId());
//			invoice.setInvoiceStatus(rs.getInvoiceStatus());
//			invoice.setPrinted(rs.getIsPrinted());
//			invoice.setEmailed(rs.getIsEmailed());
//			invoice.setServiceID(rs.getServiceId());
//			invoice.setBankAccountID(rs.getBankAccountId());
//			invoice.setEB_orderID(rs.getOrderid().getOrderId());
//			//invoice.setEB_shipCarrier(rs.getString("  "));
//			invoice.setEB_shipServiceLevel(rs.getShipservicelevel());
//			invoice.setEB_shippingNote1(rs.getShippingNote1());
//			invoice.setEB_shippingNote2(rs.getShippingNote2());
//			invoice.setStoreTypeId(rs.getStoreTypeId());
//			invoice.setStoreId(rs.getStore().getStoreId());
//			invoice.setAmazonGiftWrapType(rs.getAmazonGiftWrapType());
//			invoice.setAmazonGiftMessageText(rs.getAmazonGiftMessageText());
//			invoice.setBillID(rs.getBillId());
//		}
			while (rs.next()) {
				invoice.setInvoiceID(rs.getInt("InvoiceID"));
				invoice.setOrderNum(rs.getInt("OrderNum"));
				invoice.setSoNum(rs.getInt("SONum"));
				invoice.setPoNum(rs.getInt("PONum"));
				invoice.setRcvNum(rs.getInt("RcvNum"));
				invoice.setEstNum(rs.getInt("EstNum"));
				invoice.setEmployeeId(rs.getInt("EmployeeID"));
				invoice.setRefNum(rs.getString("RefNum"));
				invoice.setMemo(rs.getString("Memo"));
				invoice.setNote(rs.getString("Note"));
				invoice.setCvID(rs.getInt("ClientVendorID"));
				invoice.setBillingAddrID(rs.getInt("BillingAddrID"));
				invoice.setShipToAddrID(rs.getInt("ShippingAddrID"));
				invoice.setBsaddressID(rs.getInt("BSAddressID"));
				invoice.setCompanyID(rs.getInt("CompanyID"));
				invoice.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
				invoice.setInvoiceStyleID(rs.getInt("InvoiceStyleID"));
				invoice.setWeight(rs.getDouble("Weight"));
				invoice.setSubTotal(rs.getDouble("SubTotal"));
				invoice.setTax(rs.getDouble("Tax"));
				invoice.setSh(rs.getDouble("SH"));
				invoice.setTotal(rs.getDouble("Total"));
				invoice.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
				invoice.setPaidAmount(rs.getDouble("PaidAmount"));
				invoice.setBalance(rs.getDouble("Balance"));
				invoice.setSalesRepID(rs.getInt("SalesRepID"));
				invoice.setTermID(rs.getInt("TermID"));
				invoice.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				invoice.setShipCarrierID(rs.getInt("ShipCarrierID"));
				invoice.setMessageID(rs.getInt("MessageID"));
				invoice.setSalesTaxID(rs.getInt("SalesTaxID"));
				invoice.setTaxable(rs.getInt("Taxable") == 1 ? true : false);
				invoice.setShipped(rs.getInt("Shipped"));
				invoice.setTrackingCode(rs.getString("TrackingCode"));
				invoice.setShippingMethod(rs.getString("ShippingMethod"));
				invoice.setReceived(rs.getBoolean("IsReceived"));
				// iD.setPaid(rs.getInt("Paid")==1?true:false);
				invoice.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
				invoice.setFromPO(rs.getBoolean("FromPO"));
				invoice.setDateConfirmed((java.util.Date) rs.getDate("DateConfirmed"));
				invoice.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
				// iD.setDueDate((java.util.Date)rs.getDate("DueDate"));
				invoice.setCategoryID(rs.getInt("CategoryID"));
				invoice.setInvoiceStatus(rs.getInt("invoiceStatus"));
				invoice.setPrinted(rs.getBoolean("IsPrinted"));
				invoice.setEmailed(rs.getBoolean("IsEmailed"));
				invoice.setServiceID(rs.getLong("ServiceID"));
				invoice.setBankAccountID(rs.getInt("BankAccountID"));
				invoice.setEB_orderID(rs.getString("orderid"));
				invoice.setEB_shipCarrier(rs.getString("ShipCarrier"));
				invoice.setEB_shipServiceLevel(rs.getString("shipservicelevel"));
				invoice.setEB_shippingNote1(rs.getString("ShippingNote1"));
				invoice.setEB_shippingNote2(rs.getString("ShippingNote2"));
				invoice.setStoreTypeId(rs.getInt("StoreTypeID"));
				invoice.setStoreId(rs.getInt("StoreID"));
				invoice.setAmazonGiftWrapType(rs.getString("AmazonGiftWrapType"));
				invoice.setAmazonGiftMessageText(rs.getString("AmazonGiftMessageText"));
				invoice.setBillID(rs.getInt("BillID"));

			}
			db.close(con);

			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
		return invoice;
	}

	@Override
	public void updateTransaction(TblPaymentDto payment, double receivedAmount, String receivedName, Date date)
			throws SQLException {
		// TODO Auto-generated method stub
		strName = receivedName;
		receivedAmountForRL = receivedAmount;
		paymentForReceived = payment;
		paidDate = date;
		inv = getInvoiceByInvoiceID(payment.getInvoiceID());
		flag = checkEdits();

		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		if (flag) {
			updatePaymentTables();
			TblAccount oldAccount = getAccountById(payment.getOldAccountID());
			TblAccount newAccount = getAccountById(payment.getAccountID());
			double amount = 0.00;

			amount = payment.getAmount() - receivedAmount;
			if (strName.equals("Deposit") && payment.getInvoiceID() > 0) {
				adjustDepositBalance(amount);
				adjustDepositBalance(payment, amount);
				updateRefundTransaction(payment, receivedAmount);

			}
			if (strName.equals("Payment") && payment.getInvoiceID() > 0) {
				adjustPaymentBalance(amount);
				adjustPaymentBalance(payment, amount); // actual code changed
														// adjustPaymentBalance(payment,receivedAmount);

			}

		}

		try {
			if (con != null) {
				db.close(con);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}

	}

	public void adjustPaymentBalance(TblPaymentDto payment, double amount) {
		double payFromBalance = 0.00;
		double payToBalance = 0.00;
		int paymentID = 0;
		int priority = 0;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		Statement stmt = null;

		PreparedStatement pstmt = null;
		TblAccount payerAccount = null;
		TblAccount payeeAccount = null;

		double paymentAmount = payment.getAmount();
		String sqlP = " SELECT PaymentID,PayFromBalance,PayToBalance,PayerID,PayeeID,Priority FROM bca_payment"
				+ " WHERE AccountID=" + payment.getAccountID() + " AND Priority >= " + payment.getPriority();

		String sql = " UPDATE bca_payment SET PayFromBalance=?" + " ,PayToBalance= ?" + " WHERE PaymentID =?";

		try {
			con = db.getConnection();
			pstmt = con.prepareStatement(sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sqlP);

			while (rs.next()) {
				payFromBalance = rs.getDouble("PayFromBalance");
				payToBalance = rs.getDouble("PayToBalance");
				paymentID = rs.getInt("PaymentID");
				priority = rs.getInt("Priority");

				payFromBalance = (payFromBalance + amount);
				payToBalance = (payToBalance + amount);

				pstmt.setDouble(1, payFromBalance);
				pstmt.setDouble(2, payToBalance);
				pstmt.setInt(3, paymentID);
				pstmt.addBatch();

			}
			int[] updateCounts = pstmt.executeBatch();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public void adjustPaymentBalance(double amount) throws SQLException {
		TblAccount account = getAccountForPayer(paymentForReceived.getOldClientVendorID(), ConstValue.companyId);
		TblAccount account1 = getAccountForPayer(paymentForReceived.getCvID(), ConstValue.companyId);

		adjustBankBalance(getAccountById(paymentForReceived.getOldAccountID()), amount);

		double paidAmount = 0.0;
		adjustBankBalanceOfVendor(account, (amount * -1));
		getAccountForPayer(inv.getCvID(), ConstValue.companyId);
		adjustCustomerCurrentBalance(account, amount);
		inv.setBalance(amount + inv.getBalance());
		inv.setPaidAmount(inv.getPaidAmount() - (paymentForReceived.getAmount() - receivedAmountForRL));
		inv.setPaymentCompleted(true);
		invoicePaid(inv, true);

	}

	public void adjustBankBalanceOfVendor(TblAccount account, double amount) throws SQLException {

		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		String sql_get = "SELECT CustomerCurrentBalance FROM bca_account " + " WHERE AccountID = "
				+ account.getAccountID() + " AND CompanyID = " + ConstValue.companyId;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql_get);
			double currentBalance = 0.0;
			/** get current balance */
			if (rs.next()) {
				currentBalance = rs.getDouble("CustomerCurrentBalance");
			}
			/** put new balance */
			String sql_put = "UPDATE bca_account " + "SET CustomerCurrentBalance=" + (currentBalance + amount);

			if (account.getLastCheckNo() > 0) {
				sql_put += ", LastCheck=" + account.getLastCheckNo();
			}

			sql_put += " WHERE AccountID = " + account.getAccountID();
			stmt.executeUpdate(sql_put);
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

	public void adjustDepositBalance(TblPaymentDto payment, double amount) throws SQLException {
		double payFromBalance = 0.00;
		double payToBalance = 0.00, payToBalanceAmount = 0.0;
		double payAmount = 0.0;
		int paymentID = 0;
		int priority = 0;
		int PayeeID = -1, PayerID = -1, AccountID = -1;
		PreparedStatement pstmt = null;
		TblAccount payerAccount = null;
		TblAccount payeeAccount = null;
		Connection con;
		Statement stmt = null;
		ResultSet rs = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		boolean isStartingBalance = true;

		double paymentAmount = payment.getAmount();

		try {
			String sql = "SELECT Amount,PaymentID,PayFromBalance,PayToBalance,AccountID,PayerID,PayeeID,"
					+ "Priority FROM bca_payment" + " WHERE AccountID=" + payment.getAccountID() + " AND Priority >= "
					+ payment.getPriority();

			String sql_2 = " UPDATE bca_payment SET PayFromBalance=?" + ",PayToBalance= ?" + " WHERE PaymentID =?";

			pstmt = con.prepareStatement(sql_2);

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				payAmount = rs.getDouble("Amount");
				AccountID = rs.getInt("AccountID");
				PayerID = rs.getInt("PayerID");
				PayeeID = rs.getInt("PayeeID");
				payFromBalance = rs.getDouble("PayFromBalance");
				payToBalance = rs.getDouble("PayToBalance");
				paymentID = rs.getInt("PaymentID");
				priority = rs.getInt("Priority");
				int pID = payment.getPriority();

				payFromBalance = (payFromBalance - amount);
				payToBalance = (payToBalance - amount);
				payToBalanceAmount = payToBalance;

				pstmt.setDouble(1, payFromBalance);
				pstmt.setDouble(2, payToBalance);
				pstmt.setInt(3, paymentID);
				pstmt.addBatch();
			}
			int[] updateCounts = pstmt.executeBatch();
			adjustStartingBankBalance(payment.getAccountID(), payToBalanceAmount, amount);
			/* updateRefundTransaction(payment,receivedAmountForRL); */

		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
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
	}

//	private void updateRefundTransaction(TblPaymentDto payment, double amount) {
//		Statement stmt = null;
//		Connection con = null;
//		ResultSet rs = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//
//		String Sql = "UPDATE bca_refundlist " + " SET Amount=" + amount + " WHERE PaymentID=" + payment.getId()
//				+ " AND Status=0";
//
//		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(Sql);
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
//	}
	private void updateRefundTransaction(TblPaymentDto payment, double amount) {

		try {
			List<BcaRefundlist> refundList = bcaRefundlistRepository.findByPayment_PaymentIdAndStatus(payment.getId(),
					0);
			refundList.stream().forEach(refund -> {
				refund.setAmount(amount);

			});
			bcaRefundlistRepository.saveAll(refundList);
//		String Sql = "UPDATE bca_refundlist " + " SET Amount=" + amount + " WHERE PaymentID=" + payment.getId()
//				+ " AND Status=0";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}

	public static void adjustStartingBankBalance(int accountID, double currentBal, double startingBal)
			throws SQLException {
		Statement stmt = null;
		Connection con = null;
		ResultSet rs = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "UPDATE bca_account SET " + " CustomerCurrentBalance=" + currentBal + ",CustomerStartingBalance="
				+ startingBal + " WHERE AccountID = " + accountID;
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
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

	private void adjustDepositBalance(double amount) throws SQLException {
		TblAccount newAccount = getAccountById(paymentForReceived.getPayeeID());
		payerAccount = getAccountByPayerId(paymentForReceived.getPayerID());
		TblAccount account = getAccountForPayer(paymentForReceived.getOldclientVendorID(), ConstValue.companyId);
		TblAccount account1 = getAccountForPayer(paymentForReceived.getCvID(), ConstValue.companyId);

		if (payerAccount == null) {
			payerAccount = new TblAccount();
			payerAccount.setAccountTypeID(3);
		}
		if (newAccount != null) {
			if (newAccount.getAccountTypeID() == 2) {
				if (amount < 0 && payerAccount.getAccountTypeID() != 2) {

				} else if (amount >= 0 && payerAccount.getAccountTypeID() != 2) {
					adjustBankBalance(newAccount, -amount);
					adjustBankBalanceOfCustomer(account, -amount);

					if (inv != null) {
						TblAccount acc = getAccountForPayer(inv.getCvID(), ConstValue.companyId);
						adjustCustomerCurrentBalance(acc, amount);
						inv.setBalance(amount + inv.getBalance());
						inv.setPaidAmount(inv.getPaidAmount() - (paymentForReceived.getAmount() - receivedAmountForRL));
						inv.setPaymentCompleted(false);

						updateInvoicemodifiedforBankingedited(inv, true);

					}

				}
			}
		}

	}

	private void updateDepositPayment(boolean isDeposit) {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = " UPDATE bca_payment" + " SET isNeedtoDeposit=" + (isDeposit == false ? 1 : 0)
				+ " WHERE PaymentID = " + paymentForReceived.getId();
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	final public static void updateInvoicemodifiedforBankingedited(ReceivableListDto invoice, boolean b)
			throws SQLException {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		long invoiceID = invoice.getInvoiceID();

		if (invoiceID > 0) {

			if (invoice.getGiftAmount() > invoice.getTotal() && invoice.getBalance() == 0.0) {
				invoice.setPaymentCompleted(false);
			} else {
				invoice.setPaymentCompleted(!(invoice.getBalance() > 0.0));
			}
			String sql = "UPDATE bca_invoice SET " + "OrderNum=" + invoice.getOrderNum() + "," + // OrderNum
					"PONum=" + invoice.getPoNum() + "," + "RefNum=" + "'" + invoice.getRefNum().replaceAll("'", "''")
					+ "'" + "," + ///
					"EstNum=" + invoice.getEstNum() + "," + "ClientVendorID=" + invoice.getCvID() + "," + "Memo=" + "'"
					+ invoice.getMemo().replaceAll("'", "''") + "'" + ","
					// + "Note=" + "'" + invoice.getNote().replaceAll("'", "''") + "'" + ","
					+ "BillingAddrID=" + invoice.getBillingAddrId() + "," + "ShippingAddrID="
					+ invoice.getShippingAddrId() + "," + "CompanyID=" + ConstValue.companyId + "," + "EmployeeID="
					+ invoice.getEmployeeId() + "," + "InvoiceTypeID=" + invoice.getInvoiceTypeID() + ","
					+ "InvoiceStyleID=" + invoice.getInvoiceStyleID() + "," + "Weight=" + invoice.getWeight() + ","
					+ "SubTotal=" + invoice.getSubTotal() + "," + "Tax=" + invoice.getTax() + "," + "SH="
					+ invoice.getSh() + "," + "Total=" + invoice.getTotal() + "," + "AdjustedTotal="
					+ invoice.getAdjustedTotal() + "," + "PaidAmount="
					+ JProjectUtil.currFormat.format(invoice.getPaidAmount()) + "," + "Balance=" + invoice.getBalance()
					+ "," + "TermID=" + invoice.getTermID() + "," + "PaymentTypeID=" + invoice.getPaymentTypeID() + ","
					+ "ShipCarrierID=" + invoice.getShipCarrierID() + "," + "MessageID=" + invoice.getMessageID() + ","
					+ "SalesTaxID=" + invoice.getSalesTaxID() + "," + "Taxable=" + (invoice.isTaxable() ? 1 : 0) + ","
					+ "Shipped=" + invoice.getShipped() + "," + "ShippingMethod=" + "'" + invoice.getShippingMethod()
					+ "'" + "," + "TrackingCode=" + "'" + invoice.getTrackingCode() + "'" + "," + "IsReceived="
					+ (invoice.isReceived() == true ? 1 : 0) + "," + "IsPaymentCompleted="
					+ (invoice.isPaymentCompleted() ? 1 : 0) + ","
					/*
					 * + "DateConfirmed="+invoice.getDateConfirmed()== null :
					 * JProjectUtil.getDateFormaterCommon().format(new Date()) + "," + "DateAdded="
					 * + ConstValue.getDbToken() + (invoice.getDateAdded() == null ?
					 * JProjectUtil.getDateFormater().format(new Date()) : ((invoice.getDateAdded()
					 * == null ? "" :
					 * JProjectUtil.getDateFormater().format(invoice.getDateAdded())))) +
					 * ConstValue.getDbToken() + ","
					 */
					+ "CategoryID=" + invoice.getCategoryID() + ","
					/*
					 * + "orderid=" + "'" + invoice.getEB_orderID().replaceAll("'", "''") + "'" +
					 * ","
					 */
					/*
					 * + "shipservicelevel=" + "'" +
					 * invoice.getEB_shipServiceLevel().replaceAll("'", "''") + "'" + ","
					 */
					/*
					 * + "ShippingNote1=" + "'" + invoice.getEB_shippingNote1().replaceAll("'",
					 * "''") + "'" + "," + "ShippingNote2=" + "'" +
					 * invoice.getEB_shippingNote2().replaceAll("'", "''") + "'" + ","
					 */
					+ "StoreTypeID=" + invoice.getStoreTypeId() + "," + "StoreID=" + invoice.getStoreId() + ","
					/*
					 * + "ShipCarrier=" + "'" + invoice.getEB_shipCarrier().replaceAll("'", "''") +
					 * "'" + ","
					 */
					+ "IsPrinted=" + (invoice.isPrinted() ? 1 : 0) + "," + "IsEmailed=" + (invoice.isEmailed() ? 1 : 0)
					+ "," + "ServiceID=" + invoice.getServiceID() + ","
					/*
					 * + "AmazonGiftWrapType=" + "'" +
					 * invoice.getAmazonGiftWrapType().replaceAll("'", "''") + "'" + "," +
					 * "AmazonGiftMessageText=" + "'" +
					 * invoice.getAmazonGiftMessageText().replaceAll("'", "''") + "'" + ","
					 */
					+ "SalesRepID=" + invoice.getSalesRepID() + "," + "dropShipCustomerID="
					+ invoice.getDropShipCustomerID() + "," + "JobCategoryID = " + invoice.getJobCategoryID() + ","
					+ "BillID = " + invoice.getBillID() + "," + "isBillReceived = " + (invoice.isBillReceived() ? 1 : 0)
					+ ","
					// + "InvoiceStatus = " + invoice.getInvoiceStatus() + "," /*$RG Please don't
					// remove this Comment*/

					+ "GiftAmount = " + invoice.getGiftAmount() + "," + "GiftCertificateCode = '"
					+ invoice.getGiftCertificateCode() + "'" + "," + "TotalCommission = " + invoice.getCommission();

			sql = sql + " WHERE InvoiceID = " + invoiceID;
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(sql);

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
	}

	public void adjustCustomerCurrentBalance(TblAccount account, double amount) throws SQLException {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		String sql_get = "SELECT CustomerCurrentBalance FROM bca_account " + " WHERE AccountID = "
				+ account.getAccountID() + " AND CompanyID = " + ConstValue.companyId;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql_get);
			double currentBalance = 0.0;
			if (rs.next()) {
				currentBalance = rs.getDouble("CustomerCurrentBalance");
			}
			String sql_put = "UPDATE bca_account SET CustomerCurrentBalance=" + (currentBalance + amount)
					+ " WHERE AccountID = " + account.getAccountID() + " AND CompanyID = " + ConstValue.companyId;
			stmt.executeUpdate(sql_put);
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

	public void adjustBankBalanceOfCustomer(TblAccount account, double amount) throws SQLException {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		double currentBalance = 0.0;

		String sql = "SELECT VendorCurrentBalance FROM bca_account " + " WHERE AccountID = " + account.getAccountID()
				+ " AND CompanyID = " + ConstValue.companyId;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				currentBalance = rs.getDouble("VendorCurrentBalance");

			}
			String sql_put = "UPDATE bca_account " + " SET VendorCurrentBalance=" + (currentBalance + amount);

			if (account.getLastCheckNo() > 0) {
				sql_put += ", LastCheck=" + account.getLastCheckNo();
			}
			sql_put += " WHERE AccountID = " + account.getAccountID();
			stmt.executeUpdate(sql_put);
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

	private boolean checkEdits() throws SQLException {
		if (paymentForReceived.getInvoiceID() > 0) {
			ReceivableListDto invoice = getInvoiceByInvoiceID(paymentForReceived.getInvoiceID());
			if (invoice != null) {
				partialDepositAmount = receivedAmountForRL - paymentForReceived.getAmount() + invoice.getPaidAmount();
				flag = true;
				if (strName.equals("Payment")) {
					double editAmount = paymentForReceived.getAmount() - receivedAmountForRL;
					double newAmount = inv.getPaidAmount() - editAmount;
					inv.setPaidAmount(newAmount);
					flag = true;
				}
			}
			flag = true; // changed by pritesh 09-08-2018
		}
		flag = true; // changed by pritesh 09-08-2018
		return flag;
	}

//	private void updatePaymentTables() {
//		double amount = 0.0;
//		String strDate = null;
//		strDate = JProjectUtil.getDateFormaterCommon().format(paidDate);
//		amount = receivedAmountForRL;
//		boolean isCvChanged = checkCvChanged();
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		String sql = "";
//
//		if (isCvChanged) {
//			if (strName.equals("Payment")) {
//				int payeeId = getAccountForPayer(paymentForReceived.getCvID(), ConstValue.companyId).getAccountID();
//				sql = " UPDATE bca_payment SET " + // here
//						" Amount =" + amount + " ,DateAdded ='" + strDate + "'" + ",PaymentTypeID="
//						+ paymentForReceived.getPaymentTypeID() + "," + " CategoryID="
//						+ paymentForReceived.getCategoryId() + "" + "," + " AccountCategoryID="
//						+ paymentForReceived.getAccountCategoryId() + "" + "," + " CheckNumber='"
//						+ paymentForReceived.getCheckNumber() + "'" + "," + " IsToBePrinted="
//						+ (paymentForReceived.isToBePrinted() ? 1 : 0) + "," + " ClientVendorID="
//						+ paymentForReceived.getCvID() + "," + " PayeeID = " + payeeId + "," + " PayerID = "
//						+ paymentForReceived.getAccountID() + "," + " AccountID = " + paymentForReceived.getAccountID()
//						+ " WHERE CompanyID = " + ConstValue.companyId + " AND PaymentID = "
//						+ paymentForReceived.getId();
//			} else if (strName.equals("Deposit")) {
//				int payerId = getAccountForPayer(paymentForReceived.getCvID(), ConstValue.companyId).getAccountID();
//				sql = " UPDATE bca_payment SET " + // here
//						" Amount =" + amount + " ,DateAdded ='" + strDate + "'" + ",PaymentTypeID="
//						+ paymentForReceived.getPaymentTypeID() + "," + " CategoryID="
//						+ paymentForReceived.getCategoryId() + "" + "," + " AccountCategoryID="
//						+ paymentForReceived.getAccountCategoryId() + "" + "," + " CheckNumber='"
//						+ paymentForReceived.getCheckNumber() + "'" + "," + " IsToBePrinted="
//						+ (paymentForReceived.isToBePrinted() ? 1 : 0) + "," + " ClientVendorID="
//						+ paymentForReceived.getCvID() + "," + " PayeeID = " + paymentForReceived.getAccountID() + ","
//						+ " PayerID = " + payerId + "," + " AccountID = " + paymentForReceived.getAccountID()
//						+ " WHERE CompanyID = " + ConstValue.companyId + " AND PaymentID = "
//						+ paymentForReceived.getId();
//			}
//		}
//
//		else {
//			sql = "UPDATE bca_payment SET " + " Amount =" + amount + " ,DateAdded ='" + strDate + "'"
//					+ ",PaymentTypeID=" + paymentForReceived.getPaymentTypeID() + "," + " CategoryID="
//					+ paymentForReceived.getCategoryId() + "" + "," + " AccountCategoryID="
//					+ paymentForReceived.getAccountCategoryId() + "" + "," + " CheckNumber='"
//					+ paymentForReceived.getCheckNumber() + "'" + "," + " IsToBePrinted="
//					+ (paymentForReceived.isToBePrinted() ? 1 : 0) + " WHERE CompanyID = " + ConstValue.companyId
//					+ " AND PaymentID = " + paymentForReceived.getId();
//
//		}
//		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql);
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
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
//
//	}
	private void updatePaymentTables() {
		double amount = 0.0;
		String strDate = null;
		strDate = JProjectUtil.getDateFormaterCommon().format(paidDate);
		amount = receivedAmountForRL;
		boolean isCvChanged = checkCvChanged();
		
		try {
		BcaPayment bcaPayment = bcaPaymentRepository.findByPaymentIdAndCompany_CompanyId(paymentForReceived.getId(),
				new Long(ConstValue.companyId));

		if (isCvChanged) {

			if (strName.equals("Payment")) {
				int payeeId = getAccountForPayer(paymentForReceived.getCvID(), ConstValue.companyId).getAccountID();

				bcaPayment.setAmount(amount);
				Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository
						.findById(paymentForReceived.getPaymentTypeID());
				if (paymentType.isPresent())
					bcaPayment.setPaymentType(paymentType.get());

				bcaPayment.setPayerId(paymentForReceived.getAccountID());
				bcaPayment.setPayeeId(payeeId);
				Optional<BcaAccount> bca_account = bcaAccountRepository.findById(paymentForReceived.getAccountID());
				if (bca_account.isPresent())
					bcaPayment.setAccount(bca_account.get());
				Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository
						.findById(paymentForReceived.getCvID());
				if (clientVendor.isPresent())
					bcaPayment.setClientVendor(clientVendor.get());
				Optional<BcaCategory> category = bcaCategoryRepository.findById(paymentForReceived.getCategoryId());
				if (category.isPresent())
					bcaPayment.setCategory(category.get());
				bcaPayment.setAccountCategoryId(paymentForReceived.getAccountCategoryId());

				bcaPayment.setDateAdded(DateHelper.string2OffsetDateTime(strDate));

				bcaPayment.setIsToBePrinted((paymentForReceived.isToBePrinted() ? true : false));
				bcaPayment.setCheckNumber(paymentForReceived.getCheckNumber());

			} else if (strName.equals("Deposit")) {
				int payerId = getAccountForPayer(paymentForReceived.getCvID(), ConstValue.companyId).getAccountID();

				bcaPayment.setAmount(amount);
				Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository
						.findById(paymentForReceived.getPaymentTypeID());
				if (paymentType.isPresent())
					bcaPayment.setPaymentType(paymentType.get());

				bcaPayment.setPayerId(payerId);
				bcaPayment.setPayeeId(paymentForReceived.getAccountID());
				Optional<BcaAccount> bca_account = bcaAccountRepository.findById(paymentForReceived.getAccountID());
				if (bca_account.isPresent())
					bcaPayment.setAccount(bca_account.get());
				Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository
						.findById(paymentForReceived.getCvID());
				if (clientVendor.isPresent())
					bcaPayment.setClientVendor(clientVendor.get());

				Optional<BcaCategory> category = bcaCategoryRepository.findById(paymentForReceived.getCategoryId());
				if (category.isPresent())
					bcaPayment.setCategory(category.get());
				bcaPayment.setAccountCategoryId(paymentForReceived.getAccountCategoryId());

				bcaPayment.setDateAdded(DateHelper.string2OffsetDateTime(strDate));

				bcaPayment.setIsToBePrinted((paymentForReceived.isToBePrinted() ? true : false));
				bcaPayment.setCheckNumber(paymentForReceived.getCheckNumber());

			}
		}

		else {

			bcaPayment.setAmount(amount);
			Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository
					.findById(paymentForReceived.getPaymentTypeID());
			if (paymentType.isPresent())
				bcaPayment.setPaymentType(paymentType.get());

			Optional<BcaCategory> category = bcaCategoryRepository.findById(paymentForReceived.getCategoryId());
			if (category.isPresent())
				bcaPayment.setCategory(category.get());
			bcaPayment.setAccountCategoryId(paymentForReceived.getAccountCategoryId());

			bcaPayment.setDateAdded(DateHelper.string2OffsetDateTime(strDate));

			bcaPayment.setIsToBePrinted((paymentForReceived.isToBePrinted() ? true : false));

			bcaPayment.setCheckNumber(paymentForReceived.getCheckNumber());

		}
		
			bcaPaymentRepository.save(bcaPayment);
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}

	}

	private boolean checkCvChanged() {
		boolean isChanged = false;
		if (paymentForReceived.getOldclientVendorID() != paymentForReceived.getCvID()
				|| paymentForReceived.getOldAccountID() != paymentForReceived.getAccountID()) {
			return isChanged = true;
		}
		return isChanged;
	}

	@Override
	public int readInvoiceStatus(int invoiceId) {
		// TODO Auto-generated method stub
		try {
			Optional<BcaInvoice> invoice = bcaInvoiceRepository.findByInvoiceIdAndCompany_CompanyId(invoiceId,
					ConstValue.companyIdLong);
			if (invoice.isPresent()) {
				return invoice.get().getInvoiceStatus();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}

		return 0;
	}
//	@Override
//	public int readInvoiceStatus(int invoiceId) {
//		// TODO Auto-generated method stub
//
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//		String sql = "SELECT invoiceStatus FROM bca_invoice " + " WHERE CompanyID=" + ConstValue.companyId
//				+ " AND InvoiceID =" + invoiceId;
//
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			if (rs.next()) {
//				return rs.getInt("invoiceStatus");
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
//		return 0;
//	}

	@Override
	public void setDeletedmodified(TblPaymentDto payment, boolean isDeleted, String tableName, int isUpfrontDeposit) {
		// TODO Auto-generated method stub

		boolean isDepositAccount = false;
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		TblAccount payerAccount = getAccountByPayerId(payment.getPayerID());
		TblAccount payeeAcount = getAccountByPayeeId(payment.getPayeeID());

		updateTransaction(payment, isDeleted);
		if (payerAccount != null) {
			try {
				adjustBankBalance(payerAccount, payment.getAmount());
				updateInvoice(payment);
				deleteAccountable(payment.getPayableID());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				Loger.log(e.toString());
			}
		}
		deleteAccountablemodified(payment.getInvoiceID());

		if (payeeAcount != null) {
			if (payeeAcount.getAccountTypeID() == 2) {
				try {
					/*
					 * String sql = " UPDATE bca_payment  " + " SET isNeedtoDeposit=1" +
					 * " WHERE PaymentID = " + payment.getId(); stmt = con.createStatement();
					 * stmt.executeUpdate(sql);
					 */

					adjustBankBalance(payeeAcount, -payment.getAmount());
					if (isUpfrontDeposit != 1 && payment.getPayableID() > 0) {
						if (payment.getPayerID() != ConstValue.customerDepositAccID) {
							updateInvoice(payment);
						}
					}
					payment.setNeedToDeposit(false);
					updateBcaPaymentForToSetIsneedTodeposit(payment);

				} catch (SQLException e) {
					Loger.log(e.toString());
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
			}
		}

		if (payeeAcount != null) {
			if (payeeAcount.getAccountTypeID() == 2) {
				isDepositAccount = true;
			}
		}
		if (isDepositAccount) // --------- Adjust Deposite transactions ----------------
		{
			adjustCurrentBalancemodified(payment, payerAccount, payeeAcount, -payment.getAmount());
//			deletePayment(payment);
		} else {
			adjustCurrentBalancemodified(payment, payerAccount, payeeAcount, payment.getAmount());
		}
	}

	public static void deleteAccountable(int payableID) {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
		try {
//			stmt = con.createStatement();
//			String sql = " DELETE FROM bca_accountable WHERE PayableID = " + payableID;
//			stmt.executeUpdate(sql);
			accountableRepository.deleteById(payableID);
		} catch (Exception e) {
			Loger.log(e.toString());
		}
//		finally {
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
	}

	public void deletePayment(TblPaymentDto payment) {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		String sql = " DELETE FROM bca_payment Where CompanyID=" + ConstValue.companyId + " AND PaymentID="
				+ payment.getId();

		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public void updateBcaPaymentForToSetIsneedTodeposit(TblPaymentDto payment) {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//
//		String sql = " UPDATE bca_payment  " + " SET isNeedtoDeposit=1" + " WHERE PaymentID = " + payment.getId();

		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql);
			bcaPaymentRepository.updateBcaPaymentForToSetIsneedTodeposit(payment.getId());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
	}

	public static void adjustCurrentBalancemodified(TblPaymentDto payment, TblAccount payerAccount,
			TblAccount payeeAccount, double paymentAmount) {
		double payFromBalance = 0.00;
		double payToBalance = 0.00;
		int paymentID = 0;
		int payerID = 0;
		int payeeID = 0;
		int priority = 0;
		PreparedStatement pstmt = null;
		boolean isTransferFund = false;

		ResultSet rs = null;
		Statement stmt = null;
		Connection con;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		try {
			String sql = " SELECT PaymentID,PayFromBalance,PayToBalance,PayerID,PayeeID,"
					+ " Priority FROM bca_payment " + " WHERE AccountID=" + payment.getOldAccountID() // Here changed
																										// the code
																										// payment.getAccountID()
																										// is actual
					+ " AND Priority >= " + payment.getPriority();

			String sql_2 = " UPDATE bca_payment SET PayFromBalance=?" + ",PayToBalance= ?" + " WHERE PaymentID =?";

			pstmt = con.prepareStatement(sql_2);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				payFromBalance = rs.getDouble("PayFromBalance");
				payToBalance = rs.getDouble("PayToBalance");
				paymentID = rs.getInt("PaymentID");
				payerID = rs.getInt("PayerID");
				payeeID = rs.getInt("PayeeID");
				priority = rs.getInt("Priority");
				int pID = payment.getPriority();

				if (payerAccount != null && payeeAccount != null) {
					if (payerAccount.getAccountTypeID() == 2 && payeeAccount.getAccountTypeID() == 2) {
						// -------------- Adjust Bank Transfer Fund --------------------
						isTransferFund = true;
					}
				}
				if (priority > pID) {
					if (isTransferFund) {
						payFromBalance = (payFromBalance - paymentAmount);
						payToBalance = (payToBalance + payment.getAmount());
					} else if (payment.getOldAccountID() == payerID) {
						payFromBalance = (payFromBalance + paymentAmount);
					} else if (payment.getOldAccountID() == payeeID) {
						payToBalance = (payToBalance + paymentAmount);
					} else if (payment.getOldAccountID() == payerID) {
						if (payment.getTransactionID().equals("7")) {
							payToBalance = (payToBalance + paymentAmount);
						}
					}

					pstmt.setDouble(1, payFromBalance);
					pstmt.setDouble(2, payToBalance);
					pstmt.setInt(3, paymentID);
					pstmt.addBatch();

				}

			}

			int[] updateCounts = pstmt.executeBatch();

			if (payment.getPayeeID() == payment.getOldAccountID()) {
				// Invoice deposit
				adjustAccountBalanceofCustomer(payment.getPayerID(), (paymentAmount * -1));
			} else if (payment.getPayerID() == payment.getOldAccountID()) {
				/* adjustVendorBankBalance(payeeAccount, paymentAmount); */
				adjustAccountBalanceofVendor(payment.getPayeeID(), paymentAmount);
			}

		} catch (SQLException e) {
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
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
	}

	public static void adjustAccountBalanceofVendor(int AccountID, double amount) {
		ResultSet rs = null;
		Statement stmt = null;
		Statement stmt1 = null;
		Connection con;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		double currentBalance = 0.0;

		String sql = "SELECT VendorCurrentBalance " + " FROM bca_account " + " WHERE AccountID= " + AccountID
				+ " AND CompanyID=" + ConstValue.companyId;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				currentBalance = rs.getDouble("VendorCurrentBalance");
			}
			currentBalance = currentBalance + amount;

			String Sql = "Update bca_account " + "Set VendorCurrentBalance =" + currentBalance + " WHERE AccountID= "
					+ AccountID + " AND CompanyID=" + ConstValue.companyId;

			stmt1 = con.createStatement();

			stmt1.executeUpdate(Sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
				}
				if (stmt1 != null) {
					db.close(stmt1);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
	}

	public static void adjustAccountBalanceofCustomer(int AccountID, double amount) {
		ResultSet rs = null;
		Statement stmt = null;
		Statement stmt1 = null;
		Connection con;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		double currentBalance = 0.0;

		String sql = "SELECT CustomerCurrentBalance " + " FROM bca_account " + " WHERE AccountID= " + AccountID
				+ " AND CompanyID=" + ConstValue.companyId;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				currentBalance = rs.getDouble("CustomerCurrentBalance");
			}
			currentBalance = currentBalance + amount;

			String sql1 = "Update bca_account " + " Set CustomerCurrentBalance =" + currentBalance // VendorCurrentBalance
					+ " WHERE AccountID= " + AccountID + " AND CompanyID=" + ConstValue.companyId;

			stmt1 = con.createStatement();
			stmt1.executeUpdate(sql1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
				}
				if (stmt1 != null) {
					db.close(stmt1);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

	}

	public static void updateInvoice(TblPaymentDto payment) {
		ReceivableListDto invoice;

		try {
			invoice = getInvoiceByInvoiceID(payment.getInvoiceID());

			if (invoice != null) {
				double balance = invoice.getBalance();
				double amount = payment.getAmount();
				double paidAmount = invoice.getPaidAmount();
				paidAmount = paidAmount - amount;
				balance = balance + amount;
				invoice.setBalance(balance);
				invoice.setPaidAmount(paidAmount);

				if (invoice.getInvoiceID() > 0) {
					invoicePaid(invoice, true);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}

	public static void deleteAccountablemodified(int payableID) {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();

//		String sql = " DELETE FROM bca_accountable WHERE InvoiceID = " + payableID;
		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql);
			BcaInvoice bcaInvoice = invoiceRepository.getOne(payableID);
			accountableRepository.deleteByInvoice(bcaInvoice);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

	}

	public static void updateTransaction(TblPaymentDto payment, boolean b) {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "UPDATE bca_payment  " + " SET Deleted=" + (b == true ? 1 : 0) + " ,Amount=" + payment.getAmount()
				+ " ,PayerID=" + payment.getPayerID() + " ,PayeeID=" + payment.getPayeeID() + " ,PayFromBalance= "
				+ payment.getAmount() + " ,PayToBalance=" + payment.getAmount() + " ,DateAdded="
				+ (payment.getDateAdded() == null ? null
						: ("'" + JProjectUtil.getDateFormaterCommon().format(payment.getDateAdded()) + "'"))
				+ " WHERE PaymentID = " + payment.getId();

		try {

			stmt = con.createStatement();
			int count = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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

	}

	@Override
	public ArrayList<SalesBillingTable> getSalesBillingList() {
		// TODO Auto-generated method stub

		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		ArrayList<SalesBillingTable> sl = new ArrayList<SalesBillingTable>();

		/*
		 * String sql =
		 * "SELECT  bca_invoice.InvoiceID,BillingAddrID,OrderNum, bca_invoice.ClientVendorID,bca_invoice.DateAdded,Balance,bca_term.TermID,ServiceID,bca_term.Days, c.Email,(DATE(DATE_ADD(bca_invoice.DateAdded,INTERVAL bca_term.Days Day))) as dueDate, (DATEDIFF(DATE(now()),DATE(DATE_ADD(bca_invoice.DateAdded,INTERVAL bca_term.Days Day)))) as overDueDays "
		 * +
		 * " FROM  (bca_invoice LEFT JOIN bca_term ON (bca_invoice.TermID = bca_term.TermID )) INNER JOIN bca_clientvendor c ON (bca_invoice.ClientVendorID = c.ClientVendorID  ) "
		 * + " WHERE " + " c.status = 'N' " +
		 * " AND bca_invoice.InvoiceTypeID In (1,12,17) AND ((" +
		 * JProjectUtil.getDateAddFunction("Day,bca_term.Days, bca_invoice.DateAdded ")+
		 * " >= " + JProjectUtil.currentDateFunction() + " )  or  " +
		 * " bca_invoice.TermID=3 ) AND Total<>0 AND bca_invoice.IsPaymentCompleted=0 "
		 * false + "AND bca_invoice.invoiceStatus=0  AND bca_invoice.CompanyID = " +
		 * ConstValue.companyId +
		 * " AND bca_invoice.InvoiceID<>-1  ORDER BY bca_invoice.OrderNum DESC" ;
		 */

		String sql = "SELECT bca_invoice.InvoiceID," + " BillingAddrID,OrderNum," + " bca_invoice.ClientVendorID,"
				+ " bca_invoice.DateAdded,Balance,bca_term.TermID,ServiceID," + " bca_term.Days, c.Email,"
				+ " (DATE(DATE_ADD(bca_invoice.DateAdded,INTERVAL bca_term.Days Day))) as dueDate,"
				+ " (DATEDIFF(DATE(now()),DATE(DATE_ADD(bca_invoice.DateAdded,INTERVAL bca_term.Days Day)))) as overDueDays "
				+ " FROM  (bca_invoice LEFT JOIN bca_term ON (bca_invoice.TermID = bca_term.TermID )) INNER JOIN bca_clientvendor c ON (bca_invoice.ClientVendorID = c.ClientVendorID  ) "
				+ " WHERE  c.status = 'N'  AND (bca_invoice.InvoiceTypeID) In (1,12,17)"
				+ " AND ((DATE_ADD(bca_invoice.DateAdded,INTERVAL bca_term.Days  Day)>=now() )  or   bca_invoice.TermID=3 )"
				+ " AND Total<>0 AND bca_invoice.IsPaymentCompleted=0 AND bca_invoice.invoiceStatus=0 "
				+ " AND bca_invoice.CompanyID =" + ConstValue.companyId
				+ " AND bca_invoice.InvoiceID<>-1  ORDER BY bca_invoice.OrderNum DESC";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				SalesBillingTable table = new SalesBillingTable();
				table.setInvoiceID(rs.getInt("InvoiceID"));
				table.setBillingAddrId(rs.getInt("BillingAddrID"));
				table.setOrderID(rs.getInt("OrderNum"));
				table.setDateAdded(rs.getDate("DateAdded"));
				table.setDueDate(rs.getDate("dueDate"));
				table.setOverdueDays(rs.getInt("overDueDays"));
				table.setAmount(rs.getDouble("Balance"));
				table.setTerm((getTerm(rs.getInt("TermID"))));

				int serviceID = rs.getInt("ServiceID");
				int clientVendorID = rs.getInt("ClientVendorID");
				table.setName(getCv(clientVendorID, true).getName());
				sl.add(table);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return sl;
	}

	public static ClientVendor getCv(int cvID, boolean searchResult) {
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		ClientVendor cv = null;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT FirstName,LastName,Name,Email,State,City,Province,ZipCode,Email,Address1,ClientVendorID "
					+ " FROM bca_clientvendor " + " WHERE  ClientVendorID =" + cvID + " AND Status='N'"
					+ " AND CompanyID=" + ConstValue.companyId);

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql.toString());
			if (rs.next()) {
				cv = new ClientVendor();
				String vendorName = null;
				/**
				 * modified by sm because Name : company Name is not compulsary field in smc so
				 * the data come from smc are shows "null", to remove this we add this below
				 * code
				 */
				String name = rs.getString("Name");
				cv.setName(name.equals("") ? name : name.trim());
				cv.setFirstName(rs.getString("FirstName"));
				cv.setLastName(rs.getString("LastName"));
				cv.setCity(rs.getString("City"));
				cv.setState(rs.getString("State"));
				cv.setProvince(rs.getString("Province"));
				cv.setZipCode(rs.getString("ZipCode"));
				cv.setEmail(rs.getString("Email"));
				cv.setAddress1(rs.getString("Address1"));
				cv.setCvID(rs.getInt("ClientVendorID"));
				vendorName = cv.toString();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
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
		return cv;
	}

	public static TblTerm getTerm(int termID) {

		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		String sql = " SELECT * FROM bca_term " + " WHERE CompanyID = " + ConstValue.companyId + " AND TermID = "
				+ termID;

		try {
			stmt = con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		TblTerm term = new TblTerm();

		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {

				term.setTerm(rs.getInt("TermID"));
				term.setDays(rs.getInt("Days"));
				term.setName(rs.getString("Name"));
				term.setOverDue(false);
			}
		} catch (SQLException e) {

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

		return term;
	}

	@Override
	public void changeInvoiceStatusForLayaway(int invoiceID) {
		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//
//		String sql = "UPDATE bca_invoice SET InvoiceTypeID=" + ReceivableListDto.LAYAWAYS_TYPE + " WHERE CompanyID="
//				+ ConstValue.companyId + " AND InvoiceID=" + invoiceID;
		try {
//			stmt = con.createStatement();
//			int i = stmt.executeUpdate(sql);
//			System.out.println("update layaways : ------" + i);
			int i = 0;
			Optional<BcaInvoicetype> invoiceType = bcaInvoicetypeRepository.findById(ReceivableListDto.LAYAWAYS_TYPE);
			Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
			if (invoiceType.isPresent() && company.isPresent()) {
				i = bcaInvoiceRepository.updateInvoiceTypeByCompanyIdAndInvoiceId(invoiceType.get(), company.get(),
						invoiceID);
			}
			System.out.println("update layaways : ------" + i);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

	}

	@Override
	public ArrayList<ReceivableListDto> getLayawayList() {
		// TODO Auto-generated method stub
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		ArrayList<ReceivableListDto> rlb = new ArrayList<ReceivableListDto>();
		con = db.getConnection();

		try {
			String sql = "SELECT INV.InvoiceID,INV.OrderNum,INV.PONum,INV.SubTotal,INV.Tax,INV.EmployeeID,INV.RefNum,INV.Memo,INV.ShipCarrierID,INV.ShippingMethod,"
					+ " INV.SH," + "INV.ClientVendorID," + "INV.InvoiceTypeID," + "INV.Total," + "INV.AdjustedTotal,"
					+ "INV.PaidAmount," + "(SELECT Sum(bca_payment.Amount) AS AB" + " FROM bca_payment"
					+ " WHERE bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) AS PaidAmount12,"
					+ "INV.Balance," + "INV.IsReceived," + "INV.TermID," + "INV.IsPaymentCompleted,"
					+ "INV.DateConfirmed," + "INV.DateAdded," + "INV.invoiceStatus," + "INV.PaymentTypeID,"
					+ "INV.CategoryID," + "INV.ServiceID," + "INV.SalesTaxID," + "INV.SalesRepID," + "INV.Taxable,"
					+ "INV.Shipped," + "INV.JobCategoryID," + "term.Days," + "INV.BillingAddrID,"
					+ "INV.ShippingAddrID," + "INV.TotalCommission," + "INV.BankAccountID,"
					+ "pay.Name AS paymentTypeName," + "account.Name AS accountName," + "term.Name AS termName"
					+ " FROM bca_invoice AS INV" + " LEFT JOIN  bca_term AS term" + " ON INV.TermID = term.TermID"
					+ " LEFT JOIN bca_paymenttype AS pay ON INV.PaymentTypeID = pay.PaymentTypeID"
					+ " LEFT JOIN bca_account AS account ON INV.BankAccountID = account.AccountID"
					+ " WHERE  ( ( ( InvoiceTypeID ) IN (" + ReceivableListDto.LAYAWAYS_TYPE + ")"
					+ " AND INV.TermID <> 3 )" + " OR INV.InvoiceTypeID = 11 )" + " AND INV.AdjustedTotal > 0"
					+ " AND INV.IsPaymentCompleted = 0" + " AND INV.invoiceStatus = 0" + " AND INV.CompanyID ="
					+ ConstValue.companyId + " AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount)"
					+ " FROM   bca_payment" + " WHERE  bca_payment.InvoiceID =" + "INV.InvoiceID"
					+ " AND bca_payment.Deleted != 1)" + " OR (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
					+ " WHERE  bca_payment.InvoiceID = INV.InvoiceID" + " AND bca_payment.Deleted != 1) IS NULL )"
					+ "ORDER  BY OrderNum DESC  ";

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
				ReceivableListDto rb = new ReceivableListDto();
				TblCategoryDto categoryName = category.getCategoryOf(rs.getInt("CategoryID"));
				TblTermLoader termloader = new TblTermLoader();
				TblTerm tblterm = termloader.getObjectOfID(rs.getInt("TermID"));
				int cvId = rs.getInt("ClientVendorID");
				ClientVendor cv = getClentVendor(cvId, ConstValue.companyId);
				rb.setInvoiceID(rs.getInt("InvoiceID"));
				rb.setOrderNum(rs.getInt("OrderNum"));
				rb.setPoNum(rs.getInt("PONum"));
				rb.setEmployeeId(rs.getInt("EmployeeID"));
				rb.setRefNum(rs.getString("RefNum"));
				rb.setMemo(rs.getString("Memo"));
				rb.setCvID(cvId);
				rb.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
				rb.setTotal(rs.getDouble("Total"));
				rb.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
				rb.setPaidAmount(rs.getDouble("PaidAmount"));
				rb.setBalance(rs.getDouble("Balance"));
				rb.setTermID(rs.getInt("TermID"));
				rb.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				rb.setShipCarrierID(rs.getInt("ShipCarrierID"));
				rb.setSh(rs.getDouble("SH")); // new changes
				rb.setSubTotal(rs.getDouble("SubTotal"));
				rb.setTax(rs.getDouble("Tax"));
				rb.setShippingMethod(rs.getString("ShippingMethod"));
				rb.setSalesTaxID(rs.getInt("SalesTaxID"));
				rb.setTaxable(rs.getInt("Taxable") == 1 ? true : false);
				rb.setReceived(rs.getBoolean("IsReceived"));
				rb.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
				rb.setDateConfirmed((java.util.Date) rs.getDate("DateConfirmed"));
				rb.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
				rb.setCategoryID(rs.getInt("CategoryID"));
				rb.setInvoiceStatus(rs.getInt("invoiceStatus"));
				rb.setServiceID(rs.getLong("ServiceID"));
				rb.setSalesRepID(rs.getInt("SalesRepID"));
				rb.setShipped(rs.getInt("Shipped"));
				rb.setJobCategoryID(rs.getInt("JobCategoryID"));
				rb.setBillingAddrID(rs.getInt("BillingAddrID"));
				rb.setShipToAddrID(rs.getInt("ShippingAddrID"));
				rb.setCommission(rs.getDouble("TotalCommission"));
				rb.setBankAccountID(rs.getInt("BankAccountID"));
				rb.setCvName(cv.getFirstName() + " " + cv.getLastName());
				rb.setCompanyName(cv.getName());
				rb.setTblcategory(categoryName);
				rb.setTermName(rs.getString("termName"));
				rb.setPaymentTypeName(rs.getString("paymentTypeName"));
				rb.setAccountName(rs.getString("accountName"));

				totalAmount = totalAmount + rs.getDouble("Balance");
				rb.setTotalAmountLabel(totalAmount);
				rlb.add(rb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return rlb;

	}

	@Override
	public double updateInvoiceForLayaways(ReceivableListDto bean) {
		// TODO Auto-generated method stub
		ReceivableListDto rb = getInvoiceForLayawaysByOrderNUm(bean.getOrderNum(), bean.getCompanyID());
		double paidAmount = rb.getPaidAmount() + bean.getBalance();
		double balance = rb.getAdjustedTotal() - paidAmount;
		int i = 0;
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();

		String sql = "update bca_invoice SET PaymentTypeID =" + bean.getPaymentTypeID() + "," + " BankAccountID="
				+ bean.getBankAccountID() + "," + "CategoryID=" + bean.getCategoryID() + "," + " PaidAmount="
				+ paidAmount + "," + " Balance=" + balance + "," + "ClientVendorID=" + bean.getCvID() + ", Memo='"
				+ bean.getMemo() + "'" + " Where OrderNum=" + bean.getOrderNum() + " AND CompanyID="
				+ bean.getCompanyID();

		try {
			stmt = con.createStatement();
			i = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return balance;

	}

	@Override
	public ArrayList<TblPaymentDto> getPartiallyReceivedLayaways() {
		// TODO Auto-generated method stub

		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		ArrayList<TblPaymentDto> rl = new ArrayList<TblPaymentDto>();

		String sql = "SELECT * , " + " b.Name As PaymentTypeName," + " INV.OrderNum," + " account.Name AS AccountName"
				+ " FROM bca_payment a  " + " LEFT JOIN bca_paymenttype b  ON a.PaymentTypeID = b.PaymentTypeID"
				+ " LEFT JOIN bca_invoice INV ON a.InvoiceID = INV.InvoiceID"
				+ " LEFT JOIN bca_account account ON a.AccountID = account.AccountID " + " WHERE a.CompanyID =  "
				+ ConstValue.companyId + " AND a.InvoiceID <> -1  " + " AND a.Deleted=0 "
				+ " AND a.TransactionType = 18 ";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				TblPaymentDto payment = new TblPaymentDto();
				TblCategoryDtoLoader category = new TblCategoryDtoLoader();
				TblCategoryDto categoryName = category.getCategoryOf(rs.getInt("CategoryID"));
				ClientVendor cv = getClentVendor(rs.getInt("ClientVendorID"), ConstValue.companyId);
				payment.setId(rs.getInt("PaymentID"));
				payment.setAmount(rs.getDouble("Amount"));
				payment.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				payment.setPaymentTypeName(rs.getString("PaymentTypeName"));
				payment.setPayerID(rs.getInt("PayerID"));
				payment.setPayeeID(rs.getInt("PayeeID"));
				payment.setAccountID(rs.getInt("AccountID"));
				payment.setAccountName(getAccountNameById(payment.getAccountID()));
				payment.setCvID(rs.getInt("ClientVendorID"));
				payment.setInvoiceID(rs.getInt("InvoiceID"));
				payment.setOrderNum(rs.getInt("OrderNum"));
				payment.setCategoryId(rs.getInt("CategoryID"));
				payment.setAccountCategoryId(rs.getInt("AccountCategoryID"));
				payment.setDateAdded(rs.getDate("DateAdded"));
				payment.setNeedToDeposit(rs.getBoolean("isNeedtoDeposit"));
				payment.setToBePrinted(rs.getBoolean("IsToBePrinted"));
				payment.setCheckNumber(rs.getString("CheckNumber"));
				payment.setTblcategory(categoryName);
				payment.setCvName(cv.getFirstName() + " " + cv.getLastName());
				payment.setCompanyName(cv.getName());
				payment.setTotalAmount(rs.getDouble("Total"));
				payment.setAccountNameString(rs.getString("AccountName"));
				/*
				 * payment.setPaymentDetail(tblPaymentDetailLoader.getPaymentDetail(payment.
				 * getId()));
				 */
				rl.add(payment);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return rl;
	}

	@Override
	public void changeInvoiceTypeForLayawaysByInvoiceId(int invoiceId) {
		// TODO Auto-generated method stub

		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "Update bca_invoice " + " SET InvoiceTypeId=" + ReceivableListDto.INVOICE_TYPE
				+ " WHERE CompanyID=" + ConstValue.companyId + " AND InvoiceID=" + invoiceId;

		try {
			stmt = con.createStatement();
			int i = stmt.executeUpdate(sql);
			System.out.println("Invoice Updated :-----" + i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	@Override
	public ArrayList<TblPaymentType> getPaymentTypeForPoPayable() {
		// TODO Auto-generated method stub
		ArrayList<TblPaymentType> paymentType = new ArrayList<TblPaymentType>();
//	
//		ClientVendor cv = null;
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//
//		String sql = "SELECT PaymentTypeID,Name,Type,CCTypeID,Active,BankAcctID,TypeCategory "
//				+ " FROM bca_paymenttype " + " WHERE CompanyID = " + ConstValue.companyId + " AND Active =1 "
//				+ " AND TypeCategory =  " + TblPaymentType.PAYMENT_TYPE + " ORDER BY Name";

		try {
			int paymentType2 = TblPaymentType.PAYMENT_TYPE;
			Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
			BcaCompany bcaCompany = new BcaCompany();
			if (company.isPresent()) {
				bcaCompany = company.get();
			}

			List<BcaPaymenttype> paymenttypes = bcaPaymenttypeRepository
					.findByCompanyAndActiveAndTypeCategoryOrderByName(bcaCompany, 1, paymentType2);
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
			for (BcaPaymenttype bcaPaymenttype : paymenttypes) {
				TblPaymentType tbt = new TblPaymentType();
				tbt.setId(bcaPaymenttype.getPaymentTypeId());
				tbt.setTypeName(bcaPaymenttype.getName());
				tbt.setType(bcaPaymenttype.getType());
				tbt.setCctype_id(bcaPaymenttype.getCctype().getCctypeId());
				boolean active = bcaPaymenttype.getActive() > 0 ? true : false;
				tbt.setActive(active);
				tbt.setBankAcctID(bcaPaymenttype.getBankAcctId());
				tbt.setTypeCategory(bcaPaymenttype.getTypeCategory());
				paymentType.add(tbt);

			}
//			while (rs.next()) {
//				TblPaymentType tbt = new TblPaymentType();
//				tbt.setId(rs.getInt("PaymentTypeID"));
//				tbt.setTypeName(rs.getString("Name"));
//				tbt.setType(rs.getString("Type"));
//				tbt.setCctype_id(rs.getInt("CCTypeID"));
//				tbt.setActive(rs.getBoolean("Active"));
//				tbt.setBankAcctID(rs.getInt("BankAcctID"));
//				tbt.setTypeCategory(rs.getInt("TypeCategory"));
//
//				paymentType.add(tbt);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return paymentType;

	}

	@Override
	public ArrayList<ReceivableListDto> getPoPayableList() {
		// TODO Auto-generated method stub
		ArrayList<ReceivableListDto> pli = new ArrayList<ReceivableListDto>();
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;

		String sql = "SELECT INV.InvoiceID, INV.PONum, INV.ClientVendorID , INV.CompanyID,INV.InvoiceTypeID "
				+ " ,INV.AdjustedTotal" + " ,INV.paidamount" + " ,INV.BankAccountID"
				+ " ,(SELECT Sum(bca_payment.Amount) AS AB FROM bca_payment WHERE bca_payment.InvoiceID = INV.InvoiceID AND bca_payment.Deleted <> 1) AS PaidAmount12"
				+ " ,INV.Balance" + " ,INV.TermID" + " ,INV.PaymentTypeID" + " ,INV.IsPaymentCompleted"
				+ " ,INV.DateAdded AS DateAdded" + " ,INV.CategoryId" + " ,INV.Memo" + " ,PAY.Name AS PaymentTypeName"
				+ " ,Bank.Name AS AccountName" + " ,Category.Name As CategoryName" + " ,Category.CateNumber"
				+ " ,bca_clientvendor.Name AS CompanyName" + " ,bca_clientvendor.FirstName"
				+ " ,bca_clientvendor.LastName" + " FROM bca_invoice AS INV"
				+ " INNER JOIN bca_clientvendor ON INV.ClientVendorID = bca_clientvendor.ClientVendorID"
				+ " LEFT JOIN bca_paymenttype as PAY ON INV.PaymentTypeID = PAY.PaymentTypeID"
				+ " LEFT JOIN bca_account AS Bank ON INV.BankAccountID = Bank.AccountID"
				+ " LEFT JOIN bca_category AS Category ON INV.CategoryID = Category.CategoryID"
				+ " WHERE INV.CompanyID=" + ConstValue.companyId + " AND INV.IsPaymentCompleted = 0"
				+ " AND INV.InvoiceStatus = 0" + " AND INV.InvoiceTypeID = 2" + " AND bca_clientvendor.Status IN ('N', 'U')"
				+ " AND bca_clientvendor.CompanyID =" + ConstValue.companyId
				+ " AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
				+ " WHERE  bca_payment.InvoiceID = INV.InvoiceID AND bca_payment.Deleted <> 1)"

				+ "  OR (SELECT Sum(bca_payment.Amount) FROM bca_payment WHERE  bca_payment.InvoiceID = INV.InvoiceID AND bca_payment.Deleted <> 1) IS NULL )"
				+ " ORDER  BY ponum DESC";

//		con = db.getConnection();
		try {
			List<Object[]> poPayableList = bcaInvoiceRepository.findPoPayableList(ConstValue.companyId);
			if (poPayableList.size() > 0) {
				List<PoPayableDto> poPayableDto = poPayableDto(poPayableList);
				for (PoPayableDto poDto : poPayableDto) {
					ReceivableListDto rb = new ReceivableListDto();

					rb.setInvoiceID(poDto.getInvoiceID());
					/* rb.setOrderNum(rs.getInt("OrderNum")); */
					rb.setPoNum(poDto.getPONum());
					int poNo = (poDto.getPONum());
					String yearPart = MyUtility
							.getYearPart(new SimpleDateFormat("dd-mm-yyyy").format(poDto.getDateAdded()));

					if (configDto.getIsPurchasePrefix().equals("on")) {
						rb.setPoNumStr("PO".concat(yearPart)
								.concat("-" + MyUtility.getOrderNumberByConfigData(Integer.toString(poNo),
										AppConstants.POType, configDto, false)));
					} else {
						rb.setPoNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(poNo), AppConstants.POType,
								configDto, false));
					}
					rb.setMemo(poDto.getMemo());
					rb.setCvID(poDto.getClientVendorID());
					rb.setInvoiceTypeID(poDto.getInvoiceTypeID());
					rb.setAdjustedTotal(poDto.getAdjustedTotal());
					rb.setPaidAmount(poDto.getPaidAmount());
					rb.setBalance(poDto.getBalance());
					rb.setTermID(poDto.getTermID());
					if (null != poDto.getPaymentTypeID())
						rb.setPaymentTypeID(poDto.getPaymentTypeID());
					rb.setPaymentCompleted(poDto.isPaymentCompleted());
					rb.setDateAdded((java.util.Date) poDto.getDateAdded());
					if (null != poDto.getCategoryId())
						rb.setCategoryID(poDto.getCategoryId());
					if (null != poDto.getBankAccountId())
						rb.setBankAccountID(poDto.getBankAccountId());
					rb.setCvName(poDto.getFirstName() + " " + poDto.getLastName());
					rb.setCompanyName(poDto.getCompanyName());
					if (null != poDto.getCategoryName())
						rb.setCategoryName((poDto.getCategoryName() + " " + poDto.getCateNumber()));
					if (null != poDto.getPaymentTypeName())
						rb.setPaymentTypeName(poDto.getPaymentTypeName());
					if (null != poDto.getAccountName())
						rb.setAccountName(poDto.getAccountName());

					pli.add(rb);
				}
			}

//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				ReceivableListDto rb = new ReceivableListDto();
//
//				rb.setInvoiceID(rs.getInt("InvoiceID"));
//				/* rb.setOrderNum(rs.getInt("OrderNum")); */
//				rb.setPoNum(rs.getInt("PONum"));
////<<<<<<< Updated upstream
//				int poNo = (rs.getInt("PONum"));
//				String yearPart = MyUtility
//						.getYearPart(new SimpleDateFormat("dd-mm-yyyy").format(rs.getDate("DateAdded")));
//
//				if (configDto.getIsPurchasePrefix().equals("on")) {
//					rb.setPoNumStr("PO".concat(yearPart)
//							.concat("-" + MyUtility.getOrderNumberByConfigData(Integer.toString(poNo),
//									AppConstants.POType, configDto, false)));
//				} else {
//					rb.setPoNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(poNo), AppConstants.POType,
//							configDto, false));
//				}
//
////=======
////				int orderNo = (rs.getInt("PONum"));
////				rb.setOrderNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(orderNo), AppConstants.POType,
////						configDto, false));
////>>>>>>> Stashed changes
//				/* rb.setEmployeeId(rs.getInt("EmployeeID")); */
//				/* rb.setRefNum(rs.getString("RefNum")); */
//				rb.setMemo(rs.getString("Memo"));
//				rb.setCvID(rs.getInt("ClientVendorID"));
//				rb.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
//				/* rb.setTotal(rs.getDouble("Total")); */
//				rb.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
//				rb.setPaidAmount(rs.getDouble("PaidAmount"));
//				rb.setBalance(rs.getDouble("Balance"));
//				rb.setTermID(rs.getInt("TermID"));
//				rb.setPaymentTypeID(rs.getInt("PaymentTypeID"));
//				/* rb.setShipCarrierID(rs.getInt("ShipCarrierID")); */
//				/* rb.setSh(rs.getDouble("SH")); */
//				/* rb.setSubTotal(rs.getDouble("SubTotal")); */
//				/* rb.setTax(rs.getDouble("Tax")); */
//				/* rb.setShippingMethod(rs.getString("ShippingMethod")); */
//				/* rb.setSalesTaxID(rs.getInt("SalesTaxID")); */
//				/* rb.setTaxable(rs.getInt("Taxable") == 1 ? true : false); */
//				/* rb.setReceived(rs.getBoolean("IsReceived")); */
//				rb.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
//				/* rb.setDateConfirmed((java.util.Date) rs.getDate("DateConfirmed")); */
//				rb.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
//				rb.setCategoryID(rs.getInt("CategoryID"));
//				/* rb.setInvoiceStatus(rs.getInt("invoiceStatus")); */
//				/* rb.setServiceID(rs.getLong("ServiceID")); */
//				/* rb.setSalesRepID(rs.getInt("SalesRepID")); */
//				/* rb.setShipped(rs.getInt("Shipped")); */
//				/*
//				 * rb.setJobCategoryID(rs.getInt("JobCategoryID"));
//				 * rb.setBillingAddrID(rs.getInt("BillingAddrID"));
//				 * rb.setShipToAddrID(rs.getInt("ShippingAddrID"));
//				 * rb.setCommission(rs.getDouble("TotalCommission"));
//				 */
//				rb.setBankAccountID(rs.getInt("BankAccountID"));
//				rb.setCvName(rs.getString("FirstName") + " " + rs.getString(("LastName")));
//				rb.setCompanyName(rs.getString("CompanyName"));
//				rb.setCategoryName((rs.getString("CategoryName") + " " + rs.getString("CateNumber")));
//				rb.setPaymentTypeName(rs.getString("PaymentTypeName"));
//				rb.setAccountName(rs.getString("AccountName"));
//
//				pli.add(rb);
//			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

		return pli;
	}

	@Override
	public void getInvoices(ReceivableListDto bean) throws SQLException {
		// TODO Auto-generated method stub
		TblAccountable payable = new TblAccountable();
		Calendar c1 = Calendar.getInstance();
		double amount = 0.0;

		payable.setAmount(bean.getPaidAmount());
		payable.setCategoryId(bean.getCategoryID());
		payable.setAccountCategoryId(bean.getCategoryID());
		payable.setDateAdded(c1.getTime());
		payable.setInvoiceId(bean.getInvoiceID());
		payable.setPayeeCvId(bean.getCvID());
		payable.setInvoiceTypeID(bean.getInvoiceTypeID());

		payable.setPayeeID(getAccountForPayer(bean.getCvID(), ConstValue.companyId).getAccountID());
		payable.setMemo(bean.getMemo());
		payable.setPaymentTypeId(bean.getPaymentTypeID());
		payable.setCheckNumber(bean.getCheckNum());

		payable.setPayFromId(bean.getBankAccountID());

		payable.setPayeeCvServiceId((int) bean.getServiceID());

		bean.setAccountable(payable);
		TblAccount creditAccount = getAccountForPayer(bean.getCvID(), ConstValue.companyId);
		TblAccount debitAccount = getAccount(bean.getAccountable().getPayFromId());

		if (debitAccount != null) {
			amount = debitAccount.getCustomerCurrentBalance();
		}

		payable.setPayFromBalance(bean.getPaidAmount());

		try {
			payable.setPayToBalance(creditAccount.getVendorCurrentBalance() - bean.getPaidAmount());
		} catch (Exception e) {
			payable.setPayToBalance(0.00);
		}

		bean.setPaidAmount(payable.getAmount());

		int payableId = insert(payable, false);
		payable.setId(payableId);
		bean.setAccountable(payable);
		adjustVendorBankBalance(creditAccount, -bean.getPaidAmount());

	}

	public static void adjustVendorBankBalance(TblAccount account, double amount) throws SQLException {
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;

		String sql = "SELECT VendorCurrentBalance FROM bca_account " + " WHERE AccountID = " + account.getAccountID()
				+ " AND CompanyID = " + ConstValue.companyId;

		try {
			con = db.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			double currentBalance = 0.0;

			if (rs.next()) {
				currentBalance = rs.getDouble("VendorCurrentBalance");
			}

			String sql_put = "UPDATE bca_account SET VendorCurrentBalance=" + (currentBalance + amount) + // changed by
																											// pritesh
																											// amount
																											// actual
																											// code
																											// (currentBalance+amount)
					" WHERE AccountID = " + account.getAccountID() + " AND CompanyID = " + ConstValue.companyId;
			stmt.executeUpdate(sql_put);
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

	public int insert(TblAccountable accountable, boolean isNeedToPrint) throws SQLException {
		Connection con = null;
		Statement stmt = null;
		Statement stmt_1 = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		ResultSet rs_1 = null;
		boolean toPrinted = false;
		int paymentId = -1;
		int payableId = -1;
		double payFromBalance = 0.00;
		double payToBalance = 0.00;

		TblAccount fromAccount = getAccount(accountable.getPayFromId());
		if (fromAccount != null) {

			adjustBankBalance(fromAccount, -accountable.getAmount());
			payFromBalance = (fromAccount.getCustomerCurrentBalance());

		}
		TblAccount toAccount = getAccount(accountable.getPayeeID()); // 57061

		if (toAccount != null) {
			adjustBankBalance(toAccount, accountable.getAmount());
			payToBalance = (toAccount.getVendorCurrentBalance());

		}
		if (fromAccount != null && fromAccount.getAccountTypeID() == 2) {
			payToBalance = 0.0;
		}
		TblPaymentDto payment = new TblPaymentDto();
		if (accountable.getInvoiceTypeId() == 2) {
			payment.setInvoiceTypeID(2);
		} else if (accountable.getInvoiceTypeId() == 31) {
			payment.setInvoiceTypeID(31);
		}
		if (!isNeedToPrint) {

			payableId = insertIntoAccountable(accountable); // 30
			int priority = getPriority();
			insertIntoPaymentTable(accountable, payableId, payFromBalance, payToBalance, payment, priority);
		}

		return payableId;
	}

	public int insertIntoAccountable(TblAccountable accountable) throws SQLException {
		Connection con = null;
		Statement stmt = null;
		Statement stmt_1 = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		ResultSet rs_1 = null;
		int payableId = -1;

		String sql = "INSERT INTO bca_accountable(InvoiceID,PayeeCvID,PayeeCvServiceID,PayerCvID,PayerCvServiceID,"
				+ "DateAdded,Amount,Memo,Ref,PayFromID,CategoryID,PaymentCompleted,CompanyID,CreditCardID,PaymentTypeID,"
				+ "IsPayable,CheckNumber) VALUES " + "(" + accountable.getInvoiceId() + "," + accountable.getPayeeCvId()
				+ "," + accountable.getPayeeCvServiceId() + "," + accountable.getPayerCvId() + ","
				+ accountable.getPayerCvServiceId() + "," + // (accountable.getDateAdded()==null?null:("'"+JProjectUtil.dateFormatLong.format(accountable.getDateAdded())+"'"))+","+
				(accountable.getDateAdded() == null ? null
						: ("'" + JProjectUtil.getDateFormaterCommon().format(accountable.getDateAdded()) + "'"))
				+ "," + accountable.getAmount() + "," + "'" + accountable.getMemo().replaceAll("'", "''") + "'" + ","
				+ "'" + accountable.getRef().replaceAll("'", "''") + "'" + "," + accountable.getPayFromId() + ","
				+ accountable.getCategoryId() + "," + (accountable.isPaymentCompleted() == true ? 1 : 0) + ","
				+ ConstValue.companyId + "," + accountable.getCreditCardId() + "," + accountable.getPaymentTypeId()
				+ "," + (accountable.isPayable() == true ? 1 : 0) + "," + "'" + accountable.getCheckNumber() + "'"
				+ ")";

		con = db.getConnection();
		stmt = con.createStatement();
		stmt.executeUpdate(sql);

		rs = stmt.executeQuery("SELECT MAX(PayableID) as LastID FROM bca_accountable");
		if (rs.next()) {
			payableId = rs.getInt("LastID");
		}

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
		return payableId;
	}

	public void insertIntoPaymentTable(TblAccountable accountable, int payableId, double payFromBalance,
			double payToBalance, TblPaymentDto payment, int priority) throws SQLException {
		Connection con = null;
		Statement stmt = null;
		Statement stmt_1 = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		ResultSet rs_1 = null;
		boolean toPrinted = false;
		int paymentId = -1;

		String sql1 = "INSERT INTO bca_payment(Amount,"
				+ "PaymentTypeID,PayerID,PayeeID,AccountID,ClientVendorID,InvoiceID,"
				+ "CategoryID,AccountCategoryID,CompanyID,DateAdded,CheckNumber,PayableID,"
				+ "RmaNo,RmaItemID,IsToBePrinted,BillNum,PayFromBalance,"
				+ "PayToBalance,TransactionType,Priority) VALUES (" + accountable.getAmount() + ","
				+ accountable.getPaymentTypeId() + "," + accountable.getPayFromId() + "," + // accountable.getPayeeCvId()+","+
				accountable.getPayeeID() + "," + accountable.getPayFromId() + "," + accountable.getPayeeCvId() + ","
				+ accountable.getInvoiceId() + "," + accountable.getCategoryId() + ","
				+ accountable.getAccountCategoryId() + "," + ConstValue.companyId + "," + // (accountable.getDateAdded()==null?null:("'"+JProjectUtil.dateFormatLong.format(accountable.getDateAdded())+"'"))+
																							// ","+
				(accountable.getDateAdded() == null ? null
						: ("'" + JProjectUtil.getDateFormaterCommon().format(accountable.getDateAdded()) + "'"))
				+ "," + "'" + accountable.getCheckNumber() + "'," + payableId + "," + accountable.getRmaNumber() + ","
				+ accountable.getRmaUniqueID() + "," + (toPrinted == true ? 1 : 0) + "," + accountable.getBillNum()
				+ "," + payFromBalance + "," + payToBalance + "," + payment.getInvoiceTypeID() + "," // ss to get
																										// InvoiceTypeID
				+ (priority + 1) + ")";
		con = db.getConnection();
		stmt = con.createStatement();
		stmt.executeUpdate(sql1);

		rs_1 = stmt.executeQuery("SELECT MAX(PaymentID) as LastID FROM bca_payment");
		if (rs_1.next()) {
			paymentId = rs_1.getInt("LastID");
		}
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

	@Override
	public ArrayList<TblPaymentDto> getPaidList(Date fromDate, Date toDate) {
		// TODO Auto-generated method stub
		String dataStr = "";
		String sql = "";
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		dataStr = getSQL4Date(fromDate, toDate);
		ArrayList<TblPaymentDto> paidL = new ArrayList<TblPaymentDto>();

		sql = " SELECT a.*" + " ,acc.Name AS AccountName" + " ,pay.Name AS PaymentName" + " ,cat.Name AS CategoryName"
				+ " ,cat.CateNumber" + " ,vendor.FirstName" + " ,vendor.LastName" + " ,vendor.Name AS CompanyName"
				+ " ,b.AdjustedTotal" + " ,b.PaidAmount" + " ,b.PONum" + " FROM   bca_invoice AS b"
				+ " ,bca_payment AS a " + " LEFT JOIN bca_account AS acc ON a.AccountID = acc.AccountID"
				+ " LEFT JOIN bca_paymenttype AS pay ON a.PaymentTypeID = pay.PaymentTypeID"
				+ " LEFT JOIN bca_category AS cat ON a.CategoryID = cat.CategoryID"
				+ " LEFT JOIN bca_clientvendor AS vendor ON a.ClientVendorID = vendor.ClientVendorID"
				+ " WHERE  a.companyid =" + ConstValue.companyId + " AND ( a.invoiceid <> -1 "
				+ " OR a.invoiceid <> 0 )" + " AND a.rmano <= 0" + " AND b.invoicetypeid IN ( 2 )"
				+ " AND a.invoiceid = b.invoiceid" + " AND a.deleted = 0" + " AND a.transactiontype <> 16"
				+ " AND a.categoryid <> -11" + " AND vendor.Status IN ('U','N')";

		if (!dataStr.equals("")) {
			sql = sql + " AND DATE_FORMAT(a.DateAdded,'%Y/%m/%d %T')  " + dataStr;
		}
		sql = sql + " ORDER  BY ponum DESC";

		try {
			con = db.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				TblPaymentDto payment = new TblPaymentDto();
				payment.setId(rs.getInt("PaymentID"));
				payment.setAmount(rs.getDouble("Amount"));
				payment.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				payment.setPaymentTypeName(rs.getString("PaymentName"));
				payment.setPayerID(rs.getInt("PayerID"));
				payment.setPayeeID(rs.getInt("PayeeID"));
				payment.setAccountID(rs.getInt("AccountID"));
				payment.setAccountNameString(rs.getString("AccountName"));
				payment.setCvID(rs.getInt("ClientVendorID"));
				payment.setInvoiceID(rs.getInt("InvoiceID"));
				payment.setCategoryId(rs.getInt("CategoryID"));
				payment.setAccountCategoryId(rs.getInt("AccountCategoryID"));
				payment.setDateAdded(rs.getDate("DateAdded"));
				payment.setNeedToDeposit(rs.getBoolean("isNeedtoDeposit"));
				payment.setToBePrinted(rs.getBoolean("IsToBePrinted"));
				payment.setCheckNumber(rs.getString("CheckNumber"));
				payment.setCategoryName(rs.getString("CategoryName") + " " + rs.getString("CateNumber"));
				payment.setTotalAmount(rs.getDouble("AdjustedTotal"));
				payment.setBalance(rs.getDouble("AdjustedTotal") - rs.getDouble("Amount"));
				payment.setPoNum(rs.getInt("PONum"));
				payment.setPayableID(rs.getInt("PayableID"));
				payment.setCvName(rs.getString("CompanyName") + " (" + rs.getString("FirstName") + " "
						+ rs.getString("LastName") + ")");

				paidL.add(payment);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

		return paidL;
	}

	@Override
	public ArrayList<ReceivableListDto> getConsignmentSaleList() {
		// TODO Auto-generated method stub
		ArrayList<ReceivableListDto> cli = new ArrayList<ReceivableListDto>();
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//
//		String sql = "SELECT INV.InvoiceID, INV.PONum, INV.ClientVendorID , INV.CompanyID,INV.InvoiceTypeID "
//				+ " ,INV.AdjustedTotal" + " ,INV.paidamount" + " ,INV.BankAccountID"
//				+ " ,(SELECT Sum(bca_payment.Amount) AS AB FROM bca_payment WHERE bca_payment.InvoiceID = INV.InvoiceID AND bca_payment.Deleted <> 1) AS PaidAmount12"
//				+ " ,INV.Balance" + " ,INV.TermID" + " ,INV.PaymentTypeID" + " ,INV.IsPaymentCompleted"
//				+ " ,INV.DateAdded AS DateAdded" + " ,INV.CategoryId" + " ,INV.Memo" + " ,PAY.Name AS PaymentTypeName"
//				+ " ,Bank.Name AS AccountName" + " ,Category.Name As CategoryName" + " ,Category.CateNumber"
//				+ " ,bca_clientvendor.Name AS CompanyName" + " ,bca_clientvendor.FirstName"
//				+ " ,bca_clientvendor.LastName" + " FROM bca_invoice AS INV"
//				+ " INNER JOIN bca_clientvendor ON INV.ClientVendorID = bca_clientvendor.ClientVendorID"
//				+ " LEFT JOIN bca_paymenttype as PAY ON INV.PaymentTypeID = PAY.PaymentTypeID"
//				+ " LEFT JOIN bca_account AS Bank ON INV.BankAccountID = Bank.AccountID"
//				+ " LEFT JOIN bca_category AS category ON INV.CategoryID = Category.CategoryID"
//				+ " WHERE INV.CompanyID=" + ConstValue.companyId + " AND INV.IsPaymentCompleted = 0"
//				+ " AND INV.InvoiceStatus = 0" + " AND INV.InvoiceTypeID =" + ReceivableListDto.CONSIGNMENT_SALE_TYPE
//				+ " AND bca_clientvendor.Status = 'N'" + " AND bca_clientvendor.CompanyID = 1"
//				+ " AND ( INV.AdjustedTotal > (SELECT Sum(bca_payment.Amount)" + " FROM   bca_payment"
//				+ " WHERE  bca_payment.InvoiceID = INV.InvoiceID AND bca_payment.Deleted <> 1)"
//
//				+ "  OR (SELECT Sum(bca_payment.Amount) FROM bca_payment WHERE  bca_payment.InvoiceID = INV.InvoiceID AND bca_payment.Deleted <> 1) IS NULL )"
//				+ " ORDER  BY ponum DESC";

		StringBuffer query = new StringBuffer(
				"select inv from  BcaInvoice as inv inner join BcaClientvendor as cv on inv.clientVendor.clientVendorId = cv.clientVendorId "
						+ " left join BcaPaymenttype as pay on inv.paymentType.paymentTypeId = pay.paymentTypeId left join BcaAccount as bank on inv.bankAccountId = bank.accountId "
						+ " left join BcaCategory as cat on inv.category.categoryId =cat.categoryId where inv.company.companyId = :companyId "
						+ " and inv.isPaymentCompleted = 0 and inv.invoiceStatus = 0 and inv.invoiceType.invoiceTypeId = :invoiceTypeId "
						+ " and cv.status = 'N'  and cv.company.companyId = 1 and (inv.adjustedTotal > (select sum (bp.amount) from BcaPayment bp where bp.invoice.invoiceId =inv.invoiceId and bp.deleted <> 1) "
						+ " or (select sum(bp.amount) from BcaPayment bp where bp.invoice.invoiceId = inv.invoiceId and bp.deleted <> 1 ) is null ) order by inv.ponum desc ");

		StringBuffer query2 = new StringBuffer(
				"select bank.name from  BcaInvoice as inv inner join BcaClientvendor as cv on inv.clientVendor.clientVendorId = cv.clientVendorId "
						+ " left join BcaPaymenttype as pay on inv.paymentType.paymentTypeId = pay.paymentTypeId left join BcaAccount as bank on inv.bankAccountId = bank.accountId "
						+ " left join BcaCategory as cat on inv.category.categoryId =cat.categoryId where inv.company.companyId = :companyId "
						+ " and inv.isPaymentCompleted = 0 and inv.invoiceStatus = 0 and inv.invoiceType.invoiceTypeId = :invoiceTypeId "
						+ " and cv.status = 'N'  and cv.company.companyId = 1 and (inv.adjustedTotal > (select sum (bp.amount) from BcaPayment bp where bp.invoice.invoiceId =inv.invoiceId and bp.deleted <> 1) "
						+ " or (select sum(bp.amount) from BcaPayment bp where bp.invoice.invoiceId = inv.invoiceId and bp.deleted <> 1 ) is null ) order by inv.ponum desc ");

//		con = db.getConnection();
		try {
			TypedQuery<BcaInvoice> typedQuery = this.entityManager.createQuery(query.toString(), BcaInvoice.class);
			JpaHelper.addParameter(typedQuery, query.toString(), "companyId", new Long(ConstValue.companyId));
			JpaHelper.addParameter(typedQuery, query.toString(), "invoiceTypeId",
					ReceivableListDto.CONSIGNMENT_SALE_TYPE);
			TypedQuery<String> typed_Query = this.entityManager.createQuery(query2.toString(), String.class);
			JpaHelper.addParameter(typed_Query, query.toString(), "companyId", new Long(ConstValue.companyId));
			JpaHelper.addParameter(typed_Query, query.toString(), "invoiceTypeId",
					ReceivableListDto.CONSIGNMENT_SALE_TYPE);

			List<BcaInvoice> resultList = typedQuery.getResultList();
			List<String> accountNameList = typed_Query.getResultList();
			IntStream.range(0, resultList.size()).forEach(i -> {
				BcaInvoice bcaInvoice = resultList.get(i);
				String accountName = accountNameList.get(i);
				ReceivableListDto rb = new ReceivableListDto();

				rb.setInvoiceID(bcaInvoice.getInvoiceId());
				rb.setPoNum(bcaInvoice.getPonum());
				rb.setMemo(bcaInvoice.getMemo());
				if (null != bcaInvoice.getClientVendor())
					rb.setCvID(bcaInvoice.getClientVendor().getClientVendorId());
				if (null != bcaInvoice.getInvoiceType())
					rb.setInvoiceTypeID(bcaInvoice.getInvoiceType().getInvoiceTypeId());
				rb.setAdjustedTotal(bcaInvoice.getAdjustedTotal());
				rb.setPaidAmount(bcaInvoice.getPaidAmount());
				rb.setBalance(bcaInvoice.getBalance());
				if (null != bcaInvoice.getTerm())
					rb.setTermID(bcaInvoice.getTerm().getTermId());
				if (null != bcaInvoice.getPaymentType())
					rb.setPaymentTypeID(bcaInvoice.getPaymentType().getPaymentTypeId());
				rb.setPaymentCompleted(bcaInvoice.getIsPaymentCompleted());
				rb.setDateAdded(offsetDateTimeToDate(bcaInvoice.getDateAdded()));
				if (null != bcaInvoice.getCategory())
					rb.setCategoryID(bcaInvoice.getCategory().getCategoryId());
				rb.setBankAccountID(bcaInvoice.getBankAccountId());
				rb.setCvName(
						bcaInvoice.getClientVendor().getFirstName() + " " + bcaInvoice.getClientVendor().getLastName());
				rb.setCompanyName(bcaInvoice.getClientVendor().getName());
				rb.setCategoryName(bcaInvoice.getCategory().getName() + " " + bcaInvoice.getCategory().getCateNumber());
				rb.setPaymentTypeName(bcaInvoice.getPaymentType().getName());
				rb.setAccountName(accountName);

				cli.add(rb);

			});

//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				ReceivableListDto rb = new ReceivableListDto();
//
//				rb.setInvoiceID(rs.getInt("InvoiceID"));
//				rb.setPoNum(rs.getInt("PONum"));
//				rb.setMemo(rs.getString("Memo"));
//				rb.setCvID(rs.getInt("ClientVendorID"));
//				rb.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
//				rb.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
//				rb.setPaidAmount(rs.getDouble("PaidAmount"));
//				rb.setBalance(rs.getDouble("Balance"));
//				rb.setTermID(rs.getInt("TermID"));
//				rb.setPaymentTypeID(rs.getInt("PaymentTypeID"));
//				rb.setPaymentCompleted(rs.getBoolean("IsPaymentCompleted"));
//				rb.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
//				rb.setCategoryID(rs.getInt("CategoryID"));
//				rb.setBankAccountID(rs.getInt("BankAccountID"));
//				rb.setCvName(rs.getString("FirstName") + " " + rs.getString(("LastName")));
//				rb.setCompanyName(rs.getString("CompanyName"));
//				rb.setCategoryName((rs.getString("CategoryName") + " " + rs.getString("CateNumber")));
//				rb.setPaymentTypeName(rs.getString("PaymentTypeName"));
//				rb.setAccountName(rs.getString("AccountName"));
//
//				cli.add(rb);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return cli;

	}

	@Override
	public void changeInvoiceTypeIdForConsignment(int invoiceID) {
		// TODO Auto-generated method stub
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "UPDATE bca_invoice SET InvoiceTypeID=" + ReceivableListDto.CONSIGNMENT_SALE_TYPE
				+ " WHERE CompanyID=" + ConstValue.companyId + " AND InvoiceID=" + invoiceID;
		try {
			stmt = con.createStatement();
			int i = stmt.executeUpdate(sql);
			System.out.println("update Consignment : ------" + i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	@Override
	public ArrayList<TblPaymentDto> getPaidConsignPaymentList() {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		ArrayList<TblPaymentDto> paidConsign = new ArrayList<TblPaymentDto>();

		String sql = " SELECT a.*" + " ,acc.Name AS AccountName" + " ,pay.Name AS PaymentName"
				+ " ,cat.Name AS CategoryName" + " ,cat.CateNumber" + " ,vendor.FirstName" + " ,vendor.LastName"
				+ " ,vendor.Name AS CompanyName" + " ,b.AdjustedTotal" + " ,b.PaidAmount" + " ,b.PONum"
				+ " FROM   bca_invoice AS b" + " ,bca_payment AS a "
				+ " LEFT JOIN bca_account AS acc ON a.AccountID = acc.AccountID"
				+ " LEFT JOIN bca_paymenttype AS pay ON a.PaymentTypeID = pay.PaymentTypeID"
				+ " LEFT JOIN bca_category AS cat ON a.CategoryID = cat.CategoryID"
				+ " LEFT JOIN bca_clientvendor AS vendor ON a.ClientVendorID = vendor.ClientVendorID"
				+ " WHERE  a.companyid =" + ConstValue.companyId + " AND ( a.invoiceid <> -1 "
				+ " OR a.invoiceid <> 0 )" + " AND a.rmano <= 0" + " AND b.invoicetypeid IN ( "
				+ ReceivableListDto.CONSIGNMENT_SALE_TYPE + " )" + " AND a.invoiceid = b.invoiceid"
				+ " AND a.deleted = 0" + " AND a.transactiontype <> 16" + " AND a.categoryid <> -11"
				+ " AND vendor.Status IN ('U','N')" + " ORDER  BY ponum DESC";

		try {
			con = db.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				TblPaymentDto payment = new TblPaymentDto();
				payment.setId(rs.getInt("PaymentID"));
				payment.setAmount(rs.getDouble("Amount"));
				payment.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				payment.setPaymentTypeName(rs.getString("PaymentName"));
				payment.setPayerID(rs.getInt("PayerID"));
				payment.setPayeeID(rs.getInt("PayeeID"));
				payment.setAccountID(rs.getInt("AccountID"));
				payment.setAccountNameString(rs.getString("AccountName"));
				payment.setCvID(rs.getInt("ClientVendorID"));
				payment.setInvoiceID(rs.getInt("InvoiceID"));
				payment.setCategoryId(rs.getInt("CategoryID"));
				payment.setAccountCategoryId(rs.getInt("AccountCategoryID"));
				payment.setDateAdded(rs.getDate("DateAdded"));
				payment.setNeedToDeposit(rs.getBoolean("isNeedtoDeposit"));
				payment.setToBePrinted(rs.getBoolean("IsToBePrinted"));
				payment.setCheckNumber(rs.getString("CheckNumber"));
				payment.setCategoryName(rs.getString("CategoryName") + " " + rs.getString("CateNumber"));
				payment.setTotalAmount(rs.getDouble("AdjustedTotal"));
				payment.setBalance(rs.getDouble("AdjustedTotal") - rs.getDouble("Amount"));
				payment.setPoNum(rs.getInt("PONum"));
				payment.setCvName(rs.getString("CompanyName") + " (" + rs.getString("FirstName") + " "
						+ rs.getString("LastName") + ")");

				paidConsign.add(payment);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return paidConsign;

	}

	@Override
	public void clearFromConsignmentTab(int invoiceID) {
		// TODO Auto-generated method stub
		Connection con;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "UPDATE bca_invoice SET InvoiceTypeID=" + ReceivableListDto.PURCHASE_ORDER_INVOICE_TYPE
				+ " WHERE CompanyID=" + ConstValue.companyId + " AND InvoiceID=" + invoiceID;
		try {
			stmt = con.createStatement();
			int i = stmt.executeUpdate(sql);
			System.out.println("update Consignment : ------" + i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	@Override
	public ArrayList<Date> getSelectedDateRange(int option) {
		// TODO Auto-generated method stub
		int s = option;
		ArrayList<Date> rangeList = new ArrayList<Date>();
		switch (s) {
		case 1:

			break;
		case 2:
			setCustom();
			break;

		case 3:
			setToday();
			break;
		case 4:
			setThisMonth();
			break;
		case 5:
			setThisQuarter();
			break;
		case 6:
			setThisYear();
			break;
		case 7:
			setYear(1);
			break;
		case 8:
			setYear(2);
			break;
		case 9:
			setYear(3);
			break;
		case 10:
			setMonth2Date();
			break;
		case 11:
			setQuarter2Date();
			break;
		case 12:
			setYear2Date();
			break;
		case 13:
			lastDays(10);
			break;
		case 14:
			lastDays(30);
			break;
		case 15:
			lastDays(60);
			break;
		case 16:
			setWeek(7);
			break;

		default:
			break;
		}
		rangeList.add(frDate);
		rangeList.add(tdate);

		return rangeList;

	}

	private void setCustom() {
		/*
		 * Calendar cur = Calendar.getInstance(); Calendar c1 = Calendar.getInstance();
		 * c1.add(Calendar.DATE, -1); if (tblPreference.getInstance().dateFrom == null)
		 * { getDateFrom().setDate(c1.getTime()); } else {
		 * getDateFrom().setDate(tblPreference.getInstance().dateFrom); } if
		 * (tblPreference.getInstance().dateTo == null) {
		 * getDateTo().setDate(cur.getTime()); } else {
		 * getDateTo().setDate(tblPreference.getInstance().dateTo); }
		 * getDateFrom().requestFocus(); setDateComboEditable();
		 */
	}

	private void setToday() {
		Calendar cur = Calendar.getInstance();
		frDate = cur.getTime();
		tdate = cur.getTime();

	}

	private void setThisMonth() {

		Calendar cur = Calendar.getInstance();

		int firstDay = cur.getActualMinimum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, firstDay);
		frDate = cur.getTime();

		int lastDay = cur.getActualMaximum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, lastDay);
		tdate = cur.getTime();
	}

	private void setThisQuarter() {
		Calendar cur = Calendar.getInstance();
		int mon = cur.get(Calendar.MONTH);
		int pivot = (int) (mon / 3);
		if (pivot == 0) {
			mon = 0;
		} else if (pivot == 1) {
			mon = 3;
		} else if (pivot == 2) {
			mon = 6;
		} else if (pivot == 3) {
			mon = 9;
		}

		cur.set(Calendar.MONTH, mon);
		int firstDay = cur.getMinimum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, firstDay);
		frDate = cur.getTime();

		cur.set(Calendar.MONTH, mon + 2);
		int lastDay = cur.getMaximum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, lastDay);
		tdate = cur.getTime();

	}

	private void setThisYear() {
		Calendar cur = Calendar.getInstance();
		int mon = cur.getMinimum(Calendar.MONTH);
		cur.set(Calendar.MONTH, mon);
		int day = cur.getMinimum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, day);
		frDate = cur.getTime();

		mon = cur.getMaximum(Calendar.MONTH);
		cur.set(Calendar.MONTH, mon);
		day = cur.getMaximum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, day);
		tdate = cur.getTime();

	}

	private void setYear(int years) {
		Calendar cur = Calendar.getInstance();
		int year = cur.get(Calendar.YEAR);
		cur.set(Calendar.YEAR, year - years);
		frDate = cur.getTime();

		Calendar cur1 = Calendar.getInstance();
		tdate = cur1.getTime();

	}

	private void setMonth2Date() {
		Calendar cur = Calendar.getInstance();
		frDate = cur.getTime();
		int firstDay = cur.getMinimum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, firstDay);
		tdate = cur.getTime();
	}

	private void setQuarter2Date() {
		Calendar cur = Calendar.getInstance();
		tdate = cur.getTime();

		int mon = cur.get(Calendar.MONTH);
		int pivot = (int) (mon / 3);
		if (pivot == 0) {
			mon = 0;
		} else if (pivot == 1) {
			mon = 3;
		} else if (pivot == 2) {
			mon = 6;
		} else if (pivot == 3) {
			mon = 9;
		}

		cur.set(Calendar.MONTH, mon);
		int firstDay = cur.getMinimum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, firstDay);
		frDate = cur.getTime();
	}

	private void setYear2Date() {
		Calendar cur = Calendar.getInstance();
		tdate = cur.getTime();

		int mon = cur.getMinimum(Calendar.MONTH);
		cur.set(Calendar.MONTH, mon);
		int day = cur.getMinimum(Calendar.DAY_OF_MONTH);
		cur.set(Calendar.DAY_OF_MONTH, day);
		frDate = cur.getTime();

	}

	private void lastDays(int days) {
		Calendar cur = Calendar.getInstance();
		tdate = cur.getTime();
		cur.add(Calendar.DAY_OF_MONTH, -days);
		frDate = cur.getTime();
	}

	private void setWeek(int days) {
		Calendar cur = Calendar.getInstance();
		tdate = cur.getTime();
		cur.add(Calendar.DAY_OF_MONTH, -days);
		frDate = cur.getTime();
	}

	final public static String getSQL4Date(Date from, Date to) {
		String sql = "";
		String strFrom = "";
		String strTo = "";

		if (from != null) {
			strFrom = JProjectUtil.getDateFormaterCommon().format(from).concat(" " + "00:00:00");
		}
		if (to != null) {
			strTo = JProjectUtil.getDateFormaterCommon().format(to).concat(" " + "00:00:00");
		}

		if (from != null && to != null) {
			if (from.equals(to)) {
				strFrom = JProjectUtil.getDateFormaterCommon().format(from).concat(" " + "00:00:00");
				strTo = JProjectUtil.getDateFormaterCommon().format(to).concat(" " + "23:59:59");
			}
		}
		if (!strFrom.equals("") && !strTo.equals("")) {
			sql = " BETWEEN " + ConstValue.getTIMESTAMP_START() + "'" + strFrom + "'" + ConstValue.getTIMESTAMP_END()
					+ " AND " + ConstValue.getTIMESTAMP_START() + "'" + strTo + "'" + ConstValue.getTIMESTAMP_END();
		}
		return sql;
	}

//	@Override
//	public ArrayList<TblAccountCategory> getAccountCategoriesList() {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//		ArrayList<TblAccountCategory> categories = new ArrayList<>();
//		DefaultMutableTreeNode root = new DefaultMutableTreeNode("Account Category");
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("SELECT * FROM bca_acctcategory");
//			while (rs.next()) {
//				TblAccountCategory category = new TblAccountCategory();
//				category.setAccountCategoryID(rs.getInt("AcctCategoryID"));
//				category.setName(rs.getString("Name"));
//				/*
//				 * if (categoryname.equals("eSales")) {
//				 * //category.setName("Paid Imported Order"); }
//				 */
//				categories.add(category);
//			}
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
//		return categories;
//	}
	@Override
	public ArrayList<TblAccountCategory> getAccountCategoriesList() {

		ArrayList<TblAccountCategory> categories = new ArrayList<>();
		DefaultMutableTreeNode root = new DefaultMutableTreeNode("Account Category");
		try {
			List<BcaAcctcategory> acctcategory = bcaAcctcategoryRepository.findAll();
			for (BcaAcctcategory bca_acc_cat : acctcategory) {
				TblAccountCategory category = new TblAccountCategory();
				category.setAccountCategoryID(bca_acc_cat.getAcctCategoryId());
				category.setName(bca_acc_cat.getName());
				categories.add(category);
			}

		} catch (Exception e) {
			System.out.println(e);
			Loger.log(e.toString());
		}
		return categories;
	}

//	 @Override
//	public void loadBankAccounts() {
//		// TODO Auto-generated method stub
//
//		bankAccounts.clear();
//		bankAccounts.add(new TblAccount());
//
//		bankAccountsInFundTransfer.clear();
//		bankAccountsInFundTransfer.add(new TblAccount());
//
//		bankAccountswithCategory.clear();
//		bankAccountswithCategory.add(new TblAccount());
//
//		String sql2 = null;
//		String sql23 = null;
//
//		Connection con;
//		Statement stmt = null, stmt1 = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null, rs1 = null;
//
//		sql2 = "SELECT * " + " FROM bca_account " + " WHERE AcctTypeID = 2 " + " AND Active = 1 " + " AND CompanyID = "
//				+ ConstValue.companyId + " ORDER BY AcctCategoryID,Name ASC ";
//
//		sql23 = "SELECT * " + " FROM bca_account " + " WHERE AcctTypeID IN (2,-1) " + " AND Active = 1 "
//				+ " AND CompanyID = " + ConstValue.companyId + " ORDER BY AcctCategoryID,Name ASC ";
//
//		try {
//			stmt = con.createStatement();
//			stmt1 = con.createStatement();
//
//			rs = stmt.executeQuery(sql2);
//			rs1 = stmt1.executeQuery(sql23);
//			while (rs.next()) {
//				TblAccount account = new TblAccount();
//				account.setAccountID(rs.getInt("AccountID"));
//				account.setParentID(rs.getInt("ParentID"));
//				account.setName(rs.getString("Name"));
//				account.setAccountTypeID(rs.getInt("AcctTypeID"));
//				account.setAccountCategoryID(rs.getInt("AcctCategoryID"));
//				account.setCustomerStartingBalance(rs.getDouble("CustomerStartingBalance"));
//				account.setCustomerCurrentBalance(rs.getDouble("CustomerCurrentBalance"));
//				account.setFirstCheckNo(rs.getInt("FirstCheck"));
//				account.setIsCategory(rs.getBoolean("isCategory"));
//				account.setDepositPaymentID(rs.getInt("DepositPaymentID"));
//				account.setDateAdded(new Date(rs.getTimestamp("DateAdded").getTime()));
//				account.setDescription(rs.getString("Description"));
//				account.setLastCheckNo(rs.getInt("LastCheck"));
//				account.setIsitmainaccount(rs.getInt("MAINACCOUNT"));
//				// bankAccounts.add(account);
//				if (account.getAccountCategoryID() != 7) {
//					bankAccounts.add(account);
//				}
//				bankAccountsInFundTransfer.add(account);
//			}
//			while (rs1.next()) {
//				TblAccount account = new TblAccount();
//				account.setAccountID(rs1.getInt("AccountID"));
//				account.setParentID(rs1.getInt("ParentID"));
//				account.setName(rs1.getString("Name"));
//				account.setAccountTypeID(rs1.getInt("AcctTypeID"));
//				account.setAccountCategoryID(rs1.getInt("AcctCategoryID"));
//				account.setIsCategory(rs1.getBoolean("isCategory"));
//				account.setDateAdded(new Date(rs1.getTimestamp("DateAdded").getTime()));
//				account.setDescription(rs1.getString("Description"));
//				account.setCustomerStartingBalance(rs1.getDouble("CustomerStartingBalance"));
//				account.setCustomerCurrentBalance(rs1.getDouble("CustomerCurrentBalance"));
//				account.setDepositPaymentID(rs1.getInt("DepositPaymentID"));
//				bankAccountswithCategory.add(account);
//				if (account.isIsCategory()) {
//					bankAccountsInFundTransfer.add(account);
//				}
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
//
//	}

	@Override
	public void loadBankAccounts() {
		// TODO Auto-generated method stub

		bankAccounts.clear();
		bankAccounts.add(new TblAccount());

		bankAccountsInFundTransfer.clear();
		bankAccountsInFundTransfer.add(new TblAccount());

		bankAccountswithCategory.clear();
		bankAccountswithCategory.add(new TblAccount());

		try {

			Long companyId = new Long(ConstValue.companyId);
			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(companyId);
			List<BcaAccount> bcaAccounts1 = bcaAccountRepository
					.findBcaAccountByAcctTypeAndActiveAndCompanyID(bcaCompany);
			List<BcaAccount> bcaAccounts2 = bcaAccountRepository
					.getBcaAccountByAcctTypeAndActiveAndCompanyID(bcaCompany);
			for (BcaAccount bcaAccount : bcaAccounts1) {
				TblAccount account = new TblAccount();
				account.setAccountID(bcaAccount.getAccountId());
				account.setParentID(bcaAccount.getParentId());
				account.setName(bcaAccount.getName());
				account.setAccountTypeID(bcaAccount.getAcctType().getAcctTypeId());
				account.setAccountCategoryID(bcaAccount.getAcctCategory().getAcctCategoryId());
				account.setCustomerStartingBalance(bcaAccount.getCustomerStartingBalance());
				account.setCustomerCurrentBalance(bcaAccount.getCustomerCurrentBalance());
				account.setFirstCheckNo(bcaAccount.getFirstCheck());
				account.setIsCategory(bcaAccount.getIsCategory());
				account.setDepositPaymentID(bcaAccount.getDepositPaymentId());
				OffsetDateTime dateAdded = bcaAccount.getDateAdded();
				Timestamp valueOf = Timestamp.valueOf(dateAdded.atZoneSameInstant(ZoneOffset.UTC).toLocalDateTime());
				account.setDateAdded(new Date(valueOf.getTime()));
				account.setDescription(bcaAccount.getDescription());
				if (bcaAccount.getLastCheck() != null) {
					account.setLastCheckNo(bcaAccount.getLastCheck());
				}
				if (bcaAccount.getMainaccount() != null) {

					account.setIsitmainaccount(bcaAccount.getMainaccount().intValue());
				}

				if (account.getAccountCategoryID() != 7) {
					bankAccounts.add(account);
				}
				bankAccountsInFundTransfer.add(account);

			}
			for (BcaAccount bcaAccount : bcaAccounts2) {
				TblAccount account = new TblAccount();
				account.setAccountID(bcaAccount.getAccountId());
				account.setParentID(bcaAccount.getParentId());
				account.setName(bcaAccount.getName());
				account.setAccountTypeID(bcaAccount.getAcctType().getAcctTypeId());
				account.setAccountCategoryID(bcaAccount.getAcctCategory().getAcctCategoryId());
				account.setIsCategory(bcaAccount.getIsCategory());
				OffsetDateTime dateAdded = bcaAccount.getDateAdded();
				Timestamp valueOf = Timestamp.valueOf(dateAdded.atZoneSameInstant(ZoneOffset.UTC).toLocalDateTime());
				account.setDateAdded(new Date(valueOf.getTime()));
				account.setDescription(bcaAccount.getDescription());
				account.setCustomerStartingBalance(bcaAccount.getCustomerStartingBalance());
				account.setCustomerCurrentBalance(bcaAccount.getCustomerCurrentBalance());
				account.setDepositPaymentID(bcaAccount.getDepositPaymentId());

				bankAccountswithCategory.add(account);
				if (account.isIsCategory()) {
					bankAccountsInFundTransfer.add(account);
				}
			}

		} catch (Exception e) {
			System.out.println(e);
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}

	}

	@Override
	public ArrayList<TblAccount> getBankAccountsTreeForFundTransfer(ArrayList<TblAccountCategory> categoryList) {
		parent.clear();
		root.clear();
		parent.add(new TblAccount());
		for (TblAccountCategory category : categoryList) {
			/* parent.add(category); */
			root.add(category);
			searchBankAccountsChildforFundTransfer(category);
		}
		return parent;
	}

	private void searchBankAccountsChildforFundTransfer(final Object category) throws NullPointerException {

		if (category instanceof TblAccount) {
			TblAccount account = (TblAccount) category;
			ArrayList<TblAccount> accounts = getChildBankAccountsOfId(account.getAccountID(), true);
			for (TblAccount a : accounts) {
				parent.add(a);
				searchBankAccountsChildforFundTransfer(a);
			}

		} else if (category instanceof TblAccountCategory) {
			TblAccountCategory cat = (TblAccountCategory) category;
			ArrayList<TblAccount> accounts = getBankAccountsOfCategoryIdFundTransfer(cat.getAccountCategoryID());
			if (cat.getName().equalsIgnoreCase("Checking")) {
				TblAccount defaultBank = null;
				for (TblAccount acc : accounts) {
					if (acc.getName().equalsIgnoreCase("US State Bank")) {
						defaultBank = acc;
						break;
					}
				}
				if (defaultBank != null) {
					accounts.remove(defaultBank);
					accounts.add(0, defaultBank);
				}
			}
			for (TblAccount a : accounts) {
				parent.add(a);
				searchBankAccountsChildforFundTransfer(a);
			}

		}
	}

	private ArrayList<TblAccount> getChildBankAccountsOfId(int parentId, boolean check) {

		ArrayList<TblAccount> tempBankAccounts = new ArrayList<TblAccount>();
		if (check) {
			for (TblAccount account : bankAccountsInFundTransfer) {
				if (parentId == account.getParentID()) {
					tempBankAccounts.add(account);
				}
			}
		} else {
			for (TblAccount account : bankAccounts) {
				if (parentId == account.getParentID()) {
					tempBankAccounts.add(account);
				}
			}
		}
		return tempBankAccounts;
	}

	private ArrayList<TblAccount> getBankAccountsOfCategoryIdFundTransfer(int accountCategoryId) {
		ArrayList<TblAccount> tempBankAccounts = new ArrayList<TblAccount>();
		for (TblAccount bankAccount : bankAccountsInFundTransfer) { // bankAccounts
			if (accountCategoryId == bankAccount.getAccountCategoryID() && bankAccount.getParentID() <= 0) {
				if (bankAccount.getName().equals("Customer Deposit Account")) {
					/*
					 * if (tblbusinessmodulesLoader.chechFeatureExist("Upfront Deposit")) {
					 * tempBankAccounts.add(bankAccount); }
					 */
				} else {
					tempBankAccounts.add(bankAccount);
				}
			}
		}
		return tempBankAccounts;
	}

	@Override
	public ArrayList<TblPaymentDto> getPaymentsForBanking(TblAccount account, Date from, Date to, String transType,
			Boolean useFilter) {
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<TblPaymentDto> payments = new ArrayList<>();

		String trans = "";
		String dateAdded = "";
		String colDateAdded = "Date_Format(pay.DateAdded,'%Y-%m-%d')";

		if (transType.equals("ALLPAYMENTS")) {
			trans = " pay.PayerID=" + account.getAccountID();
		} else if (transType.equals("ALLDEPOSITE")) {
			trans = " pay.PayeeID = " + account.getAccountID();
		} else if (transType.equals("INVOICE")) {
			if (account.getAccountCategoryID() != 7) {
				trans = " pay.PayeeID =" + account.getAccountID() + " AND pay.InvoiceID > 0";
			}
		} else if (transType.equals("PURCHASE")) {
			trans = " pay.PayerID =" + account.getAccountID() + " AND pay.InvoiceID > 0 AND pay.RmaNo <= 0";
		} else {
			trans = " ( pay.PayerID =" + account.getAccountID() + " OR pay.PayeeID=" + account.getAccountID() + ")";
		}

		StringBuffer sql = new StringBuffer();
		sql.append(
				"SELECT *, pType.Name AS paymentTypeName , c.FirstName , c.LastName , c.Name AS companyName , cat.Name AS cName , payeeAccount.Name As payeeAccount");
		sql.append(
				", payerAccount.Name As payerAccount , cv.FirstName AS VendorFirstName , cv.LastName AS VendorLastName");
		sql.append(" FROM bca_payment AS pay");
		sql.append(" LEFT JOIN bca_paymenttype as pType ON pay.PaymentTypeID = pType.PaymentTypeID");
		sql.append(" LEFT JOIN bca_clientvendor AS c ON pay.ClientVendorID = c.ClientVendorID");
		sql.append(" LEFT JOIN bca_clientvendor AS cv ON pay.PayeeID = cv.ClientVendorID");
		sql.append(" LEFT JOIN bca_invoice as INV ON pay.InvoiceID = INV.InvoiceId");
		sql.append(" LEFT JOIN bca_category AS cat ON pay.CategoryID = cat.CategoryID");
		sql.append(" LEFT JOIN bca_account AS payeeAccount ON pay.PayeeID = payeeAccount.AccountID");
		sql.append(" LEFT JOIN bca_account AS payerAccount ON pay.PayerID = payerAccount.AccountID");
		sql.append(" WHERE");
		sql.append(trans);
		if (from != null && to != null) {
			Timestamp t = new Timestamp(to.getYear(), to.getMonth(), to.getDate(), 23, 00, 00, 0);
			dateAdded = " AND " + colDateAdded + " BETWEEN " + ConstValue.getTIMESTAMP_START() + "'"
					+ JProjectUtil.qbFormatter().format(from) + "'" + ConstValue.getTIMESTAMP_END() + " AND "
					+ ConstValue.getTIMESTAMP_START() + "'" + t + "'" + ConstValue.getTIMESTAMP_END();
		}
		/*
		 * if(!dataStr.equals("")){ dateAdded =
		 * " AND DATE_FORMAT(pay.DateAdded,'%Y-%m-%d')  " + dataStr; }
		 */
		sql.append(dateAdded);
		sql.append(" AND pay.CompanyID = " + ConstValue.companyId + " AND pay.DELETED<>1 AND c.Status IN ('U','N')");
		if (!transType.equals("INVOICE") && !transType.equals("PURCHASE") && !transType.equals("ALLDEPOSITE")) {
//			sql.append(
//					" OR ( ( pay.InvoiceID = -1 OR pay.ClientVendorID = -1 OR pay.CategoryID = -1) AND pay.Deleted =0");
			sql.append(
					" OR ( ( pay.InvoiceID is null OR pay.ClientVendorID is null OR pay.CategoryID is null) AND pay.Deleted =0");
			sql.append(dateAdded + ")");
		}
		sql.append(" GROUP BY pay.PaymentID");
		sql.append(" ORDER BY pay.Priority DESC");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				TblPaymentDto payment = new TblPaymentDto();
				payment.setId(rs.getInt("PaymentID"));
				payment.setAmount(rs.getDouble("Amount"));
				payment.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				payment.setPaymentTypeName(rs.getString("paymentTypeName"));
				payment.setPayerID(rs.getInt("PayerID"));
				payment.setPayeeID(rs.getInt("PayeeID"));
				payment.setAccountID(rs.getInt("AccountID"));
				payment.setCvID(rs.getInt("ClientVendorID"));
				payment.setInvoiceID(rs.getInt("InvoiceID"));
				payment.setCategoryId(rs.getInt("CategoryID"));
				payment.setAccountCategoryId(rs.getInt("AccountCategoryID"));
				payment.setCheckNumber(rs.getString("CheckNumber"));
				payment.setDeleted(rs.getBoolean("Deleted"));
				payment.setAcID(account.getAccountID());
				payment.setPayableID(rs.getInt("PayableID"));
				if (account.getAccountID() == payment.getPayerID()) {
					payment.setBalanceForBanking(rs.getDouble("PayFromBalance"));
				} else {
					payment.setBalanceForBanking(rs.getDouble("PayToBalance"));
				}
				if (account.getAccountID() == payment.getPayerID()) {
					payment.setFromCurrentBalance(payment.getAmount());
				} else {
					payment.setToCurrentBalance(payment.getAmount());
				}
				payment.setTransactionID(rs.getString("TransactionType"));
				payment.setBillNum(rs.getInt("BillNum"));

				try {
					payment.setDateAdded(new Date(rs.getTimestamp("DateAdded").getTime()));
				} catch (Exception e) {
					payment.setDateAdded(null);
				}
				payment.setToBePrinted(rs.getBoolean("IsToBePrinted"));
				payment.setNeedToDeposit(rs.getBoolean("isNeedtoDeposit"));
				payment.setCvName(rs.getString("FirstName") + " " + rs.getString("LastName") + "("
						+ rs.getString("CompanyName") + ")");
				if (payment.getCvName().equals("null null(null)")) {
					payment.setCvName(rs.getString("payeeAccount"));
				}
				if (payment.getCvName() == null) {
					payment.setCvName(rs.getString("VendorFirstName") + " " + rs.getString("VendorLastName"));
				}
				payment.setOrderNum(rs.getInt("OrderNum"));
				payment.setPoNum(rs.getInt("PONum"));
				payment.setCategoryName(rs.getString("cName") + " " + rs.getString("CateNumber"));
				payment.setPyerAccountForBanking(rs.getString("payerAccount"));
				payments.add(payment);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
		return payments;
	}

	@Override
	public int getPriority() {
		// TODO Auto-generated method stub
		int priority = 0;
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//
//		String sql = "SELECT MAX(Priority) FROM bca_payment";

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			if (rs.next()) {
//				priority = rs.getInt(1);
//			}

			Optional<Integer> opt = bcaPaymentRepository.findTopByOrderByPriorityDesc();
			if (opt.isPresent()) {
				priority = opt.get();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return priority;
	}

	@Override
	public ArrayList<TblPaymentType> getOnlySimplePaymentTypes() {
		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<TblPaymentType> types = new ArrayList<TblPaymentType>();
		types.add(new TblPaymentType());
//		String sql = "SELECT PaymentTypeID,Name,Type,BankAcctID,TypeCategory " + " FROM bca_paymenttype "
//				+ " WHERE CCTypeID = -1 AND Active = 1 AND TypeCategory = 0" + " AND CompanyID = "
//				+ ConstValue.companyId;

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);

//			while (rs.next()) {
//				TblPaymentType ptype = new TblPaymentType();
//				ptype.setId(rs.getInt("PaymentTypeID"));
//				ptype.setType(rs.getString("Type"));
//				ptype.setTypeName(rs.getString("Name"));
//				ptype.setBankAcctID(rs.getInt("BankAcctID"));
//				ptype.setTypeCategory(rs.getInt("TypeCategory"));
//				types.add(ptype);
//			}
			List<Object[]> paymentType = bcaPaymenttypeRepository
					.findOnlySimplePaymentTypes(new Long(ConstValue.companyId));
			for (Object[] bcaPaymenttype : paymentType) {
				TblPaymentType ptype = new TblPaymentType();
				ptype.setId((Integer) bcaPaymenttype[0]);
				ptype.setType((String) bcaPaymenttype[1]);
				ptype.setTypeName((String) bcaPaymenttype[2]);
				ptype.setBankAcctID((Integer) bcaPaymenttype[3]);
				ptype.setTypeCategory((Integer) bcaPaymenttype[4]);
				types.add(ptype);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return types;
	}

//	@Override
//	public int bankTransfer(TblPaymentDto payment, double amount, Date transferDate, int priority) {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//
//		int paymentId = -1;
//		double balance = 0.0;
//		double ToBalance = 0.0;
//		String TransactionID = "-1";
//
//		/*
//		 * if (fromAccount.getAccountTypeID() == 3) { balance = amount; } else {
//		 */
//		balance = payment.getFromBalance() - amount;
//		ToBalance = payment.getToBalance() + amount;
//		if (payment.getCategoryId() < -1 || payment.getCategoryId() > 1) {
//			payment.setAccountCategoryId(payment.getCategoryId());
//		}
//		/* } */
//

//
//
//		String sql = "INSERT INTO bca_payment(Amount,PaymentTypeID,PayerID,PayeeID,AccountID,ClientVendorID,InvoiceID,"
//				+ "CategoryID,AccountCategoryID,CompanyID,DateAdded,IsToBePrinted,isNeedtoDeposit,"
//				+ "PayFromBalance,PayToBalance,Priority,CheckNumber,TransactionID)" + " VALUES (" + amount + ","
//				+ payment.getPaymentTypeID() + ","
//				// "-1" + "," +//fromAccount.getAccountCategoryID()+","+
//				+ payment.getPayerID() + "," + payment.getPayeeID() + "," + payment.getAccountID() + "," + "-1," + "-1,"
//				+ payment.getAccountCategoryId() + "," + payment.getAccountCategoryId() + "," + ConstValue.companyId
//				+ "," + "'" + JProjectUtil.getDateFormaterCommon().format(transferDate) + "',0,0," + balance + ","
//				+ ToBalance + "," + (priority + 1) + ",'" + payment.getCheckNumber() + "','" + TransactionID + "')";
//		try {
////			BcaPayment bcaPayment =new BcaPayment();
////			bcaPayment.setAmount(amount);
////			bcaPayment.setPaymentType(null);
////			bcaPayment.setPayerId(payment.getPayerID());
////			bcaPayment.setPayeeId(payment.getPayeeID());
////			bcaPayment.setAccount(null);
////			bcaPayment.setClientVendor(null);
////			bcaPayment.setInvoice(null);
////			bcaPayment.setCategory(null);
////			bcaPayment.setAccountCategoryId(payment.getAccountCategoryId());
////			bcaPayment.setCompany(null);
////			bcaPayment.set();
////			
//			stmt = con.createStatement();
//			int count = stmt.executeUpdate(sql);
//			/*
//			 * adjustBankBalance(fromAccount, - amount);
//			 * adjustBankBalance(toAccount,amount);
//			 */
//
//			rs = stmt.executeQuery("SELECT MAX(PaymentID) AS LastID FROM bca_payment");
//			if (rs.next()) {
//				paymentId = rs.getInt("LastID");
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (rs != null)
//					db.close(rs);
//				if (stmt != null)
//					db.close(stmt);
//				if (con != null)
//					db.close(con);
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return paymentId;
//	}

	@Override
	public int bankTransfer(TblPaymentDto payment, double amount, Date transferDate, int priority) {
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;

		int paymentId = -1;
		double balance = 0.0;
		double ToBalance = 0.0;
		String TransactionID = "-1";

		/*
		 * if (fromAccount.getAccountTypeID() == 3) { balance = amount; } else {
		 */
		balance = payment.getFromBalance() - amount;
		ToBalance = payment.getToBalance() + amount;
		if (payment.getCategoryId() < -1 || payment.getCategoryId() > 1) {
			payment.setAccountCategoryId(payment.getCategoryId());
		}
		/* } */

		try {

			BcaPayment bcaPayment = new BcaPayment();
			bcaPayment.setAmount(amount);
			Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository.findById(payment.getPaymentTypeID());
			if (paymentType.isPresent())
				bcaPayment.setPaymentType(null);

			bcaPayment.setPayerId(payment.getPayerID());
			bcaPayment.setPayeeId(payment.getPayeeID());
			Optional<BcaAccount> bca_account = bcaAccountRepository.findById(payment.getAccountID());
			if (bca_account.isPresent())
				bcaPayment.setAccount(bca_account.get());
			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(-1);
			if (clientVendor.isPresent())
				bcaPayment.setClientVendor(clientVendor.get());
			Optional<BcaInvoice> invoice = bcaInvoiceRepository.findById(-1);
			if (invoice.isPresent())
				bcaPayment.setInvoice(invoice.get());
			Optional<BcaCategory> category = bcaCategoryRepository.findById(payment.getAccountCategoryId());
			if (category.isPresent())
				bcaPayment.setCategory(category.get());
			bcaPayment.setAccountCategoryId(payment.getAccountCategoryId());
			Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
			if (company.isPresent())
				bcaPayment.setCompany(company.get());
			String date = JProjectUtil.getDateFormaterCommon().format(transferDate);

			bcaPayment.setDateAdded(DateHelper.string2OffsetDateTime(date));

			bcaPayment.setIsToBePrinted(false);
			bcaPayment.setIsNeedtoDeposit(false);
			bcaPayment.setPayFromBalance(balance);
			bcaPayment.setPayToBalance(ToBalance);
			bcaPayment.setPriority((priority + 1));
			bcaPayment.setCheckNumber(payment.getCheckNumber());
			bcaPayment.setTransactionId(TransactionID);
			BcaPayment save = bcaPaymentRepository.save(bcaPayment);
			paymentId = save.getPaymentId();
//			stmt = con.createStatement();
//			int count = stmt.executeUpdate(sql);
			/*
			 * adjustBankBalance(fromAccount, - amount);
			 * adjustBankBalance(toAccount,amount);
			 */

//			rs = stmt.executeQuery("SELECT MAX(PaymentID) AS LastID FROM bca_payment");
//			if (rs.next()) {
//				paymentId = rs.getInt("LastID");
//			}
		} catch (Exception e) {
			e.printStackTrace();
			Loger.log(e.toString());
		}
		return paymentId;
	}

	@Override
	public void adjustBankForBanking(TblPaymentDto payment) {
		// TODO Auto-generated method stub
		TblAccount fromAccount = getAccountById(payment.getPayerID());
		TblAccount toAccount = getAccountById(payment.getPayeeID());

		try {
			adjustBankBalance(fromAccount, -payment.getAmount());
			adjustBankBalance(toAccount, payment.getAmount());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}

	}

	@Override
	public ArrayList<ClientVendor> getAllClientVendorList() {
		// TODO Auto-generated method stub
		ArrayList<ClientVendor> cvList = new ArrayList<ClientVendor>();

//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;

		/*
		 * String sql = "SELECT Name,FirstName,LastName,ClientVendorID" +
		 * " FROM bca_clientvendor" + " WHERE CompanyID = " + ConstValue.companyId +
		 * " AND Status IN ('U', 'N' ) " + " AND (Deleted = 0 OR Active = 1) " +
		 * " AND CVTypeID IN (" + getCustomerTypeId(ConstValue.VENDOR) + "," +
		 * getCustomerTypeId(ConstValue.BILL_VENDOR) + "," +
		 * getCustomerTypeId(ConstValue.CustVenBoth) + "," +
		 * getCustomerTypeId(ConstValue.DealerVenBoth) + ")" + " AND CVTypeID IN (" +
		 * getCustomerTypeId(ConstValue.VENDOR) + "," +
		 * getCustomerTypeId(ConstValue.CustVenBoth) + "," +
		 * getCustomerTypeId(ConstValue.DealerVenBoth) + ")" + " ORDER BY Name";
		 */
//		String sql = "SELECT Name,FirstName,LastName,ClientVendorID FROM bca_clientvendor WHERE CompanyID = "
//				+ ConstValue.companyId + " AND Status IN ('U', 'N' )  AND (Deleted = 0 OR Active = 1) AND CVTypeID IN ("
//				+ getCustomerTypeId(ConstValue.VENDOR) + "," + getCustomerTypeId(ConstValue.CustVenBoth) + ","
//				+ getCustomerTypeId(ConstValue.DealerVenBoth) + ") ORDER BY Name";
		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				ClientVendor clientVendor = new ClientVendor();
//				String name = rs.getString("Name");
//				clientVendor.setName(name.equals("") ? name : name.trim());
//				clientVendor.setFirstName(rs.getString("FirstName").trim());
//				clientVendor.setLastName(rs.getString("LastName").trim());
//				clientVendor.setCvID(rs.getInt("ClientVendorID"));
//				cvList.add(clientVendor);
//			}
			List<Object[]> bcaclientVendor = bcaClientvendorRepository.findAllClientVendorList(
					new Long(ConstValue.companyId), getCustomerTypeId(ConstValue.VENDOR),
					getCustomerTypeId(ConstValue.CustVenBoth), getCustomerTypeId(ConstValue.DealerVenBoth));
			for (Object[] obj : bcaclientVendor) {
				ClientVendor clientVendor = new ClientVendor();
				String name = (String) obj[0];
				clientVendor.setName(name.equals("") ? name : name.trim());
				clientVendor.setFirstName(((String) obj[1]).trim());
				clientVendor.setLastName(((String) obj[2]).trim());
				clientVendor.setCvID((Integer) obj[3]);
				cvList.add(clientVendor);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return cvList;

	}

	@Override
	public ArrayList<TblCategoryDto> getCategoryListForPayment() {
		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<TblCategoryDto> categoryList = new ArrayList<TblCategoryDto>();

//		String sql = "SELECT * from bca_category where CompanyID=" + ConstValue.companyId
//				+ " AND CategoryTypeID IN (1841648525) AND isActive = 1 ORDER BY Name ASC";

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaCategory> bcaCategories = bcaCategoryRepository
					.findByCompany_CompanyIdAndIsActiveAndCategoryTypeIdOrderByNameAsc(new Long(ConstValue.companyId),
							true, 1841648525);
			for (BcaCategory bcaCategory : bcaCategories) {
				TblCategoryDto category = new TblCategoryDto();
				category.setId(bcaCategory.getCategoryId());
				category.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				category.setParent(bcaCategory.getParent());
				category.setDescription(bcaCategory.getDescription());
				category.setName(bcaCategory.getName());
				category.setCategoryNumber(bcaCategory.getCateNumber());
				category.setBudgetCategoryID(bcaCategory.getBudgetCategoryId());

				categoryList.add(category);
			}

//			while (rs.next()) {
//				TblCategoryDto category = new TblCategoryDto();
//				category.setId(rs.getInt("CategoryID"));
//				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				category.setParent(rs.getString("Parent"));
//				category.setDescription(rs.getString("Description"));
//				category.setName(rs.getString("Name"));
//				category.setCategoryNumber(rs.getString("CateNumber"));
//				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
//
//				categoryList.add(category);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return categoryList;
	}

	@Override
	public ArrayList<TblAccount> getCustomerCurrentBalanceForvendor(ArrayList<ClientVendor> cvList) {
		// TODO Auto-generated method stub
		ArrayList<TblAccount> account = new ArrayList<TblAccount>();

		for (ClientVendor cv : cvList) {

			TblAccount accountForCv = getAccountForPayer(cv.getCvID(), ConstValue.companyId);
			account.add(accountForCv);

		}

		return account;

	}

	@Override
	public void adjustBankBalanceForVendor(TblPaymentDto payment) {
		// TODO Auto-generated method stub

		TblAccount fromAccount = getAccountById(payment.getPayerID());
		TblAccount toAccount = getAccountForPayer(payment.getPayeeID(), ConstValue.companyId);

		try {
			adjustBankBalance(fromAccount, -payment.getAmount());
			adjustBankBalance(toAccount, payment.getAmount());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}

	@Override
	public ArrayList<ClientVendor> getClientForDeposit() {
		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<ClientVendor> clientList = new ArrayList<ClientVendor>();

//		String sql = "SELECT Name,FirstName,LastName,ClientVendorID" + " FROM bca_clientvendor" + " WHERE CompanyID = "
//				+ ConstValue.companyId + " AND Status IN ('U', 'N' ) " + " AND (Deleted = 0 OR Active = 1) "
//				+ " AND CVTypeID IN (" + getCustomerTypeId(ConstValue.CUSTOMER) + ","
//				+ getCustomerTypeId(ConstValue.CustVenBoth) + "," + getCustomerTypeId(ConstValue.DEALER) + ")"
//				+ " ORDER BY Name ";

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);

//			while (rs.next()) {
//				ClientVendor clientVendor = new ClientVendor();
//				String name = rs.getString("Name");
//				clientVendor.setName(name.equals("") ? name : name.trim());
//				clientVendor.setFirstName(rs.getString("FirstName").trim());
//				clientVendor.setLastName(rs.getString("LastName").trim());
//				clientVendor.setCvID(rs.getInt("ClientVendorID"));
//				clientList.add(clientVendor);
//			}

			List<Object[]> bcaclientVendor = bcaClientvendorRepository.findAllClientVendorList(
					new Long(ConstValue.companyId), getCustomerTypeId(ConstValue.CUSTOMER),
					getCustomerTypeId(ConstValue.CustVenBoth), getCustomerTypeId(ConstValue.DEALER));
			for (Object[] obj : bcaclientVendor) {
				ClientVendor clientVendor = new ClientVendor();
				String name = (String) obj[0];
				clientVendor.setName(name.equals("") ? name : name.trim());
				clientVendor.setFirstName(((String) obj[1]).trim());
				clientVendor.setLastName(((String) obj[2]).trim());
				clientVendor.setCvID((Integer) obj[3]);
				clientList.add(clientVendor);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return clientList;
	}

	@Override
	public ArrayList<TblCategoryDto> getCategoryListForDeposit() {
		// TODO Auto-generated method stub

//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<TblCategoryDto> categoryList = new ArrayList<TblCategoryDto>();
//
//		String sql = "SELECT * from bca_category where CompanyID=" + ConstValue.companyId
//				+ " AND CategoryTypeID IN (1973117447) AND isActive = 1 ORDER BY Name ASC";

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				TblCategoryDto category = new TblCategoryDto();
//				category.setId(rs.getInt("CategoryID"));
//				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				category.setParent(rs.getString("Parent"));
//				category.setDescription(rs.getString("Description"));
//				category.setName(rs.getString("Name"));
//				category.setCategoryNumber(rs.getString("CateNumber"));
//				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
//
//				categoryList.add(category);
//			}
//			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaCategory> bcaCategories = bcaCategoryRepository
					.findByCompany_CompanyIdAndIsActiveAndCategoryTypeIdOrderByNameAsc(new Long(ConstValue.companyId),
							true, 1973117447);
			for (BcaCategory bcaCategory : bcaCategories) {
				TblCategoryDto category = new TblCategoryDto();
				category.setId(bcaCategory.getCategoryId());
				category.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				category.setParent(bcaCategory.getParent());
				category.setDescription(bcaCategory.getDescription());
				category.setName(bcaCategory.getName());
				category.setCategoryNumber(bcaCategory.getCateNumber());
				category.setBudgetCategoryID(bcaCategory.getBudgetCategoryId());

				categoryList.add(category);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return categoryList;
	}

//	@Override
//	public int bankTransferFromDeposit(TblPaymentDto payment, double amount, Date transferDate, int priority) {
//		// TODO Auto-generated method stub
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//
//		int paymentId = -1;
//		double balance = 0.0;
//		double ToBalance = 0.0;
//		String TransactionID = "-1";
//
//		if (payment.getAccountTypeId() == 3) {
//			balance = amount;
//			ToBalance = payment.getToBalance() + amount;
//		} else {
//			balance = payment.getFromBalance() + amount;
//			ToBalance = balance;
//		}
//		if (payment.getCategoryId() < -1 || payment.getCategoryId() > 1) {
//			payment.setAccountCategoryId(payment.getCategoryId());
//		}
//
//		/* } */
//
//		String sql = "INSERT INTO bca_payment(Amount,"
//				+ "PaymentTypeID,PayerID,PayeeID,AccountID,ClientVendorID,InvoiceID,"
//				+ "CategoryID,AccountCategoryID,CompanyID,DateAdded," + "IsToBePrinted,isNeedtoDeposit,"
//				+ "PayFromBalance,PayToBalance,Priority,CheckNumber,TransactionID) VALUES (" + amount + ","
//				+ payment.getPaymentTypeID() + ","
//				// "-1" + "," +//fromAccount.getAccountCategoryID()+","+
//				+ payment.getPayerID() + "," + payment.getPayeeID() + "," + payment.getPayerID() + "," + "-1" + ","
//				+ "-1" + "," + payment.getAccountCategoryId() + "," + payment.getAccountCategoryId() + ","
//				+ ConstValue.companyId + "," + "'" + JProjectUtil.getDateFormaterCommon().format(transferDate) + "'"
//				+ "," + "0" + "," /* true/false is not supported in derby */
//				+ "0" + "," + balance + "," + ToBalance + "," + (priority + 1) + "," + "'" + payment.getCheckNumber()
//				+ "'" + ",'" + TransactionID + "')";
//		try {
//
//			stmt = con.createStatement();
//			int count = stmt.executeUpdate(sql);
//			/*
//			 * adjustBankBalance(fromAccount, - amount);
//			 * adjustBankBalance(toAccount,amount);
//			 */
//
//			rs = stmt.executeQuery("SELECT MAX(PaymentID) AS LastID FROM bca_payment");
//
//			if (rs.next()) {
//				paymentId = rs.getInt("LastID");
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
//		return paymentId;
//
//	}
	@Override
	public int bankTransferFromDeposit(TblPaymentDto payment, double amount, Date transferDate, int priority) {
		// TODO Auto-generated method stub

		int paymentId = -1;
		double balance = 0.0;
		double ToBalance = 0.0;
		String TransactionID = "-1";

		if (payment.getAccountTypeId() == 3) {
			balance = amount;
			ToBalance = payment.getToBalance() + amount;
		} else {
			balance = payment.getFromBalance() + amount;
			ToBalance = balance;
		}
		if (payment.getCategoryId() < -1 || payment.getCategoryId() > 1) {
			payment.setAccountCategoryId(payment.getCategoryId());
		}
		try {
			BcaPayment bcaPayment = new BcaPayment();
			bcaPayment.setAmount(amount);
			Optional<BcaPaymenttype> paymentType = bcaPaymenttypeRepository.findById(payment.getPaymentTypeID());
			if (paymentType.isPresent())
				bcaPayment.setPaymentType(paymentType.get());

			bcaPayment.setPayerId(payment.getPayerID());
			bcaPayment.setPayeeId(payment.getPayeeID());
			Optional<BcaAccount> bca_account = bcaAccountRepository.findById(payment.getPayerID());
			if (bca_account.isPresent())
				bcaPayment.setAccount(bca_account.get());
			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(-1);
			if (clientVendor.isPresent())
				bcaPayment.setClientVendor(clientVendor.get());
			Optional<BcaInvoice> invoice = bcaInvoiceRepository.findById(-1);
			if (invoice.isPresent())
				bcaPayment.setInvoice(invoice.get());
			Optional<BcaCategory> category = bcaCategoryRepository.findById(payment.getAccountCategoryId());
			if (category.isPresent())
				bcaPayment.setCategory(category.get());
			bcaPayment.setAccountCategoryId(payment.getAccountCategoryId());
			Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
			if (company.isPresent())
				bcaPayment.setCompany(company.get());
			String date = JProjectUtil.getDateFormaterCommon().format(transferDate);

			bcaPayment.setDateAdded(DateHelper.string2OffsetDateTime(date));

			bcaPayment.setIsToBePrinted(false);
			bcaPayment.setIsNeedtoDeposit(false);
			bcaPayment.setPayFromBalance(balance);
			bcaPayment.setPayToBalance(ToBalance);
			bcaPayment.setPriority((priority + 1));
			bcaPayment.setCheckNumber(payment.getCheckNumber());
			bcaPayment.setTransactionId(TransactionID);
			BcaPayment save = bcaPaymentRepository.save(bcaPayment);
			paymentId = save.getPaymentId();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
		return paymentId;

	}

	@Override
	public void adjustBankAfterDeposit(TblPaymentDto payment) {
		// TODO Auto-generated method stub
		TblAccount toAccount = getAccountById(payment.getPayeeID());

		try {
			adjustBankBalance(toAccount, payment.getAmount());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}

//	@Override
//	public ArrayList<ClientVendor> getAllClientVendor() {
//		// TODO Auto-generated method stub
//		ArrayList<ClientVendor> allClientvendor = new ArrayList<ClientVendor>();
//
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//
//		String sql = "SELECT * FROM bca_clientvendor WHERE CompanyId=" + ConstValue.companyId
//				+ " AND Status IN ('U','N') AND Active = 1";
//
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				ClientVendor clientVendor = new ClientVendor();
//				String name = rs.getString("Name");
//				clientVendor.setName(name.equals("") ? name : name.trim());
//				clientVendor.setFirstName(rs.getString("FirstName").trim());
//				clientVendor.setLastName(rs.getString("LastName").trim());
//				clientVendor.setCvID(rs.getInt("ClientVendorID"));
//				allClientvendor.add(clientVendor);
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
//		return allClientvendor;
//	}
	@Override
	public ArrayList<ClientVendor> getAllClientVendor() {
		// TODO Auto-generated method stub
		ArrayList<ClientVendor> allClientvendor = new ArrayList<ClientVendor>();
		try {
//			BcaCompany company = bcaCompanyRepository.getOne(new Long(ConstValue.companyId));
			List<BcaClientvendor> bcaClientvendors = bcaClientvendorRepository
					.findListOfClientVendorDetails(new Long(ConstValue.companyId));
			for (BcaClientvendor bcaClientvendor : bcaClientvendors) {
				ClientVendor clientVendor = new ClientVendor();

				String name = bcaClientvendor.getName();

				clientVendor.setName(name.equals("") ? name : name.trim());
				clientVendor.setFirstName(bcaClientvendor.getFirstName().trim());
				clientVendor.setLastName(bcaClientvendor.getLastName().trim());
				clientVendor.setCvID(bcaClientvendor.getClientVendorId());
				allClientvendor.add(clientVendor);
			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return allClientvendor;

	}

//	@Override
//	public ArrayList<TblCategoryDto> getAllCategory() {
//		// TODO Auto-generated method stub
//		ArrayList<TblCategoryDto> allCategory = new ArrayList<TblCategoryDto>();
//
//		Connection con;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//
//		String sql = "SELECT * FROM bca_category WHERE CompanyID=" + ConstValue.companyId + " AND isActive = 1";
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				TblCategoryDto category = new TblCategoryDto();
//				category.setId(rs.getInt("CategoryID"));
//				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				category.setParent(rs.getString("Parent"));
//				category.setDescription(rs.getString("Description"));
//				category.setName(rs.getString("Name"));
//				category.setCategoryNumber(rs.getString("CateNumber"));
//				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
//				allCategory.add(category);
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
//		return allCategory;
//	}

	@Override
	public ArrayList<TblCategoryDto> getAllCategory() {

		ArrayList<TblCategoryDto> allCategory = new ArrayList<TblCategoryDto>();
		try {
//			BcaCompany bcaCompany = bcaCompanyRepository.getOne(new Long(ConstValue.companyId));
			List<BcaCategory> bcaCategories = bcaCategoryRepository
					.findByCompany_CompanyIdAndIsActive(new Long(ConstValue.companyId), true);

			for (BcaCategory rs : bcaCategories) {
				TblCategoryDto category = new TblCategoryDto();
				category.setId(rs.getCategoryId());
				category.setCategoryTypeID(rs.getCategoryTypeId());
				category.setParent(rs.getParent());
				category.setDescription(rs.getDescription());
				category.setName(rs.getName());
				category.setCategoryNumber(rs.getCateNumber());
				category.setBudgetCategoryID(rs.getBudgetCategoryId());
				allCategory.add(category);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
		return allCategory;
	}

//	@Override
//	public ArrayList<TblPaymentType> getAllPaymentList() {
//		// TODO Auto-generated method stub
//
//		ArrayList<TblPaymentType> allPayment = new ArrayList<TblPaymentType>();
//
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//
//		String sql = "SELECT * FROM bca_paymenttype WHERE CompanyID = " + ConstValue.companyId;
//
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				TblPaymentType tbt = new TblPaymentType();
//				tbt.setId(rs.getInt("PaymentTypeID"));
//				tbt.setTypeName(rs.getString("Name"));
//				tbt.setType(rs.getString("Type"));
//				tbt.setCctype_id(rs.getInt("CCTypeID"));
//				tbt.setActive(rs.getBoolean("Active"));
//				tbt.setBankAcctID(rs.getInt("BankAcctID"));
//				tbt.setTypeCategory(rs.getInt("TypeCategory"));
//
//				allPayment.add(tbt);
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
//		return allPayment;
//	}

	@Override
	public ArrayList<TblPaymentType> getAllPaymentList() {
		// TODO Auto-generated method stub

		ArrayList<TblPaymentType> allPayment = new ArrayList<TblPaymentType>();

		try {
//			BcaCompany bcaCompany = bcaCompanyRepository.getOne(new Long(ConstValue.companyId));
			List<BcaPaymenttype> bcaPayment = bcaPaymenttypeRepository
					.findByCompany_CompanyId(new Long(ConstValue.companyId));
			for (BcaPaymenttype rs : bcaPayment) {
				TblPaymentType tbt = new TblPaymentType();
				tbt.setId(rs.getPaymentTypeId());
				tbt.setTypeName(rs.getName());
				tbt.setType(rs.getType());
				tbt.setCctype_id(rs.getCctype().getCctypeId());
				boolean active = rs.getActive() > 0 ? true : false;
				tbt.setActive(active);
				tbt.setBankAcctID(rs.getBankAcctId());
				tbt.setTypeCategory(rs.getTypeCategory());
				allPayment.add(tbt);

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
		return allPayment;
	}

	@Override
	public void addAccount(TblPaymentDto payment, int priority, String status, int AccountId) {
		int bankID = 0;
		priorityForAddBank = priority;
		statusForAddBank = status;
		TblAccount accountInfo = getAccountInfo(payment);
		if (accountInfo != null) {
			if (statusForAddBank.equals("Save")) {
				try {
					bankID = insertBankAccountmodified(accountInfo, payment.getAccountCategoryId(), payment);
					if (accountInfo.getIsitmainaccount() == 1) {
						updatedefaultbank(bankID);
					}
				} catch (Exception e) {
					e.printStackTrace();
					Loger.log(e.toString());
				}
			} else {
				editBankAccmodified(accountInfo, AccountId);
				if (accountInfo.getIsitmainaccount() == 1) {
					updatedefaultbank(bankID);
				}
			}
		}
	}

//	public void editBankAccmodified(TblAccount newAccount, int accountId) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//
//		String sql = "UPDATE bca_account SET " + " Name =" + "'" + newAccount.getName().replaceAll("'", "''") + "'"
//				+ "," + " MAINACCOUNT=" + newAccount.getIsitmainaccount() + " WHERE AccountID = " + accountId
//				+ " AND CompanyID = " + ConstValue.companyId;
//		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
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
//	}
	public void editBankAccmodified(TblAccount newAccount, int accountId) {

//		String sql = "UPDATE bca_account SET " + " Name =" + "'" + newAccount.getName().replaceAll("'", "''") + "'"
//				+ "," + " MAINACCOUNT=" + newAccount.getIsitmainaccount() + " WHERE AccountID = " + accountId
//				+ " AND CompanyID = " + ConstValue.companyId;
		try {
			BcaAccount account = bcaAccountRepository
					.findByAccountIdAndCompany_CompanyId(accountId, new Long(ConstValue.companyId)).orElse(null);
			if (null != account) {
				account.setName(newAccount.getName().replaceAll("'", "''"));
				account.setMainaccount(new BigDecimal(newAccount.getIsitmainaccount()));
				bcaAccountRepository.save(account);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}

//	public void updatedefaultbank(int accountId) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//		try {
//			String sql = " UPDATE bca_preference SET DefaultBankTransferAccID=" + accountId + " WHERE companyid="
//					+ ConstValue.companyId;
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql);
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
//	}
	public void updatedefaultbank(int accountId) {

		try {
			Optional<BcaPreference> preference = bcaPreferenceRepository
					.findByCompany_CompanyId(new Long(ConstValue.companyId));
			if (preference.isPresent()) {
				BcaPreference bcaPreference = preference.get();
				bcaPreference.setDefaultBankTransferAccId(accountId);
				bcaPreferenceRepository.save(bcaPreference);
			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}
	}

	public int saveAccountCategory(TblPaymentDto paymentDto, String status) {
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
		int rowUpdated = 0;
		try {
			if (status.equalsIgnoreCase("Save")) {
//				String sql = " INSERT INTO bca_acctcategory (Name) VALUES ('" + paymentDto.getCategoryName() + "')";
//				stmt = con.createStatement();
//				rowUpdated = stmt.executeUpdate(sql);
				BcaAcctcategory acctcategory = new BcaAcctcategory();
				acctcategory.setName(paymentDto.getCategoryName());
				BcaAcctcategory save = bcaAcctcategoryRepository.save(acctcategory);
				rowUpdated = null != save ? 1 : 0;
			} else {
//				String sql = " UPDATE bca_acctcategory SET Name='" + paymentDto.getCategoryName()
//						+ "' WHERE AcctCategoryID=" + paymentDto.getAccountCategoryId();
//				stmt = con.createStatement();
//				rowUpdated = stmt.executeUpdate(sql);
				Optional<BcaAcctcategory> acctcategory = bcaAcctcategoryRepository
						.findById(paymentDto.getAccountCategoryId());
				if (acctcategory.isPresent()) {
					BcaAcctcategory acctcat = acctcategory.get();
					acctcat.setName(paymentDto.getCategoryName());
					BcaAcctcategory save = bcaAcctcategoryRepository.save(acctcat);
					rowUpdated = null != save ? 1 : 0;
				}

			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}
//		finally {
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
		return rowUpdated;
	}

	public int insertBankAccountmodified(TblAccount account, int depositFrom, TblPaymentDto payment) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

		int accountId = -1;

//		String sql = " INSERT INTO bca_account (ParentID,isCategory,Name,Description,AcctTypeID,AcctCategoryID,CompanyID,"
//				+ "ClientVendorID,DepositPaymentID,CustomerStartingBalance,CustomerCurrentBalance,VendorStartingBalance,"
//				+ "VendorCurrentBalance,Active,DateAdded,FirstCheck,MAINACCOUNT) VALUES (" + account.getParentID() + ","
//				+ (account.isIsCategory() == true ? 1 : 0) + "," + "'" + account.getName().replaceAll("'", "''") + "'"
//				+ "," + "'" + account.getDescription().replaceAll("'", "''") + "'" + "," + account.getAccountTypeID()
//				+ "," + account.getAccountCategoryID() + "," + ConstValue.companyId + "," + account.getCvID() + ","
//				+ account.getDepositPaymentID() + "," + // -1 as default
//				account.getCustomerStartingBalance() + "," + account.getCustomerCurrentBalance() + ","
//				+ account.getVendorStartingBalance() + "," + account.getVendorCurrentBalance() + "," + "1" + "," + "'"
//				+ JProjectUtil.dateTimeFormatLong.format(account.getDateAdded()) + "'" + "," + account.getFirstCheckNo()
//				+ "," + account.getIsitmainaccount() + ")";

		BcaAccount bcaAccount = new BcaAccount();
		bcaAccount.setParentId(account.getParentID());
		bcaAccount.setIsCategory(account.isIsCategory());
		bcaAccount.setName(account.getName().replaceAll("'", "''"));
		bcaAccount.setDescription(account.getDescription().replaceAll("'", "''"));
		Optional<BcaAccttype> accttype = bcaAccttypeRepository.findById(account.getAccountTypeID());
		if (accttype.isPresent())
			bcaAccount.setAcctType(accttype.get());
		Optional<BcaAcctcategory> acctcategory = bcaAcctcategoryRepository.findById(account.getAccountCategoryID());
		if (acctcategory.isPresent())
			bcaAccount.setAcctCategory(acctcategory.get());

		Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
		if (company.isPresent())
			bcaAccount.setCompany(company.get());

		Optional<BcaClientvendor> bcaClientvendor = bcaClientvendorRepository.findById(account.getCvID());
		if (bcaClientvendor.isPresent())
			bcaAccount.setClientVendor(bcaClientvendor.get());
		bcaAccount.setDepositPaymentId(account.getDepositPaymentID());
		bcaAccount.setCustomerStartingBalance(account.getCustomerStartingBalance());
		bcaAccount.setCustomerCurrentBalance(account.getCustomerCurrentBalance());
		bcaAccount.setVendorStartingBalance(account.getVendorStartingBalance());
		bcaAccount.setVendorCurrentBalance(account.getVendorCurrentBalance());
		bcaAccount.setActive(1);
		String format = JProjectUtil.dateTimeFormatLong.format(account.getDateAdded());
		// Define the format of the input string
		// Define the format of the input string
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		try {
			// Parse the string to create a LocalDateTime
			LocalDateTime localDateTime = LocalDateTime.parse(format, formatter);

			// Assume a specific offset, for example, UTC+0
			ZoneOffset offset = ZoneOffset.UTC;

			// Convert LocalDateTime to OffsetDateTime
			OffsetDateTime offsetDateTime = OffsetDateTime.of(localDateTime, offset);

			// Output the result
			System.out.println("Parsed OffsetDateTime: " + offsetDateTime);
			bcaAccount.setDateAdded(offsetDateTime);
		} catch (Exception e) {
			// Handle parsing exception
			System.err.println("Error parsing date: " + e.getMessage());
		}
		bcaAccount.setFirstCheck(account.getFirstCheckNo());
		bcaAccount.setMainaccount(BigDecimal.valueOf(account.getIsitmainaccount()));

		BcaAccount bca_account = bcaAccountRepository.save(bcaAccount);

//		stmt = con.createStatement();
//		stmt.executeUpdate(sql);
		accountId = bca_account.getAccountId();
		// accountId = bcaAccountRepository.findMaxAccountIdByCompany(company.get());

//		rs = stmt.executeQuery(
//				"SELECT Max(AccountID) AS LastID from bca_account where companyid=" + ConstValue.companyId);
//		if (rs.next()) {
//			accountId = rs.getInt("LastID");
//		}
		account.setAccountID(accountId);
		int depositFromId = payment.getAccountID() == -1 ? -1 : payment.getAccountID();
		int cateoryID = (depositFromId == -1 ? -7 : -9);

		TblPaymentDto pay = new TblPaymentDto();
		pay.setAmount(account.getCustomerStartingBalance());
		pay.setPaymentTypeID(account.getAccountCategoryID());
		pay.setPayerID(depositFromId);
		pay.setPayeeID(accountId);
		pay.setAccountID(accountId);
		pay.setCvID(account.getCvID());
		pay.setToBePrinted(false);
		pay.setNeedToDeposit(false);
		pay.setDateAdded(account.getDateAdded());
		pay.setCategoryId(cateoryID);

		TblCategoryDto category = getCategory("Bank Deposit");

		pay.setAccountCategoryId((int) category.getId());
		int paymentId = addBankTransaction(pay);

		/*
		 * stmt.executeUpdate(" UPDATE bca_account SET DepositPaymentID=" + paymentId +
		 * " WHERE AccountID=" + accountId );
		 */
		pay.setAcID(paymentId);
		updatebcaAccount(paymentId, accountId);
		updateBankBalance(pay);

		return accountId;

	}

//	public void updatebcaAccount(int paymentId, int accountId) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//
//		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(
//					" UPDATE bca_account SET DepositPaymentID=" + paymentId + " WHERE AccountID=" + accountId);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
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
//	}
	public void updatebcaAccount(int paymentId, int accountId) {

		try {
			Optional<BcaAccount> bcaAccount = bcaAccountRepository.findById(accountId);
			if (bcaAccount.isPresent()) {
				BcaAccount account = bcaAccount.get();
				account.setDepositPaymentId(paymentId);
				bcaAccountRepository.save(account);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}
//
//	public void updateBankBalance(TblPaymentDto payment) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//		double payFromBalance = 0.0;
//
//		String sql_getPayee = "SELECT CustomerCurrentBalance FROM bca_account " + " WHERE AccountID = "
//				+ payment.getPayerID() + " AND CompanyID = " + ConstValue.companyId;
//
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql_getPayee);
//
//			if (rs.next()) {
//				payFromBalance = rs.getDouble("CustomerCurrentBalance");
//			}
//
//			String sql_put = "UPDATE bca_payment SET PayToBalance=" + (payment.getAmount()) + " ,PayFromBalance="
//					+ payFromBalance + " WHERE PaymentID = " + payment.getAcID();
//
//			stmt.executeUpdate(sql_put);
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
//	}

	public void updateBankBalance(TblPaymentDto payment) {

		double payFromBalance = 0.0;

		try {
			Optional<BcaAccount> account = bcaAccountRepository
					.findByAccountIdAndCompany_CompanyId(payment.getPayerID(), new Long(ConstValue.companyId));
			if (account.isPresent()) {
				payFromBalance = account.get().getCustomerCurrentBalance();
			}
			Optional<BcaPayment> bcapayment = bcaPaymentRepository.findById(payment.getAcID());
			if (bcapayment.isPresent()) {
				BcaPayment bca_payment = bcapayment.get();
				bca_payment.setPayFromBalance(payFromBalance);
				bca_payment.setPayToBalance(payment.getAmount());
				bcaPaymentRepository.save(bca_payment);

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}

	public int addBankTransaction(TblPaymentDto payment) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

		int paymentId = -1;
		double payFromBalance = 0.00;
		double payToBalance = 0.00;
		try {
			TblAccount fromAccount = getAccount(payment.getPayerID());

			if (fromAccount != null) {
				try {
					adjustBankBalance(fromAccount, -payment.getAmount());
					payFromBalance = (fromAccount.getCustomerCurrentBalance());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					Loger.log(e.toString());
				}

			}
			TblAccount toAccount = getAccount(payment.getPayeeID());
			if (toAccount != null) {
				try {
					adjustBankBalance(toAccount, payment.getAmount());
					payToBalance = (toAccount.getVendorCurrentBalance());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					Loger.log(e.toString());
				}
			}
			if (fromAccount != null && fromAccount.getAccountTypeID() == 2) {
				payToBalance = 0.0;
			}
			if (toAccount != null && toAccount.getAccountTypeID() == 2) {
				toAccount = getAccount(payment.getPayeeID());
				payToBalance = toAccount.getCustomerCurrentBalance();
				payFromBalance = 0.0;
			}

			/* int priority = getPriority() + 1; */

			/*
			 * String sql = "INSERT INTO bca_payment(Amount,PaymentTypeID,PayerID," +
			 * "PayeeID,AccountID," + "ClientVendorID,InvoiceID," +
			 * "CategoryID,AccountCategoryID,CompanyID,DateAdded,IsToBePrinted,isNeedtoDeposit,"
			 * + "TransactionID,CheckNumber,PayFromBalance,PayToBalance,Priority," +
			 * "BillNum,TransactionType) VALUES (" + payment.getAmount() + "," +
			 * payment.getPaymentTypeID() + "," + payment.getPayerID() + "," +
			 * payment.getPayeeID() + "," + payment.getAccountID() + "," + payment.getCvID()
			 * + "," + payment.getInvoiceID() + "," + payment.getCategoryId() + "," +
			 * payment.getAccountCategoryId() + "," + ConstValue.companyId + "," +
			 * (payment.getDateAdded() == null ? null : ("'" +
			 * JProjectUtil.getDateFormaterCommon().format(new Date()) + "'")) + "," +
			 * (payment.isToBePrinted()== true ? 1 : 0) + "," + (payment.isNeedToDeposit()
			 * == false ? 1 : 0) + ",'" + payment.getTransactionID() + "','" +
			 * payment.getCheckNumber() + "'" + "," + payFromBalance + "," + payToBalance +
			 * "," + priorityForAddBank + "," + payment.getBillNum() + "," +
			 * payment.getInvoiceTypeID() + //ss to get InvoiceTypeID ")";
			 */

			/* try { */
			/*
			 * if(con.isClosed()) { con = db.getConnection();
			 * 
			 * } else { stmt = con.createStatement(); } stmt.executeUpdate(sql);
			 */
			insertRecord(payment, payFromBalance, payToBalance);
			paymentId = getmaxPaymentId();
			/*
			 * rs = stmt.executeQuery("SELECT MAX(PaymentID) AS LastID FROM  bca_payment");
			 * if (rs.next()) { paymentId = rs.getInt("LastID");
			 *//** payment detail *//*
									 * }
									 * 
									 * } catch (SQLException e) { // TODO Auto-generated catch block
									 * Loger.log(e.toString()); }
									 */
			/*
			 * finally { if (rs != null) { try { rs.close(); } catch (SQLException e) { //
			 * TODO Auto-generated catch block Loger.log(e.toString()); } } if (stmt !=
			 * null) { try { stmt.close(); } catch (SQLException e) { // TODO Auto-generated
			 * catch block Loger.log(e.toString()); } } }
			 */

		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return paymentId;
	}

	public int getmaxPaymentId() {
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		con = db.getConnection();
		int paymentId = -1;

		String sql = "SELECT MAX(PaymentID) AS LastID FROM  bca_payment";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				paymentId = rs.getInt("LastID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

		return paymentId;
	}

//	public void insertRecord(TblPaymentDto payment, double payFromBalance, double payToBalance) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
//
//		String sql = "INSERT INTO bca_payment(Amount,PaymentTypeID,PayerID," + "PayeeID,AccountID,"
//				+ "ClientVendorID,InvoiceID,"
//				+ "CategoryID,AccountCategoryID,CompanyID,DateAdded,IsToBePrinted,isNeedtoDeposit,"
//				+ "TransactionID,CheckNumber,PayFromBalance,PayToBalance,Priority,"
//				+ "BillNum,TransactionType) VALUES (" + payment.getAmount() + "," + payment.getPaymentTypeID() + ","
//				+ payment.getPayerID() + "," + payment.getPayeeID() + "," + payment.getAccountID() + ","
//				+ payment.getCvID() + "," + payment.getInvoiceID() + "," + payment.getCategoryId() + ","
//				+ payment.getAccountCategoryId() + "," + ConstValue.companyId + ","
//				+ (payment.getDateAdded() == null ? null
//						: ("'" + JProjectUtil.getDateFormaterCommon().format(new Date()) + "'"))
//				+ "," + (payment.isToBePrinted() == true ? 1 : 0) + "," + (payment.isNeedToDeposit() == false ? 1 : 0)
//				+ ",'" + payment.getTransactionID() + "','" + payment.getCheckNumber() + "'" + "," + payFromBalance
//				+ "," + payToBalance + "," + priorityForAddBank + "," + payment.getBillNum() + ","
//				+ payment.getInvoiceTypeID() + // ss to get InvoiceTypeID
//				")";
//
//		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql);
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
//	}
	public void insertRecord(TblPaymentDto payment, double payFromBalance, double payToBalance) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();

//		String sql = "INSERT INTO bca_payment(Amount,PaymentTypeID,PayerID," + "PayeeID,AccountID,"
//				+ "ClientVendorID,InvoiceID,"
//				+ "CategoryID,AccountCategoryID,CompanyID,DateAdded,IsToBePrinted,isNeedtoDeposit,"
//				+ "TransactionID,CheckNumber,PayFromBalance,PayToBalance,Priority,"
//				+ "BillNum,TransactionType) VALUES (" + payment.getAmount() + "," + payment.getPaymentTypeID() + ","
//				+ payment.getPayerID() + "," + payment.getPayeeID() + "," + payment.getAccountID() + ","
//				+ payment.getCvID() + "," + payment.getInvoiceID() + "," + payment.getCategoryId() + ","
//				+ payment.getAccountCategoryId() + "," + ConstValue.companyId + ","
//				+ (payment.getDateAdded() == null ? null
//						: ("'" + JProjectUtil.getDateFormaterCommon().format(new Date()) + "'"))
//				+ "," + (payment.isToBePrinted() == true ? 1 : 0) + "," + (payment.isNeedToDeposit() == false ? 1 : 0)
//				+ ",'" + payment.getTransactionID() + "','" + payment.getCheckNumber() + "'" + "," + payFromBalance
//				+ "," + payToBalance + "," + priorityForAddBank + "," + payment.getBillNum() + ","
//				+ payment.getInvoiceTypeID() + // ss to get InvoiceTypeID
//				")";

		try {
			BcaPayment bcaPayment = new BcaPayment();
			bcaPayment.setAmount(payment.getAmount());
			Optional<BcaPaymenttype> bcaPaymentType = bcaPaymenttypeRepository.findById(payment.getPaymentTypeID());
			if (bcaPaymentType.isPresent())
				bcaPayment.setPaymentType(bcaPaymentType.get());
			bcaPayment.setPayerId(payment.getPayerID());
			bcaPayment.setPayeeId(payment.getPayeeID());
			Optional<BcaAccount> account = bcaAccountRepository.findById(payment.getAccountID());
			if (account.isPresent())
				bcaPayment.setAccount(account.get());
			Optional<BcaClientvendor> clientVendor = bcaClientvendorRepository.findById(payment.getCvID());
			if (clientVendor.isPresent())
				bcaPayment.setClientVendor(clientVendor.get());
			Optional<BcaInvoice> invoice = bcaInvoiceRepository.findById(payment.getInvoiceID());
			if (invoice.isPresent())
				bcaPayment.setInvoice(invoice.get());
			Optional<BcaCategory> category = bcaCategoryRepository.findById(payment.getCategoryId());
			if (category.isPresent())
				bcaPayment.setCategory(category.get());
			bcaPayment.setAccountCategoryId(payment.getAccountCategoryId());
			Optional<BcaCompany> company = bcaCompanyRepository.findById(new Long(ConstValue.companyId));
			if (company.isPresent())
				bcaPayment.setCompany(company.get());
			String dateAddded = payment.getDateAdded() == null ? null
					: ("'" + JProjectUtil.getDateFormaterCommon().format(new Date()) + "'");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

			try {
				// Parse the string to create a LocalDateTime
				LocalDateTime localDateTime = LocalDateTime.parse(dateAddded, formatter);

				// Assume a specific offset, for example, UTC+0
				ZoneOffset offset = ZoneOffset.UTC;

				// Convert LocalDateTime to OffsetDateTime
				OffsetDateTime offsetDateTime = OffsetDateTime.of(localDateTime, offset);

				// Output the result
				System.out.println("Parsed OffsetDateTime: " + offsetDateTime);
				bcaPayment.setDateAdded(offsetDateTime);
			} catch (Exception e) {
				// Handle parsing exception
				System.err.println("Error parsing date: " + e.getMessage());
			}
			bcaPayment.setIsToBePrinted((payment.isToBePrinted() == true ? true : false));
			bcaPayment.setIsNeedtoDeposit((payment.isNeedToDeposit() == false ? true : false));
			bcaPayment.setTransactionId(payment.getTransactionID());
			bcaPayment.setCheckNumber(payment.getCheckNumber());
			bcaPayment.setPayFromBalance(payFromBalance);
			bcaPayment.setPayToBalance(payToBalance);
			bcaPayment.setPriority(priorityForAddBank);
			bcaPayment.setBillNum(payment.getBillNum());
			bcaPayment.setTransactionType(payment.getInvoiceTypeID());
			bcaPaymentRepository.save(bcaPayment);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}

	public TblCategoryDto getCategory(String categoryName) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		TblCategoryDto category = new TblCategoryDto();

//		String sql = "SELECT * FROM bca_category WHERE companyID = " + ConstValue.companyId + " and Name = '"
//				+ categoryName + "'";
		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);

//			if (rs.next()) {
//				category.setId(rs.getInt("CategoryID"));
//				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				category.setParent(rs.getString("Parent"));
//				category.setDescription(rs.getString("Description"));
//				category.setName(rs.getString("Name"));
//				// r.setCTypeName = rs.getString("CategoryTypeName");
//				category.setCategoryNumber(rs.getString("CateNumber"));
//				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
//			}
			BcaCompany company = bcaCompanyRepository.getOne(new Long(ConstValue.companyId));
			List<BcaCategory> bcaCategories = bcaCategoryRepository.findByCompanyAndName(company, categoryName);
			for (BcaCategory bcaCategory : bcaCategories) {
				category.setId(bcaCategory.getCategoryId());
				category.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				category.setParent(bcaCategory.getParent());
				category.setDescription(bcaCategory.getDescription());
				category.setName(bcaCategory.getName());
				// r.setCTypeName = rs.getString("CategoryTypeName");
				category.setCategoryNumber(bcaCategory.getCateNumber());
				category.setBudgetCategoryID(bcaCategory.getBudgetCategoryId());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return category;

	}

	public TblCategoryDto getCategoryById(int categoryId) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		con = db.getConnection();
		TblCategoryDto category = new TblCategoryDto();

//		String sql = " SELECT * FROM bca_category WHERE CompanyID = " + ConstValue.companyId + " AND CategoryID = "
//				+ categoryId;

		try {
			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaCategory> bcaCategories = bcaCategoryRepository.findByCompanyAndCategoryId(bcaCompany, categoryId);
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			if (rs.next()) {
//				category.setId(rs.getInt("CategoryID"));
//				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				category.setParent(rs.getString("Parent"));
//				category.setDescription(rs.getString("Description"));
//				category.setName(rs.getString("Name"));
//				// r.setCTypeName = rs.getString("CategoryTypeName");
//				category.setCategoryNumber(rs.getString("CateNumber"));
//				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
//			}
			for (BcaCategory bcaCategory : bcaCategories) {
				category.setId(bcaCategory.getCategoryId());
				category.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				;
				category.setParent(bcaCategory.getParent());
				category.setDescription(bcaCategory.getDescription());
				category.setName(bcaCategory.getName());
				// r.setCTypeName = rs.getString("CategoryTypeName");
				category.setCategoryNumber(bcaCategory.getCateNumber());
				category.setBudgetCategoryID(bcaCategory.getBudgetCategoryId());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return category;
	}

	public TblAccount getAccountInfo(TblPaymentDto payment) {
		TblAccount account = new TblAccount();
		int parentId = -1;
		int accountId = -1;
		int depositPaymentId = -1;
		boolean b = false;
		double customerCurrentBalance = 0.0;
		double customerStartingBalance = 0.0;

		account.setName(payment.getAccountNameString());
		account.setAccountID(accountId);
		account.setIsCategory(payment.getIsCategory());
		account.setDescription(payment.getDescriptionForAddAccount());

		if (payment.getIsMainAccount()) {
			account.setIsitmainaccount(1);
		} else {
			account.setIsitmainaccount(0);
		}

		b = getIsAccountNameExists(payment);
		if (b) {

		}
		if (payment.getIsCategory()) {
			account.setAccountTypeID(-1);
			account.setParentID(-1);
		} else {
			account.setParentID(-1);
			account.setAccountTypeID(2);
		}
		account.setCvID(-1);
		if (payment.getOpeningbalance() != 2.2E-306) {
			account.setCustomerStartingBalance(payment.getOpeningbalance());
		} else {
			account.setCustomerCurrentBalance(0);
		}
		account.setAccountCategoryID(payment.getAccountCategoryId());
		if (!payment.getCheckNumber().equals("")) {
			account.setFirstCheckNo((int) Long.parseLong(payment.getCheckNumber()));
		}
		account.setDepositPaymentID(depositPaymentId);
		account.setDateAdded(new Date());
		return account;
	}

	public boolean getIsAccountNameExists(TblPaymentDto payment) {
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		String sql = "SELECT AccountID " + " FROM bca_account " + " WHERE Name like '" + payment.getAccountNameString()
				+ "'" + " AND CompanyID = " + ConstValue.companyId + " AND Active = 1";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return false;
	}

	@Override
	public void deleteBankAccount(int accountId) {
		// TODO Auto-generated method stub
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();

//		String sql1 = "UPDATE bca_account SET " + " Active =0 " + " WHERE AccountID = " + accountId
//				+ " AND CompanyID = " + ConstValue.companyId;
//
//		String sql2 = "UPDATE bca_paymenttype " + " SET BankAcctID = 0 " + " , Active = 0 " + " WHERE BankAcctID = "
//				+ accountId + " AND CompanyID = " + ConstValue.companyId;

		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql1);
//			stmt.executeUpdate(sql2);
			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			bcaAccountRepository.updateBankAccount(accountId, company);
			bcaPaymenttypeRepository.updateBankPaymenttype(accountId, company);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

	}

	@Override
	public ArrayList<ClientVendor> getCvForBill() {
		// TODO Auto-generated method stub

//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet resultSet = null;
		ArrayList<ClientVendor> cvList = new ArrayList<ClientVendor>();
		List<Integer> cvTypeIdsToExclude = Arrays.asList(2, 4);
//		String sql = " SELECT * FROM  bca_clientvendor WHERE CompanyID = " + ConstValue.companyId
//				+ " AND Status = 'N' AND Deleted = 0 AND Active = 1 AND CVTypeID <> 2 AND CVTypeID <> 4 ORDER BY LastName";
//		// + " AND Status = 'N' AND Deleted = 0 AND Active = 1 AND CVTypeID <> 2 AND
		// CVTypeID <> 4 AND CVCategoryID <> 46 ORDER BY LastName";

		try {
//			stmt = con.createStatement();
//			resultSet = stmt.executeQuery(sql);
			BcaCompany company = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaClientvendor> bcaClientvendors = bcaClientvendorRepository
					.findByCompanyAndStatusAndDeletedAndActiveAndCvtypeIdNotInOrderByLastName(company, "N", 0, 1,
							cvTypeIdsToExclude);
//			while (resultSet.next()) {
//				ClientVendor cv = new ClientVendor();
//
//				cv.setCvID(resultSet.getInt("ClientVendorID"));
//				cv.setName(resultSet.getString("Name"));
//				cv.setFirstName(resultSet.getString("FirstName"));
//				cv.setLastName(resultSet.getString("LastName"));
//				cv.setTaxable(resultSet.getInt("Taxable"));
//				cv.setSalesRepID(resultSet.getInt("SalesRepID"));
//				cv.setTermID(resultSet.getInt("TermID"));
//				cv.setShipCarrierID(resultSet.getInt("ShipCarrierID"));
//				cv.setPaymentTypeID(resultSet.getInt("PaymentTypeID"));
//				cv.setUseSpecialMessage(resultSet.getInt("UseSpecialMessage") == 1);
//				cv.setMessage(resultSet.getString("Message"));
//				cv.setPriceLevelID(resultSet.getInt("PriceLevelID"));
//				cv.setState(resultSet.getString("State"));
//				cv.setCategoryId(resultSet.getInt("CategoryID"));
//				cv.setEmail(resultSet.getString("Email"));// To get Email (ss).
//				cv.setLineOfCreditTermID(resultSet.getInt("LineofCreditTermID"));
//				cv.setCustomerCreditLine(resultSet.getDouble("CustomerCreditLine"));
//				cv.setRemainingCreditAmount(resultSet.getDouble("RemainingCredit"));
//				cv.setVendorAllowedCredit(resultSet.getDouble("VendorAllowedCredit"));
//				cv.setAddress1(resultSet.getString("Address1"));
//
//				cvList.add(cv);
//			}
			for (BcaClientvendor clientvendor : bcaClientvendors) {
				ClientVendor cv = new ClientVendor();

				cv.setCvID(clientvendor.getClientVendorId());
				if (null != clientvendor.getName())
					cv.setName(clientvendor.getName());
				if (null != clientvendor.getFirstName())
					cv.setFirstName(clientvendor.getFirstName());
				if (null != clientvendor.getLastName())
					cv.setLastName(clientvendor.getLastName());
				cv.setTaxable(clientvendor.getTaxable().intValue());
				cv.setSalesRepID(clientvendor.getSalesRep().getSalesRepId());
				cv.setTermID(clientvendor.getTerm().getTermId());
				cv.setShipCarrierID(clientvendor.getShipCarrier().getShipCarrierId());
				cv.setPaymentTypeID(clientvendor.getPaymentType().getPaymentTypeId());
				if (null != clientvendor.getUseSpecialMessage())
					cv.setUseSpecialMessage(clientvendor.getUseSpecialMessage());
				if (null != clientvendor.getMessage())
					cv.setMessage(clientvendor.getMessage());
				if (null != clientvendor.getPriceLevelId())
					cv.setPriceLevelID(clientvendor.getPriceLevelId());

				cv.setState(clientvendor.getState());
				if (null != clientvendor.getCategory())
					cv.setCategoryId(clientvendor.getCategory().getCategoryId());
				cv.setEmail(clientvendor.getEmail());// To get Email (ss).
				if (null != clientvendor.getLineofCreditTermId())
					cv.setLineOfCreditTermID(clientvendor.getLineofCreditTermId());
				if (null != clientvendor.getCustomerCreditLine())
					cv.setCustomerCreditLine(clientvendor.getCustomerCreditLine());
				if (null != clientvendor.getRemainingCredit())
					cv.setRemainingCreditAmount(clientvendor.getRemainingCredit());
				if (null != clientvendor.getVendorAllowedCredit())
					cv.setVendorAllowedCredit(clientvendor.getVendorAllowedCredit());
				cv.setAddress1(clientvendor.getAddress1());

				cvList.add(cv);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
//			try {
//				if (resultSet != null) {
//					db.close(resultSet);
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
		return cvList;
	}

	@Override
	public ArrayList<TblVendorDetail> getUnpaidBillList(int cvID, int checkStatus) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		double totalUnpaidAmount = 0.00;
		ArrayList<TblVendorDetail> unpaidBill = new ArrayList<TblVendorDetail>();
		List<Object[]> list;
//		String Sql = " SELECT bill.BillNum,bill.DueDate,bill.AmountDue,bill.Status,bill.BillType,bill.AmountPaid,bill.CreditUsed,"
//				+ " bill.Balance,bill.Memo,bill.IsMemorized,bill.VendorId,bill.CategoryID,bill.PayerID "
//				+ " ,bill.ServiceID,bill.DateAdded,bill.CHECKNO,bill.Status,ci.Name,CONCAT(cat.Name,\" \", cat.CateNumber) AS CatName"
//				+ " FROM bca_bill as bill INNER Join bca_clientvendor as ci ON bill.VENDORID=ci.CLIENTVENDORID"
//				+ " LEFT JOIN bca_category as cat ON cat.CategoryID=bill.CategoryID " + " WHERE bill.CompanyID="
//				+ ConstValue.companyId;

//		if (cvID > 0) {
//			Sql += " AND bill.VendorId=" + cvID;
//		}

//		Sql += " AND bill.Status = 0 And ci.STATUS='N'";
//		Sql += " ORDER BY bill.BillNum DESC";

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(Sql);

			if (cvID > 0) {
				list = bcaBillRepository.findUnpainBillList(new Long(ConstValue.companyId), cvID);
			} else {
				list = bcaBillRepository.findUnpainBillList(new Long(ConstValue.companyId));
			}
			List<BcaBillDto> billDtos = objectToBcaBillDto(list);
			for (BcaBillDto dto : billDtos) {
				TblVendorDetail vDetail = new TblVendorDetail();
				vDetail.setIsSelected(false);
				vDetail.setIsSelected(vDetail.getIsSelected());
				vDetail.setVendorName(dto.getName());
				vDetail.setCheckNo(dto.getCheckNo());
				vDetail.setBillNo(dto.getBillNum());
				vDetail.setDueDate(JProjectUtil.getdateFormat().format(offsetDateTimeToDate(dto.getDuedate())));
				vDetail.setCreditUsed(dto.getCreditUsed());
				vDetail.setAmountTopay(dto.getBalance());
				double AmountDue = dto.getAmountDue();
				vDetail.setAmount(AmountDue);
				totalUnpaidAmount = totalUnpaidAmount + AmountDue;
				vDetail.setTotalBillAmount(totalUnpaidAmount);
				vDetail.setMemo(dto.getMemo());
				vDetail.setBillType(dto.getBillType());
				vDetail.setVendorId(dto.getVendorId());
				vDetail.setCategoryID(dto.getCategoryId());
				vDetail.setPayerId(dto.getPayerId());
				vDetail.setBalance(vDetail.getAmountTopay());
				vDetail.setAmountPaid(dto.getAmountPaid());
				vDetail.setServiceID(dto.getServiceId());
				boolean status = dto.getIsMemorized();
				vDetail.setDateAdded(offsetDateTimeToDate(dto.getDateAdded()));
				vDetail.setCategoryName(dto.getCatName());
				String billStatus = "Unpaid"; // "Unpaid";
				if (status) {
					billStatus = "Memorized"; // "Memorized";
				}
				int bStatus = rs.getInt("Status");
				if (bStatus == 1)
					billStatus = "Paid";
				if (bStatus == 2)
					billStatus = "Schedule";

				vDetail.setStatus(billStatus);

				unpaidBill.add(vDetail);
			}
//			while (rs.next()) {
//				TblVendorDetail vDetail = new TblVendorDetail();
//				vDetail.setIsSelected(false);
//				vDetail.setIsSelected(vDetail.getIsSelected());
//				vDetail.setVendorName(rs.getString("Name"));
//				vDetail.setCheckNo(rs.getInt("CHECKNO"));
//				vDetail.setBillNo(rs.getInt("BillNum"));
//				vDetail.setDueDate(JProjectUtil.getdateFormat().format(rs.getDate("DueDate")));
//				vDetail.setCreditUsed(rs.getDouble("CreditUsed"));
//				vDetail.setAmountTopay(rs.getDouble("Balance"));
//				double AmountDue = rs.getDouble("AmountDue");
//				vDetail.setAmount(AmountDue);
//				totalUnpaidAmount = totalUnpaidAmount + AmountDue;
//				vDetail.setTotalBillAmount(totalUnpaidAmount);
//				vDetail.setMemo(rs.getString("Memo"));
//				vDetail.setBillType(rs.getInt("BillType"));
//				vDetail.setVendorId(rs.getInt("VendorId"));
//				vDetail.setCategoryID(rs.getLong("CategoryID"));
//				vDetail.setPayerId(rs.getInt("PayerID"));
//				vDetail.setBalance(vDetail.getAmountTopay());
//				vDetail.setAmountPaid(rs.getDouble("AmountPaid"));
//				vDetail.setServiceID(rs.getLong("ServiceID"));
//				boolean status = rs.getBoolean("IsMemorized");
//				vDetail.setDateAdded(rs.getDate("DateAdded"));
//				vDetail.setCategoryName(rs.getString("CatName"));
//				String billStatus = "Unpaid"; // "Unpaid";
//				if (status) {
//					billStatus = "Memorized"; // "Memorized";
//				}
//				int bStatus = rs.getInt("Status");
//				if (bStatus == 1)
//					billStatus = "Paid";
//				if (bStatus == 2)
//					billStatus = "Schedule";
//
//				vDetail.setStatus(billStatus);
//
//				unpaidBill.add(vDetail);
//			}
		} catch (SQLException e) {
			e.printStackTrace(); // TODO Auto-generated catch block
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
		return unpaidBill;
	}

	@Override
	public TblVendorDetail getBillById(int billNum) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		TblVendorDetail vDetail = null;

		String sql = "SELECT * FROM bca_bill AS bill WHERE bill.BillNum = " + billNum + " AND bill.CompanyID ="
				+ ConstValue.companyId;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				vDetail = new TblVendorDetail();
				vDetail.setCheckNo(rs.getInt("CheckNo"));
				vDetail.setBillNo(rs.getInt("BillNum"));
				vDetail.setDueDate(JProjectUtil.getdateFormat().format(rs.getDate("DueDate")));
				vDetail.setCreditUsed(rs.getDouble("CreditUsed"));
				vDetail.setAmountTopay(rs.getDouble("Balance"));
				double AmountDue = rs.getDouble("AmountDue");
				vDetail.setAmount(AmountDue);
				/*
				 * totalUnpaidAmount = totalUnpaidAmount+AmountDue;
				 * vDetail.setTotalBillAmount(totalUnpaidAmount);
				 */
				vDetail.setMemo(rs.getString("Memo"));
				vDetail.setBillType(rs.getInt("BillType"));
				vDetail.setVendorId(rs.getInt("VendorId"));
				vDetail.setCategoryID(rs.getLong("CategoryID"));
				vDetail.setPayerId(rs.getInt("PayerID"));
				vDetail.setBalance(vDetail.getAmountTopay());
				vDetail.setAmountPaid(rs.getDouble("AmountPaid"));
				vDetail.setServiceID(rs.getLong("ServiceID"));
				boolean status = rs.getBoolean("IsMemorized");
				vDetail.setDateAdded(rs.getDate("DateAdded"));
				vDetail.setDate(rs.getString("DateAdded"));
				vDetail.setRecurringPeriod(rs.getString("RecurringPeriod"));
				vDetail.setNextDate(rs.getDate("NextDate"));
				String billStatus = "Unpaid"; // "Unpaid";
				if (status) {
					billStatus = "Memorized"; // "Memorized";
				}
				int bStatus = rs.getInt("Status");
				if (bStatus == 1)
					billStatus = "Paid";
				if (bStatus == 2)
					billStatus = "Schedule";
				vDetail.setStatus(billStatus);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return vDetail;

	}

	@Override
	public void updateBill(TblVendorDetail vDetail) {
		// TODO Auto-generated method stub
		double paidAmount = 0.00;
		double balance = 0.00;

		TblVendorDetail oldDetail = getBillById(vDetail.getBillNo());
		paidAmount = oldDetail.getAmountPaid() + vDetail.getAmount();
		balance = oldDetail.getAmount() - paidAmount;

		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		TblVendorDetail detail = null;

		String sql = " Update bca_bill SET PayerID = " + vDetail.getPayerId() + " ,VendorID = " + vDetail.getVendorId()
				+ " ,Memo = '" + vDetail.getMemo() + "'" + " ,CheckNo = " + vDetail.getCheckNo() + " ,AmountPaid = "
				+ paidAmount + " ,Balance = " + balance + " ,CategoryID = " + vDetail.getCategoryID()
				+ " WHERE BillNum = " + vDetail.getBillNo() + " AND CompanyID = " + ConstValue.companyId;
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
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

	@Override
	public void makePayment(TblVendorDetail vDetail, int cvID) {
		// TODO Auto-generated method stub
		try {

			TblAccount clientAccount = getAccountForPayer(cvID, ConstValue.companyId);
			vDetail.setPayeeId(clientAccount.getAccountID());
		} catch (Exception e) {
			vDetail.setPayeeId(cvID);
		}
		updateBillTab(vDetail);
		updateVendorBalance(cvID, vDetail.getAmountTopay());

	}

	public void updateVendorBalance(int clientvendotID, double amount) {
		TblAccount vendorAccount = null;

		try {
			vendorAccount = getAccountForPayer(clientvendotID, ConstValue.companyId);
			if (vendorAccount != null) {
				if (vendorAccount.getCvTypeID() == 3) {
					// tblAccountLoader2.adjustVendorCurrentBalance(vendorAccount,-amount);
					adjustVendorBankBalance(vendorAccount, -amount);
				} else if (vendorAccount.getCvTypeID() == 1) {
					// tblAccountLoader2.adjustVendorCurrentBalance(vendorAccount,-amount);
					adjustVendorBankBalance(vendorAccount, -amount);
					adjustCustomerCurrentBalance(vendorAccount, -amount);
				}

			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}
	}

	public void updateBillTab(TblVendorDetail v) {
		int paymentID = 0;

		Calendar c = Calendar.getInstance();

		TblAccount account = getAccountById(v.getPayerId());
		TblAccount debitAccount = getAccountById(v.getPayerId());

		double amount = debitAccount.getCustomerCurrentBalance();

		v.setPayFromBalance(amount - v.getAmountTopay());

		try {
			TblAccount creditAccount = getAccountForPayer(v.getVendorId(), ConstValue.companyId);
			v.setPayToBalance(creditAccount.getVendorCurrentBalance() - v.getAmountTopay());
		} catch (Exception e) {
			v.setPayToBalance(0.00);
		}

		if (account.getAccountCategoryID() == 1) {
			v.setIscheckPaid(true);
		} else {
			v.setIscheckPaid(false);
		}

		int priority = getPriority() + 1;

		Connection con = null;
		Statement stmt = null;
		Statement stmt1 = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		String Sql = "INSERT INTO bca_payment(Amount," + "PayerID,PayeeID,AccountID,ClientVendorID,CategoryID,"
				+ "CompanyID,DateAdded,BillNum,IsToBePrinted,InvoiceID,PayFromBalance,PayToBalance,Priority,CHECKNUMBER,AccountCategoryID) "
				+ // changed by pritesh 11-04-2018(ACCOUNTCATEGORYID)
				" values(" + v.getAmountTopay() + "," + v.getPayerId() + "," + v.getPayeeId() + "," +
//                vendorDetail.getVendorId() + "," +
				v.getPayerId() + "," + v.getVendorId() + "," + v.getCategoryID() + "," + ConstValue.companyId + ","
				+ "'" + JProjectUtil.getDateFormater().format(c.getTime()) + "'" + "," + v.getBillNo() + ","
				+ (v.ischeckPaid == true ? 1 : 0) + "," +
				// vendorDetail.ischeckPaid + "," +
				v.getInvoiceId() + "," + v.getPayFromBalance() + "," + v.getPayToBalance() + "," + priority + ",'"
				+ v.getCheckNo() + "'," + v.getCategoryID() + ")";

		try {
			stmt = con.createStatement();
			stmt.executeUpdate(Sql);

			rs = stmt.executeQuery("SELECT MAX(PaymentID) AS LastID FROM bca_payment");

			if (rs.next()) {
				paymentID = rs.getInt("LastID");
			}

			adjustBankBalance(debitAccount, -v.getAmountTopay());

			/* double paidAmount = v.getAmountPaid() + v.getAmountTopay(); */
			double paidAmount = v.getAmountPaid();
			if (v.getAmountTopay() < v.getBalance()) {
				/* double cal_amount = v.getBalance() - v.getAmountTopay(); */
				double cal_amount = v.getBalance();
				String sql = "Update bca_bill SET Balance=" + cal_amount + ", DueDate=" + "'"
						+ JProjectUtil.getDateFormater().format(c.getTime()) + "'" + ", Memo='" + v.getMemo() + "'"
						+ ",PayerID=" + v.getPayerId() + ",PaymentID=" + paymentID + ",AmountPaid=" + paidAmount
						+ " WHERE BillNum = " + v.getBillNo();
			}
			/* else if (v.getBalance() == v.getAmountTopay()) { */
			else if (v.getAmount() == v.getAmountPaid()) {
				String sql = "Update bca_bill SET Balance= 0.0" + ", DueDate=" + "'"
						+ JProjectUtil.getDateFormater().format(c.getTime()) + "'" + ", Memo='" + v.getMemo() + "'"
						+ ",PayerID=" + v.getPayerId() + ",PaymentID=" + paymentID + ",AmountPaid=" + paidAmount
						+ ", Status = 1 WHERE BillNum = " + v.getBillNo();
				stmt1 = con.createStatement();
				stmt1.executeUpdate(sql);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
				}
				if (stmt1 != null) {
					db.close(stmt1);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

	}

	@Override
	public ArrayList<TblPaymentDto> getPaidBillLists() {
		// TODO Auto-generated method stub

		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs_paidUC = null;
		ArrayList<TblPaymentDto> paidBillLists = new ArrayList<TblPaymentDto>();
		StringBuffer Sql = new StringBuffer();
		double totaAmount = 0.00;

		Sql.append("SELECT bill.ServiceID," + " bill.VendorId," + " Payment.DateAdded," + " bill.PayerID,"
				+ " bill.Memo," + " Payment.CheckNumber," + " Payment.Amount," + " Payment.IsToBePrinted,"
				+ " bill.BillNum," + " bill.CategoryID," + " bill.AmountDue," + " Payment.PaymentTypeID,"
				+ " Payment.PaymentID," + " ClientV.Name AS CompanyName," + " ClientV.FirstName," + " ClientV.LastName,"
				+ " Account.Name AS AccountName" + " FROM bca_payment AS Payment"
				+ " INNER JOIN bca_bill AS bill ON Payment.BillNum = bill.BillNum "
				+ " LEFT JOIN bca_clientvendor AS ClientV ON bill.VendorId = ClientV.ClientVendorID"
				+ " LEFT JOIN bca_account AS Account ON Payment.PayerID = Account.AccountID"
				+ " WHERE Payment.Deleted <> 1 " + " AND ClientV.Status = 'N'" + " AND bill.CompanyID = "
				+ ConstValue.companyId);

		Sql.append(" ORDER BY Payment.DateAdded  DESC");

		try {
			stmt = con.createStatement();
			rs_paidUC = stmt.executeQuery(Sql.toString());

			while (rs_paidUC.next()) {
				TblPaymentDto payment = new TblPaymentDto();
				payment.setId(rs_paidUC.getInt("PaymentID"));
				payment.setAmount(rs_paidUC.getDouble("Amount"));
				totaAmount = totalAmount + rs_paidUC.getDouble("Amount");
				payment.setTotalAmount(totaAmount);
				payment.setPaymentTypeID(rs_paidUC.getInt("PaymentTypeID"));
				/*
				 * payment.setPaymentTypeName(tblPaymentLoader.getPaymentTypeName(payment.
				 * getPaymentTypeID()));
				 */
				payment.setPayerID(rs_paidUC.getInt("PayerID"));
				/* payment.setPayeeID(rs_paidUC.getInt("PayeeID")); */
				/* payment.setAccountID(rs_paidUC.getInt("AccountID")); */
				payment.setCvID(rs_paidUC.getInt("VendorId"));
				/* payment.setInvoiceID(rs_paidUC.getInt("InvoiceID")); */
				payment.setCategoryId(rs_paidUC.getInt("CategoryID"));
				payment.setDateAdded(rs_paidUC.getDate("DateAdded"));
				/* payment.setNeedToDeposit(rs_paidUC.getBoolean("isNeedtoDeposit")); */
				payment.setToBePrinted(rs_paidUC.getBoolean("IsToBePrinted"));
				payment.setCheckNumber(rs_paidUC.getString("CheckNumber"));
				payment.setServiceId(rs_paidUC.getInt("ServiceID"));
				payment.setMemo(rs_paidUC.getString("Memo"));
				payment.setAmountDue(rs_paidUC.getDouble("AmountDue"));
				payment.setBillNum(rs_paidUC.getInt("BillNum"));
				payment.setAccountNameString(rs_paidUC.getString("AccountName"));
				payment.setCvName(rs_paidUC.getString("CompanyName") + " (" + rs_paidUC.getString("LastName") + " "
						+ rs_paidUC.getString("FirstName") + " )");

				paidBillLists.add(payment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		} finally {
			try {
				if (rs_paidUC != null) {
					db.close(rs_paidUC);
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
		return paidBillLists;

	}

	@Override
	public ArrayList<TblPayment> getPaidBillListsPayment() {
		// TODO Auto-generated method stub

//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs_paidUC = null;
		ArrayList<TblPayment> paidBillLists = new ArrayList<TblPayment>();
//		StringBuffer Sql = new StringBuffer();
		double totaAmount = 0.00;
//
//		Sql.append("SELECT bill.ServiceID," + " bill.VendorId," + " Payment.DateAdded," + " bill.PayerID,"
//				+ " bill.Memo," + " Payment.CheckNumber," + " Payment.Amount," + " Payment.IsToBePrinted,"
//				+ " bill.BillNum," + " bill.CategoryID," + " bill.AmountDue," + " Payment.PaymentTypeID,"
//				+ " Payment.PaymentID," + " ClientV.Name AS CompanyName," + " ClientV.FirstName," + " ClientV.LastName,"
//				+ " Account.Name AS AccountName" + " FROM bca_payment AS Payment"
//				+ " INNER JOIN bca_bill AS bill ON Payment.BillNum = bill.BillNum "
//				+ " LEFT JOIN bca_clientvendor AS ClientV ON bill.VendorId = ClientV.ClientVendorID"
//				+ " LEFT JOIN bca_account AS Account ON Payment.PayerID = Account.AccountID"
//				+ " WHERE Payment.Deleted <> 1 " + " AND ClientV.Status = 'N'" + " AND bill.CompanyID = "
//				+ ConstValue.companyId);
//
//		Sql.append(" ORDER BY Payment.DateAdded  DESC");

		try {
//			stmt = con.createStatement();
//			rs_paidUC = stmt.executeQuery(Sql.toString());
			List<Object[]> lists = bcaPaymentRepository.findPaidBillListsPayment(new Long(ConstValue.companyId));
			List<BcaPaymentDto> objectToBcaPaymentDto = objectToBcaPaymentDto(lists);
			for (BcaPaymentDto dto : objectToBcaPaymentDto) {
				TblPayment payment = new TblPayment();
				payment.setId(dto.getPaymentId());
				payment.setAmount(dto.getAmount());
				totaAmount = totalAmount + dto.getAmount();
				payment.setTotalAmount(totaAmount);
				payment.setPaymentTypeID(dto.getPaymentTypeId());
				/*
				 * payment.setPaymentTypeName(tblPaymentLoader.getPaymentTypeName(payment.
				 * getPaymentTypeID()));
				 */
				payment.setPayerID(dto.getPayerId());
				/* payment.setPayeeID(rs_paidUC.getInt("PayeeID")); */
				/* payment.setAccountID(rs_paidUC.getInt("AccountID")); */
				payment.setCvID(dto.getVendorId());
				/* payment.setInvoiceID(rs_paidUC.getInt("InvoiceID")); */
				payment.setCategoryId(dto.getCategoryId());
				payment.setDateAdded(offsetDateTimeToDate(dto.getDateAdded()));
				/* payment.setNeedToDeposit(rs_paidUC.getBoolean("isNeedtoDeposit")); */
				payment.setToBePrinted(dto.getIsToBePrinted());
				payment.setCheckNumber(dto.getCheckNumber());
				payment.setServiceId(dto.getServiceId());
				payment.setMemo(dto.getMemo());
				payment.setAmountDue(dto.getAmountDue());
				payment.setBillNum(dto.getBillNum());
				payment.setAccountNameString(dto.getAccountName());
				payment.setCvName(dto.getCompnayName() + " (" + dto.getLastName() + " " + dto.getFirstName() + " )");

				paidBillLists.add(payment);
			}
//			while (rs_paidUC.next()) {
//
//				TblPayment payment = new TblPayment();
//				payment.setId(rs_paidUC.getInt("PaymentID"));
//				payment.setAmount(rs_paidUC.getDouble("Amount"));
//				totaAmount = totalAmount + rs_paidUC.getDouble("Amount");
//				payment.setTotalAmount(totaAmount);
//				payment.setPaymentTypeID(rs_paidUC.getInt("PaymentTypeID"));
//				/*
//				 * payment.setPaymentTypeName(tblPaymentLoader.getPaymentTypeName(payment.
//				 * getPaymentTypeID()));
//				 */
//				payment.setPayerID(rs_paidUC.getInt("PayerID"));
//				/* payment.setPayeeID(rs_paidUC.getInt("PayeeID")); */
//				/* payment.setAccountID(rs_paidUC.getInt("AccountID")); */
//				payment.setCvID(rs_paidUC.getInt("VendorId"));
//				/* payment.setInvoiceID(rs_paidUC.getInt("InvoiceID")); */
//				payment.setCategoryId(rs_paidUC.getInt("CategoryID"));
//				payment.setDateAdded(rs_paidUC.getDate("DateAdded"));
//				/* payment.setNeedToDeposit(rs_paidUC.getBoolean("isNeedtoDeposit")); */
//				payment.setToBePrinted(rs_paidUC.getBoolean("IsToBePrinted"));
//				payment.setCheckNumber(rs_paidUC.getString("CheckNumber"));
//				payment.setServiceId(rs_paidUC.getInt("ServiceID"));
//				payment.setMemo(rs_paidUC.getString("Memo"));
//				payment.setAmountDue(rs_paidUC.getDouble("AmountDue"));
//				payment.setBillNum(rs_paidUC.getInt("BillNum"));
//				payment.setAccountNameString(rs_paidUC.getString("AccountName"));
//				payment.setCvName(rs_paidUC.getString("CompanyName") + " (" + rs_paidUC.getString("LastName") + " "
//						+ rs_paidUC.getString("FirstName") + " )");
//
//				paidBillLists.add(payment);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
//			try {
//				if (rs_paidUC != null) {
//					db.close(rs_paidUC);
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
		return paidBillLists;

	}

	@Override
	public ArrayList<TblPaymentDto> getRecurrentBillPayment() {
		// TODO Auto-generated method stub
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs_paidUC = null;
		ArrayList<TblPaymentDto> recurrentPaymentList = new ArrayList<TblPaymentDto>();
		double totaAmount = 0.00;

//		StringBuffer Sql = new StringBuffer();
//
//		Sql.append("SELECT payment.ServiceID," + " payment.PayeeID," + " payment.PaymentDate," + " payment.PayerID,"
//				+ " payment.Memo," + " payment.CheckNumber," + " payment.Amount," + " payment.IsToBePrinted,"
//				+ " payment.PaymentTypeID," + " payment.PaymentID," + " ClientV.Name AS CompanyName,"
//				+ " ClientV.FirstName," + " ClientV.LastName," + " Account.Name AS AccountName"
//				+ " FROM bca_recurrentpayment AS Payment"
//				+ " INNER JOIN bca_clientvendor AS ClientV ON payment.PayeeID = ClientV.ClientVendorID"
//				+ " LEFT JOIN bca_account AS Account ON payment.PayerID = Account.AccountID"
//				+ " WHERE payment.IsPaymentCompleted = 1 " + " AND ClientV.Status = 'N'" + " AND payment.CompanyID = "
//				+ ConstValue.companyId);
//
//		Sql.append(" ORDER BY payment.PaymentDate  DESC");

		try {
//			stmt = con.createStatement();
//			rs_paidUC = stmt.executeQuery(Sql.toString());
			List<Object[]> recurrentBillpayement = bcaRecurrentpaymentRepository
					.findRecurrentBillPayment(new Long(ConstValue.companyId));
			List<BcaRecurrentPaymentDto> list = objectToBcaRecurrentPaymentDto(recurrentBillpayement);
			for (BcaRecurrentPaymentDto dto : list) {
				TblPaymentDto payment = new TblPaymentDto();
				payment.setId(dto.getPaymentId());
				payment.setAmount(dto.getAmount());
				totaAmount = totaAmount + dto.getAmount();
				payment.setTotalAmount(totaAmount);
				payment.setPaymentTypeID(dto.getPaymentTypeId());
				payment.setPayerID(dto.getPayerId());
				payment.setCvID(dto.getPayeeId());
				payment.setServiceId(dto.getServiceId());
				payment.setDateAdded(offsetDateTimeToDate(dto.getPaymentDate()));
				payment.setToBePrinted(dto.getIsToBePrinted());
				payment.setCheckNumber("ToBePrinted");
				payment.setMemo(dto.getMemo());
				payment.setAccountNameString(dto.getAccountName());
				payment.setCvName(dto.getCompanyName() + " (" + dto.getLastName() + " " + dto.getFirstName() + " )");
				recurrentPaymentList.add(payment);
			}
//			while (rs_paidUC.next()) {
//				TblPaymentDto payment = new TblPaymentDto();
//				payment.setId(rs_paidUC.getInt("PaymentID"));
//				payment.setAmount(rs_paidUC.getDouble("Amount"));
//				totaAmount = totaAmount + rs_paidUC.getDouble("Amount");
//				payment.setTotalAmount(totaAmount);
//				payment.setPaymentTypeID(rs_paidUC.getInt("PaymentTypeID"));
//				payment.setPayerID(rs_paidUC.getInt("PayerID"));
//				payment.setCvID(rs_paidUC.getInt("PayeeID"));
//				payment.setServiceId(rs_paidUC.getInt("ServiceID"));
//				payment.setDateAdded(rs_paidUC.getDate("PaymentDate"));
//				payment.setToBePrinted(rs_paidUC.getBoolean("IsToBePrinted"));
//				payment.setCheckNumber("ToBePrinted");
//				payment.setMemo(rs_paidUC.getString("Memo"));
//				payment.setAccountNameString(rs_paidUC.getString("AccountName"));
//				payment.setCvName(rs_paidUC.getString("CompanyName") + " (" + rs_paidUC.getString("LastName") + " "
//						+ rs_paidUC.getString("FirstName") + " )");
//				recurrentPaymentList.add(payment);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
//			try {
//				if (rs_paidUC != null) {
//					db.close(rs_paidUC);
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
		return recurrentPaymentList;

	}

	@Override
	public void deleteSelectedBill(int billNum) {
		// TODO Auto-generated method stub

		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		String sql = "UPDATE bca_bill SET Status = 1 WHERE CompanyID = " + ConstValue.companyId + " AND BillNum = "
				+ billNum;
		String sql2 = "DELETE FROM bca_billdetail WHERE CompanyID = " + ConstValue.companyId + " AND BillNum = "
				+ billNum;
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			stmt.executeUpdate(sql2);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	@Override
	public ArrayList<TblVendorDetail> getAllBill(int cvID, int checkStatus) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		double totalUnpaidAmount = 0.00;
		ArrayList<TblVendorDetail> allBill = new ArrayList<TblVendorDetail>();

		String Sql = " SELECT bill.BillNum,bill.DueDate,bill.AmountDue,bill.Status,bill.BillType,"
				+ " bill.AmountPaid,bill.CreditUsed,bill.Balance,bill.Memo,bill.IsMemorized,"
				+ " bill.VendorId,bill.CategoryID,bill.PayerID,bill.ServiceID,bill.DateAdded,bill.CHECKNO,bill.Status,ci.Name"
				+ " FROM bca_bill as bill INNER Join bca_clientvendor as ci" + " ON bill.VENDORID=ci.CLIENTVENDORID"
				+ " WHERE " + " bill.Status=0 and " + " bill.CompanyID=" + ConstValue.companyId;

		if (cvID > 0) {
			Sql += " AND bill.VendorId=" + cvID;
		}

		Sql += " AND ( bill.Status = 0 OR bill.Status = 1 )  And ci.STATUS='N'";
		Sql += " ORDER BY bill.BillNum";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);

			while (rs.next()) {
				TblVendorDetail vDetail = new TblVendorDetail();
				vDetail.setIsSelected(false);
				vDetail.setIsSelected(vDetail.getIsSelected());
				vDetail.setVendorName(rs.getString("Name"));
				vDetail.setCheckNo(rs.getInt("CHECKNO"));
				vDetail.setBillNo(rs.getInt("BillNum"));
				vDetail.setDueDate(JProjectUtil.getdateFormat().format(rs.getDate("DueDate")));
				vDetail.setCreditUsed(rs.getDouble("CreditUsed"));
				vDetail.setAmountTopay(rs.getDouble("Balance"));
				double AmountDue = rs.getDouble("AmountDue");
				vDetail.setAmount(AmountDue);
				totalUnpaidAmount = totalUnpaidAmount + AmountDue;
				vDetail.setTotalBillAmount(totalUnpaidAmount);
				vDetail.setMemo(rs.getString("Memo"));
				vDetail.setBillType(rs.getInt("BillType"));
				vDetail.setVendorId(rs.getInt("VendorId"));
				vDetail.setCategoryID(rs.getLong("CategoryID"));
				vDetail.setPayerId(rs.getInt("PayerID"));
				vDetail.setBalance(vDetail.getAmountTopay());
				vDetail.setAmountPaid(rs.getDouble("AmountPaid"));
				vDetail.setServiceID(rs.getLong("ServiceID"));
				boolean status = rs.getBoolean("IsMemorized");
				vDetail.setDateAdded(rs.getDate("DateAdded"));

				String billStatus = "Unpaid"; // "Unpaid";
				if (status) {
					billStatus = "Memorized"; // "Memorized";
				}
				int bStatus = rs.getInt("Status");
				if (bStatus == 1)
					billStatus = "Paid";
				if (bStatus == 2)
					billStatus = "Schedule";

				vDetail.setStatus(billStatus);

				allBill.add(vDetail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return allBill;
	}

	@Override
	public TblVendorDetail getBillByBillNum(String billNum) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		double totalUnpaidAmount = 0.00;
		TblVendorDetail vDetail = new TblVendorDetail();

		String Sql = " SELECT bill.BillNum,bill.DueDate,bill.AmountDue,bill.Status,bill.BillType,"
				+ " bill.AmountPaid,bill.CreditUsed,bill.Balance,bill.Memo,bill.IsMemorized,"
				+ " bill.VendorId,bill.CategoryID,bill.PayerID,bill.ServiceID,bill.DateAdded,bill.CHECKNO,bill.Status,ci.Name"
				+ " FROM bca_bill as bill INNER Join bca_clientvendor as ci" + " ON bill.VENDORID=ci.CLIENTVENDORID"
				+ " WHERE " + " bill.Status=0 and " + " bill.CompanyID=" + ConstValue.companyId + " and bill.BillNum ="
				+ billNum;
		Sql += " AND ( bill.Status = 0 OR bill.Status = 1 )  And ci.STATUS='N'";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);

			while (rs.next()) {
				vDetail.setIsSelected(false);
				vDetail.setIsSelected(vDetail.getIsSelected());
				vDetail.setVendorName(rs.getString("Name"));
				vDetail.setCheckNo(rs.getInt("CHECKNO"));
				vDetail.setBillNo(rs.getInt("BillNum"));
				vDetail.setDueDate(JProjectUtil.getdateFormat().format(rs.getDate("DueDate")));
				vDetail.setCreditUsed(rs.getDouble("CreditUsed"));
				vDetail.setAmountTopay(rs.getDouble("Balance"));
				double AmountDue = rs.getDouble("AmountDue");
				vDetail.setAmount(AmountDue);
				totalUnpaidAmount = totalUnpaidAmount + AmountDue;
				vDetail.setTotalBillAmount(totalUnpaidAmount);
				vDetail.setMemo(rs.getString("Memo"));
				vDetail.setBillType(rs.getInt("BillType"));
				vDetail.setVendorId(rs.getInt("VendorId"));
				vDetail.setCategoryID(rs.getLong("CategoryID"));
				vDetail.setPayerId(rs.getInt("PayerID"));
				vDetail.setBalance(vDetail.getAmountTopay());
				vDetail.setAmountPaid(rs.getDouble("AmountPaid"));
				vDetail.setServiceID(rs.getLong("ServiceID"));
				boolean status = rs.getBoolean("IsMemorized");
				vDetail.setDateAdded(rs.getDate("DateAdded"));

				String billStatus = "Unpaid"; // "Unpaid";
				if (status) {
					billStatus = "Memorized"; // "Memorized";
				}
				int bStatus = rs.getInt("Status");
				if (bStatus == 1)
					billStatus = "Paid";
				if (bStatus == 2)
					billStatus = "Schedule";

				vDetail.setStatus(billStatus);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return vDetail;
	}

	public void updateBillByBillNumForPaid(String BillNum) {
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		String sql = "update bca_bill set Status = 1 where BillNum=" + BillNum;
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	@Override
	public void updateVendorBills(TblVendorDetail vDetail) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "UPDATE bca_bill SET" + " TransactionName= '" + vDetail.getTransactionName().trim() + "',"
				+ " RemindOption=" + vDetail.getMemorizedOption() + "," + " RecurringPeriod='" + vDetail.getHowOften()
				+ "'," + " RecurringNumber=" + vDetail.getNumRemain() + "," + " DaysInAdvanceToEnter="
				+ vDetail.getDayInAdv() + "," + " IsMemorized=1" + "," + " NextDate= '"
				+ JProjectUtil.getDateFormaterCommon().format(vDetail.getNextDate()) + "'" + " WHERE BillNum="
				+ vDetail.getBillNo();
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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

	}

	@Override
	public ArrayList<TblVendorDetail> getMemorizeTransactionList() {
		// TODO Auto-generated method stub
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<TblVendorDetail> vDetail = new ArrayList<TblVendorDetail>();

//		String sql = " SELECT bill.*, bca_account.Name AS AccountName FROM bca_bill AS bill "
//				+ " LEFT JOIN bca_account ON bill.PayerID = bca_account.AccountID" + " where bill.CompanyID ="
//				+ ConstValue.companyId + " AND bill.IsMemorized = 1";
		try {
			List<Object[]> list = bcaBillRepository.findMemorizeTransactionList(new Long(ConstValue.companyId));
			for (Object obj[] : list) {
				TblVendorDetail detail = new TblVendorDetail();
				detail.setBillNo((Integer) obj[0]);
				detail.setTransactionName((String) obj[1]);
				detail.setBankAccount((String) obj[2]);
				detail.setAmount((Double) obj[3]);
				detail.setRecurringPeriod((String) obj[4]);
				detail.setRemindOption((Integer) obj[5]);
				detail.setNextDate(offsetDateTimeToDate((OffsetDateTime) obj[6]));
				detail.setRecurringNumber((Integer) obj[7]);
				detail.setDaysInAdvanceToEnter((Integer) obj[8]);

				vDetail.add(detail);
			}
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				TblVendorDetail detail = new TblVendorDetail();
//				detail.setBillNo(rs.getInt("BillNum"));
//				detail.setTransactionName(rs.getString("TransactionName"));
//				detail.setBankAccount(rs.getString("AccountName"));
//				detail.setAmount(rs.getDouble("AmountDue"));
//				detail.setRecurringPeriod(rs.getString("RecurringPeriod"));
//				detail.setRemindOption(rs.getInt("RemindOption"));
//				detail.setNextDate(rs.getDate("Nextdate"));
//				detail.setRecurringNumber(rs.getInt("RecurringNumber"));
//				detail.setDaysInAdvanceToEnter(rs.getInt("DaysInAdvanceToEnter"));
//
//				vDetail.add(detail);
//
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return vDetail;
	}

	@Override
	public void deleteBill(int billNo) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "UPDATE bca_bill SET IsMemorized=0" + " WHERE BillNum=" + billNo + " AND CompanyID="
				+ ConstValue.companyId;
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	@Override
	public ArrayList<TblVendorDetail> getPayBillsLists(Date dateFormat) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		ArrayList<TblVendorDetail> vDetail = new ArrayList<TblVendorDetail>();

		String sql = " SELECT a.firstname," + " a.lastname," + " a.NAME," + " a.clientvendorid," + " b.amountdue,"
				+ " b.duedate," + " b.billnum," + " b.creditused," + " b.amountpaid," + " b.balance," + " b.payerid,"
				+ " acc.Name AS AccountName" + " FROM bca_clientvendor a" + " LEFT JOIN bca_bill AS b"
				+ " ON a.clientvendorid = b.vendorid" + " LEFT JOIN bca_account AS acc"
				+ " ON b.PayerID = acc.AccountID" + " WHERE  a.companyid =" + ConstValue.companyId
				+ " AND ( a.deleted = 0 " + " OR a.active = 1 )" + " AND a.status IN ( 'U', 'N' )"
				+ " AND a.cvtypeid IN ( 1, 3 )" + " AND b.billtype = 0" + " AND b.status IN ( 0, 2 )"
				+ " AND b.duedate <= '" + JProjectUtil.getDateFormaterCommon().format(dateFormat) + "'"
				+ " ORDER  BY b.duedate  ";

		try {
//			String format = JProjectUtil.getDateFormaterCommon().format(dateFormat);
//			List<Object[]>list=bcaClientvendorRepository.findPayBillsLists(new Long(ConstValue.companyId), format);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				TblVendorDetail detail = new TblVendorDetail();
				detail.setBillNo(rs.getInt("BillNum"));
				detail.setVendorName(rs.getString("FirstName") + " " + rs.getString("LastName"));
				detail.setDueDate(JProjectUtil.getdateFormat().format(rs.getDate("DueDate")));
				detail.setAmount(rs.getDouble("AmountDue"));
				detail.setCreditUsed(rs.getDouble("CreditUsed"));
				detail.setAmountTopay(rs.getDouble("Balance"));
				detail.setBankAccount(rs.getString("AccountName"));
				vDetail.add(detail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return vDetail;
	}

	@Override
	public ArrayList<TblCategoryDto> getAllCategories() {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		ArrayList<TblCategoryDto> vRoot = new ArrayList<TblCategoryDto>();
		ArrayList<TblCategoryDto> vSub = new ArrayList<TblCategoryDto>();

		String sql1 = " Select * from bca_category" + " where CompanyID = " + ConstValue.companyId
				+ " and isActive = 1 " + " and Parent = 'root' " + " order by CategoryTypeID,Name ";

		String sql2 = " Select * from bca_category " + " where CompanyID = " + ConstValue.companyId
				+ " and isActive = 1 " + " and NOT (Parent = 'root') " + " order by CategoryTypeID,Name desc ";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql1);

			while (rs.next()) {
				TblCategoryDto r = new TblCategoryDto();
				r.setId(rs.getInt("CategoryID"));
				r.setCategoryTypeID(rs.getLong("CategoryTypeID"));
				r.setParent(rs.getString("Parent"));
				r.setDescription(rs.getString("Description"));
				r.setName(rs.getString("Name"));
				r.setCategoryNumber(rs.getString("CateNumber"));
				r.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));

				vRoot.add(r);

			}
			rs = stmt.executeQuery(sql2);

			while (rs.next()) {
				TblCategoryDto r1 = new TblCategoryDto();
				r1.setId(rs.getInt("CategoryID"));
				r1.setCategoryTypeID(rs.getLong("CategoryTypeID"));
				r1.setParent(rs.getString("Parent"));
				r1.setDescription(rs.getString("Description"));
				r1.setName(rs.getString("Name"));
				r1.setCategoryNumber(rs.getString("CateNumber"));
				r1.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));

				vSub.add(r1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		int i = 0;
		while (i < vRoot.size()) {
			int j = 0;
			String id_root = Long.toString(vRoot.get(i).getId());
			while (j < vSub.size()) {
				String id_sub = vSub.get(j).getParent();
				if (id_root.equals(id_sub)) {
					int subLevel = vRoot.get(i).getSubLevel();

					vSub.get(j).setSubLevel(subLevel + 1);

					vRoot.add(i + 1, vSub.get(j));

					vSub.remove(j);

				} else {
					j++;
				}
			}
			i++;
		}

		vRoot.add(0, new TblCategoryDto());
		vSub = null;
		return vRoot;
	}

	@Override
	public int getmaxBill() {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		int maxBillId = 0;

		String sql = "SELECT max(BillNUm) AS BillNumber FROM bca_bill WHERE CompanyID = " + ConstValue.companyId;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				maxBillId = rs.getInt("BillNumber");
				maxBillId += 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return maxBillId;
	}

	@Override
	public void insertNewBill(TblVendorDetail vDetail) throws ParseException {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
		Date DueDate = new SimpleDateFormat("dd-MM-yyyy").parse(vDetail.getDueDate());
		String DueDate1 = DATE_FORMAT.format(DueDate);

		String sql = "INSERT into bca_bill(VendorId,PayerID,CompanyID,DateAdded,DueDate,AmountDue,Status,Memo,BillType,Balance,NextDate,CategoryID,ServiceID) Values("
				+ vDetail.getVendorId() + "," + vDetail.getAccountId() + "," + ConstValue.companyId + "," + "'"
				+ DATE_FORMAT.format(new Date()) + "'" + "," + "'" + DueDate1 + "'" + "," + vDetail.getAmount() + ","
				+ 0 + "," + "'" + vDetail.getMemo() + "'" + "," + vDetail.getBillType() + "," + vDetail.getAmount()
				+ "," + "'" + DueDate1 + "'" + "," + vDetail.getCategoryID() + "," + -1 + ")";

		String sql1 = "INSERT into bca_billdetail(BillNum,ExpenseAcctID,ExpenseAmount,ExpenseMemo,ExpenseClientVendorID,CompanyID,DetailType,Billable)"
				+ "Values(" + vDetail.getBillNo() + "," + vDetail.getExpenseAccountId() + "," + vDetail.getAmount()
				+ "," + "'" + vDetail.getExpenseMemo() + "'" + "," + vDetail.getExpenseClientVendorId() + ","
				+ ConstValue.companyId + "," + 0 + "," + vDetail.getBillAble() + ")";

		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			stmt.executeUpdate(sql1);
		} catch (SQLException e) {
			e.printStackTrace();

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

	@Override
	public TblRecurrentPaymentPlan getPlanOfCvID(int cvId) {
		// TODO Auto-generated method stub

		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		TblRecurrentPaymentPlan recurrentPayment = null;

		String sql = " SELECT *," + " Ptype.NAME AS PaymentTypeName," + " Account.Name AS AccountName "
				+ " FROM   bca_recurrentpaymentplan AS Rplan" + " LEFT JOIN bca_paymenttype AS Ptype"
				+ " ON Rplan.paymenttypeid = Ptype.paymenttypeid" + " LEFT JOIN bca_account AS Account"
				+ " ON Rplan.PaymentAccountID = Account.AccountID" + " WHERE  Rplan.payeeid =" + cvId
				+ " AND Rplan.active = 1" + " AND Rplan.status <> 'Canceled'  ";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				recurrentPayment = new TblRecurrentPaymentPlan();
				recurrentPayment.setPlanID(rs.getInt("PlanID"));
				recurrentPayment.setPayeeID(rs.getInt("PayeeID"));
				recurrentPayment.setPaymentAccountID(rs.getInt("PaymentAccountID"));
				recurrentPayment.setPaymentTypeID(rs.getInt("PaymentTypeID"));

				String paymentType = rs.getString("PaymentTypeName");
				if (paymentType != null && paymentType.equals("Checking"))
					recurrentPayment.setIsToBePrinted(true);
				recurrentPayment.setAmount(rs.getDouble("Amount"));
				recurrentPayment.setSamePaymentAmount(rs.getBoolean("SamePaymentAmount"));
				recurrentPayment.setLastPaymentAmount(rs.getDouble("LastPaymentAmount"));
				recurrentPayment.setFirstPaymentDate(rs.getString("FirstPaymentDate"));
				recurrentPayment.setFrequency(rs.getString("Frequency"));
				recurrentPayment.setDays(rs.getInt("Days"));
				recurrentPayment.setRecurrentOption(rs.getInt("RecurrentOption"));
				recurrentPayment.setNumberOfPayments(rs.getInt("NumberOfPayments"));
				recurrentPayment.setStatus(rs.getString("Status"));
				recurrentPayment.setPlanSetupDate(rs.getString("PlanSetupDate"));
				recurrentPayment.setLastPaymentDate(rs.getString("LastPaymentDate"));
				recurrentPayment.setMemo(rs.getString("Memo"));
				recurrentPayment.setCustomerCurrentBalance(rs.getDouble("CustomerCurrentBalance"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return recurrentPayment;
	}

	@Override
	public void insertRecurrentPaymentPlan(TblRecurrentPaymentPlan payment, boolean active) throws ParseException {
		// TODO Auto-generated method stub

		String sql = "";
		int planID = -1;
		Date firstPaymentDate = null;
		Date planSetupdate = null;
		Date lastPaymentDate = null;

		if (payment.getPlanID() == -1) {
			// Add New Payment Plan
			planID = getPlanId();
			payment.setPlanID(planID);
		}
		if (payment.getRecurrentOption() == 1) {
			int frequency = payment.getDays();
			int noOfPayments = payment.getNumberOfPayments();
			int days = frequency * noOfPayments;
			Calendar calendar = getCalendar(payment.getFirstPaymentDate());
			calendar.add(Calendar.DATE, days);
			payment.setLastPaymentDate(JProjectUtil.dateFormat.format(calendar.getTime()));
		} else if (payment.getRecurrentOption() == 2) {
			int noOfPayments = calculateNoOfPayments(payment.getFirstPaymentDate(), payment.getLastPaymentDate(),
					payment.getDays());
			payment.setNumberOfPayments(noOfPayments);
		}
		try {

			firstPaymentDate = JProjectUtil.getDateForBanking().parse(payment.getFirstPaymentDate());

		} catch (Exception e) {
			firstPaymentDate = JProjectUtil.getdateFormat().parse(payment.getFirstPaymentDate());
		}
		try {
			lastPaymentDate = JProjectUtil.getDateForBanking().parse(payment.getLastPaymentDate());

		} catch (Exception e1) {
			lastPaymentDate = JProjectUtil.getdateFormat().parse(payment.getLastPaymentDate());
		}

		sql = " INSERT INTO bca_recurrentpaymentplan "
				+ " (PlanID,PayeeID,PaymentAccountID,PaymentTypeID,Amount,SamePaymentAmount,LastPaymentAmount,"
				+ "  FirstPaymentDate ,Frequency ,Days ,RecurrentOption,NumberOfPayments,Status,PlanSetupDate,Active,LastPaymentDate,Memo,ServiceID)"
				+ "  VALUES( " + payment.getPlanID() + "," + payment.getPayeeID() + "," + payment.getPaymentAccountID()
				+ "," + payment.getPaymentTypeID() + "," + payment.getAmount() + ","
				+ (payment.isSamePaymentAmount() == true ? 1 : 0) + "," + payment.getLastPaymentAmount() + ",'"
				+ JProjectUtil.getdateFormat().format(firstPaymentDate) + "','" + payment.getFrequency() + "',"
				+ payment.getDays() + "," + payment.getRecurrentOption() + "," + payment.getNumberOfPayments() + ",'"
				+ payment.getStatus() + "','"
				+ JProjectUtil.getdateFormat().format(JProjectUtil.getdateFormat().parse(payment.getPlanSetupDate()))
				+ "'," + (active == true ? 1 : 0) + ",'" + JProjectUtil.getdateFormat().format(lastPaymentDate) + "','"
				+ payment.getMemo() + "'," + payment.getServiceID() + ")";

		Connection con = null;
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			insertRecurrentPayments(payment, planID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public void insertRecurrentPayments(TblRecurrentPaymentPlan payment, int planID) {
		switch (payment.getRecurrentOption()) {
		case 0:
			payment.setNumberOfPayments(1);
		case 1:
		case 2:
			insertRecurrentPayments(payment);
			break;
		}
	}

	public void insertRecurrentPayments(TblRecurrentPaymentPlan recurrentPlan) {
		PreparedStatement pst = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		String sql = " INSERT INTO bca_recurrentpayment"
				+ " (Amount,PaymentTypeID,PayerID,PayeeID,Deleted,PaymentDate,PlanID,Status,CompanyID,Memo,ServiceID,IsToBePrinted)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		;
		try {
			pst = con.prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for (int i = 0; i < recurrentPlan.getNumberOfPayments(); i++) {

			try {
				if (i == recurrentPlan.getNumberOfPayments() - 1 && recurrentPlan.getLastPaymentAmount() > 0) {
					pst.setDouble(1, recurrentPlan.getLastPaymentAmount());
				} else {
					pst.setDouble(1, recurrentPlan.getAmount());
				}
				pst.setInt(2, recurrentPlan.getPaymentTypeID());
				pst.setInt(3, recurrentPlan.getPaymentAccountID());
				pst.setInt(4, recurrentPlan.getPayeeID());
				pst.setInt(5, 0);
				Calendar calendar = getCalendar(recurrentPlan.getFirstPaymentDate());
				pst.setString(6, JProjectUtil.getDateFormaterCommon().format(calendar.getTime()));
				pst.setInt(7, recurrentPlan.getPlanID());
				pst.setString(8, "Scheduled");
				pst.setInt(9, ConstValue.companyId);
				pst.setString(10, recurrentPlan.getMemo());
				pst.setInt(11, (int) recurrentPlan.getServiceID());
				pst.setInt(12, (recurrentPlan.isToBePrinted() == true ? 1 : 0));
				pst.addBatch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				Loger.log(e.toString());
			}

			Calendar calendar1 = getCalendar(recurrentPlan.getFirstPaymentDate());
			calendar1.add(Calendar.DATE, recurrentPlan.getDays());
			recurrentPlan.setFirstPaymentDate(JProjectUtil.getdateFormat().format(calendar1.getTime()));
			if (recurrentPlan.getRecurrentOption() == 0) {
				recurrentPlan.setLastPaymentDate(JProjectUtil.dateFormat.format(calendar1.getTime()));
				updateRecurrentPlan(recurrentPlan);
			}
		}
		try {
			pst.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		} finally {
			try {
				if (pst != null) {
					db.close(pst);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

	}

	public void updateRecurrentPlan(TblRecurrentPaymentPlan recurrentPaymentPlan) {
		Statement stmt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sql = "UPDATE bca_recurrentpaymentplan " + " SET LastPaymentDate='"
				+ recurrentPaymentPlan.getLastPaymentDate() + "'" + " WHERE PlanID=" + recurrentPaymentPlan.getPlanID();

		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	private int calculateNoOfPayments(String firstPaymentDate, String lastPaymentDate, int days) {
		long diffDays = 0;
		try {
			if (firstPaymentDate.equals(lastPaymentDate))
				return 1;

			Calendar fCal = getCalendar(firstPaymentDate);
			Calendar lCal = getCalendar(lastPaymentDate);
			// Get difference in milliseconds
			long diffMillis = lCal.getTimeInMillis() - fCal.getTimeInMillis();
			// Get difference in days
			diffDays = diffMillis / (24 * 60 * 60 * 1000);
			diffDays = diffDays / days;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return (int) diffDays;
	}

	public Calendar getCalendar(String firstPaymentDate) {
		Calendar fCal = null;
		firstPaymentDate = firstPaymentDate.replaceAll("/", "-");
		Date fPaymentDate = null;
		try {
			fPaymentDate = JProjectUtil.getDateForBanking().parse(firstPaymentDate);
			Calendar c1 = Calendar.getInstance();
			c1.setTime(fPaymentDate);
			fCal = new GregorianCalendar(c1.get(Calendar.YEAR), c1.get(Calendar.MONTH), c1.get(Calendar.DAY_OF_MONTH));

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			try {
				fPaymentDate = JProjectUtil.getdateFormat().parse(firstPaymentDate);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Calendar c1 = Calendar.getInstance();
			c1.setTime(fPaymentDate);
			fCal = new GregorianCalendar(c1.get(Calendar.YEAR), c1.get(Calendar.MONTH), c1.get(Calendar.DAY_OF_MONTH));

		}
		return fCal;
	}

	public int getPlanId() {
		int planId = 0;
		Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();

		String sSQL = " SELECT MAX(PlanID) as pID" + " FROM bca_recurrentpaymentplan";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sSQL);

			if (rs.next()) {
				planId = rs.getInt("pID");
				planId++;
			} else {
				planId = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return planId;
	}

	@Override
	public void updateRecurrentPayment(TblRecurrentPaymentPlan rPayment) {
		// TODO Auto-generated method stub
		updatePlan(rPayment.getPlanID(), false, false);
		updateRecurrentPayments(rPayment.getPlanID(), true, false);
		try {
			insertRecurrentPaymentPlan(rPayment, true);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
	}

	public void updatePlan(int planID, boolean active, boolean status) {
		Statement stmt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		String sSQL = "";
		if (status) {
			sSQL = "  UPDATE bca_recurrentpaymentplan " + " SET Status='Canceled'" + " Where PlanID=" + planID;
		} else {
			sSQL = "  UPDATE bca_recurrentpaymentplan " + " SET Active=" + (active == true ? 1 : 0) + ","
					+ " Status='Scheduled'" + " Where PlanID=" + planID;
		}

		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sSQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	public void updateRecurrentPayments(int planID, boolean isDeleted, boolean status) {
		Statement stmt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		String sSQL = "";

		if (status) {
			sSQL = " UPDATE bca_recurrentpayment  " + " SET Status='Canceled'" + " Where PlanID=" + planID
					+ " AND Status='Scheduled'";
		} else {
			sSQL = "  UPDATE bca_recurrentpayment  " + " SET Deleted=" + (isDeleted == true ? 1 : 0) + " Where PlanID="
					+ planID;
		}
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sSQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
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
	}

	@Override
	public TblCategoryDto getCategoryCategoryDetails(String categoryId) {
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		ResultSet rs = null;
		TblCategoryDto tblCategory = null;

		String sql1 = "SELECT * FROM bca_category WHERE CategoryID=" + categoryId;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql1);
			while (rs.next()) {
				tblCategory = new TblCategoryDto();
				tblCategory.setId(rs.getInt("CategoryID"));
				tblCategory.setCategoryTypeID(rs.getLong("CategoryTypeID"));
				tblCategory.setParent(rs.getString("Parent"));
				tblCategory.setDescription(rs.getString("Description"));
				tblCategory.setName(rs.getString("Name"));
				tblCategory.setCategoryNumber(rs.getString("CateNumber"));
				tblCategory.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
				tblCategory.setSubLevel(1);
				tblCategory.setActive(rs.getBoolean("isActive"));
			}
		} catch (SQLException e) {
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
		return tblCategory;
	}

//	@Override
//	public ArrayList<TblCategoryDto> getListOfCategoryForCategoryManager() {
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		Connection con = db.getConnection();
//		ResultSet rs = null;
//
//		ArrayList<TblCategoryDto> vRoot = new ArrayList<>();
//		ArrayList<TblCategoryDto> vSub = new ArrayList<>();
//		ArrayList<TblCategoryDto> cList = new ArrayList<>();
//
//		String sql1 = " SELECT a.*,b.CategoryTypeName FROM bca_category a, bca_categorytype b WHERE a.categorytypeid = b.categorytypeid "
//				+ " AND a.isActive=1 AND a.companyid=" + ConstValue.companyId + " ORDER BY a.CateNumber";
//
////		String sql2 = " SELECT * FROM   bca_category a, bca_categorytype b WHERE  a.categorytypeid = b.categorytypeid "
////				+ " AND a.companyid =" + ConstValue.companyId + " AND a.isactive = 1 AND NOT ( parent='root' )"
////				+ " ORDER  BY a.CateNumber";
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
//			while (rs.next()) {
//				TblCategoryDto r = new TblCategoryDto();
//				r.setId(rs.getInt("CategoryID"));
//				r.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				r.setParent(rs.getString("Parent"));
//				r.setCategoryTypeName(rs.getString("CategoryTypeName"));
//				r.setDescription(rs.getString("Description"));
//				r.setName(rs.getString("Name"));
//				r.setCategoryNumber(rs.getString("CateNumber"));
//				r.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
//				TblBudgetCategory budget = getObjectOfID(rs.getInt("BudgetCategoryID"));
//				r.setBudgetCategoryName(budget.getBudgetCategoryName());
//				r.setActive(rs.getBoolean("isActive"));
//				r.setSubLevel(1);
//				vRoot.add(r);
//			}
////			rs = stmt.executeQuery(sql2);
////			while(rs.next()) {
////				TblCategoryDto r1 = new TblCategory();
////				r1.setId(rs.getInt("CategoryID"));
////				r1.setCategoryTypeID(rs.getLong("CategoryTypeID"));
////				r1.setParent(rs.getString("Parent"));
////				r1.setCategoryTypeName(rs.getString("CategoryTypeName"));
////				r1.setDescription(rs.getString("Description"));
////				r1.setName(rs.getString("Name"));
////				r1.setCategoryNumber(rs.getString("CateNumber"));
////				r1.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
////				TblBudgetCategory budget = getObjectOfID(rs.getInt("BudgetCategoryID"));
////				r1.setBudgetCategoryName(budget.getBudgetCategoryName());
////				vSub.add(r1);
////			}
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
////	   	int i = 0;
////		while (i < vRoot.size()) {
////			int j = 0;
////			String id_root = Long.toString(vRoot.get(i).getId());
////			while (j < vSub.size()) {
////				String id_sub = vSub.get(j).getParent();
////				if (id_root.equals(id_sub)) {
////					int subLevel = vRoot.get(i).getSubLevel();
////					vSub.get(j).setSubLevel(subLevel + 1);
////					vRoot.add(i + 1, vSub.get(j));
////					vSub.remove(j);
////				} else {
////					j++;
////				}
////			}
////			i++;
////		}
////		cList = sort(vRoot);
//		return vRoot;
//	}
	@Override
	public ArrayList<TblCategoryDto> getListOfCategoryForCategoryManager() {

		ArrayList<TblCategoryDto> vRoot = new ArrayList<>();
//		ArrayList<TblCategoryDto> vSub = new ArrayList<>();
//		ArrayList<TblCategoryDto> cList = new ArrayList<>();

		try {
//			int companyId=ConstValue.companyId;
			Long companyId = new Long(ConstValue.companyId);
			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(companyId);
			List<Object[]> findCategory = bcaCategoryRepository.findCategory(bcaCompany);
			for (Object[] listOfCategory : findCategory) {
				BcaCategory bcaCategory = (BcaCategory) listOfCategory[0];
				String categoryTypeName = (String) listOfCategory[1];
				TblCategoryDto tblCategoryDto = new TblCategoryDto();
				tblCategoryDto.setId(bcaCategory.getCategoryId());
				tblCategoryDto.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				tblCategoryDto.setParent(bcaCategory.getParent());
				tblCategoryDto.setCategoryTypeName(categoryTypeName);
				tblCategoryDto.setDescription(bcaCategory.getDescription());
				tblCategoryDto.setName(bcaCategory.getName());
				tblCategoryDto.setCategoryNumber(bcaCategory.getCateNumber());
				tblCategoryDto.setBudgetCategoryID(bcaCategory.getBudgetCategoryId());
				TblBudgetCategory budget = getObjectOfID(bcaCategory.getBudgetCategoryId());
				tblCategoryDto.setBudgetCategoryName(budget.getBudgetCategoryName());
				tblCategoryDto.setActive(bcaCategory.getIsActive());
				tblCategoryDto.setSubLevel(1);
				vRoot.add(tblCategoryDto);

			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}

		return vRoot;
	}

	public TblBudgetCategory getObjectOfID(int id) {
		int i = 0;
		for (i = 0; i < vRows.size(); i++) {
			TblBudgetCategory obj = vRows.get(i);
			if (obj.getBudgetCategoryID() == id)
				return vRows.get(i);
		}
		return new TblBudgetCategory();
	}

	public ArrayList<TblCategoryDto> sort(ArrayList<TblCategoryDto> catList) {
		ArrayList<TblCategoryDto> category = new ArrayList<TblCategoryDto>();
		String[] sortBy = { "ASSETS", "INCOME", "EXPENSE", "PAYROLL" };
		for (int c = 0; c < sortBy.length; c++) {
			int c1 = 0;
			while (c1 < catList.size()) {
				TblCategoryDto d = (TblCategoryDto) catList.get(c1);
				String strType = d.getCategoryTypeName().trim();
				if (strType.equals(sortBy[c])) {
					category.add(d);
					catList.remove(c1);
				} else {
					c1++;
				}
			}
		}
		return category;
	}

	public ArrayList<TblBudgetCategory> readBudgetCategory() {
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		ResultSet rs = null;
		ArrayList<TblBudgetCategory> vTemp = new ArrayList<>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM bca_budgetcategory WHERE isActive =1 ORDER BY BudgetCategoryNumber");
			while (rs.next()) {
				TblBudgetCategory row = new TblBudgetCategory();
				row.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
				row.setBudgetCategoryName(rs.getString("BudgetCategoryName"));
				row.setBudgetCategoryNumber(rs.getInt("BudgetCategoryNumber"));
				row.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
				row.setThreshold(rs.getDouble("Threshold"));
				vTemp.add(row);
			}
		} catch (SQLException e) {
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
		vRows = (ArrayList<TblBudgetCategory>) vTemp.clone();
		vTemp = null;
		return vRows;
	}

	@Autowired
	private BcaCategorytypeRepository categoryTypeRepository;

	@Override
	public ArrayList<TblCategoryType> getCategoryType() {

		ArrayList<TblCategoryType> categoryType = new ArrayList<>();

		try {
			List<BcaCategorytype> categoryTypes = categoryTypeRepository.findByIsActiveOrderByCategoryTypeNameAsc(true);
			for (BcaCategorytype catType : categoryTypes) {
				TblCategoryType type = new TblCategoryType();
				type.setCategoryTypeID(catType.getCategoryTypeId());
				type.setCategoryTypeName(catType.getCategoryTypeName());
				categoryType.add(type);
			}
			// categoryType.addAll(categoryTypes);
		} catch (Exception e) {
			Loger.log(e.toString());
			// Handle or rethrow the exception as appropriate
		}

		return categoryType;
	}
//	public ArrayList<TblCategoryType> getCategoryType() {
//
//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//		ArrayList<TblCategoryType> categoryType = new ArrayList<TblCategoryType>();
//		String sql = "SELECT * FROM bca_categorytype WHERE isActive = 1 ORDER BY CategoryTypeName";
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				TblCategoryType type = new TblCategoryType();
//				type.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				type.setCategoryTypeName(rs.getString("CategoryTypeName"));
//				categoryType.add(type);
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
//		return categoryType;
//	}

	@Override
	public boolean saveCategory(TblCategoryDto category) {
		Statement stmt = null, stmt2 = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		boolean b = false;
		int i = 0;
		String strParent = "root";
		String cateNumber = "-1";
		if (category.getCategoryNumber() != null) {
			cateNumber = category.getCategoryNumber().trim();
		}
		try {
			if (category.isSubAccountOf()) {
				String sql = "Select * from bca_category WHERE CategoryID =" + category.getParent();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					long parentCatType = rs.getInt("CategoryTypeID");
					String catParent = rs.getString("Parent");
					if (parentCatType == category.getCategoryTypeID()) {
						if (catParent.equals("root")) {
							strParent = rs.getString("CategoryID");
						} else {
							strParent = catParent;
						}
					}
				}
			}

			String sql2 = "INSERT INTO bca_category (CategoryTypeID,Name,CateNumber,Parent,Description,CompanyID,BudgetCategoryID,isActive) "
					+ " VALUES (?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql2);
			pstmt.setLong(1, category.getCategoryTypeID());
			pstmt.setString(2, category.getName().trim());
			pstmt.setString(3, cateNumber);
			pstmt.setString(4, strParent);
			pstmt.setString(5, category.getDescription().trim());
			pstmt.setInt(6, ConstValue.companyId);
			pstmt.setInt(7, category.getBudgetCategoryID());
			pstmt.setInt(8, 1);
			i = pstmt.executeUpdate();

			String sql3 = " UPDATE bca_budgetcategory SET Threshold = " + Double.parseDouble("2.2E-306")
					+ " WHERE BudgetCategoryID = " + category.getBudgetCategoryID();
			stmt2 = con.createStatement();
			stmt2.executeUpdate(sql3);
		} catch (SQLException e) {
			Loger.log(e.toString());
		} finally {
			try {
				if (i > 0)
					b = true;
				if (rs != null)
					db.close(rs);
				if (stmt != null)
					db.close(stmt);
				if (stmt2 != null)
					db.close(stmt2);
				if (pstmt != null)
					db.close(pstmt);
				if (con != null)
					db.close(con);
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return b;
	}

	@Override
	public void updateCategory(TblCategoryDto category, String categoryId) {
		Statement stmt = null, stmt1 = null, stmt2 = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;

		String strParent = "root";
		String cateNumber = "-1";
		if (category.getCategoryNumber() != null) {
			cateNumber = category.getCategoryNumber().trim();
		}
		try {
			if (category.isSubAccountOf()) {
				String sql = "Select * from bca_category WHERE CategoryID =" + category.getParent();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					long parentCatType = rs.getInt("CategoryTypeID");
					String catParent = rs.getString("Parent");
					if (parentCatType == category.getCategoryTypeID()) {
						if (catParent.equals("root")) {
							strParent = rs.getString("CategoryID");
						} else {
							strParent = catParent;
						}
					}
				}
			}
			String CategoryID = categoryId;
			String sql = "UPDATE bca_category SET " + " CategoryTypeID = " + category.getCategoryTypeID() + ","
					+ " Name = " + "'" + category.getName().replaceAll("'", "''") + "'," + " CateNumber = " + "'"
					+ cateNumber + "'," + " Parent = " + "'" + strParent + "'," + " Description = " + "'"
					+ category.getDescription().replaceAll("'", "''") + "'," + " BudgetCategoryID = "
					+ category.getBudgetCategoryID() + " WHERE CategoryID = " + CategoryID;

			stmt1 = con.createStatement();
			int count = stmt1.executeUpdate(sql);

			String sql_1 = " UPDATE bca_budgetcategory SET Threshold = " + Double.parseDouble("2.2E-306")
					+ " WHERE BudgetCategoryID = " + category.getBudgetCategoryID();
			stmt2 = con.createStatement();
			stmt2.executeUpdate(sql_1);
		} catch (SQLException e) {
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null)
					db.close(rs);
				if (stmt != null)
					db.close(stmt);
				if (stmt1 != null)
					db.close(stmt1);
				if (stmt2 != null)
					db.close(stmt2);
				if (con != null)
					db.close(con);
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
	}

	@Override
	public boolean checkCategory(String categoryId) {
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		ResultSet rs = null;
		boolean b = false;
		String sql2 = " SELECT * FROM bca_category a, bca_categorytype b "
				+ " WHERE  a.categorytypeid = b.categorytypeid AND a.companyid =" + ConstValue.companyId
				+ " AND a.isactive = 1" + " AND parent =" + categoryId
				+ " ORDER  BY b.categorytypename, a.NAME, a.budgetcategoryid";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql2);
			if (rs.next()) {
				b = true;
			}
		} catch (SQLException e) {
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
		return b;
	}

	@Override
	public boolean isCategoryID_using(int categoryId) {
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		Connection con = db.getConnection();
		ResultSet rs = null;
		boolean b = false;
		int howMany = 0;
		String sql = " SELECT COUNT(*) as howmany FROM bca_invoice " + " WHERE CategoryID = " + categoryId
				+ " AND CompanyID = " + ConstValue.companyId;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				howMany = rs.getInt("howmany");
				if (howMany > 0) {
					b = true;
				}
			}
		} catch (SQLException e) {
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
		return b;
	}

	@Override
	public void deleteCategory(int categoryId) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		try {
			String sql = "Update bca_category SET isActive=0 WHERE CategoryID = " + categoryId + " AND CompanyID = "
					+ ConstValue.companyId;
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			Loger.log(e.toString());
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
	}

	@Override
	public ArrayList<TblPaymentDto> getPaymentsList(TblPaymentDto payment, Date fromDate, Date toDate) {
		Statement stmt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		ArrayList<TblPaymentDto> listOfPayments = new ArrayList<>();
		String sql = "";
		sql = "SELECT a.paymentid,a.amount,a.paymenttypeid,a.invoiceid,a.dateadded,a.istobeprinted,a.isneedtodeposit,a.PayerID,a.checknumber,"
				+ " c.Name AS CategoryName,c.BudgetCategoryID,b.BudgetCategoryName,cl.Name AS CompanyName "
				+ " FROM bca_payment As a" + " LEFT JOIN bca_category As c ON a.CategoryID = c.CategoryID"
				+ " LEFT JOIN bca_budgetcategory AS b ON c.BudgetCategoryID = b.BudgetCategoryID"
				+ " LEFT JOIN bca_clientvendor AS cl ON a.ClientVendorID = cl.ClientVendorID"
				+ " WHERE a.deleted = 0 AND a.CompanyID =" + ConstValue.companyId + " AND c.CompanyID ="
				+ ConstValue.companyId + " AND b.CompanyID =" + ConstValue.companyId + " AND cl.Status IN ('U','N')";
		if (payment.getAccountID() > 0) {
			sql = sql + " AND a.PayerID =" + payment.getAccountID();
		}
		if (payment.getCategoryId() > 0) {
			sql = sql + " AND a.CategoryID =" + payment.getCategoryId();
		}
		sql = sql + " ORDER BY a.dateadded ASC";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				TblPaymentDto payment1 = new TblPaymentDto();
				payment1.setId(rs.getInt("PaymentID"));
				payment1.setAmount(rs.getDouble("Amount"));
				payment1.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				payment1.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
				payment1.setToBePrinted(rs.getBoolean("IsToBePrinted"));
				payment1.setNeedToDeposit(rs.getBoolean("isNeedtoDeposit"));
				payment1.setCheckNumber(rs.getString("CheckNumber"));
				payment1.setCategoryName(rs.getString("CategoryName"));
				payment1.setBudgetCategoryName(rs.getString("BudgetCategoryName"));
				payment1.setCompanyName(rs.getString("CompanyName"));

				if (fromDate != null && toDate != null && payment1.getDateAdded().compareTo(fromDate) >= 0
						&& payment1.getDateAdded().compareTo(toDate) <= 0) {
					listOfPayments.add(payment1);
				} else {
					listOfPayments.add(payment1);
				}
			}
		} catch (SQLException e) {
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null)
					db.close(rs);
				if (stmt != null)
					db.close(stmt);
				if (con != null)
					db.close(con);
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return listOfPayments;
	}

	@Override
	public ArrayList<TblPaymentDto> getDepositsList(TblPaymentDto payment, Date fromDate, Date toDate) {
		Statement stmt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		ArrayList<TblPaymentDto> listOfPayments = new ArrayList<TblPaymentDto>();
		String sql = "";
		sql = "SELECT a.paymentid,a.amount,a.paymenttypeid,a.invoiceid,a.dateadded,a.istobeprinted,a.isneedtodeposit,a.PayeeID,a.checknumber,"
				+ " c.Name AS CategoryName,c.BudgetCategoryID,b.BudgetCategoryName,cl.Name AS CompanyName"
				+ " FROM bca_payment As a" + " LEFT JOIN bca_category As c ON a.CategoryID = c.CategoryID"
				+ " LEFT JOIN bca_budgetcategory AS b ON c.BudgetCategoryID = b.BudgetCategoryID"
				+ " LEFT JOIN bca_clientvendor AS cl ON a.ClientVendorID = cl.ClientVendorID"
				+ " WHERE a.deleted = 0 AND a.CompanyID =" + ConstValue.companyId + " AND c.CompanyID ="
				+ ConstValue.companyId + " AND b.CompanyID =" + ConstValue.companyId + " AND cl.Status IN ('U','N')";
		if (payment.getAccountID() > 0) {
			sql = sql + " AND a.PayerID =" + payment.getAccountID();
		}
		if (payment.getCategoryId() > 0) {
			sql = sql + " AND a.CategoryID =" + payment.getCategoryId();
		}
		sql = sql + " ORDER BY a.dateadded ASC";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				TblPaymentDto payment1 = new TblPaymentDto();
				payment1.setId(rs.getInt("PaymentID"));
				payment1.setAmount(rs.getDouble("Amount"));
				payment1.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				payment1.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
				payment1.setToBePrinted(rs.getBoolean("IsToBePrinted"));
				payment1.setNeedToDeposit(rs.getBoolean("isNeedtoDeposit"));
				payment1.setCheckNumber(rs.getString("CheckNumber"));
				payment1.setCategoryName(rs.getString("CategoryName"));
				payment1.setBudgetCategoryName(rs.getString("BudgetCategoryName"));
				payment1.setCompanyName(rs.getString("CompanyName"));

				if (fromDate != null && toDate != null && payment1.getDateAdded().compareTo(fromDate) >= 0
						&& payment1.getDateAdded().compareTo(toDate) <= 0) {
					listOfPayments.add(payment1);
				} else {
					listOfPayments.add(payment1);
				}
			}
		} catch (SQLException e) {
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null)
					db.close(rs);
				if (stmt != null)
					db.close(stmt);
				if (con != null)
					db.close(con);
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return listOfPayments;
	}

	@Override
	public ArrayList<TblPaymentDto> getPaymentOfReconciliation(int accountId, Date fromDate, Date toDate) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		ArrayList<TblPaymentDto> listOfpayment = new ArrayList<TblPaymentDto>();
		double totalAmount = 0.00;

		String datebetween = "";
		String dateAdded = " DATE_FORMAT(p.DateAdded,'%Y/%m/%d')";

		Date toDatee = (java.util.Date) toDate.clone();

		toDatee.setMinutes(59);
		toDatee.setSeconds(59);
		toDatee.setHours(23);

		try {
			if (fromDate == null && toDate == null) {
				datebetween = "";
			} else if (fromDate != null && toDate == null) {
				datebetween = " AND " + dateAdded + " >= " + ConstValue.getTIMESTAMP_START() + "'"
						+ JProjectUtil.getDateLongFormater().format(fromDate) + "'" + ConstValue.getTIMESTAMP_END();
			} else if (fromDate == null && toDate != null) {
				datebetween = " AND " + dateAdded + " <= " + ConstValue.getTIMESTAMP_START() + "'"
						+ JProjectUtil.getDateLongFormater().format(toDate) + "'" + ConstValue.getTIMESTAMP_END();
			} else if (fromDate != null && toDate != null) {
				datebetween = " AND " + dateAdded + " BETWEEN  " + ConstValue.getTIMESTAMP_START() + "'"
						+ JProjectUtil.getDateLongFormater().format(fromDate) + "'" + ConstValue.getTIMESTAMP_END()
						+ " AND " + ConstValue.getTIMESTAMP_START() + "'"
						+ JProjectUtil.getDateLongFormater().format(toDatee) + "'" + ConstValue.getTIMESTAMP_END();
			}

			StringBuffer sb = new StringBuffer();
			sb.append(
					"SELECT p.paymentid,p.amount,p.paymenttypeid,p.clientvendorid,p.invoiceid,p.dateadded,p.istobeprinted,p.isneedtodeposit,"
							+ " p.payeeid," + " p.payerid," + " p.checknumber," + " p.categoryid,"
							+ " p.accountcategoryid," + " p.transactiontype," + " p.deleted," + " p.AccountID,"
							+ " c.FirstName," + " c.LastName," + " c.Name AS CompanyName," + " cat.Name AS CategoryName"
							+ " FROM bca_payment AS p"
							+ " LEFT JOIN bca_clientvendor AS c ON p.ClientVendorID = c.ClientVendorID"
							+ " LEFT JOIN bca_category AS cat ON p.CategoryID = cat.CategoryID" + " WHERE p.CompanyID="
							+ ConstValue.companyId + " AND c.Status IN ('U','N')" + " AND PayerID =" + accountId);

			sb.append(datebetween);
			sb.append(" AND p.Deleted = 0");
			sb.append(" OR (p.payeeid = -1 AND p.Deleted = 0)"); // changes here on date 06-08-2018
			sb.append(" ORDER BY p.Priority DESC ");

			stmt = con.createStatement();
			rs = stmt.executeQuery(sb.toString());

			while (rs.next()) {
//				BcaCompany bcaCompany=bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
//				List<Object[]>  list=paymentRepository.findListOfBcaPayment(accountId,bcaCompany,datebetween);
				TblPaymentDto payment = new TblPaymentDto();
				payment.setId(rs.getInt("PaymentID"));
				payment.setCvName(rs.getString("LastName") + " " + rs.getString("FirstName") + "("
						+ rs.getString("CompanyName") + ")");
				payment.setCheckNumber(rs.getString("CheckNumber"));
				payment.setAmount(rs.getDouble("Amount"));
				payment.setCategoryName(rs.getString("CategoryName"));
				payment.setDateAdded(rs.getDate("DateAdded"));
				totalAmount += rs.getDouble("Amount");
				payment.setTotalAmount(totalAmount);
				payment.setPayerID(rs.getInt("PayerID"));
				payment.setCvID(rs.getInt("ClientVendorID"));
				payment.setCategoryId(rs.getInt("CategoryID"));
				payment.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				payment.setAccountID(rs.getInt("AccountID"));

				listOfpayment.add(payment);
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
		return listOfpayment;
	}

	@Override
	public ArrayList<TblPaymentDto> getDepositOfReconciliation(int accountId, Date fromDate, Date toDate) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection con = null;
		SQLExecutor db = new SQLExecutor();
		con = db.getConnection();
		ResultSet rs = null;
		ArrayList<TblPaymentDto> listDepositAmount = new ArrayList<TblPaymentDto>();
		double totalAmount = 0.00;

		String datebetween = "";
		String dateAdded = " DATE_FORMAT(p.DateAdded,'%Y/%m/%d')";

		Date toDatee = (java.util.Date) toDate.clone();

		toDatee.setMinutes(59);
		toDatee.setSeconds(59);
		toDatee.setHours(23);

		try {
			if (fromDate == null && toDate == null) {
				datebetween = "";
			} else if (fromDate != null && toDate == null) {
				datebetween = " AND " + dateAdded + " >= " + ConstValue.getTIMESTAMP_START() + "'"
						+ JProjectUtil.getDateLongFormater().format(fromDate) + "'" + ConstValue.getTIMESTAMP_END();
			} else if (fromDate == null && toDate != null) {
				datebetween = " AND " + dateAdded + " <= " + ConstValue.getTIMESTAMP_START() + "'"
						+ JProjectUtil.getDateLongFormater().format(toDate) + "'" + ConstValue.getTIMESTAMP_END();
			} else if (fromDate != null && toDate != null) {
				datebetween = " AND " + dateAdded + " BETWEEN  " + ConstValue.getTIMESTAMP_START() + "'"
						+ JProjectUtil.getDateLongFormater().format(fromDate) + "'" + ConstValue.getTIMESTAMP_END()
						+ " AND " + ConstValue.getTIMESTAMP_START() + "'"
						+ JProjectUtil.getDateLongFormater().format(toDatee) + "'" + ConstValue.getTIMESTAMP_END();
			}

			StringBuffer sb = new StringBuffer();
			sb.append(
					"SELECT p.paymentid,p.amount,p.paymenttypeid,p.clientvendorid,p.invoiceid,p.dateadded,p.istobeprinted,p.isneedtodeposit,"
							+ " p.payeeid," + " p.payerid," + " p.checknumber," + " p.categoryid,"
							+ " p.accountcategoryid," + " p.transactiontype," + " p.deleted," + " p.AccountID,"
							+ " c.FirstName," + " c.LastName," + " c.Name AS CompanyName," + " cat.Name AS CategoryName"
							+ " FROM bca_payment AS p"
							+ " LEFT JOIN bca_clientvendor AS c ON p.ClientVendorID = c.ClientVendorID"
							+ " LEFT JOIN bca_category AS cat ON p.CategoryID = cat.CategoryID" + " WHERE p.CompanyID="
							+ ConstValue.companyId + " AND c.Status IN ('U','N')" + " AND PayeeID =" + accountId);

			sb.append(datebetween);
			sb.append(" AND p.Deleted = 0");
			sb.append(" OR (p.PayerID = -1 AND p.Deleted = 0)"); // changes here on date 06-08-2018
			sb.append(" ORDER BY p.Priority DESC ");

			stmt = con.createStatement();
			rs = stmt.executeQuery(sb.toString());
			String query = sb.toString();
			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			OffsetDateTime fromDateTime = convertDateToOffsetDateTime(fromDate);
			OffsetDateTime toDateTime = convertDateToOffsetDateTime(toDate);

			List<Object[]> lsad = bcaPaymentRepository.findListOfBcaPayment(accountId, bcaCompany, fromDateTime,
					toDateTime);
			while (rs.next()) {
				TblPaymentDto payment = new TblPaymentDto();
				payment.setId(rs.getInt("PaymentID"));
				payment.setCvName(rs.getString("LastName") + " " + rs.getString("FirstName") + "("
						+ rs.getString("CompanyName") + ")");
				payment.setCheckNumber(rs.getString("CheckNumber"));
				payment.setAmount(rs.getDouble("Amount"));
				payment.setCategoryName(rs.getString("CategoryName"));
				payment.setDateAdded(rs.getDate("DateAdded"));
				totalAmount += rs.getDouble("Amount");
				payment.setTotalAmount(totalAmount);
				payment.setPayeeID(rs.getInt("PayeeID"));
				payment.setCvID(rs.getInt("ClientVendorID"));
				payment.setCategoryId(rs.getInt("CategoryID"));
				payment.setPaymentTypeID(rs.getInt("PaymentTypeID"));
				payment.setAccountID(rs.getInt("AccountID"));

				listDepositAmount.add(payment);
			}

		} catch (Exception e) {
			System.out.println("error : " + e);
			Loger.log(e.toString());
		} finally {
			db.close(con);
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				Loger.log(e.toString());
			}
		}
		return listDepositAmount;
	}

	@Override
	public ArrayList<TblCategoryDto> initTblCategory(long CategoryTypeId) {
		// TODO Auto-generated method stub
//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<TblCategoryDto> categoryList = new ArrayList<TblCategoryDto>();

		boolean b = true;

//		String sql = "  SELECT * FROM bca_category" + "  WHERE CategoryTypeID=" + CategoryTypeId
//				+ "  AND Parent = 'root' " + "  AND CompanyID = " + ConstValue.companyId;
		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
			BcaCompany bcaCompany = bcaCompanyRepository.getOne(new Long(ConstValue.companyId));
			List<BcaCategory> bcaCategories = bcaCategoryRepository
					.findByCategoryTypeIdAndParentAndCompany((int) CategoryTypeId, "root", bcaCompany);
//			while (rs.next()) {
//				TblCategoryDto cat = new TblCategoryDto();
//				cat.setCategoryNumber(rs.getString("Name"));
//				cat.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				cat.setId(rs.getLong("CategoryID"));
//
//				categoryList.add(cat);
//
//				if (b) {
//					category = cat;
//				}
//			}
			for (BcaCategory bcaCategory : bcaCategories) {
				TblCategoryDto cat = new TblCategoryDto();
				cat.setCategoryNumber(bcaCategory.getCateNumber());
				cat.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				cat.setId(bcaCategory.getCategoryId());

				categoryList.add(cat);
				if (b) {
					category = cat;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return categoryList;
	}

	@Override
	public ArrayList<TblCategoryDto> initComboCharge(TblCategoryDto category) {
//		// TODO Auto-generated method stub
//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<TblCategoryDto> categoryList = new ArrayList<TblCategoryDto>();

//		String sql = " SELECT * FROM bca_category" + " WHERE Parent='" + category.getId() + "'" + " AND isActive=1";

		try {
//			stmt = con.createStatement();
//
//			rs = stmt.executeQuery(sql);
			List<BcaCategory> bcaCategories = bcaCategoryRepository
					.findByParentAndIsActive(String.valueOf(category.getId()), true);

//			while (rs.next()) {
//				TblCategoryDto cat = new TblCategoryDto();
//				cat.setCategoryNumber(rs.getString("Name"));
//				cat.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				cat.setId(rs.getLong("CategoryID"));
//
//				categoryList.add(cat);
//			}
			for (BcaCategory bcaCategory : bcaCategories) {
				TblCategoryDto cat = new TblCategoryDto();
				cat.setCategoryNumber(bcaCategory.getName());
				cat.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				cat.setId(bcaCategory.getCategoryId());

				categoryList.add(cat);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return categoryList;
	}

	@Override
	public void addBankCharge(TblPaymentDto payment) throws ParseException {
		// TODO Auto-generated method stub
		String date = JProjectUtil.getDateFormaterCommon()
				.format(new SimpleDateFormat("MM/dd/yyyy").parse(payment.getFromDate()));
		double amount = payment.getAmount();
//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();

//		ResultSet rs = null;
		double expenseAmount = amount;
		int payerID = -1;
		int payeeID = -1;
		int checkNum = 0;
		String chkNum = "";

		if (payment.isSelectedCheckbox()) {
			chkNum = payment.getCheckNumber();
			checkNum = Integer.parseInt(chkNum);
		}
		TblAccount account = getAccountById(payment.getAccountID());

		account.setLastCheckNo(checkNum);

		TblCategoryDto category = getCategoryById(payment.getCategoryId());

		if (category.getCategoryTypeID() == 1841648525) {
			// Expense
			expenseAmount = -amount;
			payerID = account.getAccountID();
		} else {
			expenseAmount = amount;
			payeeID = account.getAccountID();
		}

		double balance = account.getCustomerCurrentBalance() + expenseAmount;

		int priority = getPriority() + 1;

//		String sql = "INSERT INTO bca_payment(Amount,PaymentTypeID,PayerID,PayeeID,AccountID,ClientVendorID,InvoiceID,"
//				+ "CategoryID,CompanyID,DateAdded,IsToBePrinted,isNeedtoDeposit,PayFromBalance,PayToBalance,Priority,CheckNumber,BillNum) VALUES ("
//				+ amount + "," + "-1" + "," + // fromAccount.getAccountCategoryID()+","+
//				payerID + "," + payeeID + "," + account.getAccountID() + "," + "-1" + "," + "-1" + ","
//				+ category.getId() + "," + ConstValue.companyId + "," + "'" + date + "'" + ",0" + "," + /* false */
//				"0" + "," + /* false */
//				balance + "," + balance + "," + priority + "," + "'" + chkNum + "',-1" + ")";

		try {
			BcaAccount bcaAccount = bcaAccountRepository.getOne(account.getAccountID());
			BcaPayment bcaPayment = new BcaPayment();
			BcaCategory bcaCategory = bcaCategoryRepository.getOne((int) category.getId());
			BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			bcaPayment.setAmount(amount);
			bcaPayment.setPaymentType(null);
			bcaPayment.setPayerId(payerID);
			bcaPayment.setPayeeId(payeeID);
			bcaPayment.setAccount(bcaAccount);
			bcaPayment.setClientVendor(null);
			bcaPayment.setInvoice(null);
			bcaPayment.setCategory(bcaCategory);
			bcaPayment.setCompany(bcaCompany);
			bcaPayment.setDateAdded(StringToOffsetDateTime(date));
			bcaPayment.setIsToBePrinted(false);
			bcaPayment.setIsNeedtoDeposit(false);
			bcaPayment.setPayFromBalance(balance);
			bcaPayment.setPayToBalance(balance);
			bcaPayment.setPriority(priority);
			bcaPayment.setCheckNumber(chkNum);
			bcaPayment.setBillNum(null);

			bcaPaymentRepository.save(bcaPayment);
			adjustBankBalance(account, expenseAmount);
//			con = db.getConnection();
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql);

		} catch (Exception e) {
			Loger.log(e.toString());
		}
//		finally {
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

//	@Override
//	public ArrayList<TblCategoryDto> getCategoryForAsset() {
//		// TODO Auto-generated method stub
//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
//		ArrayList<TblCategoryDto> categoryList = new ArrayList<TblCategoryDto>();
//
//		String sql = " SELECT * FROM bca_category" + " WHERE CategoryTypeID = -450722500" + " AND Parent = 'root' "
//				+ " AND CompanyID = " + ConstValue.companyId + " AND CategoryID NOT IN (2146772369,2146772370)";
//
//		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//
//			while (rs.next()) {
//				TblCategoryDto category = new TblCategoryDto();
//				category.setCategoryNumber(rs.getString("Name"));
//				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				category.setId(rs.getLong("CategoryID"));
//
//				categoryList.add(category);
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
//		return categoryList;
//	}

	@Override
	public ArrayList<TblCategoryDto> getCategoryForAsset() {

		ArrayList<TblCategoryDto> categoryList = new ArrayList<TblCategoryDto>();

		Long companyId = new Long(ConstValue.companyId);
		BcaCompany bcaCompany = bcaCompanyRepository.findByCompanyId(companyId);

		List<BcaCategory> bcaCategories = bcaCategoryRepository.getByCategoryTypeIdAndParentIdAndCompanyId(bcaCompany);
		try {

			for (BcaCategory bcaCategory : bcaCategories) {
				TblCategoryDto category = new TblCategoryDto();
				category.setCategoryNumber(bcaCategory.getName());
				category.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				category.setId(bcaCategory.getCategoryId());

				categoryList.add(category);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
		return categoryList;
	}

	@Override
	public void setDeleted(int paymentId) {
		// TODO Auto-generated method stub

		boolean isRefundedTransaction = false;
		TblPaymentDto payment = null;

		payment = getObjectOfStoragePayment(paymentId);

		if (payment.getTransactionID().equals("19")) {
			return;
		}
		if (payment.getCategoryId() == -13) {
			return;
		}
		setDeletedmodified(payment, true, "bca_payment", 0);

	}

	@Override
	public ArrayList<ReceivableListDto> getAllInvoicesForBillingBoardWithSearchOption(Date from, Date to, String ascent,
			String columnName, int InvoiceType, int overdueDays, String alldata, String advanceSearchCriteria,
			String advanceSearchData) {

//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<ReceivableListDto> list = new ArrayList<ReceivableListDto>();

		String dateStr = getSQL4Date(from, to);
		String advanceFilter = "";
		String table_ClientVendor = "";
		int ordNo = 0;

		String billingBoard_table = " BcaInvoice";
		table_ClientVendor = "clientVendor";

		if (columnName.trim().equals("DateAdded")) {
			columnName = billingBoard_table + ".dateAdded";
		} else if (columnName.trim().equals("Name")) {
			columnName = table_ClientVendor + ".name ";
		}
		if (columnName.equals("")) {
			columnName = billingBoard_table + ".orderNum";
		}
//
//		String sql = "SELECT OrderNum,Total,inv.TermID,Memo,Note,InvoiceID,ServiceID, InvoiceTypeID, JobCategoryID, inv.DateAdded, AdjustedTotal,"
//				+ "inv.PaymentTypeID, IsEmailed, Shipped, Balance, PaidAmount, inv.SalesRepID,BillDate, ShippingMethod,inv.ClientVendorID, "
//				+ "cv.FirstName,cv.LastName,cv.Name,Email, cv.State,cv.Address1,cv.Country,cv.City,cv.Province,cv.ZipCode,term.Days "
//				+ "FROM (" + billingBoard_table + " as inv "
//				+ "LEFT JOIN bca_term AS term ON (inv.TermID=term.TermID)) " + "INNER JOIN " + table_ClientVendor
//				+ " as cv ON cv.ClientVendorID = inv.ClientVendorID " + "WHERE inv.CompanyID = " + ConstValue.companyId
//				+ " AND NOT (invoiceStatus = 1 ) AND inv.IsPaymentCompleted = 0 AND Status='N' ";

		StringBuffer query = new StringBuffer("select iv from " + billingBoard_table + " as iv "
				+ " left join iv.term as term on ( iv.term.termId = term.termId) inner join  iv." + table_ClientVendor
				+ " as cv on cv.clientVendorId = iv.clientVendor.clientVendorId "
				+ "where iv.company.companyId = :companyId and not (invoiceStatus =1 ) and iv.isPaymentCompleted =0 and status ='N' ");

		StringBuffer advance_Filter = new StringBuffer();

		if (!advanceSearchCriteria.equals("") && !advanceSearchData.equals("")) {
			if (advanceSearchCriteria.equals("Bill#") && !advanceSearchData.equals("")) {
				query.append(" and iv.iv.invoiceType.invoiceTypeId in (13) ");
//				sql = sql + " AND InvoiceTypeID IN (13)  ";
			} else if (advanceSearchCriteria.equals("Invoice#") && !advanceSearchData.equals("")) {
//				sql = sql + " AND InvoiceTypeID IN (1)  ";
				query.append(" and iv.invoiceType.invoiceTypeId in (1) ");
			} else {
				query.append(" and iv.invoiceType.invoiceTypeId in (1,13) ");
//				sql = sql + " AND InvoiceTypeID IN (1,13)  ";
			}

			if (advanceSearchCriteria.equals("Invoice#")) {
//				advanceFilter = " AND OrderNum = " + advanceSearchData + " ";
				advance_Filter.append(" and iv.orderNum = " + advanceSearchData + " ");
			} else if (advanceSearchCriteria.equals("Bill#")) {
//				advanceFilter = " AND OrderNum = " + advanceSearchData + " ";
				advance_Filter.append(" and iv.orderNum = " + advanceSearchData + " ");
			} else if (advanceSearchCriteria.equals("First Name")) {
				advance_Filter.append(" and cv.firstName like '" + advanceSearchData + "%' ");
//				advanceFilter = " AND FirstName LIKE '" + advanceSearchData + "%' ";
			} else if (advanceSearchCriteria.equals("Last Name")) {
//				advanceFilter = " AND LastName LIKE '" + advanceSearchData + "%' ";
				advance_Filter.append(" and cv.lastName like '" + advanceSearchData + "%' ");
			} else if (advanceSearchCriteria.equals("Address")) {
//				advanceFilter = " AND Address1 LIKE '" + advanceSearchData + "%' ";
				advance_Filter.append(" and cv.address1 like '" + advanceSearchData + "%' ");
			} else if (advanceSearchCriteria.equals("ZipCode")) {
//				advanceFilter = " AND Zipcode LIKE '" + advanceSearchData + "%' ";
				advance_Filter.append(" and cv.zipCode like ' " + advanceSearchData + "%' ");
			} else if (advanceSearchCriteria.equals("Email")) {
//				advanceFilter = " AND Email LIKE '" + advanceSearchData + "%' ";
				advance_Filter.append(" and cv.email like '" + advanceSearchData + "%' ");
			} else if (advanceSearchCriteria.equals("Country")) {
//				advanceFilter = " AND Country LIKE '" + advanceSearchData + "%' ";
				advance_Filter.append(" and cv.country like '" + advanceSearchData + "%' ");
			}
		} else {
			if (InvoiceType == 113) {
				// Both Invoices & Recurring Billings
//				sql = sql + " AND InvoiceTypeID IN (1,13,17) ";
				query.append(" and iv.invoiceType.invoiceTypeId in  (1,13,17)");
			} else if (InvoiceType == 13) {
//				sql = sql + " AND InvoiceTypeID IN (13) ";
				query.append(" and iv.invoiceType.invoiceTypeId in (13) ");
			} else if (InvoiceType == 1) {
//				sql = sql + " AND InvoiceTypeID IN (1) ";
				query.append(" and iv.invoiceType.invoiceTypeId in (1) ");
			}
		}

		if (!dateStr.trim().equals("")) {
//			sql = sql + " And " + billingBoard_table + ".DateAdded " + dateStr;
			query.append(" and " + billingBoard_table + ".dateAddeed" + dateStr);
		}

		if (overdueDays > 0) {
//			sql = sql
//					+ " AND (DATEDIFF(Date(now()),DATE(DATE_ADD(DATE(DATE_ADD(inv.DateAdded,INTERVAL ,term.Days  Day)), INTERVAL "
//					+ overdueDays + " Day)))=0) ";
			query.append(
					" and (DATEDIFF ( DATE(now()), DATE (DATE _ADD ( DATE ( DATE_ADD ( iv.dateAdded ,INTERVAL , term.days DAY)) ,INTERVAL "
							+ overdueDays + " DAY))) = 0 ) ");
		}
		query.append(advance_Filter);
		query.append(" order by iv." + columnName + ascent);
//		sql = sql + advanceFilter;
//		sql = sql + " ORDER BY " + " inv." + columnName + ascent;
		String _query = query.toString();
		int length = query.length();
		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
			TypedQuery<BcaInvoice> typedquery = this.entityManager.createQuery(query.toString(), BcaInvoice.class);
			JpaHelper.addParameter(typedquery, query.toString(), "companyId", new Long(ConstValue.companyId));
//			JpaHelper.addParameter(typedquery, query.toString(), "invoiceTypeId", typeIds);
			List<BcaInvoice> resultList;
//int size = resultList.size();
			resultList = typedquery.getResultList();
			for (BcaInvoice inv : resultList) {
//				BcaInvoice bcaInvoice =new BcaInvoice();
				int year = 0;
				int month = 0;
				int day = 0;
				ReceivableListDto invoice = new ReceivableListDto();
				ordNo = inv.getOrderNum();

				invoice.setInvoiceID(inv.getInvoiceId());

				invoice.setOrderNum(ordNo);
				invoice.setOrderNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(ordNo),
						AppConstants.InvoiceType, configDto, false));
				invoice.setMemo(inv.getMemo());
				if (null != inv.getNote())
					;
				invoice.setNote(inv.getNote());
				if (null != inv.getClientVendor())
					invoice.setCvID(inv.getClientVendor().getClientVendorId());

				invoice.setTotal(inv.getTotal());
				if (null != inv.getInvoiceType())
					invoice.setInvoiceTypeID(inv.getInvoiceType().getInvoiceTypeId());
				if (null != inv.getJobCategoryId())
					invoice.setJobCategoryID(inv.getJobCategoryId());

				invoice.setAdjustedTotal(inv.getAdjustedTotal());

				invoice.setPaidAmount(inv.getPaidAmount());

				invoice.setBalance(inv.getBalance());

				invoice.setBillType(inv.getBillDate());
				if (null != inv.getTerm())
					invoice.setTermID(inv.getTerm().getTermId());
				if (null != inv.getPaymentType())
					invoice.setPaymentTypeID(inv.getPaymentType().getPaymentTypeId());
				if (null != inv.getShippingMethod())
					invoice.setShippingMethod(inv.getShippingMethod());

				invoice.setDateAdded(offsetDateTimeToDate(inv.getDateAdded()));
				if (null != inv.getServiceId())
					invoice.setServiceID(inv.getServiceId());
				if (null != inv.getClientVendor())
					invoice.setCvName(inv.getClientVendor().getName() + " ( " + inv.getClientVendor().getFirstName()
							+ " " + inv.getClientVendor().getLastName() + " )");

				Date date = offsetDateTimeToDate(inv.getDateAdded());
				/*
				 * Date date = null; try { date =
				 * JProjectUtil.qbFormatter().parse("2017-01-23"); } catch (ParseException e) {
				 * // TODO Auto-generated catch block Loger.log(e.toString()); }
				 */
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				year = cal.get(Calendar.YEAR);
				month = cal.get(Calendar.MONTH) + 1;
				day = cal.get(Calendar.DAY_OF_MONTH);

				int termDays = inv.getTerm().getDays();
				if (termDays == 7) {
					day = day + 7;
					month = month;
				} else if (termDays == 30) {
					day = day - 1;
					month = month - 1;
				} else if (termDays == 14) {
					day = day + 14;
					month = month;
				} else if (termDays == 90) {
					day = day + 90;
					month = month;
				} else {
//					day = 0;
//					month = 0;
//					year = 0;
					day = day + termDays;
					month = month;
				}
				cal.clear();
				cal.set(Calendar.DAY_OF_MONTH, day);
				cal.set(Calendar.MONTH, month);
				cal.set(Calendar.YEAR, year);
				Date overDuedate = cal.getTime();

				invoice.setOverDueDate(JProjectUtil.qbFormatter().format(overDuedate));
				list.add(invoice);
			}

//			while (rs.next()) {
//				int year = 0;
//				int month = 0;
//				int day = 0;
//				ReceivableListDto invoice = new ReceivableListDto();
//				ordNo = rs.getInt("OrderNum");
//
//				invoice.setInvoiceID(rs.getInt("InvoiceID"));
//
//				invoice.setOrderNum(ordNo);
//				invoice.setOrderNumStr(MyUtility.getOrderNumberByConfigData(Integer.toString(ordNo),
//						AppConstants.InvoiceType, configDto, false));
//				invoice.setMemo(rs.getString("Memo"));
//
//				invoice.setNote(rs.getString("Note"));
//
//				invoice.setCvID(rs.getInt("ClientVendorID"));
//
//				invoice.setTotal(rs.getDouble("Total"));
//
//				invoice.setInvoiceTypeID(rs.getInt("InvoiceTypeID"));
//
//				invoice.setJobCategoryID(rs.getInt("JobCategoryID"));
//
//				invoice.setAdjustedTotal(rs.getDouble("Total"));
//
//				invoice.setPaidAmount(rs.getDouble("PaidAmount"));
//
//				invoice.setBalance(rs.getDouble("Balance"));
//
//				invoice.setBillType(rs.getString("BillDate"));
//
//				invoice.setTermID(rs.getInt("TermID"));
//
//				invoice.setPaymentTypeID(rs.getInt("PaymentTypeID"));
//
//				invoice.setShippingMethod(rs.getString("ShippingMethod"));
//
//				invoice.setDateAdded((java.util.Date) rs.getDate("DateAdded"));
//
//				invoice.setServiceID(rs.getLong("ServiceID"));
//
//				invoice.setCvName(rs.getString("Name") + " ( " + rs.getString("FirstName") + " "
//						+ rs.getString("LastName") + " )");
//
//				Date date = rs.getDate("DateAdded");
//				/*
//				 * Date date = null; try { date =
//				 * JProjectUtil.qbFormatter().parse("2017-01-23"); } catch (ParseException e) {
//				 * // TODO Auto-generated catch block Loger.log(e.toString()); }
//				 */
//				Calendar cal = Calendar.getInstance();
//				cal.setTime(date);
//				year = cal.get(Calendar.YEAR);
//				month = cal.get(Calendar.MONTH) + 1;
//				day = cal.get(Calendar.DAY_OF_MONTH);
//
//				int termDays = rs.getInt("Days");
//				if (termDays == 7) {
//					day = day + 7;
//					month = month;
//				} else if (termDays == 30) {
//					day = day - 1;
//					month = month - 1;
//				} else if (termDays == 14) {
//					day = day + 14;
//					month = month;
//				} else if (termDays == 90) {
//					day = day + 90;
//					month = month;
//				} else {
////					day = 0;
////					month = 0;
////					year = 0;
//					day = day + termDays;
//					month = month;
//				}
//				cal.clear();
//				cal.set(Calendar.DAY_OF_MONTH, day);
//				cal.set(Calendar.MONTH, month);
//				cal.set(Calendar.YEAR, year);
//				Date overDuedate = cal.getTime();
//
//				invoice.setOverDueDate(JProjectUtil.qbFormatter().format(overDuedate));
//				list.add(invoice);
//			}
		} catch (Exception e) {
			e.printStackTrace(); // TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return list;
	}

	@Override
	public ArrayList<BillingBoardReport> getBillForPrint(int invoiceId) {
		// TODO Auto-generated method stub

//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<BillingBoardReport> billingList = new ArrayList<BillingBoardReport>();
//		String sql = "SELECT inv.ordernum," + "total," + "inv.termid," + "inv.memo," + "inv.note," + "inv.invoiceid,"
//				+ "inv.serviceid," + "inv.invoicetypeid," + "inv.jobcategoryid," + "inv.dateadded,"
//				+ "inv.adjustedtotal," + "inv.paymenttypeid," + "inv.isemailed," + "inv.shipped," + "inv.balance,"
//				+ "inv.paidamount," + "inv.salesrepid," + "inv.billdate," + "inv.shippingmethod,"
//				+ "inv.clientvendorid," + "cv.firstname," + "cv.lastname," + "cv.NAME AS ClientName,"
//				+ "cv.state AS ClientState," + "cv.address1 AS ClientAddess," + "cv.country AS ClientCountry,"
//				+ "cv.city AS ClientCity," + "cv.province," + "cv.zipcode AS ClientZipCode,"
//				+ "cv.Email AS ClientEmail," + "term.Name AS termName," + "cart.InventoryCode," + "cart.Qty,"
//				+ "cart.UnitPrice," + "sRep.Name AS sName," + "comp.Name AS CompanyName,"
//				+ "comp.Address1 AS CompanyAddress," + "comp.Email AS CompanyEmail," + "comp.Phone1 AS CompanyPhone,"
//				+ "comp.City AS CompanyCity," + "comp.State As CompanyState," + "comp.Zipcode As CompanyZipCode,"
//				+ "comp.Country As CompanyCountry" + " FROM   (bca_invoice AS inv" + " LEFT JOIN bca_term AS term"
//				+ " ON ( inv.termid = term.termid ))" + " INNER JOIN bca_clientvendor AS cv"
//				+ " ON cv.clientvendorid = inv.clientvendorid"
//				+ " LEFT JOIN bca_cart AS cart ON inv.InvoiceID = cart.InvoiceID"
//				+ " LEFT JOIN bca_salesrep AS sRep ON inv.SalesRepID = sRep.SalesRepID"
//				+ " LEFT JOIN bca_company AS comp ON inv.CompanyID = comp.CompanyID" + " WHERE  inv.companyid = "
//				+ ConstValue.companyId + " AND inv.InvoiceID = " + invoiceId + " AND NOT ( invoicestatus = 1 )"
//				+ " AND inv.ispaymentcompleted = 0" + " AND status = 'N'" + " AND sRep.CompanyID="
//				+ ConstValue.companyId + " AND invoicetypeid IN ( 1, 13, 17 )" + " ORDER  BY inv. ordernum DESC  ";

		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
			List<Object[]> list = bcaBillingstatementsRepository.findBillToPrint(new Long(ConstValue.companyId),
					invoiceId);
			List<BillingBoardReportDto> boardReportDtos = convertObjectToBillingBoardReportDto(list);
			for (BillingBoardReportDto rs : boardReportDtos) {
				BillingBoardReport report = new BillingBoardReport();
				report.setOrderDate(JProjectUtil.getdateFormat().format(rs.getDateAdded()));
				report.setInvoiceNo(rs.getInvoiceId());
				report.setTotalAmount(rs.getTotal());
				report.setAdjustedTotal(rs.getAdjustedTotal());
				report.setTermDays(rs.getTermName());
				report.setSalesRep(rs.getSName());
				report.setBalance(rs.getBalance());
				report.setItemCode(rs.getInventoryCode());
				if (null != rs.getQty())
					report.setQuantity(rs.getQty());
				if (null != rs.getUnitPrice())
					report.setAmount(rs.getUnitPrice());
				report.setAddress(rs.getCompanyName() + "\n" + rs.getCompanyAddress() + "\n" + rs.getCompanyCity() + ","
						+ rs.getCompanyState() + " " + rs.getCompanyZipCode() + " " + rs.getCompanyCountry() + "\n"
						+ "Ph.no :- " + rs.getCompanyPhone() + "\n" + rs.getCompanyEmail());
				report.setBillAddress(rs.getClientName() + "\n" + rs.getFirstName() + " " + rs.getLastName() + "\n"
						+ rs.getClientAddress() + "\n" + rs.getClientCity() + "," + rs.getClientState() + " "
						+ rs.getClientZipCode() + " " + rs.getClientCountry());
				report.setPhNumber(rs.getCompanyPhone());
				report.setOrderNum(rs.getOrderNum());
				billingList.add(report);
			}

//			while (rs.next()) {
//				BillingBoardReport report = new BillingBoardReport();
//				report.setOrderDate(JProjectUtil.getdateFormat().format(rs.getDate("DateAdded")));
//				report.setInvoiceNo(rs.getInt("InvoiceID"));
//				report.setTotalAmount(rs.getDouble("Total"));
//				report.setAdjustedTotal(rs.getDouble("AdjustedTotal"));
//				report.setTermDays(rs.getString("termName"));
//				report.setSalesRep(rs.getString("sName"));
//				report.setBalance(rs.getDouble("Balance"));
//				report.setItemCode(rs.getString("InventoryCode"));
//				report.setQuantity(rs.getInt("Qty"));
//				report.setAmount(rs.getDouble("UnitPrice"));
//				report.setAddress(rs.getString("CompanyName") + "\n" + rs.getString("CompanyAddress") + "\n"
//						+ rs.getString("CompanyCity") + "," + rs.getString("CompanyState") + " "
//						+ rs.getString("CompanyZipCode") + " " + rs.getString("CompanyCountry") + "\n" + "Ph.no :- "
//						+ rs.getString("CompanyPhone") + "\n" + rs.getString("CompanyEmail"));
//				report.setBillAddress(rs.getString("ClientName") + "\n" + rs.getString("FirstName") + " "
//						+ rs.getString("LastName") + "\n" + rs.getString("ClientAddess") + "\n"
//						+ rs.getString("ClientCity") + "," + rs.getString("ClientState") + " "
//						+ rs.getString("ClientZipCode") + " " + rs.getString("ClientCountry"));
//				report.setPhNumber(rs.getString("CompanyPhone"));
//				report.setOrderNum(rs.getInt("OrderNum"));
//				billingList.add(report);
//
//			}
		} catch (Exception e) {
			e.printStackTrace(); // TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

		return billingList;
	}

	@Override
	public Map getReportParameter() {
		// TODO Auto-generated method stub

		Map parameters = new HashMap();

		parameters.put("printer", "1010111");

		return parameters;

	}

	@Override
	@Transactional
	public void insertIntoBillingStatement(int invoiceId) {
		// TODO Auto-generated method stub

//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = null;
//		ResultSet rs = null;
		try {
			ReceivableListDto invoice = getInvoiceByInvoiceID(invoiceId);
			double amount = Double.parseDouble(new DecimalFormat("#0.00").format(invoice.getTotal() + 103.9));

			BcaBillingstatements billingstatements = new BcaBillingstatements();
//			billingstatements
//					.setStatementDate(StringToOffsetDateTime(JProjectUtil.getDateFormaterCommon().format(new Date())));
			billingstatements.setStatementDate(OffsetDateTime.now());

			billingstatements.setClientVendor(bcaClientvendorRepository.getOne(invoice.getCvID()));
			billingstatements.setInvoice(bcaInvoiceRepository.getOne(invoice.getInvoiceID()));
			billingstatements.setIsCombined(11);
			billingstatements.setType(0);
			billingstatements.setAmount(amount);

			billingstatements.setOverdueAmount(103.9);

			billingstatements.setOverDueServiceCharge(0.0);
			billingstatements.setCompany(bcaCompanyRepository.getOne(new Long(new Long(invoice.getCompanyID()))));
			bcaBillingstatementsRepository.save(billingstatements);

//			db = new SQLExecutor();
//			con = db.getConnection();
//			String sql = "INSERT INTO bca_billingstatements(StatementDate,ClientVendorID,InvoiceID,IsCombined,Type,Amount,OverdueAmount,OverDueServiceCharge, CompanyID) VALUES("
//					+ "'" + JProjectUtil.getDateFormaterCommon().format(new Date()) + "'" + "," + invoice.getCvID()
//					+ "," + invoice.getInvoiceID() + "," + 11 + "," + 0 + ","
//					+ new DecimalFormat("#0.00").format(invoice.getTotal() + 103.9) + "," + 103.9 + "," + 0 + ","
//					+ invoice.getCompanyID() + ")";
//
//			stmt = con.createStatement();
//			stmt.executeUpdate(sql);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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

	@Override
	public ArrayList<BillingStatement> getBillStatementList(String dataForBillStatement,
			String criteriaForBillStatement) {
		// TODO Auto-generated method stub

//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<BillingStatement> billingList = new ArrayList<BillingStatement>();

//		String sql = "SELECT inv.Balance, inv.DateAdded, inv.PaidAmount, bill.statementno, bill.statementdate,bill.clientvendorid,bill.invoiceid,bill.iscombined,bill.type,bill.amount,"
//				+ "bill.overdueamount,bill.overdueservicecharge,c.Name AS CompanyName,c.FirstName,c.LastName,inv.OrderNum"
//				+ " FROM   bca_billingstatements AS bill"
//				+ " LEFT JOIN bca_clientvendor AS c on bill.ClientVendorID = c.ClientVendorID"
//				+ " JOIN bca_invoice AS inv ON bill.InvoiceID = inv.InvoiceID" + " WHERE   c.Status IN ('U','N') "
//				+ " AND c.CompanyID = " + ConstValue.companyId;

		StringBuffer query = new StringBuffer(
				" select new com.pritesh.bizcomposer.accounting.bean.BcaBillingstatementsDto( inv.balance , inv. dateAdded , inv.paidAmount, bill.statementNo ,"
						+ "	bill.statementDate , bill.clientVendor.clientVendorId, bill.invoice.invoiceId , bill.isCombined	,"
						+ "bill.type, bill.amount, bill.overdueAmount,bill.overDueServiceCharge , c.name as companyName , c.firstName , c.lastName ,"
						+ " inv.orderNum) from BcaBillingstatements as bill left join BcaClientvendor as c on bill.clientVendor.clientVendorId = "
						+ " c.clientVendorId  join  BcaInvoice as inv on bill.invoice.invoiceId = inv.invoiceId where c.status in ('U' , 'N' )"
						+ " and c.company.companyId = :companyId");

		int statementNo = 0;
		if (criteriaForBillStatement.equals("Statement#")) {
			statementNo = Integer.parseInt(dataForBillStatement);
			query.append(" and bill.statementNo = :statementNo");
//			sql = sql + " AND bill.StatementNo = " + statementNo;
		}
		if (criteriaForBillStatement.equals("FirstName")) {
			query.append(" and c.firstName = :dataForBillStatement");
//			sql = sql + " AND c.FirstName = '" + dataForBillStatement + "'";
		}
		if (criteriaForBillStatement.equals("LastName")) {
			query.append(" and c.lastName = :dataForBillStatement");
//			sql = sql + " AND c.LastName = '" + dataForBillStatement + "'";
		}
		try {

//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				BillingStatement bs = new BillingStatement();
//				bs.setStatementNo(rs.getInt("StatementNo"));
//				bs.setStatementFor("Order#" + rs.getInt("OrderNum"));
//				bs.setCustomerName(rs.getString("FirstName") + " " + rs.getString("LastName") + "("
//						+ rs.getString("CompanyName") + ")");
//				bs.setStatementDate(rs.getDate("StatementDate"));
//				bs.setAmount(rs.getDouble("Amount"));
//				bs.setPaidAmount(rs.getDouble("PaidAmount"));
//				bs.setPaidDate(rs.getDate("DateAdded"));
//
//				billingList.add(bs);
//			}
			@SuppressWarnings("unchecked")

			TypedQuery<BcaBillingstatementsDto> jpaQuery = (TypedQuery<BcaBillingstatementsDto>) this.getAssignments(
					new Long(ConstValue.companyId), statementNo, dataForBillStatement, query.toString());
//			  TypedQuery<BcaBillingstatementsDto> typedquery = (TypedQuery<BcaBillingstatementsDto>) entityManager.createQuery(query.toString());
//			  			JpaHelper.addParameter(typedquery, query.toString(), "companyId", new Long(ConstValue.companyId));
//			JpaHelper.addParameter(typedquery, query.toString(), "statementNo",statementNo);
//			JpaHelper.addParameter(typedquery, query.toString(), "dataForBillStatement",dataForBillStatement);
//			

			List<BcaBillingstatementsDto> resultList;
//			int size = resultList.size();
			resultList = jpaQuery.getResultList();
			for (BcaBillingstatementsDto dto : resultList) {
				BillingStatement bs = new BillingStatement();
				bs.setStatementNo(dto.getStatementNo());
				bs.setStatementFor("Order#" + dto.getOrderNum());
				bs.setCustomerName(dto.getFirstName() + " " + dto.getLastName() + "(" + dto.getCompanyName() + ")");
				bs.setStatementDate(offsetDateTimeToDate(dto.getStatementDate()));
				bs.setAmount(dto.getAmount());
				bs.setPaidAmount(dto.getPaidAmount());
				bs.setPaidDate(offsetDateTimeToDate(dto.getDateAdded()));

				billingList.add(bs);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			Loger.log(e.toString());
		}
//		finally {
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

		return billingList;
	}

	private TypedQuery<?> getAssignments(Long companyId, int statementNo, String dataForBillStatement,
			String strQuery) {

		Class<?> clazz = BcaBillingstatementsDto.class;
		TypedQuery<?> jpaQuery = this.entityManager.createQuery(strQuery, clazz);
		JpaHelper.addParameter(jpaQuery, strQuery, "companyId", companyId);
		JpaHelper.addParameter(jpaQuery, strQuery, "statementNo", statementNo);
		JpaHelper.addParameter(jpaQuery, strQuery, "dataForBillStatement", dataForBillStatement);

		return jpaQuery;
	}

	@Override
	public ArrayList<BillingStatementReport> printBillingStatement(int invoiceId) {
		// TODO Auto-generated method stub

//		Statement stmt = null;
//		Connection con = null;
//		SQLExecutor db = new SQLExecutor();
//		con = db.getConnection();
//		ResultSet rs = null;
		ArrayList<BillingStatementReport> statement = new ArrayList<BillingStatementReport>();

//		String sql = "SELECT bill.statementno, " + "bill.statementdate," + "bill.clientvendorid," + "bill.invoiceid,"
//				+ "bill.iscombined," + "bill.type," + "bill.amount," + "bill.overdueamount,"
//				+ "bill.overdueservicecharge," + "c.Name AS CompanyName," + "c.FirstName," + "c.LastName,"
//				+ "c.Address1 AS ClientAddress," + "c.City AS ClientCity," + "c.State AS ClientState,"
//				+ "c.Zipcode As ClientZipCode," + "c.Country As ClientCoutry," + "inv.ordernum," + "inv.Total,"
//				+ "t.Name AS TermName," + "Comp.Name As cName," + "Comp.Address1 AS CompanyAddress,"
//				+ "Comp.City AS CompanyCity," + "Comp.State AS CompanyState," + "Comp.Zipcode As CompanyZipCode,"
//				+ "Comp.Country AS CompanyCountry," + "Comp.Phone1 AS CompanyPhoneNumber,"
//				+ "Comp.Email AS CompanyEmail," + "cart.InventoryCode," + "cart.DateAdded"
//				+ " FROM   bca_billingstatements AS bill"
//				+ " LEFT JOIN bca_clientvendor AS c on bill.ClientVendorID = c.ClientVendorID"
//				+ " LEFT JOIN bca_invoice AS inv ON bill.InvoiceID = inv.InvoiceID"
//				+ " LEFT JOIN bca_company AS Comp ON c.CompanyID = Comp.CompanyID"
//				+ " LEFT JOIN bca_term AS t ON inv.TermID = t.TermID"
//				+ " LEFT JOIN bca_cart AS cart ON inv.InvoiceID = cart.InvoiceID" + " WHERE   c.Status IN ('U','N') "
//				+ " AND c.CompanyID = " + ConstValue.companyId + " AND bill.InvoiceID = " + invoiceId;
		try {
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
			List<Object[]> list = bcaBillingstatementsRepository.findBillingStatements(new Long(ConstValue.companyId),
					invoiceId);
			List<BillingStatementsDto> billingStatementsDtos = convertObjectToBillingStatmentDto(list);
			for (BillingStatementsDto dto : billingStatementsDtos) {
				BillingStatementReport b = new BillingStatementReport();
				b.setStatementNo(dto.getStatementNo());
				b.setStatementDate(JProjectUtil.getdateFormat().format(dto.getStatementDate()));
				b.setAddress(dto.getCName() + "\n" + dto.getCompanyAddress() + "\n" + dto.getCompanyCity() + " ,"
						+ dto.getCompanyState() + " " + dto.getCompanyZipCode() + " " + dto.getCompanyCountry() + "\n"
						+ dto.getCompanyPhoneNumber() + " ," + dto.getCompanyEmail());

				b.setBillingAddress(dto.getCompanyName() + "\n" + dto.getClientAddress() + "\n" + dto.getClientCity()
						+ "," + dto.getClientState() + " " + dto.getClientZipCode() + " " + "\n"
						+ dto.getClientCountry());
				b.setTerm(dto.getTermName());
				if (dto.getDateAdded() != null) {
					b.setCartDate(JProjectUtil.getdateFormat().format(dto.getDateAdded()));
				}
				b.setInventoryCode(dto.getInventoryCode() + "(order#" + dto.getOrderNum() + ")");
				b.setInvoiceAmount(dto.getTotal());
				b.setOutStandingAmount(dto.getOverdueAmount());
				b.setTotalAmount(new DecimalFormat("#0.00").format((dto.getTotal() + dto.getOverdueAmount())));

				/* b.setTotalAmount(new DecimalFormat("#0.00").format(25.15151); */
				statement.add(b);
			}
//			while (rs.next()) {
//				BillingStatementReport b = new BillingStatementReport();
//				b.setStatementNo(rs.getInt("StatementNo"));
//				b.setStatementDate(JProjectUtil.getdateFormat().format(rs.getDate("StatementDate")));
//				b.setAddress(rs.getString("cName") + "\n" + rs.getString("CompanyAddress") + "\n"
//						+ rs.getString("CompanyCity") + " ," + rs.getString("CompanyState") + " "
//						+ rs.getString("CompanyZipCode") + " " + rs.getString("CompanyCountry") + "\n"
//						+ rs.getString("CompanyPhoneNumber") + " ," + rs.getString("CompanyEmail"));
//
//				b.setBillingAddress(rs.getString("CompanyName") + "\n" + rs.getString("ClientAddress") + "\n"
//						+ rs.getString("ClientCity") + "," + rs.getString("ClientState") + " "
//						+ rs.getString("ClientZipCode") + " " + "\n" + rs.getString("ClientCoutry"));
//				b.setTerm(rs.getString("TermName"));
//				if (rs.getDate("DateAdded") != null) {
//					b.setCartDate(JProjectUtil.getdateFormat().format(rs.getDate("DateAdded")));
//				}
//				b.setInventoryCode(rs.getString("InventoryCode") + "(order#" + rs.getInt("OrderNum") + ")");
//				b.setInvoiceAmount(rs.getDouble("Total"));
//				b.setOutStandingAmount(rs.getDouble("OverDueAmount"));
//				b.setTotalAmount(
//						new DecimalFormat("#0.00").format((rs.getDouble("Total") + rs.getDouble("OverDueAmount"))));
//
//				/* b.setTotalAmount(new DecimalFormat("#0.00").format(25.15151); */
//				statement.add(b);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		}
//		finally {
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
		return statement;
	}

	@Override
	public String getRecurringDate(String period, String str_date) {

		String recurringDate = null;
		DateFormat formatter;
		Date date;
		try {
			str_date = str_date.replaceAll("-", "/");
			formatter = new SimpleDateFormat("MM/dd/yyyy");
			date = (Date) formatter.parse(str_date);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);

			if (period.equals("Daily")) {
				cal.add(Calendar.DATE, 1); // add 1 Day in period

			} else if (period.equals("Weekly")) {
				cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, 1); // add 1 week in period

			} else if (period.equals("Monthly")) {
				cal.add(Calendar.MONTH, 1); // add 1 month in period

			} else if (period.equals("Quarterly")) {
				cal.add(Calendar.MONTH, 6); // add 6 Day in period

			} else if (period.equals("Annually")) {
				cal.add(Calendar.YEAR, 1); // add 1 Year in period

			}
			recurringDate = JProjectUtil.getDateFormater().format(cal.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recurringDate;
	}

	private OffsetDateTime StringToOffsetDateTime(String date) {
		// Define the date format that matches your input string
		DateTimeFormatter formatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;

		// Parse the string into an OffsetDateTime object
		OffsetDateTime offsetDateTime = OffsetDateTime.parse(date, formatter);

		// If you want to convert it to a specific time zone, you can use
		// withOffsetSameInstant method
		OffsetDateTime convertedDateTime = offsetDateTime.withOffsetSameInstant(ZoneOffset.UTC);
		return convertedDateTime;
	}

	private Date offsetDateTimeToDate(OffsetDateTime dateTime) {
//		OffsetDateTime offsetDateTime = bcaAccount.getDateAdded();
		Date date = Date.from(dateTime.toInstant());
		return date;
	}

	private OffsetDateTime convertDateToOffsetDateTime(Date utilDate) {
		Instant instant = utilDate.toInstant();
		return instant.atOffset(ZoneOffset.UTC);
		// You can replace ZoneOffset.UTC with the desired time zone offset
	}

	private List<BillingStatementsDto> convertObjectToBillingStatmentDto(List<Object[]> lists) {
		List<BillingStatementsDto> billingStatementsDtos = new ArrayList<>();

		for (Object obj[] : lists) {
			BillingStatementsDto bsd = new BillingStatementsDto();
			bsd.setStatementNo((Integer) obj[0]);
			bsd.setStatementDate((Timestamp) obj[1]);
			bsd.setClientVendorId((Integer) obj[2]);
			bsd.setInvoiceId((Integer) obj[3]);
			bsd.setIsCombined((Integer) obj[4]);
			bsd.setType((Integer) obj[5]);
			bsd.setAmount((Double) obj[6]);
			bsd.setOverdueAmount((Double) obj[7]);
			bsd.setOverdueServiceCharge((Float) obj[8]);
			bsd.setCompanyName((String) obj[9]);
			bsd.setFirstName((String) obj[10]);
			bsd.setLastName((String) obj[11]);
			bsd.setClientAddress((String) obj[12]);
			bsd.setClientCity((String) obj[13]);
			bsd.setClientState((String) obj[14]);
			bsd.setClientZipCode((String) obj[15]);
			bsd.setClientCountry((String) obj[16]);
			bsd.setOrderNum((Integer) obj[17]);
			bsd.setTotal((Double) obj[18]);
			bsd.setTermName((String) obj[19]);
			bsd.setCName((String) obj[20]);
			bsd.setCompanyAddress((String) obj[21]);
			bsd.setCompanyCity((String) obj[22]);
			bsd.setCompanyState((String) obj[23]);
			bsd.setCompanyZipCode((String) obj[24]);
			bsd.setCompanyCountry((String) obj[25]);
			bsd.setCompanyPhoneNumber((String) obj[26]);
			bsd.setCompanyEmail((String) obj[27]);
			bsd.setInventoryCode((String) obj[28]);
			bsd.setDateAdded((Timestamp) obj[29]);
			billingStatementsDtos.add(bsd);

		}

		return billingStatementsDtos;

	}

	private List<BillingBoardReportDto> convertObjectToBillingBoardReportDto(List<Object[]> list) {
		List<BillingBoardReportDto> boardReportDtos = new ArrayList<>();
		for (Object[] obj : list) {
			BillingBoardReportDto bsd = new BillingBoardReportDto();
			bsd.setOrderNum((Integer) obj[0]);
			bsd.setTotal((Double) obj[1]);
			bsd.setTermId((Integer) obj[2]);
			bsd.setMemo((String) obj[3]);
			bsd.setNote((String) obj[4]);
			bsd.setInvoiceId((Integer) obj[5]);
			bsd.setServiceId((Integer) obj[6]);
			bsd.setInvoiceTypeId((Integer) obj[7]);
			bsd.setJobCategoryId((Integer) obj[8]);
			bsd.setDateAdded((Timestamp) obj[9]);
			bsd.setAdjustedTotal((Double) obj[10]);
			bsd.setPaymentTypeId((Integer) obj[11]);
			bsd.setIsEmailed((Boolean) obj[12]);
			bsd.setShipped((Integer) obj[13]);
			bsd.setBalance((Double) obj[14]);
			bsd.setPaidAmount((Double) obj[15]);
			bsd.setSalesRepId((Integer) obj[16]);
			bsd.setBillDate((String) obj[17]);
			bsd.setShippingMethod((String) obj[18]);
			bsd.setClientVendorId((Integer) obj[19]);
			bsd.setFirstName((String) obj[20]);
			bsd.setLastName((String) obj[21]);
			bsd.setClientName((String) obj[22]);
			bsd.setClientState((String) obj[23]);
			bsd.setClientAddress((String) obj[24]);
			bsd.setClientCountry((String) obj[25]);
			bsd.setClientCity((String) obj[26]);
			bsd.setProvince((String) obj[27]);
			bsd.setClientZipCode((String) obj[28]);
			bsd.setClientEmail((String) obj[29]);
			bsd.setTermName((String) obj[30]);
			bsd.setInventoryCode((String) obj[31]);
			bsd.setQty((Integer) obj[32]);
			bsd.setUnitPrice((Double) obj[33]);
			bsd.setSName((String) obj[34]);
			bsd.setCompanyName((String) obj[35]);
			bsd.setCompanyAddress((String) obj[36]);
			bsd.setCompanyEmail((String) obj[37]);
			bsd.setCompanyPhone((String) obj[38]);
			bsd.setCompanyCity((String) obj[39]);
			bsd.setCompanyState((String) obj[40]);
			bsd.setCompanyZipCode((String) obj[41]);
			bsd.setCompanyCountry((String) obj[42]);

			boardReportDtos.add(bsd);
		}
		return boardReportDtos;
	}

	private List<PoPayableDto> poPayableDto(List<Object[]> obj) {
		List<PoPayableDto> poPayableDtos = new ArrayList<>();
		for (Object[] po : obj) {
			PoPayableDto poDto = new PoPayableDto();
			poDto.setInvoiceID((Integer) po[0]);
			poDto.setPONum((Integer) po[1]);
			poDto.setClientVendorID((Integer) po[2]);
			poDto.setCompanyID((Integer) po[3]);
			poDto.setInvoiceTypeID((Integer) po[4]);
			poDto.setAdjustedTotal((Double) po[5]);
			poDto.setPaidAmount((Double) po[6]);
			poDto.setBankAccountId((Integer) po[7]);
			poDto.setPaidAmount12((Double) po[8]);
			poDto.setBalance((Double) po[9]);
			poDto.setTermID((Integer) po[10]);
			poDto.setPaymentTypeID((Integer) po[11]);
			poDto.setPaymentCompleted((Boolean) po[12]);
			poDto.setDateAdded((Timestamp) po[13]);
			poDto.setCategoryId((Integer) po[14]);
			poDto.setMemo((String) po[15]);
			poDto.setPaymentTypeName((String) po[16]);
			poDto.setAccountName((String) po[17]);
			poDto.setCategoryName((String) po[18]);
			poDto.setCateNumber((String) po[19]);
			poDto.setCompanyName((String) po[20]);
			poDto.setFirstName((String) po[21]);
			poDto.setLastName((String) po[22]);
			poPayableDtos.add(poDto);

		}

		return poPayableDtos;

	}

	private List<InvoiceDto> convertInvoiceDtoToInvoice(List<Object[]> lists) {
		List<InvoiceDto> invoiceDtos = new ArrayList<>();
		for (Object[] obj : lists) {
			InvoiceDto dto = new InvoiceDto();
			dto.setInvoiceID((Integer) obj[0]);
			dto.setOrderNum((Integer) obj[1]);
			dto.setPONum((Integer) obj[2]);
			dto.setSubTotal((Double) obj[3]);
			dto.setTax((Double) obj[4]);
			dto.setEmployeeID((Integer) obj[5]);
			dto.setRefNum((String) obj[6]);
			dto.setMemo((String) obj[7]);
			dto.setShipCarrierID((Integer) obj[8]);
			dto.setShippingMethod((String) obj[9]);
			dto.setSH((Double) obj[10]);
			dto.setClientVendorID((Integer) obj[11]);
			dto.setInvoiceTypeID((Integer) obj[12]);
			dto.setTotal((Double) obj[13]);
			dto.setAdjustedTotal((Double) obj[14]);
			dto.setPaidAmount((Double) obj[15]);
			dto.setPaidAmount12((Double) obj[16]);
			dto.setBalance((Double) obj[17]);
			dto.setIsReceived((Boolean) obj[18]);
			dto.setTermID((Integer) obj[19]);
			dto.setIsPaymentCompleted((Boolean) obj[20]);
			dto.setDateConfirmed((OffsetDateTime) obj[21]);
			dto.setDateAdded((OffsetDateTime) obj[22]);
			dto.setInvoiceStatus((Integer) obj[23]);
			dto.setPaymentTypeID((Integer) obj[24]);
			dto.setCategoryID((Integer) obj[25]);
			dto.setServiceID((Integer) obj[26]);
			dto.setSalesTaxID((Integer) obj[27]);
			dto.setSalesRepID((Integer) obj[28]);
			dto.setTaxable((Integer) obj[29]);
			dto.setShipped((Integer) obj[30]);
			dto.setJobCategoryID((Integer) obj[31]);
			dto.setTermDays((Integer) obj[32]);
			dto.setBillingAddrID((Integer) obj[33]);
			dto.setShippingAddrID((Integer) obj[34]);
			dto.setTotalCommission((Double) obj[35]);
			dto.setBankAccountID((Integer) obj[36]);
			invoiceDtos.add(dto);
		}

		return invoiceDtos;

	}

	private List<ClientvendorDto> objectToClienDto(List<Object[]> object) {
		List<ClientvendorDto> list = new ArrayList<>();
		try {
			for (Object[] obj : object) {
				ClientvendorDto dto = new ClientvendorDto();
				dto.setRemainingCredit((Double) obj[0]);
				dto.setCustomerCreditLine((Double) obj[1]);
				dto.setName((String) obj[2]);
				dto.setFirstName((String) obj[3]);
				dto.setLastName((String) obj[4]);
				dto.setDateAdded((OffsetDateTime) obj[5]);
				dto.setDate_Added((OffsetDateTime) obj[6]);
				dto.setClientVendorId((Integer) obj[7]);
				dto.setCategoryId((Integer) obj[8]);
				dto.setInvoiceId((Integer) obj[9]);
				dto.setCredit((BigDecimal) obj[10]);
				dto.setTotalCredit((BigDecimal) obj[11]);
				dto.setTermId((Integer) obj[12]);
				dto.setMemo((String) obj[13]);
				list.add(dto);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}

		return list;
	}

	private List<BcaPaymentDto> objectToBcaPaymentDto(List<Object[]> object) {
		List<BcaPaymentDto> list = new ArrayList<>();
		try {
			for (Object obj[] : object) {
				BcaPaymentDto dto = new BcaPaymentDto();
				dto.setServiceId((Integer) obj[0]);
				dto.setVendorId((Integer) obj[1]);
				dto.setDateAdded((OffsetDateTime) obj[2]);
				dto.setPayerId((Integer) obj[3]);
				dto.setMemo((String) obj[4]);
				dto.setCheckNumber((String) obj[5]);
				dto.setAmount((Double) obj[6]);
				dto.setIsToBePrinted((Boolean) obj[7]);
				dto.setBillNum((Integer) obj[8]);
				dto.setCategoryId((Integer) obj[9]);
				dto.setAmountDue((Double) obj[10]);
				dto.setPaymentTypeId((Integer) obj[11]);
				dto.setPaymentId((Integer) obj[12]);
				dto.setCompnayName((String) obj[13]);
				dto.setFirstName((String) obj[14]);
				dto.setLastName((String) obj[15]);
				dto.setAccountName((String) obj[16]);
				list.add(dto);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return list;
	}

	private List<BcaRecurrentPaymentDto> objectToBcaRecurrentPaymentDto(List<Object[]> object) {
		List<BcaRecurrentPaymentDto> list = new ArrayList<>();
		try {
			for (Object obj[] : object) {
				BcaRecurrentPaymentDto dto = new BcaRecurrentPaymentDto();
				dto.setServiceId((Integer) obj[0]);
				dto.setPayeeId((Integer) obj[1]);
				dto.setPaymentDate((OffsetDateTime) obj[2]);
				dto.setPayerId((Integer) obj[3]);
				dto.setMemo((String) obj[4]);
				dto.setCheckNumber((String) obj[5]);
				dto.setAmount((Double) obj[6]);
				dto.setIsToBePrinted((Boolean) obj[7]);
				dto.setPaymentTypeId((Integer) obj[8]);
				dto.setPaymentId((Integer) obj[9]);
				dto.setCompanyName((String) obj[10]);
				dto.setFirstName((String) obj[11]);
				dto.setLastName((String) obj[12]);
				dto.setAccountName((String) obj[13]);
				list.add(dto);
			}
		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return list;
	}

	private List<BcaBillDto> objectToBcaBillDto(List<Object[]> object) {
		List<BcaBillDto> dtos = new ArrayList<>();
		try {
			for (Object[] obj : object) {
				BcaBillDto dto = new BcaBillDto();
				dto.setBillNum((Integer) obj[0]);
				dto.setDuedate((OffsetDateTime) obj[1]);
				dto.setAmountDue((Double) obj[2]);
				dto.setStatus((String) obj[3]);
				dto.setBillType((Integer) obj[4]);
				dto.setAmountPaid((Double) obj[5]);
				dto.setCreditUsed((Double) obj[6]);
				dto.setBalance((Double) obj[7]);
				dto.setMemo((String) obj[8]);
				dto.setIsMemorized((Boolean) obj[9]);
				dto.setVendorId((Integer) obj[10]);
				dto.setCategoryId((Integer) obj[11]);
				dto.setPayerId((Integer) obj[12]);
				dto.setServiceId((Integer) obj[13]);
				dto.setDateAdded((OffsetDateTime) obj[14]);
				dto.setCheckNo((Integer) obj[15]);
				dto.setName((String) obj[16]);
				dto.setCatName((String) obj[17]);
				;
				dtos.add(dto);
			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return dtos;
	}

}
