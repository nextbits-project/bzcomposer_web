package com.nxsol.bizcomposer.accounting.action;

import com.avibha.bizcomposer.rma.dao.RMADetailsDao;
import com.avibha.bizcomposer.rma.dao.RMAInfoDao;
import com.avibha.bizcomposer.rma.forms.RMADto;
import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.accounting.daoimpl.ReceivableListImpl;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.TblVendorDetail;
import com.nxsol.bizcompser.global.table.TblCategoryDto;
import com.nxsol.bizcompser.global.table.TblCategoryDtoLoader;
import com.pritesh.bizcomposer.accounting.bean.*;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;

@Controller
public class PoPayableController {

	@Autowired
	private TblCategoryDtoLoader category;
	@Autowired
	private ReceivableLIst rl;

	@Autowired
	private RMAInfoDao rmaInfo;

	@GetMapping("/PoPayable")
	public ModelAndView poPayable(RMADto rmaDto, ReceivableListDto receivableListDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String forward = "/accounting/consignmentSale";
		HttpSession sess = request.getSession();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
//		ReceivableLIst rl = new ReceivableListImpl();
//		
//		TblCategoryDtoLoader category = new TblCategoryDtoLoader();
		ArrayList<TblCategoryDto> categoryforcombo = category.getCategoryForCombo();
		ArrayList<TblPaymentType> paymentTypeForPOcombo = rl.getPaymentTypeForPoPayable();
		ArrayList<TblAccount> accountForCombo = rl.getAccount();
		ArrayList<ReceivableListDto> poList = rl.getPoPayableList();

//		ArrayList<ReceivableListDto> poList = rl.getReceivableList(ConstValue.companyId);
		request.setAttribute("categoryforcombo", categoryforcombo);
		request.setAttribute("paymentTypeForPOcombo", paymentTypeForPOcombo);
		request.setAttribute("accountForCombo", accountForCombo);
		request.setAttribute("poList", poList);

		if (action.equals("UpdateRecord")) {

			Gson gson = new Gson();
			ReceivableListDto reListBean = gson.fromJson(request.getParameter("row"), ReceivableListDto.class);
			double amtToPay = reListBean.getAmtToPay();
			/* String indexNumber = request.getParameter("index"); */
			String invoiceId = request.getParameter("invoiceId");
			String checkNumber = reListBean.getCheckNum();
			reListBean.setInvoiceID(Integer.parseInt(invoiceId));
			reListBean.setCompanyID(ConstValue.companyId);
			int i = rl.updateInvoiceByOrderNum(reListBean);
			HttpSession session = request.getSession();
			session.setAttribute("checkNum" + invoiceId, checkNumber);
			session.setAttribute("invoiceId", invoiceId);
			session.setAttribute("amtToPay" + invoiceId, amtToPay);

			forward = "/accounting/poPayable";
		}
		if (action.equals("Pay")) {

			Gson gson = new Gson();
			ReceivableListDto reListBean = gson.fromJson(request.getParameter("row"), ReceivableListDto.class);
			ReceivableListDto inv = ReceivableListImpl.getInvoiceByInvoiceID(reListBean.getInvoiceID());
			reListBean.setBalance(inv.getBalance());
			reListBean.setInvoiceTypeID(inv.getInvoiceTypeID());
			ReceivableListImpl.invoicePaid(reListBean, true);
			rl.getInvoices(reListBean);
		}
		if (action.equals("consignmentTab")) {
			ArrayList<ReceivableListDto> cli = rl.getConsignmentSaleList();
			request.setAttribute("consignList", cli);
			forward = "/accounting/consignmentSale";
		}
		if (action.equals("vendorRMARefund")) {
			RMADetailsDao rd = new RMADetailsDao();
//			RMAInfoDao rmaInfo = new RMAInfoDao();
			ArrayList VendorRMAList = new ArrayList();
			int invoiceTypeID = 1;
			VendorRMAList = rmaInfo.getVendorRMAList(companyID, invoiceTypeID);
			request.setAttribute("VendorRMAList", VendorRMAList);
			forward = "/accounting/vendorRMARefund";
		}
		if (action.equals("popayable")) {
			forward = "/accounting/poPayable";
		}
		if (action.equals("clearFromConsignTab")) {
			int invoiceID = Integer.parseInt(request.getParameter("invoiceId"));
			rl.clearFromConsignmentTab(invoiceID);
		}
		if (action.equals("consignmentTab")) {
			ArrayList<ReceivableListDto> cli = rl.getConsignmentSaleList();
			request.setAttribute("consignList", cli);
			forward = "/accounting/consignmentSale";
		}

		ModelAndView modelAndView = new ModelAndView(forward);
		return modelAndView;
	}

