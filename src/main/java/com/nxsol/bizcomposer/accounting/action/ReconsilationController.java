package com.nxsol.bizcomposer.accounting.action;

import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bizcomposer.common.TblCategoryType;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.pritesh.bizcomposer.accounting.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class ReconsilationController {
	
	@Autowired
	private ReceivableLIst rl;

	@GetMapping("/Reconsilation")
	public String reconsilation(TblPaymentDto tblPaymentDto, HttpServletRequest request) throws Exception {
		String forward = "/accounting/reconsilation";
		HttpSession sess=request.getSession();
		String action = request.getParameter("tabid");
		String strName = "Deposit";
		String companyID = (String) sess.getAttribute("CID");
		Date defaultToDate = new Date();
		Date defaultFromDate = new Date("11/14/2007");
		int defaultAccountId = 56933;
		ArrayList<TblCategoryDto> initCategory = null;
		ArrayList<TblCategoryDto> initCharge = null;
		//ReceivableLIst rl = new ReceivableListImpl();
		ArrayList<TblCategoryType> categoryType = rl.getCategoryType();
		ArrayList<TblCategoryDto> subCategoryChrgeListForAsset = null;
		if(action.equals("reconsilation")) {
			
		}
		Gson gson=new Gson();
		TblPayment payment = gson.fromJson(request.getParameter("data"), TblPayment.class);
		if(payment != null) {
			defaultToDate = new SimpleDateFormat("MM/dd/yyyy").parse(payment.getToDate());
			defaultFromDate = new SimpleDateFormat("MM/dd/yyyy").parse(payment.getFromDate());
			defaultAccountId = payment.getAccountID();
		}
		if(action.equals("EditTransaction")) {
			TblPayment paymentFromAjax = gson.fromJson(request.getParameter("row"), TblPayment.class);
			int paymentId = Integer.parseInt(request.getParameter("PaymentId"));
			String paidDate = request.getParameter("date");
			Date datePaid = JProjectUtil.getdateFormat().parse(paidDate);
			double receivedAmount = Double.parseDouble(request.getParameter("amount"));
			strName = request.getParameter("tableName");
			TblPaymentDto paymentEdit = rl.getObjectOfStoragePayment(paymentId);
			paymentEdit.setOldclientVendorID(paymentFromAjax.getOldclientVendorID());
			paymentEdit.setOldAccountID(paymentFromAjax.getOldAccountID());
			paymentEdit.setPaymentTypeID(paymentFromAjax.getPaymentTypeID());
			paymentEdit.setAccountID(paymentFromAjax.getAccountID());
			paymentEdit.setCvID(paymentFromAjax.getCvID());
			double toBeDeposited = receivedAmount - paymentEdit.getAmount();
			rl.updateTransaction(paymentEdit, receivedAmount,strName,datePaid);
			System.out.println("oldAccountId" + paymentId);
		}
		
		ArrayList<TblCategoryDto> getCategoryListForAsset = rl.getCategoryForAsset();
		ArrayList<TblPaymentDto> listOfPayments = rl.getPaymentOfReconciliation(defaultAccountId, defaultFromDate, defaultToDate);
		ArrayList<TblPaymentDto> listOfDepositPayments = rl.getDepositOfReconciliation(defaultAccountId, defaultFromDate, defaultToDate);
		ArrayList<TblAccountCategory> categories = rl.getAccountCategoriesList();
		rl.loadBankAccounts();
		ArrayList<TblAccount> accountList = rl.getBankAccountsTreeForFundTransfer(categories);
		ArrayList<ClientVendor> allClientVendor = rl.getAllClientVendor();
		ArrayList<TblPaymentType> allPaymentList = rl.getAllPaymentList();
		ArrayList<TblCategoryDto> allCategoryList = rl.getAllCategory();
		
		request.setAttribute("allCategoryList", allCategoryList);
		request.setAttribute("allPaymentList", allPaymentList);
		request.setAttribute("allClientVendor", allClientVendor);
		request.setAttribute("initCategory", initCategory);
		request.setAttribute("initCharge", initCharge);
		request.setAttribute("categoryType", categoryType);
		request.setAttribute("listOfPayments", listOfPayments);
		request.setAttribute("listOfDepositPayments", listOfDepositPayments);
		request.setAttribute("accountList", accountList);
		request.setAttribute("selectedAccount", defaultAccountId);
		request.setAttribute("getCategoryListForAsset", getCategoryListForAsset);
		request.setAttribute("subCategoryChrgeListForAsset", subCategoryChrgeListForAsset);
		return forward;
	}

	@PostMapping("/ReconsilationPost")
	public String reconsilationPost(TblPaymentDto tblPaymentDto, HttpServletRequest request) throws Exception {
		String forward = "/accounting/reconsilation";
		HttpSession sess = request.getSession();
		String action = request.getParameter("tabid");
		String strName = "Deposit";
		String companyID = (String) sess.getAttribute("CID");
		Date defaultToDate = new Date();
		Date defaultFromDate = new Date("11/14/2007");
		int defaultAccountId = 56933;
		ArrayList<TblCategoryDto> initCategory = null;
		ArrayList<TblCategoryDto> initCharge = null;
//		ReceivableLIst rl = new ReceivableListImpl();
		ArrayList<TblCategoryType> categoryType = rl.getCategoryType();
		ArrayList<TblCategoryDto> subCategoryChrgeListForAsset = null;
		Gson gson=new Gson();
		if(action.equals("DeletePayment")) {
			String paymentIdString = request.getParameter("PaymentId");
			String AccountIdString  = request.getParameter("AccountId");
			rl.setDeleted(Integer.parseInt(paymentIdString));
			defaultAccountId = Integer.parseInt(AccountIdString);
		}
		if(action.equals("CategoryType")) {
			//TblCategoryType typefrm = (TblCategoryType)form;
			TblCategoryType categoryType1 = gson.fromJson(request.getParameter("data1"), TblCategoryType.class);
			if(categoryType1 != null) {
				initCategory = rl.initTblCategory(categoryType1.getCategoryTypeID());
				initCharge = rl.initComboCharge(initCategory.get(0));
				defaultAccountId = categoryType1.getAccountID();
			}
			TblCategoryDto category = gson.fromJson(request.getParameter("data2"), TblCategoryDto.class);
			if(category != null) {
				initCharge = rl.initComboCharge(category);
				defaultAccountId = category.getAccountID();
			}
		} else {
			initCategory = rl.initTblCategory(categoryType.get(2).getCategoryTypeID());
			initCharge = rl.initComboCharge(initCategory.get(0));
		}
		if(action.equals("AddReconcile")) {
			TblPaymentDto payment1 = gson.fromJson(request.getParameter("data3"), TblPaymentDto.class);
			rl.addBankCharge(payment1);
			defaultAccountId = payment1.getAccountID();
		}
		if(action.equals("SubAssetCategory")) {
			TblCategoryDto category = gson.fromJson(request.getParameter("data4"), TblCategoryDto.class);
			defaultAccountId = category.getAccountID();
			subCategoryChrgeListForAsset = rl.initComboCharge(category);
		}

		ArrayList<TblCategoryDto> getCategoryListForAsset = rl.getCategoryForAsset();
		ArrayList<TblPaymentDto> listOfPayments = rl.getPaymentOfReconciliation(defaultAccountId, defaultFromDate, defaultToDate);
		ArrayList<TblPaymentDto> listOfDepositPayments = rl.getDepositOfReconciliation(defaultAccountId, defaultFromDate, defaultToDate);
		ArrayList<TblAccountCategory> categories = rl.getAccountCategoriesList();
		rl.loadBankAccounts();
		ArrayList<TblAccount> accountList = rl.getBankAccountsTreeForFundTransfer(categories);
		ArrayList<ClientVendor> allClientVendor = rl.getAllClientVendor();
		ArrayList<TblPaymentType> allPaymentList = rl.getAllPaymentList();
		ArrayList<TblCategoryDto> allCategoryList = rl.getAllCategory();

		request.setAttribute("allCategoryList", allCategoryList);
		request.setAttribute("allPaymentList", allPaymentList);
		request.setAttribute("allClientVendor", allClientVendor);
		request.setAttribute("initCategory", initCategory);
		request.setAttribute("initCharge", initCharge);
		request.setAttribute("categoryType", categoryType);
		request.setAttribute("listOfPayments", listOfPayments);
		request.setAttribute("listOfDepositPayments", listOfDepositPayments);
		request.setAttribute("accountList", accountList);
		request.setAttribute("selectedAccount", defaultAccountId);
		request.setAttribute("getCategoryListForAsset", getCategoryListForAsset);
		request.setAttribute("subCategoryChrgeListForAsset", subCategoryChrgeListForAsset);
		return forward;
	}

}
