/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.sales.actions;

import com.avibha.bizcomposer.sales.dao.SalesBoardDetails;
import com.avibha.bizcomposer.sales.forms.SalesBoardDto;
import com.nxsol.bizcomposer.common.EmailSenderDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class SalesBordController{

	@RequestMapping(value = {"/SalesBord"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String SalesBord(SalesBoardDto salesBoardDto, HttpServletRequest request, Model model) throws IOException, ServletException {
		String forward = "/sales/invoiceboard";
		String action = request.getParameter("tabid");
		model.addAttribute("salesBoardDto", salesBoardDto);
		model.addAttribute("emailSenderDto", new EmailSenderDto());

		if (action.equalsIgnoreCase("ShowList")) { // For Fname and lname listing
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesBoardDetails(request, salesBoardDto);
			forward = "/sales/invoiceboard";
		}

		else if (action.equalsIgnoreCase("UpdateRecord")) { // For Fname and lname
			// listing
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.updateRecord(request);
			sd.getSalesBoardDetails(request, salesBoardDto);
			forward = "/sales/invoiceboard";
		}
		else if (action.equalsIgnoreCase("AllInvoiceList")) {
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesBoardDetails(request, salesBoardDto);
			forward = "/reports/allInvoiceReport";
		}
		else if (action.equalsIgnoreCase("PaidInvoiceList")) {
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesBoardDetails(request, salesBoardDto);
			forward = "/reports/PaidInvoiceReport";
		}
		else if (action.equalsIgnoreCase("UnPaidInvoiceList")) {
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesBoardDetails(request, salesBoardDto);
			forward = "/reports/UnPaidInvoiceReport";
		}
		else if(action.equalsIgnoreCase("refundInvoiceReport")) {
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getRefundInvoiceReport(request, salesBoardDto);
			forward = "/reports/refundInvoiceReport";
		}
		else if (action.equalsIgnoreCase("SalesByRepDetail")) { 
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesBoardDetails(request, salesBoardDto);
			forward = "/reports/salesByRepDetailReport";
		}
		else if (action.equalsIgnoreCase("SalesReportByRep")) { 
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesReportByRep(request, salesBoardDto);
			forward = "/reports/salesReportByRepReport";
		}
		else if(action.equalsIgnoreCase("SalesRBC")) {
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesReportByCustomer(request, salesBoardDto);
			forward = "/reports/salesReportByCustomer";
		}
		else if(action.equalsIgnoreCase("SalesRBI")) {
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesReportByCustomer(request, salesBoardDto);
			forward = "/reports/salesReportByItem";
		}
		else if(action.equalsIgnoreCase("SalesRID")) {
			SalesBoardDetails sd = new SalesBoardDetails();
			sd.getSalesReportByCustomer(request, salesBoardDto);
			forward = "/reports/salesReportByItemDetail";
		}

		return forward;
	}

}
