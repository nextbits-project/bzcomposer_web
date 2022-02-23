package com.nxsol.bizcomposer.accounting.action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.accounting.daoimpl.ReceivableListImpl;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bizcomposer.common.TblVendorDetailDto;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblAccountCategory;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentDto;
@Controller
public class BillPayableController{

	@GetMapping("/BillPayable")
	public ModelAndView billPayable(TblVendorDetailDto tblVendorDetailDto, HttpServletRequest request,
									HttpServletResponse response) throws Exception {
		String forward = "/accounting/billPayable";
		int cvID = 0;
		int checkStatus = 0;
		HttpSession sess=request.getSession();
		Date payBillsDate = new Date();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
		ReceivableLIst rl =  new ReceivableListImpl();
		ArrayList<ClientVendor> cvForCombo = rl.getCvForBill();
		ArrayList<TblAccountCategory> categories = rl.getAccountCategoriesList();
		rl.loadBankAccounts();
		ArrayList<TblAccount> accountListForBill = rl.getBankAccountsTreeForFundTransfer(categories);
		ArrayList<TblCategoryDto> categoryListForCombo = rl.getCategoryListForPayment();
		
		request.setAttribute("cvForCombo", cvForCombo);
		request.setAttribute("accountListForBill", accountListForBill);
		request.setAttribute("categoryListForCombo", categoryListForCombo);
		if(action.equals("billpayable"))
		{
			forward = "/accounting/billPayable";
		}
		if(action.equals("PaidBillLists"))
		{	
			ArrayList<TblPaymentDto> paidBillLists = rl.getPaidBillLists();
			ArrayList<TblPaymentDto> recurrentPaymentList = rl.getRecurrentBillPayment();
			request.setAttribute("recurrentPaymentList", recurrentPaymentList);
			request.setAttribute("paidBillLists", paidBillLists);
			forward = "/accounting/paidBillLists";
		}

		ArrayList<TblVendorDetailDto> unpaidBillList = rl.getUnpaidBillList(cvID, checkStatus);
		request.setAttribute("unpaidBillList", unpaidBillList );
		ArrayList<TblVendorDetailDto> getMemorizeTransactionList = rl.getMemorizeTransactionList();
		request.setAttribute("getMemorizeTransactionList", getMemorizeTransactionList);
		ArrayList<TblVendorDetailDto> payBillList = rl.getPayBillsLists(payBillsDate);
		request.setAttribute("payBillList", payBillList);
		ModelAndView modelAndView =new ModelAndView(forward);

		return modelAndView;
}
	@PostMapping("/billPayablePost")
	public ModelAndView billPayablePost(TblVendorDetailDto tblVendorDetailDto, HttpServletRequest request,
									HttpServletResponse response) throws Exception {
		String forward = "/accounting/billPayable";
		int cvID = 0;
		int checkStatus = 0;
		HttpSession sess = request.getSession();
		Date payBillsDate = new Date();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
		ReceivableLIst rl = new ReceivableListImpl();
		ArrayList<ClientVendor> cvForCombo = rl.getCvForBill();
		ArrayList<TblAccountCategory> categories = rl.getAccountCategoriesList();
		rl.loadBankAccounts();
		ArrayList<TblAccount> accountListForBill = rl.getBankAccountsTreeForFundTransfer(categories);
		ArrayList<TblCategoryDto> categoryListForCombo = rl.getCategoryListForPayment();

		request.setAttribute("cvForCombo", cvForCombo);
		request.setAttribute("accountListForBill", accountListForBill);
		request.setAttribute("categoryListForCombo", categoryListForCombo);
		if(action.equals("save"))
		{
			Gson gson=new Gson();
			TblVendorDetailDto vDetail =  gson.fromJson(request.getParameter("data"), TblVendorDetailDto.class);
			rl.updateBill(vDetail);
		}
		if(action.equals("MakePayment"))
		{
			Gson gson=new Gson();
			TblVendorDetailDto vDetail =  gson.fromJson(request.getParameter("data"), TblVendorDetailDto.class);
			System.out.println(vDetail);
			rl.makePayment(vDetail, cvID);

		}
		if(action.equals("DeleteBill"))
		{
			String billNum = request.getParameter("BillNum");
			int billno = Integer.parseInt(billNum);
			rl.deleteSelectedBill(billno);
		}
		if(action.equals("MakeScheduleMemorizedTransaction"))
		{
			Gson gson=new Gson();
			TblVendorDetailDto vDetail =  gson.fromJson(request.getParameter("data"), TblVendorDetailDto.class);
			Date date = JProjectUtil.getDateForBanking().parse(vDetail.getNextDateString());
			vDetail.setNextDate(date);
			rl.updateVendorBills(vDetail);
			/*System.out.println(vDetail);*/
		}
		if(action.equals("UpdateMemorizedTransaction"))
		{
			String billNumberInString  = request.getParameter("BillNumber");
			int billNo = Integer.parseInt(billNumberInString);
			rl.deleteBill(billNo);
		}
		ModelAndView modelAndView =new ModelAndView(forward);
		return modelAndView;
	}
}