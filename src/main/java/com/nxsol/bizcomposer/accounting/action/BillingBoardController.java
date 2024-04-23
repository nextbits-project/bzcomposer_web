package com.nxsol.bizcomposer.accounting.action;

import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.utility.MyUtility;
import com.google.gson.Gson;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.common.BillingStatement;
import com.nxsol.bizcomposer.jasper.pojo.BillingBoardReport;
import com.nxsol.bizcomposer.jasper.pojo.BillingStatementReport;
import com.pritesh.bizcomposer.accounting.bean.ReceivableListDto;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class BillingBoardController {

	@Autowired
	private ReceivableLIst rl;

	@Autowired
	private SalesDetailsDao sd;

//	@Autowired
//	CustomerDto customerDto;

	@GetMapping("/BillingBoard")
	public String billingBoard(CustomerDto customerDto, HttpServletRequest request) throws Exception {

		String forward = "/accounting/billingBoard";
		HttpSession sess = request.getSession();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
//	ReceivableLIst rl = new ReceivableListImpl();
		Date from = null;
		Date to = null;
		String columnName = " orderNum ";
		int InvoiceType = 113;
		int overdueDays = 0;
		String alldata = "Default";
		String advanceSearchCriteria = "";
		String advanceSearchData = "";
		String dataForBillStatement = "";
		String criteriaForBillStatement = "";
		InputStream fileInputStream;
		String jasperPath = "";
		String pdfName = "";
		String rpt = "";
		String destinationPsth = "";
		int x = 50;
		int y = 100;
		int width = 900;
		int height = 725;

		if (action.equalsIgnoreCase("billingBoard")) {
			Gson gson = new Gson();
			ArrayList<ReceivableListDto> billingList = rl.getAllInvoicesForBillingBoardWithSearchOption(from, to,
					"DESC", columnName, InvoiceType, overdueDays, alldata, advanceSearchCriteria, advanceSearchData);
			ArrayList<BillingStatement> billingStatementList = rl.getBillStatementList(dataForBillStatement,
					criteriaForBillStatement);
			request.setAttribute("billingStatementList", billingStatementList); // paid bills
			request.setAttribute("billingList", billingList);
		} else if (action.equalsIgnoreCase("billingCompaniesBoard")) {
			forward = "/accounting/billingCompaniesBoard";
			request.setAttribute("cvTypeID", 3);
			String firstCvID = sd.getCustomerList(request);
			sd.getAllList(request);

//			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			customerDto.setPeriodFrom(MyUtility.getDateBeforeGivenMonths(12));
			customerDto.setPeriodTo(MyUtility.getCurrentDate());
			request.setAttribute("selectedCvID", request.getParameter("selectedCvID"));
			request.setAttribute("selectedCvID", firstCvID);
		}

		return forward;
	}

	@RequestMapping(value = "/BillingBoardStatement", method = { RequestMethod.GET, RequestMethod.POST })
	public String billingBoardStatement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String forward = "/accounting/billingBoard";
		HttpSession sess = request.getSession();
		String action = request.getParameter("tabid");
		String companyID = (String) sess.getAttribute("CID");
//		ReceivableLIst rl = new ReceivableListImpl();
		Date from = null;
		Date to = null;
		String columnName = "orderNum ";
		int InvoiceType = 113;
		int overdueDays = 0;
		String alldata = "Default";
		String advanceSearchCriteria = "";
		String advanceSearchData = "";
		String dataForBillStatement = "";
		String criteriaForBillStatement = "";
		InputStream fileInputStream;
		String jasperPath = "";
		String pdfName = "";
		String rpt = "";
		String destinationPsth = "";
		int x = 50;
		int y = 100;
		int width = 900;
		int height = 725;

		Gson gson = new Gson();
		if (action.equals("CreateBillingStatement")) {
			try {
				Integer invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
				rl.insertIntoBillingStatement(invoiceId);
				ArrayList<BillingStatementReport> bill = rl.printBillingStatement(invoiceId);
				jasperPath = request.getServletContext().getRealPath("/JasperReport/billingStatement.jrxml");
				JasperDesign design = JRXmlLoader.load(jasperPath);
				JasperReport jasperreport = JasperCompileManager.compileReport(design);
				final String filePath = request.getServletContext().getRealPath("/JasperReport/");
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm");
				LocalDateTime now = LocalDateTime.now();
				System.out.println();
				String fileName = invoiceId + "_" + dtf.format(now) + "_billingStatement.pdf";
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperreport, rl.getReportParameter(),
						new JRBeanCollectionDataSource(bill));
				// JasperExportManager.exportReportToPdfFile(jasperPrint, filePath + fileName);
				response.setContentType("application/x-pdf");
				response.addHeader("Content-Disposition", "inline; filename=" + fileName + ";");
				ServletOutputStream outStream = response.getOutputStream();
				JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action.equals("searchByColumn")) {
			advanceSearchCriteria = request.getParameter("advanceSerchCriteria");
			advanceSearchData = request.getParameter("advanceSearchData");
		}
		if (action.equals("searchByOverDueDays")) {
			overdueDays = Integer.parseInt(request.getParameter("overdueDays"));
		}
		if (action.equals("searchForBillingStatement")) {
			criteriaForBillStatement = request.getParameter("advanceSerchCriteria");
			dataForBillStatement = request.getParameter("advanceSearchData");
		}
		if (action.equals("PrintBill")) {
			String invoiceId = request.getParameter("invoiceId");
			ArrayList<BillingBoardReport> bill = rl.getBillForPrint(Integer.parseInt(invoiceId));
			jasperPath = request.getServletContext().getRealPath("/JasperReport/PrintBilling.jrxml");
			destinationPsth = request.getServletContext().getRealPath("/JasperReport/PrintBilling.pdf");

			JasperDesign design = JRXmlLoader.load(jasperPath);
			JasperReport jasperreport = JasperCompileManager.compileReport(design);
			final String filePath = request.getServletContext().getRealPath("/JasperReport/");
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy_MM_dd_HH_mm");
			LocalDateTime now = LocalDateTime.now();
			System.out.println();
			String fileName = invoiceId + "_" + dtf.format(now) + "_PrintBilling.pdf";
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperreport, rl.getReportParameter(),
					new JRBeanCollectionDataSource(bill));
			// JasperExportManager.exportReportToPdfFile(jasperPrint, filePath + fileName);
			response.setContentType("application/x-pdf");
			response.addHeader("Content-Disposition", "inline; filename=" + fileName + ";");
			ServletOutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
		}
		ArrayList<ReceivableListDto> billingList = rl.getAllInvoicesForBillingBoardWithSearchOption(from, to, "DESC",
				columnName, InvoiceType, overdueDays, alldata, advanceSearchCriteria, advanceSearchData);
		ArrayList<BillingStatement> billingStatementList = rl.getBillStatementList(dataForBillStatement,
				criteriaForBillStatement);
		request.setAttribute("billingStatementList", billingStatementList);
		request.setAttribute("billingList", billingList);
		return forward;
	}

}