	@RequestMapping(value = "/PoPayablePost", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView poPayablePost(ReceivableListDto receivableListDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String forward = "/accounting/consignmentSale";
		HttpSession sess = request.getSession();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
//		ReceivableLIst rl = new ReceivableListImpl();

//		TblCategoryDtoLoader category = new TblCategoryDtoLoader();
		ArrayList<TblCategoryDto> categoryforcombo = category.getCategoryForCombo();
		ArrayList<TblPaymentType> paymentTypeForPOcombo = rl.getPaymentTypeForPoPayable();
		ArrayList<TblAccount> accountForCombo = rl.getAccount();
		ArrayList<ReceivableListDto> poList = rl.getPoPayableList();

		request.setAttribute("categoryforcombo", categoryforcombo);
		request.setAttribute("paymentTypeForPOcombo", paymentTypeForPOcombo);
		request.setAttribute("accountForCombo", accountForCombo);
		request.setAttribute("poList", poList);
		if (action.equals("Consignment")) {
			int invoiceID = Integer.parseInt(request.getParameter("invoiceId"));
			rl.changeInvoiceTypeIdForConsignment(invoiceID);
		}
		if (action.equals("popayable")) {
			forward = "/accounting/poPayable";
		}
		if (action.equals("UpdateRecord")) {

			Gson gson = new Gson();
			ReceivableListDto reListBean = gson.fromJson(request.getParameter("row"), ReceivableListDto.class);
			double amtToPay = reListBean.getAmtToPay();
			/* String indexNumber = request.getParameter("index"); */
			String invoiceId = request.getParameter("invoiceId");
			String checkNumber = reListBean.getCheckNum();
			reListBean.setInvoiceID(Integer.parseInt(invoiceId));
			reListBean.setCompanyID(ConstValue.companyId);
			int i = rl.updateInvoiceByOrderNum(reListBean);
			HttpSession session = request.getSession();
			session.setAttribute("checkNum" + invoiceId, checkNumber);
			session.setAttribute("invoiceId", invoiceId);
			session.setAttribute("amtToPay" + invoiceId, amtToPay);

			forward = "/accounting/poPayable";
		}
		if (action.equals("PayBills")) {
//			ReceivableListImpl receivableList = new ReceivableListImpl();
			String billNum = request.getParameter("billNum");
			TblVendorDetail tblVendorDetail = rl.getBillByBillNum(billNum);

			TblAccountable payable = new TblAccountable();
			Calendar c1 = Calendar.getInstance();
			double amount = 0.0;
			payable.setBillNum(Integer.parseInt(billNum));
			payable.setAmount(tblVendorDetail.getAmount());

//			payable.setCategoryId(546919728);
//			payable.setAccountCategoryId(546919728);

			payable.setCategoryId((int) tblVendorDetail.getCategoryID());
			payable.setAccountCategoryId((int) tblVendorDetail.getCategoryID());

			payable.setDateAdded(c1.getTime());
			payable.setInvoiceId(tblVendorDetail.getInvoiceId());
			payable.setPayeeCvId(tblVendorDetail.getVendorId());
			// payable.setInvoiceTypeID(tblVendorDetail.getInvoiceId());

//			payable.setPayeeID(57061);
			payable.setMemo(tblVendorDetail.getMemo());
			// payable.setPaymentTypeId(tblVendorDetail.getPaymentTypeID());
			// payable.setCheckNumber(bean.getCheckNum());

//			payable.setPayFromId(55574);
			payable.setPayFromId(tblVendorDetail.getPayerId());
			payable.setPayeeID(tblVendorDetail.getPayeeId());
			// payable.setPayeeCvServiceId((int)bean.getServiceID());
			rl.insert(payable, false);
			rl.updateBillByBillNumForPaid(billNum);
			forward = "/accounting/poPayable";
		}
		if (action.equals("Pay")) {
			ReceivableListDto reListBean = new ReceivableListDto();
			JSONObject newObj = new JSONObject();
			try {
				newObj = new JSONObject(request.getParameter("row"));
			} catch (JSONException e) {
				e.printStackTrace();
			}
			// Scanner scan = new
			// Scanner(newObj.getJSONObject("ReceivableListDto").getString("poNum"));
			// scan.skip("PO2022-");
			//
			String poNumberStr = newObj.getJSONObject("ReceivableListDto").getString("poNum");
			String[] poStrParts = poNumberStr.split("-");
			String strPoNum = poStrParts[1].trim();
			System.out.println(Integer.parseInt(strPoNum));
			reListBean.setPoNum(Integer.parseInt(strPoNum));
			//
			// reListBean.setPoNum(Integer.parseInt(scan.nextLine()));
			reListBean.setInvoiceID(Integer.parseInt(newObj.getJSONObject("ReceivableListDto").getString("invoiceID")));
			reListBean.setCvID(Integer.parseInt(newObj.getJSONObject("ReceivableListDto").getString("cvID")));
			reListBean.setPaymentTypeID(
					Integer.parseInt(newObj.getJSONObject("ReceivableListDto").getString("paymentTypeID")));
			reListBean.setBankAccountID(
					Integer.parseInt(newObj.getJSONObject("ReceivableListDto").getString("bankAccountID")));
			reListBean.setAdjustedTotal(
					Double.parseDouble(newObj.getJSONObject("ReceivableListDto").getString("adjustedTotal")));
			reListBean.setPaidAmount(
					Double.parseDouble(newObj.getJSONObject("ReceivableListDto").getString("paidAmount")));
			reListBean
					.setCategoryID(Integer.parseInt(newObj.getJSONObject("ReceivableListDto").getString("categoryID")));
			reListBean.setCheckNum(newObj.getJSONObject("ReceivableListDto").getString("checkNum"));

			ReceivableListDto inv = ReceivableListImpl.getInvoiceByInvoiceID(reListBean.getInvoiceID());
			reListBean.setBalance(inv.getBalance());
			reListBean.setInvoiceTypeID(inv.getInvoiceTypeID());
			ReceivableListImpl.invoicePaid(reListBean, true);
			rl.getInvoices(reListBean);
			forward = "redirect:/PoPayablePost?tabid=popayable";
		}
		if (action.equals("clearFromConsignTab")) {
			int invoiceID = Integer.parseInt(request.getParameter("invoiceId"));
			rl.clearFromConsignmentTab(invoiceID);
		}
		ModelAndView modelAndView = new ModelAndView(forward);
		return modelAndView;
	}
}
