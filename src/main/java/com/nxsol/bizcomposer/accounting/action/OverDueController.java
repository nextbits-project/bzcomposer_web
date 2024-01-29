package com.nxsol.bizcomposer.accounting.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.nxsol.bizcompser.global.table.TblCategoryDtoLoader;
import com.pritesh.bizcomposer.accounting.bean.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class OverDueController {
	@Autowired
	private ReceivableLIst rl;
	
	@Autowired
	private TblCategoryDtoLoader category ;
	
	@RequestMapping(value ="/OverDueTab", method = {RequestMethod.GET, RequestMethod.POST})
	//@GetMapping("/OverDueTab")
	public ModelAndView OverDue(ReceivableListDto form, HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		String forward = "/accounting/overDue";
		HttpSession sess=request.getSession();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
//		ReceivableLIst rl = new ReceivableListImpl();
		ArrayList<ReceivableListDto> listForUnpaidOpeningBal = rl.getInvoiceForUnpaidOpeningbal(ConstValue.companyId);
		ArrayList<ReceivableListDto> listForUnpaidCreditAmount = rl.getUnpaidCreditAmount(ConstValue.companyId);
//		TblCategoryDtoLoader category = new TblCategoryDtoLoader();
		ArrayList<TblCategoryDto> categoryforcombo = category.getCategoryForCombo();
		ArrayList<ClientVendor> clientVendorForCombo = rl.getClientVendorForCombo();
		ArrayList<TblPaymentType> paymentType = rl.getPaymentType();
		ArrayList<TblAccount> account =rl.getAccount();
		request.setAttribute("listForUnpaidCreditAmount", listForUnpaidCreditAmount);
		request.setAttribute("listForUnpaidOpeningBal", listForUnpaidOpeningBal);
		request.setAttribute("AccountForCombo", account);
		request.setAttribute("PaymentTypeForCombo", paymentType);
		request.setAttribute("CategoryCombo", categoryforcombo);
		request.setAttribute("ClineVendorForCombo", clientVendorForCombo);

		if (action.equalsIgnoreCase("overDueTab")) { // save of DataManager tab                 //changed by pritesh 24-04-2018
			forward = "/accounting/overDue";
		}
		if(action.equals("UpdateRecord"))
		{
			ReceivableListDto cfrm = (ReceivableListDto) form;
			Gson gson=new Gson();
			ReceivableListDto reListBean = gson.fromJson(request.getParameter("row"), ReceivableListDto.class);
			double amtToPay = reListBean.getAmtToPay();
			/*String indexNumber = request.getParameter("index");*/
			String invoiceId = request.getParameter("invoiceId");
			String checkNumber = reListBean.getCheckNum();
			reListBean.setCompanyID(ConstValue.companyId);
			int i = rl.updateInvoiceByOrderNum(reListBean);
			HttpSession session = request.getSession();
			session.setAttribute("checkNum"+invoiceId, checkNumber);
			session.setAttribute("invoiceId", invoiceId);
			session.setAttribute("amtToPay"+invoiceId, amtToPay);

			forward = "/accounting/overDue";
		}
		if(action.equals("ReceivedInvoice"))
		{
			ReceivableListDto cfrm = (ReceivableListDto) form;
			Gson gson=new Gson();
			ReceivableListDto invoice = gson.fromJson(request.getParameter("row"), ReceivableListDto.class);
			String rowId = request.getParameter("index");
			/*System.out.println(invoice.getPaidAmount());*/
			int orderNum = invoice.getOrderNum();
			ReceivableListDto rb = rl.getInvoiceByOrderNUm(orderNum, ConstValue.companyId);
			int invoiceId = rb.getInvoiceID();
			TblPaymentDto payment = rl.setPayment(invoice,invoiceId,ConstValue.companyId);
			payment.setInvoiceTypeID(1);
			int balance = (int) (invoice.getAdjustedTotal() - (rl.getSum(invoiceId) + invoice.getPaidAmount()));
//		    ReceivableListDto invoice = new ReceivableListDto();
			invoice.setBalance(balance);
			invoice.setInvoiceID(invoiceId);
			rl.insertAccount(payment, invoice);
			rl.getLastId(payment);
			TblAccount account1 = rl.getAccountById(invoice.getBankAccountID());
			int priority = rl.getPriority();
			rl.depositTo(payment, account1,priority);
			double totalAmount = rl.getAmountByInvoiceId(invoice);
			double adjustedAmount = rb.getAdjustedTotal();
			double totalPayable = adjustedAmount - totalAmount;
			HttpSession session = request.getSession();
			session.setAttribute("totalPayable"+invoiceId, totalPayable);
			session.removeAttribute("checkNum"+invoiceId);
			session.removeAttribute("amtToPay"+invoiceId);
		}
		if(action.equals("ClearTransaction"))
		{
			/*String invoice = request.getParameter("invoiceId");*/
			int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
			System.out.println(invoiceId);
			rl.updateInvoice(invoiceId);

		}
		ArrayList<ReceivableListDto> ReceivableList = rl.getReceivableList(ConstValue.companyId);
		request.setAttribute("ReceivableList", ReceivableList);
		ModelAndView modelAndView =new ModelAndView(forward);
		return modelAndView;
	}
	@PostMapping("/OverDueTabPost")
	public ModelAndView OverDuePost(ReceivableListDto form, HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		String forward = "/accounting/overDue";
		HttpSession sess = request.getSession();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
//		ReceivableLIst rl = new ReceivableListImpl();
		ArrayList<ReceivableListDto> listForUnpaidOpeningBal = rl.getInvoiceForUnpaidOpeningbal(ConstValue.companyId);
		ArrayList<ReceivableListDto> listForUnpaidCreditAmount = rl.getUnpaidCreditAmount(ConstValue.companyId);
		TblCategoryDtoLoader category = new TblCategoryDtoLoader();
		ArrayList<TblCategoryDto> categoryforcombo = category.getCategoryForCombo();
		ArrayList<ClientVendor> clientVendorForCombo = rl.getClientVendorForCombo();
		ArrayList<TblPaymentType> paymentType = rl.getPaymentType();
		ArrayList<TblAccount> account = rl.getAccount();
		request.setAttribute("listForUnpaidCreditAmount", listForUnpaidCreditAmount);
		request.setAttribute("listForUnpaidOpeningBal", listForUnpaidOpeningBal);
		request.setAttribute("AccountForCombo", account);
		request.setAttribute("PaymentTypeForCombo", paymentType);
		request.setAttribute("CategoryCombo", categoryforcombo);
		request.setAttribute("ClineVendorForCombo", clientVendorForCombo);
		if(action.equals("UpdateRecord"))
		{
			ReceivableListDto cfrm = (ReceivableListDto) form;
			Gson gson=new Gson();
			ReceivableListDto reListBean = gson.fromJson(request.getParameter("row"), ReceivableListDto.class);
			double amtToPay = reListBean.getAmtToPay();
			/*String indexNumber = request.getParameter("index");*/
			String invoiceId = request.getParameter("invoiceId");
			String checkNumber = reListBean.getCheckNum();
			reListBean.setCompanyID(ConstValue.companyId);
			int i = rl.updateInvoiceByOrderNum(reListBean);
			HttpSession session = request.getSession();
			session.setAttribute("checkNum"+invoiceId, checkNumber);
			session.setAttribute("invoiceId", invoiceId);
			session.setAttribute("amtToPay"+invoiceId, amtToPay);

			forward = "/accounting/overDue";
		}
		if(action.equals("ReceivedInvoice"))
		{
			ReceivableListDto cfrm = (ReceivableListDto) form;
			Gson gson=new Gson();
			ReceivableListDto invoice = gson.fromJson(request.getParameter("row"), ReceivableListDto.class);
			String rowId = request.getParameter("index");
			/*System.out.println(invoice.getPaidAmount());*/
			int orderNum = invoice.getOrderNum();
			ReceivableListDto rb = rl.getInvoiceByOrderNUm(orderNum, ConstValue.companyId);
			int invoiceId = rb.getInvoiceID();
			TblPaymentDto payment = rl.setPayment(invoice,invoiceId,ConstValue.companyId);
			payment.setInvoiceTypeID(1);
			int balance = (int) (invoice.getAdjustedTotal() - (rl.getSum(invoiceId) + invoice.getPaidAmount()));
//		    ReceivableListDto invoice = new ReceivableListDto();
			invoice.setBalance(balance);
			invoice.setInvoiceID(invoiceId);
			rl.insertAccount(payment, invoice);
			rl.getLastId(payment);
			TblAccount account1 = rl.getAccountById(invoice.getBankAccountID());
			int priority = rl.getPriority();
			rl.depositTo(payment, account1,priority);
			double totalAmount = rl.getAmountByInvoiceId(invoice);
			double adjustedAmount = rb.getAdjustedTotal();
			double totalPayable = adjustedAmount - totalAmount;
			HttpSession session = request.getSession();
			session.setAttribute("totalPayable"+invoiceId, totalPayable);
			session.removeAttribute("checkNum"+invoiceId);
			session.removeAttribute("amtToPay"+invoiceId);
		}
		if(action.equals("ClearTransaction"))
		{
			/*String invoice = request.getParameter("invoiceId");*/
			int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
			System.out.println(invoiceId);
			rl.updateInvoice(invoiceId);

		}
		ModelAndView modelAndView =new ModelAndView(forward);
		return modelAndView;
	}
}
