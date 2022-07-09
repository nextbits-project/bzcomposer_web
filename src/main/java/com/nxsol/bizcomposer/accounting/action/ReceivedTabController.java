package com.nxsol.bizcomposer.accounting.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nxsol.bizcompser.global.table.TblCategoryDtoLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.accounting.daoimpl.ReceivableListImpl;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.pritesh.bizcomposer.accounting.bean.ReceivableListDto;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentDto;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;
@Controller
public class ReceivedTabController {

	@GetMapping("/ReceivedTab")
	public ModelAndView ReceivedTab(TblPaymentDto form, HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		Date fromDate = null;
		Date toDate = null;
		String strName = "Deposit";
		String tableName = "bca_payment";
		String forward = "/accounting/received";
		HttpSession sess=request.getSession();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
		ReceivableLIst rl = new ReceivableListImpl();
		TblCategoryDtoLoader category = new TblCategoryDtoLoader();
		ArrayList<TblCategoryDto> categoryforcombo = category.getCategoryForCombo();
		ArrayList<ClientVendor> clientVendorForCombo = rl.getClientVendorForCombo();
		ArrayList<TblPaymentType> paymentType = rl.getPaymentType();
		ArrayList<TblAccount> account =rl.getAccount();
		
		ArrayList<Date> date = rl.getDateRange();	
		fromDate = date.get(0);
		toDate = date.get(1);
		String dateString = rl.getDateString(fromDate, toDate);
		request.setAttribute("AccountForCombo", account);
		request.setAttribute("PaymentTypeForCombo", paymentType);
		request.setAttribute("CategoryCombo", categoryforcombo);
		request.setAttribute("ClineVendorForCombo", clientVendorForCombo);
		if(action.equals("UpdateRecord"))
		{
			TblPaymentDto cfrm = (TblPaymentDto)form;
			Gson gson=new Gson();
			TblPaymentDto paymentFromAjax = gson.fromJson(request.getParameter("row"), TblPaymentDto.class);
			int paymentId = Integer.parseInt(request.getParameter("PaymentId"));
			String paidDate = request.getParameter("PaidDate");
			Date datePaid = JProjectUtil.getdateFormat().parse(paidDate);
			double receivedAmount = Double.parseDouble(request.getParameter("ReceivedAmount"));
			TblPaymentDto payment = rl.getObjectOfStoragePayment(paymentId);
			payment.setOldclientVendorID(paymentFromAjax.getOldclientVendorID());
			payment.setOldAccountID(paymentFromAjax.getOldAccountID());
			payment.setPaymentTypeID(paymentFromAjax.getPaymentTypeID());
			payment.setAccountID(paymentFromAjax.getAccountID());
			double toBeDeposited = receivedAmount - payment.getAmount();
			rl.updateTransaction(payment, receivedAmount,strName,datePaid);
			System.out.println("oldAccountId" + paymentId);
			HttpSession session = request.getSession();
			
		}
		if(action.equals("clearTransaction"))
		{
			int paymentId = Integer.parseInt(request.getParameter("paymentId"));
			TblPaymentDto payment = rl.getObjectOfStoragePayment(paymentId);
			int invoiceId = payment.getInvoiceID();
			int invoiceStatus = rl.readInvoiceStatus(payment.getInvoiceID());
			 if (invoiceStatus == ReceivableListDto.REFUND_INVOICE_STATUS || invoiceStatus == ReceivableListDto.PARTIAL_REFUND_INVOICE_STATUS) {
                
             }
			 else {
				 rl.setDeletedmodified(payment, true, tableName, 0);
			 }
			 
		}
		if(action.equals("receivedTab"))
		{	
				
			forward = "/accounting/received";
		}
		ArrayList<TblPaymentDto> receivedPaymentList = rl.getReceivedList(ConstValue.companyId, dateString);
		Iterator<TblPaymentDto> pay = receivedPaymentList.iterator();
		while(pay.hasNext())
		{
			TblPaymentDto payment = pay.next();
			String PaidOrUnpaid = rl.getPaidOrUnpaid(payment.getInvoiceID(),payment.getPayableID());
			Double totalAmount = rl.getTotalAmountByInvoiceId(payment.getInvoiceID());
			request.getSession().setAttribute("PaidOrUnpaid"+payment.getInvoiceID(), PaidOrUnpaid);
			request.getSession().setAttribute("invoiceId", payment.getInvoiceID());
			request.getSession().setAttribute("totalAmount"+payment.getInvoiceID(), totalAmount);
		}
		ArrayList<TblPaymentDto> partiallyReceivedLayaways = rl.getPartiallyReceivedLayaways();
		request.setAttribute("partiallyReceivedLayaways", partiallyReceivedLayaways);
		request.setAttribute("receivedList", receivedPaymentList);

		ModelAndView modelAndView =new ModelAndView(forward);
		return modelAndView;
	}
}
