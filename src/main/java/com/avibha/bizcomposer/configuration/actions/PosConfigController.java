package com.avibha.bizcomposer.configuration.actions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avibha.bizcomposer.File.dao.CompanyInfo;
import com.avibha.bizcomposer.File.forms.CompanyInfoDto;
import com.avibha.bizcomposer.configuration.dao.ConfigurationDetails;
import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.dao.TestEmail;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.configuration.forms.DeductionListDto;
import com.avibha.bizcomposer.configuration.forms.DesignFeatureDto;
import com.avibha.bizcomposer.configuration.forms.ScheduleDateDto;
import com.avibha.bizcomposer.email.dao.EmailDetails;
import com.avibha.bizcomposer.email.forms.EmailForm;
import com.avibha.bizcomposer.email.forms.MailTemplateDto;
import com.avibha.bizcomposer.employee.forms.CompanyTaxOptionDto;
import com.avibha.bizcomposer.employee.forms.StateIncomeTaxDto;
import com.avibha.bizcomposer.login.dao.LoginDAO;
import com.avibha.bizcomposer.login.dao.LoginDAOImpl;
import com.avibha.bizcomposer.purchase.dao.VendorCategory;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.common.utility.CountryState;
import com.mysql.cj.Session;
import com.nxsol.bizcomposer.accounting.action.CategoryManagerController;
import com.nxsol.bizcomposer.accounting.dao.ReceivableLIst;
import com.nxsol.bizcomposer.accounting.daoimpl.ReceivableListImpl;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.AddNewCompanyDAO;
import com.nxsol.bzcomposer.company.ConfigurationDAO;

/**
 * @author sarfrazmalik
 */
@Controller
public class PosConfigController {

	@Autowired
	private ConfigurationDetails configDetails;

	@Autowired
	private ConfigurationDetails cDetails;

	@Autowired
	private ConfigurationInfo configInfo;

	@Autowired
	private ConfigurationDAO dao;
	
	private MailTemplateDto mailTemplateDto;
	
	@Autowired
	private SalesDetailsDao sd;

	@Autowired
	ConfigurationDAO configDao;

	@Autowired
	private ReceivableLIst rl;

	private String pageActiveTab = "pageActiveTab";
	ArrayList<MailTemplateDto> mailTemplateDtos;

	@Autowired
	private CategoryManagerController catManagerController;

	@Autowired
	private CompanyInfo customer;

	@Autowired
	private AddNewCompanyDAO companyDAO;
	
	@ResponseBody
	@PostMapping(value = { "/ConfigurationPOSAjax/SaveConfiguration" })
	public String ConfigurationAjax(DesignFeatureDto configDto, HttpServletRequest request) {
		String status = "Success";
		String action = request.getParameter("tabid");
		System.out.println("-------ConfigurationAjax--POST-------tabid: " + action);

		String companyID = (String) request.getSession().getAttribute("CID");
		if (action.equalsIgnoreCase("DesignFeature")) {
			configDto.setProductIcons(request.getParameter("productIcons"));
			configDto.setGridsSalesSlip(request.getParameter("gridsSalesSlip"));
			configDto.setCalculatorDisplay(request.getParameter("calculatorDisplay"));
			configDto.setCustomerTypeId(request.getParameter("customerTypeId"));
			configDto.setProductListId(request.getParameter("productListId"));
			configDto.setSalesTaxRate(request.getParameter("salesTaxRate"));
			configDto.setSpPolice(request.getParameter("spPolice"));
			configDto.setSpRetailer(request.getParameter("spRetailer"));
			configDto.setSpWholesaler(request.getParameter("spWholesaler"));
			
			cDetails.saveDesignFeature(configDto, companyID);
			//cDetails.getConfigurationInfo(request, configDto);
		} else {
			System.out.println("-----------ERROR-ACTION-not-found-------------");
		}
		return status;
	}

}
