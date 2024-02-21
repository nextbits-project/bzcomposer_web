/*
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.purchase.dao;

import com.avibha.bizcomposer.purchase.forms.PurchaseOrderDto;
import com.avibha.bizcomposer.purchase.forms.VendorDto;
import com.avibha.bizcomposer.sales.dao.InvoiceInfo;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.avibha.common.utility.DateInfo;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.pritesh.bizcomposer.accounting.bean.TblBSAddress2;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class PurchaseOrderDetailsDao {
	

	@Autowired
	private CountryState countryState;

	@Autowired
	private PurchaseInfo purchaseInfo;

	@Autowired
	private PayMethod payMethod;

	@Autowired
	private Term term;

	@Autowired
	private Shipping shipping;

	@Autowired
	private ReceivedItemInfo receivedItemInfo;

	@Autowired
	private InvoiceInfo invoiceInfo;

	@Autowired
	private PurchaseOrderInfoDao purchaseOrderInfoDao;
	
	/*
	 * Sets all the information required for the new purchase order. It sets the
	 * information such as order date,next purchase order no.,etc.
	 */
	public void newPurchaseOrder(HttpServletRequest request, PurchaseOrderDto form) {
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
//		form.setOrderNo(purchaseInfo.getNewPONum(compId));
		form.setOrderNo(purchaseOrderInfoDao.getNewPONum(compId));
		request.setAttribute("orderNo", form.getOrderNo());

		DateInfo date = new DateInfo();
		int month = date.getMonth();
		int day = date.getDay();

		String da = "", d = "", m = "";
		if (month >= 1 && month <= 9) {
			m = "0" + month;
		} else
			m = "" + month;
		if (day >= 1 && day <= 9) {
			d = "0" + day;
		} else
			d = "" + day;
		da = m + "-" + d + "-" + (date.getYear());

		form.setOrderDate(da);
		form.setCustID("0");

		form.setInvoiceStyle(purchaseOrderInfoDao.getDefaultPOStyle(compId));
		form.setVia("0");
		form.setTerm("0");
		form.setPayMethod("0");
		form.setItemID("0");
		form.setMessage("0");
		form.setTaxID("0");
		form.setWeight(0.0);
		form.setTotal(0.0);
		form.setBillAddrValue("0");
		form.setShipAddr("0");
		form.setTaxable("false");
		form.setCompany("false");
		form.setCompanyName("");
		form.setFullName("");
		form.setBillTo("");
		form.setShipTo("");
		form.setItemID("0");
		form.setMemo("");
		form.setVenID("0");
		getInvoiceInfo(request);

		request.setAttribute("AddUser", "true");
	}

	/*
	 * Sets all the required information for the purchase order if the purchase
	 * order no. not exist. It sets the information such asorder date,next purchase
	 * order no.,etc.
	 */
	public void notExistPurchaseOrder(HttpServletRequest request, PurchaseOrderDto form) {
		DateInfo date = new DateInfo();
		int month = date.getMonth();
		int day = date.getDay();
		String d1 = "", d2 = "", d = "";

		if (month >= 1 && month <= 9)
			d = "0" + month;
		else
			d = "" + month;

		if (day >= 1 && day <= 9)
			d2 = "-0" + day;
		else
			d2 = "-" + day;

		d1 = d + d2 + "-" + (date.getYear());

		form.setOrderDate(d1);
		form.setCustID("0");
		form.setInvoiceStyle("0");
		form.setVia("0");
		form.setTerm("0");
		form.setPayMethod("0");
		form.setItemID("0");
		form.setMessage("0");
		form.setTaxID("0");
		form.setWeight(0.0);
		form.setTotal(0.0);
		form.setBillAddrValue("0");
		form.setShipAddr("0");
		form.setTaxable("false");
		form.setCompany("false");
		form.setCompanyName("");
		form.setFullName("");
		form.setBillTo("");
		form.setShipTo("");
		form.setItemID("0");
		getInvoiceInfo(request);

		request.setAttribute("AddUser", "true");

	}

	/*
	 * Provides the all basic information required for the new purchase order. The
	 * information such as purchase order style, item list etc.
	 */

	public void getInvoiceInfo(HttpServletRequest request) {
		String compId = (String) request.getSession().getAttribute("CID");
//		ReceivedItemInfo recvInfo = new ReceivedItemInfo();
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
//		Shipping ship = new Shipping();
//		Term term = new Term();
//		PayMethod pyMethod = new PayMethod();

		/* Invoice Style */
		request.setAttribute("InvoiceStyle", receivedItemInfo.getInvoiceStyle());
		/* Via Information */
		request.setAttribute("Via", shipping.getShipCarrierList(compId));
		/* Term Information */
		request.setAttribute("Term", term.getTermList(compId));
		/* Pay Method Information */
		request.setAttribute("PayMethod", payMethod.getPaymentTypeList(compId));
		/* Messages */
		request.setAttribute("Message", receivedItemInfo.getMessage(compId));
		/* Item List */
		request.setAttribute("ItemList", receivedItemInfo.getItemList(compId));
		purchaseOrderInfoDao.getCommonShipAddr(request, compId);
		/* Vendor List */
		request.setAttribute("VendorList", purchaseOrderInfoDao.getVendorDetails(compId, request));

		/* Billing & Shipping Address List */
		request.getSession().setAttribute("BillAddr", purchaseOrderInfoDao.billAddress(compId, null));
		request.setAttribute("ShAddr", purchaseOrderInfoDao.shipAddress(compId, null));

		/* customer list */
//		InvoiceInfo invoice = new InvoiceInfo();
		request.setAttribute("CDetails", invoiceInfo.customerDetails(compId, request));
	}

	/*
	 * Saves or updates the purchase order information to the database.
	 */
	public void savePurchaseOrder(HttpServletRequest request, PurchaseOrderDto form) {
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		String isShipUse = request.getParameter("useDropShip");
		if (form.getOrderNo().contains("-")) {
			String orderNo = form.getOrderNo();
			form.setOrderNo(orderNo.substring(orderNo.indexOf("-") + 1));
		}
		boolean exist = purchaseOrderInfoDao.poNumExist(compId, form.getOrderNo());
		if (exist == true) {
			try {
				int invoiceID = purchaseOrderInfoDao.getInvoiceNo(compId, form.getOrderNo());
				long isShipAddr = purchaseOrderInfoDao.getShipAddrExist(compId, form.getOrderNo());
				if (isShipAddr == 0) {
					purchaseOrderInfoDao.SaveUpdate(compId, form, invoiceID);
				} else {
					purchaseOrderInfoDao.Update(compId, form, invoiceID);
				}
				request.getSession().setAttribute("SaveStatus", "Purchase Order is successfully updated.");
			} catch (Exception e) {
				Loger.log(e.toString());
				request.getSession().setAttribute("SaveStatus", "Purchase Order is not updated.");
			}
		} else {
			try {
				purchaseOrderInfoDao.Save(compId, form);
				request.getSession().setAttribute("SaveStatus", "Purchase Order is successfully saved.");
			} catch (Exception e) {
				Loger.log(e.toString());
				request.getSession().setAttribute("SaveStatus", "Purchase Order is not saved.");
			}
		}
		if (isShipUse != null) {
			if (isShipUse.equals("on")) {
				request.setAttribute("IsUpdated", "true");
			}
		}
	}

	/*
	 * Provides the all the information of the purchase order by button name.
	 */
	public PurchaseOrderDto getPurchaseOrderDetailsByBtnName(HttpServletRequest request,
			PurchaseOrderDto purchaseOrderDto) {
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		Long orderNo = purchaseOrderInfoDao.getPONumberByBtnName(compId, request);
		ArrayList<PurchaseOrderDto> list = purchaseOrderInfoDao.getRecord(request, purchaseOrderDto, compId, orderNo);
		if (!list.isEmpty()) {
			purchaseOrderDto = list.get(0);
			request.setAttribute("Enable", "true");
			request.setAttribute("Status", "");
		} else {
			request.setAttribute("Status", "There is no Purchase Order.");
		}
		getInvoiceInfo(request);
		return purchaseOrderDto;
	}

	/*
	 * Delete the purchase order selected by user
	 */
	public boolean deletePurchaseOrder(HttpServletRequest request, PurchaseOrderDto form) {
		boolean val = false;
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
		String compId = (String) request.getSession().getAttribute("CID");
		String orderNo = form.getOrderNo();
		boolean exist = purchaseOrderInfoDao.poNumExist(compId, orderNo);
		if (exist == true) {
			try {
				purchaseOrderInfoDao.Delete(compId, orderNo);
				request.getSession().setAttribute("SaveStatus", "Purchase Order is successfully deleted.");
				val = true;
			} catch (Exception e) {
				e.printStackTrace();
				Loger.log(e.toString());
			}
		}
		return val;
	}

	/*
	 * Provides all information about the bill or ship address of perticular vendor
	 * selected by user.
	 */
	public void getConfirmAddress(HttpServletRequest request, VendorDto form, String cType) {
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
		purchaseOrderInfoDao.showConfirmAddress(form, request, cType);

//		CountryState cs = new CountryState();
		request.setAttribute("countryList", countryState.getCountryList());
		request.setAttribute("stateList", countryState.getStateList(form.getCountry()));
		request.setAttribute("cityList", countryState.getCityList(form.getState()));
	}

	/*
	 * Add the bill or ship address of the perticular vendor selected by user to the
	 * database
	 */
	@Autowired
	BcaCompanyRepository companyRepository;

	public void addConfirmAddress(HttpServletRequest request, VendorDto form) {
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
		boolean updated = false;
		try {
			//updated = purchaseOrderInfoDao.updateBillingShippingAddress(form, request);
			TblBSAddress2 address = new TblBSAddress2();
//			PurchaseInfo pinfo = new PurchaseInfo();
			int cvID = Integer.parseInt(request.getParameter("clientVendorID"));
			String comId = (String) request.getSession().getAttribute("CID");
			BcaCompany company = companyRepository.findByCompanyId(Long.valueOf(comId));

			address.setAddressWithVendorDto(form, cvID);
			purchaseInfo.insertBillingShippingAddress(address, form.getAddressType(), true, "U", company);
			updated = true;
		} catch (Exception e) {

			// TODO: handle exception
			e.printStackTrace();
		}

		// updated = purchaseInfo.updateBillingShippingAddress(form, request);
		if (updated) {
			request.getSession().setAttribute("actionMsg", "BzComposer.common.recordUpdated");
		} else {
			request.getSession().setAttribute("actionMsg", "BzComposer.common.recordNotUpdated");
		}
	}

	/*
	 * Provides all the required purchase order information.
	 */

	public void getPurchaseOrder(HttpServletRequest request, PurchaseOrderDto form) {
		ArrayList list = new ArrayList();
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
		getInvoiceInfo(request);
		String compId = (String) request.getSession().getAttribute("CID");
		list = purchaseOrderInfoDao.getRecord(request, form, compId, Long.parseLong(form.getOrderNo()));
		if (form.getCompany() == null)
			form.setCompany("false");
		else
			form.setCompany((form.getCompany().equals("on")) ? "true" : "false");
		request.setAttribute("Record", list);
		request.setAttribute("Enable", "true");
		form.setItemID("0");
	}

	/*
	 * Check the required purchase order number is exist in the database or not.
	 */
	public void isPoNumExist(HttpServletRequest request, PurchaseOrderDto form) {
//		PurchaseOrderInfoDao purchaseInfo = new PurchaseOrderInfoDao();
		getInvoiceInfo(request);
		String compId = (String) request.getSession().getAttribute("CID");
		boolean exists = purchaseOrderInfoDao.poNumExist(compId, form.getOrderNo());
		if (form.getCompany() == null)
			form.setCompany("false");
		else
			form.setCompany((form.getCompany().equals("on")) ? "true" : "false");

		if (exists) {
			request.setAttribute("Exists", "true");
		} else
			request.setAttribute("Exists", "false");

	}
}
