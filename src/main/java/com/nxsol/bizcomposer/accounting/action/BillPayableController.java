package com.nxsol.bizcomposer.accounting.action;

import com.avibha.bizcomposer.purchase.dao.PurchaseDetailsDao;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bizcomposer.common.TblVendorDetail;
import com.nxsol.bizcomposer.common.TblVendorDetailDto;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.nxsol.bzcomposer.company.service.BcaClientvendorService;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblAccountCategory;
import com.pritesh.bizcomposer.accounting.bean.TblPayment;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentDto;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class BillPayableController {

	@Autowired
	private ReceivableLIst rl;
	
	@Autowired
	private BcaClientvendorService clientVendorService;
	
	@Autowired
	private PurchaseDetailsDao purchaseDetailsDao ;
	


	@RequestMapping(value = "/BillPayable", method = { RequestMethod.GET, RequestMethod.POST })
	// @GetMapping("/BillPayable")
	public ModelAndView billPayable(TblVendorDetailDto tblVendorDetailDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String forward = "/accounting/newBillPayable";
		int cvID = 0;
		int checkStatus = 0;
		HttpSession sess = request.getSession();
		Date payBillsDate = new Date();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
		Long companyIDL = Long.valueOf(companyID);
//		ReceivableLIst rl = new ReceivableListImpl();
		//ArrayList<ClientVendor> cvForCombo = rl.getCvForBill();
	   ArrayList<ClientVendor> cvForCombo= rl.getServiceProviderClientVendor();
		ArrayList<TblAccountCategory> categories = rl.getAccountCategoriesList(companyIDL);
		rl.loadBankAccounts();
		ArrayList<TblAccount> accountListForBill = rl.getBankAccountsTreeForFundTransfer(categories);
		ArrayList<TblCategoryDto> categoryListForCombo = rl.getCategoryListForPayment();

		request.setAttribute("cvForCombo", cvForCombo);
		request.setAttribute("accountListForBill", accountListForBill);///pay from accounts
		request.setAttribute("categoryListForCombo", categoryListForCombo);
		
		if (action.equals("billpayable")) {
			forward = "/accounting/billPayable";
		}
		if (action.equals("PaidBillLists")) {
//			ArrayList<TblPaymentDto> paidBillLists = rl.getPaidBillLists();
			ArrayList<TblPayment> paidBillLists = rl.getPaidBillListsPayment();
			ArrayList<TblPaymentDto> recurrentPaymentList = rl.getRecurrentBillPayment();
			request.setAttribute("recurrentPaymentList", recurrentPaymentList);
			request.setAttribute("paidBillLists", paidBillLists);
			forward = "/accounting/paidBillLists";
		}
		if (action.equals("billCompanies")) {
//			ArrayList<TblPayment> paidBillLists = rl.getPaidBillListsPayment();
//			ArrayList<TblPaymentDto> recurrentPaymentList = rl.getRecurrentBillPayment();
//			request.setAttribute("recurrentPaymentList", recurrentPaymentList);
//			request.setAttribute("paidBillLists", paidBillLists);
//			forward = "/accounting/paidBillLists";
//			CustomerDto customerDto =new CustomerDto();
//			String cvId = request.getParameter("cvId");
//			String rowId = request.getParameter("SelectedRID");
//			String firstCvID = clientVendorService.getCustomerList(request);
//
////			SalesDetailsDao sd = new SalesDetailsDao();
////			String firstCvID = sd.getCustomerList(request);
//			if (cvId == null) {
//				cvId = firstCvID;
//			}
//			clientVendorService.searchSelectedCustomer(cvId, request, customerDto);
//			clientVendorService.getAllList(request);
//
//			if (rowId != null) {
//				customerDto.setSelectedRowID(rowId);
//			} else {
//				customerDto.setSelectedRowID("0");
//			}
//			if (cvId != null) {
//				customerDto.setClientVendorID(cvId);
//			} else {
//				customerDto.setClientVendorID("0");
//			}
//			if (rowId != null) {
//				request.setAttribute("VendorFrm", customerDto.getSelectedRowID());
//			}
			
			purchaseDetailsDao.getVendors(request);
			purchaseDetailsDao.getAllList(request);
			forward = "/accounting/billingCompanies";
		}

		ArrayList<TblVendorDetail> unpaidBillList = rl.getUnpaidBillList(cvID, checkStatus);
		request.setAttribute("unpaidBillList", unpaidBillList);
		ArrayList<TblVendorDetail> getMemorizeTransactionList = rl.getMemorizeTransactionList();
		request.setAttribute("getMemorizeTransactionList", getMemorizeTransactionList);
		ArrayList<TblVendorDetail> payBillList = rl.getPayBillsLists(payBillsDate);
		request.setAttribute("payBillList", payBillList);
		ModelAndView modelAndView = new ModelAndView(forward);
		return modelAndView;
	}

	@RequestMapping(value = "/billPayablePost", method = { RequestMethod.GET, RequestMethod.POST })
	// @PostMapping("/billPayablePost")
	public ModelAndView billPayablePost(TblVendorDetailDto tblVendorDetailDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String forward = "/accounting/billPayable";
		int cvID = 0;
		int checkStatus = 0;
		HttpSession sess = request.getSession();
		Date payBillsDate = new Date();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
		Long companyIDL = Long.valueOf(companyID);
//		ReceivableLIst rl = new ReceivableListImpl();
		ArrayList<ClientVendor> cvForCombo = rl.getCvForBill();
		ArrayList<TblAccountCategory> categories = rl.getAccountCategoriesList(companyIDL);
		rl.loadBankAccounts();
		ArrayList<TblAccount> accountListForBill = rl.getBankAccountsTreeForFundTransfer(categories);
		ArrayList<TblCategoryDto> categoryListForCombo = rl.getCategoryListForPayment();

		request.setAttribute("cvForCombo", cvForCombo);
		request.setAttribute("accountListForBill", accountListForBill);
		request.setAttribute("categoryListForCombo", categoryListForCombo);
		if (action.equals("save")) {
			JSONObject newObj = new JSONObject();
			try {
				newObj = new JSONObject(request.getParameter("data"));
			} catch (JSONException e) {
				e.printStackTrace();
			}
			TblVendorDetail vDetail = new TblVendorDetail();
			vDetail.setBillNo(Integer.parseInt(newObj.getString("billNo")));
			vDetail.setVendorId(Integer.parseInt(newObj.getString("vendorID")));
			vDetail.setPayerId(Integer.parseInt(newObj.getString("payerId")));
			vDetail.setAmount(Double.parseDouble(newObj.getString("amount")));
			vDetail.setCheckNo(Integer.parseInt(newObj.getString("checkNo")));
			vDetail.setDueDate(newObj.getString("dueDate"));
			vDetail.setCategoryID(Integer.parseInt(newObj.getString("categoryID")));
			vDetail.setMemo(newObj.getString("memo"));
			rl.updateBill(vDetail);

		}
		if (action.equals("MakePayment")) {
			Gson gson = new Gson();
			TblVendorDetail vDetail = gson.fromJson(request.getParameter("data"), TblVendorDetail.class);
			System.out.println(vDetail);
			cvID = vDetail.getVendorId();
			rl.makePayment(vDetail, cvID);

		}
		if (action.equals("DeleteBill")) {
			String billNum = request.getParameter("BillNum");
			int billno = Integer.parseInt(billNum);
			rl.deleteSelectedBill(billno);
		}
		if (action.equals("MakeScheduleMemorizedTransaction")) {
			Gson gson = new Gson();
			TblVendorDetail vDetail = gson.fromJson(request.getParameter("data"), TblVendorDetail.class);
			Date date = JProjectUtil.getDateForBanking().parse(vDetail.getNextDateString());
			vDetail.setNextDate(date);
			rl.updateVendorBills(vDetail);
			/* System.out.println(vDetail); */
		}
		if (action.equals("UpdateMemorizedTransaction")) {
			String billNumberInString = request.getParameter("BillNumber");
			int billNo = Integer.parseInt(billNumberInString);
			rl.deleteBill(billNo);
		}
		ModelAndView modelAndView = new ModelAndView(forward);
		return modelAndView;
	}
}