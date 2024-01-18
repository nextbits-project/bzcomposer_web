package com.avibha.bizcomposer.lead.actions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.employee.dao.Title;
import com.avibha.bizcomposer.lead.dto.LeadDto;
import com.avibha.bizcomposer.purchase.dao.PurchaseInfo;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.utility.CountryState;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bzcomposer.company.ConfigurationDAO;
import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaLeadSource;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;
import com.nxsol.bzcomposer.company.domain.BcaTitle;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadSourceRepository;
import com.nxsol.bzcomposer.company.repos.BcaTitleRepository;
import com.nxsol.bzcomposer.company.service.BcaClientvendorService;
import com.nxsol.bzcomposer.company.service.LeadService;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author kamiomar
 */
@Controller
public class LeadController {

	@Autowired
	private BcaClientvendorRepository clientVendorRepo;

	@Autowired
	private BcaTitleRepository titleRepo;

	@Autowired
	private LeadService leadService;

	@Autowired
	private BcaCompanyRepository companyRepo;

	@Autowired
	private CountryState cs;

	@GetMapping("/Leads")
	public String getleads(Model model, HttpServletRequest request) {

//		for (BcaClientvendor customer : customers) {
//		    // Perform operations on each customer entity
//		    System.out.println("Customer ID: " + customer.getClientVendorId());
//		    System.out.println("Customer Name: " + customer.getCountry());
//		    // ... Other operations
//		}
		int cvType = 6;// 6 for Lead

		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		BcaCompany company = companyRepo.findById(Long.parseLong(companyId)).orElse(null);
		model.addAttribute("customerList", leadService.getAllLead(cvType, company));
		return "leads/leadList";
	}

	@Autowired
	private SalesDetailsDao sd;

	@Autowired
	private InvoiceInfoDao invoice;

	@GetMapping("/newLead")
	public String getNewLead(Model model, HttpServletRequest request) {
		CustomerDto customerDto = new CustomerDto();
		String leadId = clientVendorRepo.getMaxId();
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		customerDto.setClientVendorID(leadId);
		customerDto.setZipCode("90004");

		customerDto.setDateAdded(invoice.setCurrentDate());
		customerDto.setLeadId(0);
		customerDto.setBillingAddressId(0);
		customerDto.setShippingAddressId(0);

		sd.getAllList(request);

		model.addAttribute("customerDto", customerDto);
		model.addAttribute("leadSource", leadService.getLeadSources(companyId));
		model.addAttribute("LeadCategory", leadService.getLeadCategories(companyId));
		model.addAttribute("product", leadService.getAllProducts(companyId));

		model.addAttribute("pageTitle", "BzComposer - Add New Lead");
		model.addAttribute("pageHeading", "Add New Lead");
		model.addAttribute("purpose", "newPage");
		model.addAttribute("leadId", null);
		model.addAttribute("shippingAddressId", null);
		model.addAttribute("billingAddressId", null);

		return "leads/addNewLead";
	}

	@GetMapping("/updateLead/{id}")
	public String getUpdateLead(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");

		CustomerDto customerDto = leadService.getLeadById(id);
		System.out.println(customerDto);

		sd.getAllList(request);

		model.addAttribute("leadSource", leadService.getLeadSources(companyId));
		model.addAttribute("LeadCategory", leadService.getLeadCategories(companyId));
		model.addAttribute("product", leadService.getSelectedLeadProduct(companyId, id));
		model.addAttribute("customerDto", customerDto);

		request.setAttribute("stateList", cs.getStateList(customerDto.getCountry()));
		request.setAttribute("cityList", cs.getCityList(customerDto.getState()));

		model.addAttribute("pageTitle", "BzComposer - Edit Lead");
		model.addAttribute("pageHeading", "Edit Lead");
		model.addAttribute("purpose", "editPage");

		return "leads/addNewLead";
	}

	@PostMapping("/postNewLead")
	public String postNewLead(@ModelAttribute("customerDto") CustomerDto customerDto,
			@RequestParam(name = "product", required = false) List<String> products,
			@RequestParam(name = "purpose") String purpose, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");

		leadService.addClientVendor(customerDto, companyId);
		leadService.addShippingAddress(customerDto);
		leadService.addBillingAddress(customerDto);

		int lastInsertedLeadId = leadService.addLead(customerDto, companyId);

		if (products != null) {
			leadService.addLeadProduct(products, companyId, lastInsertedLeadId, purpose);
		}

		return "redirect:/Leads";
	}

