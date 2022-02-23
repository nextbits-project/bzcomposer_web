package com.nxsol.bizcomposer.accounting.action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.accounting.daoimpl.ReceivableListImpl;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bizcomposer.common.TblRecurrentPaymentPlan;
import com.nxsol.bizcomposer.common.TblVendorDetailDto;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblAccountCategory;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentDto;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;
@Controller
public class BillCreationController {

	@GetMapping("/BillCreation")
	public ModelAndView BillCreation(TblVendorDetailDto form, TblRecurrentPaymentPlan form1, HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		
		String forward = "/accounting/billCreation";
		int cvID = 0;
		int checkStatus = 0;
		HttpSession sess=request.getSession();
		Date payBillsDate = new Date();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
		ReceivableLIst rl =  new ReceivableListImpl();
		/*Iterator<ClientVendor> itr = cvForCombo.iterator();*/
		ArrayList<TblAccountCategory> categories = rl.getAccountCategoriesList();
		rl.loadBankAccounts();
		ArrayList<TblAccount> accountListForBill = rl.getBankAccountsTreeForFundTransfer(categories);
		ArrayList<TblCategoryDto> categoryListForCombo = rl.getCategoryListForPayment();
		request.setAttribute("accountListForBill", accountListForBill);
		request.setAttribute("categoryListForCombo", categoryListForCombo);
		if(action.equals("billpayable"))
		{
			forward = "/accounting/billCreation";
		}

		if(action.equals("PaidBillLists"))
		{	
			ArrayList<TblPaymentDto> paidBillLists = rl.getPaidBillLists();
			ArrayList<TblPaymentDto> recurrentPaymentList = rl.getRecurrentBillPayment();
			request.setAttribute("recurrentPaymentList", recurrentPaymentList);
			request.setAttribute("paidBillLists", paidBillLists);
			forward = "success2";
		}


		String vendorId = request.getParameter("VendorId");
		if(vendorId != null)
		{
			int id = Integer.parseInt(vendorId);
			cvID = id;
		}
		if(action.equals("UpdateRecurrentPayment"))
		{
			TblRecurrentPaymentPlan cFrm = (TblRecurrentPaymentPlan) form1;
			Gson gson=new Gson();
			TblRecurrentPaymentPlan paymentPlan = gson.fromJson(request.getParameter("data"), TblRecurrentPaymentPlan.class);
			String planID = request.getParameter("PlanID");
			if(planID != "" && planID !=null)
			{
				int planid = Integer.parseInt(planID);
				paymentPlan.setPlanID(planid);
			}
			rl.updateRecurrentPayment(paymentPlan);
		}
		ArrayList<TblVendorDetailDto> allBillLists = rl.getAllBill(cvID, checkStatus);
		request.setAttribute("allBillLists", allBillLists);
		ArrayList<TblCategoryDto> allcategoryList = rl.getAllCategories();
		ArrayList<ClientVendor> getClientForBill = rl.getClientVendorForCombo();
		ArrayList<TblAccount> getAccountForRecurrent = rl.getAccount();
		ArrayList<TblPaymentType> getPayMentTypeForRecurrent = rl.getPaymentType();
		request.setAttribute("getPayMentTypeForRecurrent", getPayMentTypeForRecurrent);
		request.setAttribute("getAccountForRecurrent", getAccountForRecurrent);
		request.setAttribute("getClientForBill", getClientForBill);
		request.setAttribute("allcategoryList", allcategoryList);
		ArrayList<TblVendorDetailDto> getMemorizeTransactionList = rl.getMemorizeTransactionList();
		request.setAttribute("getMemorizeTransactionList", getMemorizeTransactionList);
		ArrayList<TblVendorDetailDto> payBillList = rl.getPayBillsLists(payBillsDate);
		request.setAttribute("payBillList", payBillList);
		ArrayList<TblRecurrentPaymentPlan> recurentPaymentList = new ArrayList<TblRecurrentPaymentPlan>();
		ArrayList<ClientVendor> cvForCombo = rl.getCvForBill();
		request.setAttribute("cvForCombo", cvForCombo);
		for(ClientVendor cv : cvForCombo)
		{
			/*ClientVendor cv = itr.next();*/
			TblRecurrentPaymentPlan paymentPlan = rl.getPlanOfCvID(cv.getCvID());
			if(paymentPlan != null)
			{	
				recurentPaymentList.add(paymentPlan);
			}	
		}
		request.setAttribute("recurentPaymentList", recurentPaymentList);
		int maxBillId = rl.getmaxBill();
		request.setAttribute("maxBillId", maxBillId);
		ModelAndView modelAndView =new ModelAndView(forward);
		return modelAndView;
	}

	@GetMapping("/BillCreationPost")
	public ModelAndView BillCreationPost(TblVendorDetailDto form, TblRecurrentPaymentPlan form1, HttpServletRequest request,
									 HttpServletResponse response) throws Exception {

		String forward = "/accounting/billCreation";
		int cvID = 0;
		int checkStatus = 0;
		HttpSession sess = request.getSession();
		Date payBillsDate = new Date();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
		ReceivableLIst rl = new ReceivableListImpl();
		/*Iterator<ClientVendor> itr = cvForCombo.iterator();*/
		ArrayList<TblAccountCategory> categories = rl.getAccountCategoriesList();
		rl.loadBankAccounts();
		ArrayList<TblAccount> accountListForBill = rl.getBankAccountsTreeForFundTransfer(categories);
		ArrayList<TblCategoryDto> categoryListForCombo = rl.getCategoryListForPayment();
		request.setAttribute("accountListForBill", accountListForBill);
		request.setAttribute("categoryListForCombo", categoryListForCombo);
		if(action.equals("save"))
		{
			TblVendorDetailDto cfrm = (TblVendorDetailDto) form;
			Gson gson=new Gson();
			TblVendorDetailDto vDetail =  gson.fromJson(request.getParameter("data"), TblVendorDetailDto.class);
			rl.updateBill(vDetail);


		}
		if(action.equals("MakePayment"))
		{
			TblVendorDetailDto cfrm = (TblVendorDetailDto) form;
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
			TblVendorDetailDto cfrm = (TblVendorDetailDto) form;
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
		if(action.equals("CreateBill"))
		{
			TblVendorDetailDto cfrm = (TblVendorDetailDto) form;
			Gson gson=new Gson();
			TblVendorDetailDto vDetail =  gson.fromJson(request.getParameter("data"), TblVendorDetailDto.class);
			rl.insertNewBill(vDetail);
			System.out.println("");

		}
		if(action.equals("setUpPayment"))
		{
			TblRecurrentPaymentPlan cFrm = (TblRecurrentPaymentPlan) form1;
			Gson gson=new Gson();
			TblRecurrentPaymentPlan paymentPlan = gson.fromJson(request.getParameter("data"), TblRecurrentPaymentPlan.class);
			rl.insertRecurrentPaymentPlan(paymentPlan, true);
			System.out.println(paymentPlan);

		}
		ModelAndView modelAndView =new ModelAndView(forward);
		return modelAndView;
	}
}
