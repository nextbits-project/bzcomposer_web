package com.nxsol.bizcomposer.accounting.action;

import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.common.JProjectUtil;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.nxsol.bizcompser.global.table.TblCategoryDtoLoader;
import com.pritesh.bizcomposer.accounting.bean.TblAccount;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentDto;
import com.pritesh.bizcomposer.accounting.bean.TblPaymentType;
import org.apache.struts.action.Action;
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
import java.util.Iterator;

@Controller
public class PaidListController extends Action {

	@Autowired
	private ReceivableLIst rl;

	@Autowired
	private TblCategoryDtoLoader category;

	@RequestMapping(value = "/PaidListTab", method = { RequestMethod.GET, RequestMethod.POST })
	// @GetMapping("/PaidListTab")
	public ModelAndView PaidList(TblPaymentDto form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Date fromDate = null;
		Date toDate = null;
		String strName = "Payment";
		String tableName = "bca_payment";
		String forward = "/accounting/paidList";
		HttpSession sess = request.getSession();
		String action = request.getParameter("tabid");
		String selectedRange = request.getParameter("SelectedRange");
		String companyID = (String) sess.getAttribute("CID");
//		ReceivableLIst rl = new ReceivableListImpl();
		ArrayList<TblPaymentDto> paidList = null;
//		TblCategoryDtoLoader category = new TblCategoryDtoLoader();
		ArrayList<TblCategoryDto> categoryforcombo = category.getCategoryForCombo();
		ArrayList<TblPaymentType> paymentTypeForPOcombo = rl.getPaymentTypeForPoPayable();
		ArrayList<TblAccount> accountForCombo = rl.getAccount();
		request.setAttribute("categoryforcombo", categoryforcombo);
		request.setAttribute("paymentTypeForPOcombo", paymentTypeForPOcombo);
		request.setAttribute("accountForCombo", accountForCombo);
		if (selectedRange != null) {
			int selectedrangeInt = Integer.parseInt(selectedRange);
			ArrayList<Date> range = rl.getSelectedDateRange(selectedrangeInt);
			fromDate = range.get(0);
			toDate = range.get(1);
		}
		if (action.equals("slectedMenu")) {
			paidList = rl.getPaidList(fromDate, toDate);
			request.setAttribute("paidList", paidList);

		} else {
			paidList = rl.getPaidList(fromDate, toDate);
			request.setAttribute("paidList", paidList);
		}
//		paidList = rl.getPaidList(fromDate,toDate);
		ArrayList<TblPaymentDto> paidConsign = rl.getPaidConsignPaymentList();
		/* request.setAttribute("paidList", paidList); */
		request.setAttribute("paidConsignment", paidConsign);
		Iterator<TblPaymentDto> pay = paidList.iterator();
		while (pay.hasNext()) {
			TblPaymentDto payment = pay.next();
			String PaidOrUnpaid = rl.getPaidOrUnpaid(payment.getInvoiceID(), payment.getPayableID());
			Double totalAmount = rl.getTotalAmountByInvoiceId(payment.getInvoiceID());
			request.getSession().setAttribute("PaidOrUnpaid" + payment.getInvoiceID(), PaidOrUnpaid);
		}

		if (action.equals("UpdateRecord")) {
			TblPaymentDto cfrm = form;
			Gson gson = new Gson();
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
			rl.updateTransaction(payment, receivedAmount, strName, datePaid);
			System.out.println("oldAccountId" + paymentId);
			/* HttpSession session = request.getSession(); */

		}
		if (action.equals("clearTransaction")) {
			int paymentId = Integer.parseInt(request.getParameter("paymentId"));
			TblPaymentDto payment = rl.getObjectOfStoragePayment(paymentId);
			int invoiceId = payment.getInvoiceID();
			/*
			 * int invoiceStatus = rl.readInvoiceStatus(payment.getInvoiceID()); if
			 * (invoiceStatus == ReceivableListBean.REFUND_INVOICE_STATUS || invoiceStatus
			 * == ReceivableListBean.PARTIAL_REFUND_INVOICE_STATUS) {
			 * 
			 * }
			 */
			rl.setDeletedmodified(payment, true, tableName, 0);

		}

		if (action.equals("paidList")) {
			forward = "/accounting/paidList";
		}
		ModelAndView modelAndView = new ModelAndView(forward);
		return modelAndView;
	}

	@RequestMapping(value = "/PaidListTabPost", method = { RequestMethod.GET, RequestMethod.POST })
	// @PostMapping("/PaidListTabPost")
	public ModelAndView PaidListPost(TblPaymentDto form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Date fromDate = null;
		Date toDate = null;
		String strName = "Payment";
		String tableName = "bca_payment";
		String forward = "/accounting/paidList";
		HttpSession sess = request.getSession();
		String action = request.getParameter("tabid");
		String selectedRange = request.getParameter("SelectedRange");
		String companyID = (String) sess.getAttribute("CID");
//		ReceivableLIst rl = new ReceivableListImpl();
		ArrayList<TblPaymentDto> paidList = null;
//		TblCategoryDtoLoader category = new TblCategoryDtoLoader();
		ArrayList<TblCategoryDto> categoryforcombo = category.getCategoryForCombo();
		ArrayList<TblPaymentType> paymentTypeForPOcombo = rl.getPaymentTypeForPoPayable();
		ArrayList<TblAccount> accountForCombo = rl.getAccount();
		request.setAttribute("categoryforcombo", categoryforcombo);
		request.setAttribute("paymentTypeForPOcombo", paymentTypeForPOcombo);
		request.setAttribute("accountForCombo", accountForCombo);
		if (action.equals("UpdateRecord")) {
			TblPaymentDto cfrm = form;
			Gson gson = new Gson();
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
			rl.updateTransaction(payment, receivedAmount, strName, datePaid);
			System.out.println("oldAccountId" + paymentId);
			/* HttpSession session = request.getSession(); */

		}
		if (action.equals("clearTransaction")) {
			int paymentId = Integer.parseInt(request.getParameter("paymentId"));
			TblPaymentDto payment = rl.getObjectOfStoragePayment(paymentId);
			int invoiceId = payment.getInvoiceID();
			/*
			 * int invoiceStatus = rl.readInvoiceStatus(payment.getInvoiceID()); if
			 * (invoiceStatus == ReceivableListBean.REFUND_INVOICE_STATUS || invoiceStatus
			 * == ReceivableListBean.PARTIAL_REFUND_INVOICE_STATUS) {
			 * 
			 * }
			 */
			rl.setDeletedmodified(payment, true, tableName, 0);

		}
		if (action.equals("slectedMenu")) {
			paidList = rl.getPaidList(fromDate, toDate);
			request.setAttribute("paidList", paidList);

		}
		ModelAndView modelAndView = new ModelAndView(forward);
		return modelAndView;
	}
}