	@GetMapping("/removeLead/{id}")
	public String removeLead(@PathVariable("id") int id) {
		leadService.removeClientVendor(id);
		return "redirect:/Leads";
	}
//
//	private CountryState countryState;
//
//	private Title title;
//
//	@PostConstruct
//	private void postConstruct() {
//		countryState = new CountryState();
//		title = new Title();
//	}
//
//	@GetMapping("/Leadsold")
//	public String loadLeadsOld(@RequestParam(required = false, name = "tabid") String action, Model model,
//			HttpSession session) throws Exception {
//		String forward = "";
//		// String action = request.getParameter("tabid");
//		String strCompanyId = (String) session.getAttribute("CID");
//		if (StringUtils.isEmpty(strCompanyId)) {
//			return "redirect:Login?tabid=loginPage";
//		}
//
//		int companyId = Integer.parseInt(strCompanyId);
//
//		// ConstValue.companyId = companyId;
//
//		// ConstValue c = new ConstValue();
//		// c.setCompanyId(Integer.parseInt(companyID));
//		model.addAttribute("leadList", leadDAO.loadLeads(strCompanyId));
//
//		forward = "/leads/leads";
//
//		return forward;
//	}
//
//	
//	@GetMapping("/Leads")
//	public String loadLeads(@RequestParam(required = false, name = "tabid") String action, Model model,
//			HttpSession session) throws Exception {
//		String forward = "";
//		// String action = request.getParameter("tabid");
//		String strCompanyId = (String) session.getAttribute("CID");
//		if (StringUtils.isEmpty(strCompanyId)) {
//			return "redirect:Login?tabid=loginPage";
//		}
//
//		model.addAttribute("leadList", leadDAO.loadLeads(strCompanyId));
// 
//		forward = "/leads/leads";
//
//		return forward;
//	}
//
//	@GetMapping("/Lead/delete")
//	public String loadLead(@RequestParam(required = true, name = "LeadId") Long leadId, HttpSession session,
//			Model model) {
//
//		String strCompanyId = (String) session.getAttribute("CID");
//		if (StringUtils.isEmpty(strCompanyId)) {
//			return "redirect:Login?tabid=loginPage";
//		}
//
//		leadDAO.delete(leadId, strCompanyId);
//
//		return "redirect:/Leads?tabid=leads";
//	}
//
//	@GetMapping("/Lead")
//	public String loadLead(@RequestParam(required = false, name = "LeadId") Long leadId, Model model,
//			HttpSession session) throws Exception {
//		String forward = "";
//		// String action = request.getParameter("tabid");
//		String strCompanyId = (String) session.getAttribute("CID");
//		if (StringUtils.isEmpty(strCompanyId)) {
//			return "redirect:Login?tabid=loginPage";
//		}
//
//		int companyId = Integer.parseInt(strCompanyId);
//
//		// ConstValue.companyId = companyId;
//
//		// ConstValue c = new ConstValue();
//		// c.setCompanyId(Integer.parseInt(companyID));
//
//		if (leadId == null || leadId <= 0) {
//
//			String countryID = ConstValue.countryID;
//			String stateID = ConstValue.stateID;
//
//			// country List
//			model.addAttribute("cList", countryState.getCountry());
//			model.addAttribute("countryList", countryState.getCountryList());
//			model.addAttribute("stateList", countryState.getStateList(countryID));
//			model.addAttribute("cityList", countryState.getCityList(stateID));
//
//			model.addAttribute("titleList", title.getTitleList(strCompanyId));
//
//			model.addAttribute("leadDto", new LeadDto());
//			forward = "/leads/addLead";
//		} else {
//			LeadDto dto = leadDAO.loadLead(leadId, strCompanyId);
//
//			String countryID = ObjectUtils.isEmpty(dto.getCountry()) ? ConstValue.countryID : dto.getCountry();
//			String stateID = ObjectUtils.isEmpty(dto.getState()) ? ConstValue.stateID : dto.getState();
//
//			// country List
//			model.addAttribute("cList", countryState.getCountry());
//			model.addAttribute("countryList", countryState.getCountryList());
//			model.addAttribute("stateList", countryState.getStateList(countryID));
//			model.addAttribute("cityList", countryState.getCityList(stateID));
//
//			model.addAttribute("titleList", title.getTitleList(strCompanyId));
//			model.addAttribute("leadDto", dto);
//			forward = "/leads/addLead";
//		}
//		return forward;
//	}
//
//	@PostMapping("/Lead")
//	public String saveLead(LeadDto leadDto, @RequestParam(required = true, name = "tabid") String action, Model model,
//			HttpSession session) throws Exception {
//		String forward = "";
//		// String action = request.getParameter("tabid");
//		String strCompanyId = (String) session.getAttribute("CID");
//		if (StringUtils.isEmpty(strCompanyId)) {
//			return "redirect:Login?tabid=loginPage";
//		}
//
//		if (leadDto.getLeadId() == null || leadDto.getLeadId() <= 0) {
//
//			leadDAO.insert(leadDto, strCompanyId);
//			/// forward = "/leads/addLead";
//			model.addAttribute("success", true);
//			forward = "/leads/addLead";
//		} else {
//
//			leadDAO.update(leadDto, strCompanyId);
//			/// forward = "/leads/addLead";
//			model.addAttribute("success", true);
//			forward = "/leads/addLead";
//
//		}
//
//		return "redirect:Leads";
//	}

}
