package com.avibha.bizcomposer.sales.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.opportunity.form.OpportunityDto;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.bizcomposer.sales.dao.SalesOrderBoardDetails;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.bizcomposer.sales.forms.InvoiceDto;
import com.avibha.bizcomposer.sales.forms.ItemDto;
import com.avibha.bizcomposer.sales.forms.SalesBoardDto;
import com.avibha.bizcomposer.sales.forms.UpdateInvoiceDto;
import com.avibha.common.constants.AppConstants;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.MyUtility;
import com.avibha.common.utility.Path;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.EmailSenderDto;

@Controller
public class LayawaysController {
	@Autowired
	private SalesDetailsDao sd;

	@Autowired
	private ConfigurationInfo configInfo;

	@Autowired
	private SalesOrderBoardDetails salesOrderBoardDetails;

	@RequestMapping(value = { "/Layaways" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String executeLayawaysController(CustomerDto customerDto, InvoiceDto invoiceDto, ItemDto itemDto,
			UpdateInvoiceDto updateInvoiceDto, OpportunityDto opportunityDto, EmailSenderDto emailSenderDto,
			SalesBoardDto salesBoardDto, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		setSessionAttributes(session, request);
		String forward = "/sales/SalesOrderBoard";
		model.addAttribute("emailSenderDto", new EmailSenderDto());
		model.addAttribute("salesBoardDto", salesBoardDto);

		String action = request.getParameter("tabid");
		if (action == null) {
			forward = "sales/layaways";
			return forward;
		}

		switch (action) {
		case "Layaways":
			processLayaways(request, invoiceDto);
			forward = "sales/layaways";
			break;
		case "SaveLayaways":
			sd.saveLayaways(request, invoiceDto);
			sd.removeSessionAddressUpdateData(request);
			forward = "redirect:Layaways?tabid=Layaways";
			break;

		case "ShowList":
			salesOrderBoardDetails.getLayawaysBoardDetails(request, salesBoardDto);
			forward = "sales/LayawaysBoard";
			break;
		case "Edit":
			String orderNo = request.getParameter("order_no");
//			SalesDetailsDao sdetails = new SalesDetailsDao();
			sd.newSalesOrder(request, invoiceDto);
			sd.getInvoiceInfo(request);
			sd.getLayawaysInitialize(orderNo, request, invoiceDto);

			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			InvoiceDto invoice = new InvoiceDto();
			invoice.setSalesTaxID("1");
			invoice.setState("Tax " + configDto.getSaleTaxRate() + "%");
			invoice.setRate(configDto.getSaleTaxRate());
			List<InvoiceDto> taxRates = new ArrayList<>();
			taxRates.add(invoice);
			request.setAttribute("TaxRates", taxRates);
			invoiceDto.setTemplateType(configDto.getSoTemplateType());
			invoiceDto.setOrderNo(MyUtility.getOrderNumberByConfigData(invoiceDto.getOrderNo(), AppConstants.SOType,
					configDto, false));
			request.setAttribute("Enable", "true");
			forward = "sales/layaways";

		default:
			break;
		}

		return forward;
	}

	private void setSessionAttributes(HttpSession session, HttpServletRequest request) {
		String companyID = (String) session.getAttribute("CID");
		String companyName = (String) session.getAttribute("user");
		ConstValue.setCompanyName(companyName);
		String user = (String) session.getAttribute("username");
		String userRole = (String) session.getAttribute("userRole");
		System.out.println("User is: " + user);

		ConstValue constValue = new ConstValue();
		constValue.setCompanyId(Integer.parseInt(companyID));
		Path path = new Path();
		path.setPathvalue(request.getContextPath());
		session.setAttribute("path", path);
		session.setAttribute("CID", companyID);

		Loger.log("hasan:@ Layaways ");
	}

	private void processLayaways(HttpServletRequest request, InvoiceDto invoiceDto) throws Exception {
		sd.newSalesOrder(request, invoiceDto);
		sd.getInvoiceInfo(request);

		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		InvoiceDto invoice = new InvoiceDto();
		sd.setUpdatedInvoiceAddress(invoiceDto, request);
		invoice.setSalesTaxID("1");
		invoice.setState("Tax " + configDto.getSaleTaxRate() + "%");
		invoice.setRate(configDto.getSaleTaxRate());
		List<InvoiceDto> taxRates = new ArrayList<>();
		taxRates.add(invoice);
		request.setAttribute("TaxRates", taxRates);
		invoiceDto.setRep(String.valueOf(configDto.getSelectedSalesRepId()));
		invoiceDto.setTerm(String.valueOf(configDto.getSelectedTermId()));
		invoiceDto.setPayMethod(String.valueOf(configDto.getSelectedPaymentId()));
		invoiceDto.setVia(String.valueOf(configDto.getCustomerShippingId()));
		invoiceDto.setTemplateType(configDto.getSoTemplateType());
		invoiceDto.setInvoiceStyle(String.valueOf(configDto.getSoStyleID()));
		invoiceDto.setOrderNo(
				MyUtility.getOrderNumberByConfigData(invoiceDto.getOrderNo(), AppConstants.SOType, configDto, false));
	}
}
