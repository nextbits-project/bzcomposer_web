package com.avibha.bizcomposer.purchase.actions;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.purchase.dao.PurchaseBoardDetails;
import com.avibha.bizcomposer.purchase.dao.PurchaseOrderDetailsDao;
import com.avibha.bizcomposer.purchase.forms.PurchaseBoardDto;
import com.avibha.bizcomposer.purchase.forms.PurchaseOrderDto;
import com.avibha.bizcomposer.purchase.forms.VendorDto;
import com.avibha.bizcomposer.sales.dao.InvoiceInfo;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.bizcomposer.sales.forms.UpdateInvoiceDto;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.utility.MyUtility;
import com.avibha.common.utility.Path;

@Controller
public class ConsignmentSalesController {

	@Autowired
	private InvoiceInfoDao invoiceInfoDao;

	@Autowired
	private InvoiceInfo invoiceInfo;

	@Autowired
	private PurchaseOrderDetailsDao purchaseOrderDetailsDao;

	@Autowired
	private ConfigurationInfo configInfo;

	@Autowired
	private SalesDetailsDao salesDetailsDao;

	@Autowired
	private PurchaseBoardDetails purchaseBoardDetails;

	@RequestMapping(value = { "/ConsignmentSales" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String purchaseOrder(VendorDto vendorDto, UpdateInvoiceDto updateInvoiceDto,
			PurchaseBoardDto purchaseBoardDto, PurchaseOrderDto purchaseOrderDto, HttpServletRequest request,
			Model model) throws IOException, ServletException, Throwable {
		String forward = "/purchase/consignmentSales";

		String action = request.getParameter("tabid");
		String companyID = (String) request.getSession().getAttribute("CID");
		Path p = new Path();
		p.setPathvalue(request.getContextPath());
		request.getSession().setAttribute("path", p);
		request.getSession().setAttribute("CID", companyID);
		ConfigurationDto configDto;
		if (action == null) {
			forward = "purchase/consignmentSales";
			return forward;
		}

		switch (action) {

		case "consignmentSales":

			String compId = (String) request.getSession().getAttribute("CID");

			purchaseOrderDetailsDao.newPurchaseOrder(request, purchaseOrderDto);
			configDto = configInfo.getDefaultCongurationDataBySession();

			request.setAttribute("ShAddr", invoiceInfoDao.shipAddress(compId, null));
			request.setAttribute("BillAddr", invoiceInfoDao.billAddress(compId, null));
			salesDetailsDao.setUpdatPurchaseAddress(purchaseOrderDto, request);
			request.setAttribute("Invoicestyleid", invoiceInfo.getDefaultInvoiceStyleNo(companyID));
			purchaseOrderDto.setInvoiceStyle(configDto.getVendorInvoiceStyleId() + "");
			purchaseOrderDto.setTerm(configDto.getSelectedTermId() + "");
			purchaseOrderDto.setPayMethod(configDto.getSelectedPaymentId() + "");
			purchaseOrderDto.setVia(configDto.getCustomerShippingId() + "");
			purchaseOrderDto.setTemplateType(configDto.getPoTemplateType());
			purchaseOrderDto.setOrderNo(MyUtility.getOrderNumberByConfigData(purchaseOrderDto.getOrderNo(),
					AppConstants.POType, configDto, false));

			forward = "purchase/consignmentSales";
			break;
		case "save":
			purchaseOrderDetailsDao.saveConsignmentSales(request, purchaseOrderDto);
			purchaseOrderDetailsDao.removeSessionAddressData(request);
			
			
			forward = "redirect:ConsignmentSales?tabid=consignmentSales";
			break;
			
		case "edit":
			String poNo = request.getParameter("po_no");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
//		    PurchaseOrderDetailsDao pdetails = new PurchaseOrderDetailsDao();
			purchaseOrderDetailsDao.newPurchaseOrder(request, purchaseOrderDto);
			purchaseOrderDto.setInvoiceTypeId(31);
			salesDetailsDao.getInitializePurchase(poNo, request, purchaseOrderDto);

//			ConfigurationInfo configInfo = new ConfigurationInfo();
			configDto = configInfo.getDefaultCongurationDataBySession();

//			InvoiceInfo info = new InvoiceInfo();
			request.setAttribute("Invoicestyleid", invoiceInfo.getDefaultInvoiceStyleNo(companyID));
			purchaseOrderDto.setInvoiceStyle(configDto.getVendorInvoiceStyleId() + "");
			purchaseOrderDto.setTerm(configDto.getSelectedTermId() + "");
			purchaseOrderDto.setPayMethod(configDto.getSelectedPaymentId() + "");
			purchaseOrderDto.setVia(configDto.getCustomerShippingId() + "");
			purchaseOrderDto.setTemplateType(configDto.getPoTemplateType());
			purchaseOrderDto.setOrderNo(MyUtility.getOrderNumberByConfigData(purchaseOrderDto.getOrderNo(),
					AppConstants.POType, configDto, false));
			request.setAttribute("Enable", "true");
			forward = "purchase/consignmentSales";
			break;
		case "ShowList":

			model.addAttribute("purchaseBoardDto", purchaseBoardDto);
			purchaseBoardDetails.getConsignmentSaleDetails(request, purchaseBoardDto);
			forward = "purchase/consignmentSalesBoard";
			break;

		default:
			break;

		}
		return forward;
	}

}
