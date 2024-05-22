package com.nxsol.bizcomposer.accounting.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.nxsol.bizcomposer.common.BillingStatement;
import com.nxsol.bizcomposer.common.TblBudgetCategory;
import com.nxsol.bizcomposer.common.TblCategoryType;
import com.nxsol.bizcomposer.common.TblRecurrentPaymentPlan;
import com.nxsol.bizcomposer.common.TblVendorDetail;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcomposer.jasper.pojo.BillingBoardReport;
import com.nxsol.bizcomposer.jasper.pojo.BillingStatementReport;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.pritesh.bizcomposer.accounting.bean.ReceivableListDto;
import com.pritesh.bizcomposer.accounting.bean.SalesBillingTable;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblAccountCategory;
import com.pritesh.bizcomposer.accounting.bean.TblAccountable;
import com.pritesh.bizcomposer.accounting.bean.TblPayment;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentDto;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;

public interface ReceivableLIst {

	public ArrayList<ReceivableListDto> getReceivableList(int companyId);
	
	public ArrayList<ClientVendor> getClientVendorForCombo();
	public ArrayList<ClientVendor> getAllClientVendorForCombo();
	
	public ArrayList<TblPaymentType> getPaymentType();
	
//	public Map<Integer, TblPaymentType> getPaymentType();
	
	public ArrayList<TblAccount> getAccount();

	public ReceivableListDto getInvoiceByOrderNUm(int ordernum,int companyId);

	public ReceivableListDto getInvoiceByPONum(int poNum,int companyId);

	public TblPaymentType getPaymentTypeById(int id);
	
	public TblAccount getAccountById(int id);
	
	public TblPaymentDto getPaymentByPaymentId(int id);
	
	public int updateInvoiceByOrderNum(ReceivableListDto receivableListBean);

    public ArrayList<ReceivableListDto> getInvoiceForUnpaidOpeningbal(int copanyId);
	
	public ArrayList<ReceivableListDto> getUnpaidCreditAmount(int companyId);
	
	public double getSum(int invoiceId);
	
	public TblPaymentDto setPayment(ReceivableListDto bean,int InvoiceID,int CompanyID);
	
	public double getPreviousPaidAmount(int invoiceID,int companyID);
	
	public void insertAccount(TblPaymentDto payment,ReceivableListDto bean) throws SQLException;
	
	public void getLastId(TblPaymentDto payment);
	
	public int getPriority();
	
	public void depositTo(TblPaymentDto payment,TblAccount account,int priority) throws SQLException;
	
	public double getAmountByInvoiceId(ReceivableListDto invoice);
	
	public ArrayList<TblPaymentDto> getReceivedList(int compantId,String dateString);
	
	public ArrayList<Date> getDateRange();
	
	public String getDateString(Date from , Date to);
	
	public String getPaidOrUnpaid(int invoice ,int payableId);
	
	public void updateInvoice(int invoiceId);
	
	public void updateInvoiceStatusForCancelled(int invoiceId);
	
	public ArrayList<ReceivableListDto> getCancelledTableList(int companyId);
	
	public double getTotalAmountByInvoiceId(int invoiceId);
	
	public TblPaymentDto getObjectOfStoragePayment(int paymentId);
	
	public void updateTransaction(TblPaymentDto payment,double receivedAmount,String tableName,Date date)throws SQLException;
	
	public int readInvoiceStatus(int invoiceId);
	
	public void setDeletedmodified(TblPaymentDto payment,boolean isDeleted,String tableName,int isUpfrontDeposit);
	
	public ArrayList<SalesBillingTable> getSalesBillingList();
	
	public void changeInvoiceStatusForLayaway(int invoiceID);
	
	public ArrayList<ReceivableListDto> getLayawayList();
	
	public double updateInvoiceForLayaways(ReceivableListDto bean);
	
	public ReceivableListDto getInvoiceForLayawaysByOrderNUm(int orderNnm , int companyId);
	
	public ArrayList<TblPaymentDto> getPartiallyReceivedLayaways();
	
	public void changeInvoiceTypeForLayawaysByInvoiceId(int invoiceId);
	
	public ArrayList<TblPaymentType> getPaymentTypeForPoPayable();
	
	public ArrayList<ReceivableListDto> getPoPayableList();
	
	public void getInvoices(ReceivableListDto bean) throws SQLException;
	
	public ArrayList<TblPaymentDto> getPaidList(Date fromDate,Date toDate);
	
	public ArrayList<ReceivableListDto> getConsignmentSaleList();
	
	public void changeInvoiceTypeIdForConsignment(int invoiceID);
	
	public ArrayList<TblPaymentDto> getPaidConsignPaymentList();
	
	public void clearFromConsignmentTab(int invoiceID);
	
	public ArrayList<Date> getSelectedDateRange(int option); 
	
	public void loadBankAccounts();
	
	public ArrayList<TblAccountCategory> getAccountCategoriesList();
	
	public ArrayList<TblAccountCategory> getBankAccountsTree(ArrayList<TblAccountCategory> categoryList);
	
	public ArrayList<TblAccount> getAllAccountsFromBankAccountsTree(ArrayList<TblAccountCategory> bankAccountTreeWithCat);
	
	public ArrayList<TblAccount> getBankAccountsTreeForFundTransfer(ArrayList<TblAccountCategory> categoryList);
	
	public ArrayList<TblPaymentDto> getPaymentsForBanking(TblAccount account , Date from , Date to ,String transType , Boolean useFilter);
	
	public ArrayList<TblPaymentType> getOnlySimplePaymentTypes();
	
