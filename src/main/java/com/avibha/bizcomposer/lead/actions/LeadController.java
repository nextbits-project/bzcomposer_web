package com.avibha.bizcomposer.lead.actions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avibha.bizcomposer.employee.dao.Label;
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

import java.util.ArrayList;
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
	private ConfigurationInfo configInfo;
	
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

	private int cvType = 6; // default for Leads
	
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

		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
		request.setAttribute("defaultCongurationData", configDto);
		
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
		customerDto.setCompanyID(Integer.valueOf(companyId));
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

	@GetMapping("/LeadBoard")
	public String getLeadBoard(Model model, @ModelAttribute("customerDto") CustomerDto customerDto,
			HttpServletRequest request) {
//		SalesDetailsDao sd = new SalesDetailsDao();
		sd.getAllList(request);
		int cvType = 6;

		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		BcaCompany company = companyRepo.findById(Long.parseLong(companyId)).orElse(null);
		
		List<BcaClientvendor> leadList = leadService.getAllLead(cvType, company);
		
		model.addAttribute("CustomerDetails", leadList);
		
		int firstCvID = 0;
		if (!leadList.isEmpty()) {
			firstCvID = leadList.get(0).getClientVendorId();
		}
		
		
		request.setAttribute("selectedCvID", firstCvID);

		model.addAttribute("leadSource", leadService.getLeadSources(companyId));
		model.addAttribute("LeadCategory", leadService.getLeadCategories(companyId));
		model.addAttribute("product", leadService.getAllProducts(companyId));
		

		return "leads/leadBoard";
	}

	// Ajux response for lead Details
	@GetMapping("/getLeadDetails/{id}")
	public ResponseEntity<CustomerDto> getLeadDetailsById(@PathVariable("id") int clientvendorId) {
		CustomerDto customerDto = leadService.getLeadById(clientvendorId);
		if (customerDto != null) {
			return ResponseEntity.ok(customerDto);
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@GetMapping("/leadAddressLabel")
	public String getLeadAddressLabel(Model model, HttpServletRequest request) {	
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		BcaCompany company = companyRepo.findById(Long.parseLong(companyId)).orElse(null);
		
		Label lbl = new Label();
		ArrayList labelList = lbl.getLabelList();
		model.addAttribute("Labels", labelList);
		model.addAttribute("CustomerDetails", leadService.getAllLead(cvType, company)); 
		
		return "leads/printLabels";
	}
	
}