	public int bankTransfer(TblPaymentDto payment , double amount , Date transferDate , int priority); 
	
	public void adjustBankForBanking(TblPaymentDto payment);
	
	public ArrayList<ClientVendor> getAllClientVendorList();
	
	public ArrayList<TblCategoryDto> getCategoryListForPayment();
	
	public ArrayList<TblCategoryDto> getCategoryListForAssets();
	
	public ArrayList<TblAccount> getCustomerCurrentBalanceForvendor(ArrayList<ClientVendor> cvList);
	
	public void adjustBankBalanceForVendor(TblPaymentDto payment);
	
	public ArrayList<ClientVendor> getClientForDeposit();
	
	public ArrayList<TblCategoryDto> getCategoryListForDeposit();
	
	public int bankTransferFromDeposit(TblPaymentDto payment , double amount , Date transferDate , int priority);
	
	public void adjustBankAfterDeposit(TblPaymentDto payment);
	
	public ArrayList<ClientVendor> getAllClientVendor();
	public ArrayList<ClientVendor> getServiceProviderClientVendor();
	
	public ArrayList<TblCategoryDto> getAllCategory();
	
	public ArrayList<TblPaymentType> getAllPaymentList();
	
	public int saveAccountCategory(TblPaymentDto paymentDto, String status);

	public void addAccount(TblPaymentDto payment,int priority,String status , int AccountId);
	
	public void deleteBankAccount(int accountId);
	
	public ArrayList<ClientVendor> getCvForBill(); 
	
	public ArrayList<TblVendorDetail> getUnpaidBillList(int cvID , int checkStatus);
	
	public TblVendorDetail getBillById(int billNum);
	
	public void updateBill(TblVendorDetail vDetail);
	
	public void makePayment(TblVendorDetail vDetail, int cvID);
	
	public ArrayList<TblPaymentDto> getPaidBillLists();
	
	public ArrayList<TblPayment> getPaidBillListsPayment();
	
	public ArrayList<TblPaymentDto> getRecurrentBillPayment();
	
	public void deleteSelectedBill(int billNum);
	
	public ArrayList<TblVendorDetail> getAllBill(int cvID , int checkStatus);

	public TblVendorDetail getBillByBillNum(String billNum);

	public void updateVendorBills(TblVendorDetail vDetail);
	
	public ArrayList<TblVendorDetail> getMemorizeTransactionList();
	
	public void deleteBill(int billNo);
	
	public ArrayList<TblVendorDetail> getPayBillsLists(Date dateFormat);
	
	public ArrayList<TblCategoryDto> getAllCategories();
	 
	public int getmaxBill();
	
	public void insertNewBill(TblVendorDetail vDetail) throws ParseException;
	
	public TblRecurrentPaymentPlan getPlanOfCvID(int cvId);
	
	public void insertRecurrentPaymentPlan(TblRecurrentPaymentPlan payment,boolean active)throws ParseException;
	
	public void updateRecurrentPayment(TblRecurrentPaymentPlan rPayment);

	public TblCategoryDto getCategoryCategoryDetails(String categoryId);
	public ArrayList<TblCategoryDto> getListOfCategoryForCategoryManager();
	
	public ArrayList<TblBudgetCategory> readBudgetCategory();
	
	public ArrayList<TblCategoryType> getCategoryType();
	
	public boolean saveCategory(TblCategoryDto category);
	
	public void updateCategory(TblCategoryDto category,String categoryId);
	
	public boolean checkCategory(String categoryId);
	
	public boolean isCategoryID_using(int categoryId);
	
	public void deleteCategory(int categoryId);
	
	public ArrayList<TblPaymentDto> getPaymentsList(TblPaymentDto payment,Date fromDate,Date toDate);
	
	public ArrayList<TblPaymentDto> getDepositsList(TblPaymentDto payment,Date fromDate,Date toDate);
	
	public ArrayList<TblPaymentDto> getPaymentOfReconciliation(int accountId,Date fromDate,Date toDate);
	
	public ArrayList<TblPaymentDto> getDepositOfReconciliation(int accountId,Date fromDate,Date toDate);
	
	public ArrayList<TblCategoryDto> initTblCategory(long CategoryTypeId);
	
	public ArrayList<TblCategoryDto> initComboCharge(TblCategoryDto category);
	
	public void addBankCharge(TblPaymentDto payment)throws ParseException;
	
	public ArrayList<TblCategoryDto> getCategoryForAsset();
	
	public void setDeleted(int paymentId);
	
	public ArrayList<ReceivableListDto> getAllInvoicesForBillingBoardWithSearchOption(Date from, Date to, String ascent, String columnName, int InvoiceType, int overdueDays, String alldata,String advanceSearchCriteria,String advanceSearchData);
	
	public ArrayList<ReceivableListDto> getAllInvoicesForBillingBoardPaidListWithSearchOption(Date from, Date to, String ascent, String columnName, int InvoiceType, int overdueDays, String alldata,String advanceSearchCriteria,String advanceSearchData);
	
	public ArrayList<BillingBoardReport> getBillForPrint(int invoiceId);
	
	public Map getReportParameter();
	
	public void insertIntoBillingStatement(int invoiceId);
	
	public ArrayList<BillingStatement> getBillStatementList(String dataForBillStatement,String criteriaForBillStatement);
	
	public ArrayList<BillingStatementReport> printBillingStatement(int invoiceId);

	String getRecurringDate(String period, String nextDate);
	
	public int insert(TblAccountable accountable, boolean isNeedToPrint) throws SQLException;
	public void updateBillByBillNumForPaid(String BillNum);
}
