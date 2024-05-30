package com.avibha.bizcomposer.lead.actions;

import org.apache.struts.action.ActionMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
import com.avibha.bizcomposer.sales.forms.InvoiceDto;
import com.avibha.bizcomposer.sales.forms.ItemDto;
import com.avibha.bizcomposer.sales.forms.UpdateInvoiceDto;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.EmailSenderDto;
import com.nxsol.bizcomposer.global.clientvendor.ClientVendor;
import com.nxsol.bzcomposer.company.ConfigurationDAO;
import com.nxsol.bzcomposer.company.domain.BcaBillingaddress;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaLeadNew;
import com.nxsol.bzcomposer.company.domain.BcaLeadSource;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;
import com.nxsol.bzcomposer.company.domain.BcaTitle;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadNewRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadSourceRepository;
import com.nxsol.bzcomposer.company.repos.BcaTitleRepository;
import com.nxsol.bzcomposer.company.service.BcaClientvendorService;
import com.nxsol.bzcomposer.company.service.LeadService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	private BcaLeadNewRepository bcaLeadNewRepository;
	
	@Autowired
	private CountryState cs;

	private int cvType = 6; // default for Leads

	@Autowired
	private SalesDetailsDao sd;

	@Autowired
	private InvoiceInfoDao invoice;
	
	@GetMapping("/Leads")
	public String getleads(Model model, HttpServletRequest request) {
		//create new api for lead list -- getAllLeads
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

	@GetMapping("/updateLead/{id}")
	public String getUpdateLead(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		request.getSession().setAttribute("editedLeadID", id);
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

		//return "leads/addNewLead";
		return "leads/editLead";
	}
	
	@PostMapping("/updatesLead")
	public String updatesLead(@ModelAttribute("customerDto") CustomerDto customerDto, 
			@RequestParam(name = "product", required = false) List<String> products, 
			@RequestParam(name = "purpose") String purpose, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer leadId = (Integer) request.getSession().getAttribute("editedLeadID");
		String companyId = (String) session.getAttribute("CID");
		customerDto.setCompanyID(Integer.valueOf(companyId));
		leadService.addClientVendor(customerDto, companyId, leadId);
		customerDto.setClientVendorID(String.valueOf(leadId));
		leadService.addShippingAddress(customerDto);
		leadService.addBillingAddress(customerDto);
		/*
		 * int lastInsertedLeadId = leadService.addLead(customerDto, companyId); if
		 * (products != null) { leadService.addLeadProduct(products, companyId,
		 * lastInsertedLeadId, purpose); }
		 */
		request.setAttribute("SaveStatus", new ActionMessage("Lead Information is Successfully Updated!"));
		request.getSession().setAttribute("actionMsg", "Lead Information is Successfully Updated!");
		String page = "updateLead/"+leadId+"";
		//return "redirect:/Leads";
		return "redirect:/"+page+"";
	}
	
	@PostMapping("/postNewLead")
	public String postNewLead(@ModelAttribute("customerDto") CustomerDto customerDto,
			@RequestParam(name = "product", required = false) List<String> products,
			@RequestParam(name = "purpose") String purpose, HttpServletRequest request) {
		//No use because I create new API - createLead
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		customerDto.setCompanyID(Integer.valueOf(companyId));
		leadService.addClientVendor(customerDto, companyId, 0);
		leadService.addShippingAddress(customerDto);
		leadService.addBillingAddress(customerDto);

		int lastInsertedLeadId = leadService.addLead(customerDto, companyId);

		if (products != null) {
			leadService.addLeadProduct(products, companyId, lastInsertedLeadId, purpose);
		}
		
		request.setAttribute("SaveStatus", new ActionMessage("Lead Information is Successfully Added!"));
		request.getSession().setAttribute("actionMsg", "Lead Information is Successfully Added!");
		
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
	
	//###################################### below New APIs ###############################################################
	@GetMapping("/newLead")
	public String getNewLead(Model model, HttpServletRequest request) {
		CustomerDto customerDto = new CustomerDto();
		//String leadId = clientVendorRepo.getMaxId();
		String leadId = bcaLeadNewRepository.getMaxId();
		if (leadId == null || leadId.isEmpty())
			customerDto.setClientVendorID("1");
		else 
			customerDto.setClientVendorID(leadId);
		
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
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
	
	@GetMapping("/AllLeads")
	public String getAllLeads(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		BcaCompany company = companyRepo.findById(Long.parseLong(companyId)).orElse(null);
		model.addAttribute("customerList", leadService.getAllLeadsList(company));
		if(request.getSession().getAttribute("SaveStatus") != null) {
			request.setAttribute("actionMsg",request.getSession().getAttribute("SaveStatus"));
			request.getSession().setAttribute("SaveStatus","");	
		}
		return "leads/leadList";
	}
	
	@PostMapping("/createLead")
	public String createLead(@ModelAttribute("customerDto") CustomerDto customerDto,
			@RequestParam(name = "product", required = false) List<String> products,
			@RequestParam(name = "purpose") String purpose, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		customerDto.setCompanyID(Integer.valueOf(companyId));
		BcaLeadNew bcaLeadNew = leadService.addLead(customerDto, companyId, 0);
		
		//Not required ship and bill address information for lead
		//leadService.addShippingAddress(customerDto);
		//leadService.addBillingAddress(customerDto);
		if (products != null && bcaLeadNew != null && bcaLeadNew.getLeadID() > 0) {
			leadService.addLeadNewProduct(products, companyId, bcaLeadNew.getLeadID(), purpose);
		}
		request.setAttribute("SaveStatus", new ActionMessage("Lead Information is Successfully Added!"));
		request.getSession().setAttribute("actionMsg", "Lead Information is Successfully Added!");
		return "redirect:/AllLeads";
	}
	
	@GetMapping("/editLeadDetails/{id}")
	public String getLeadDetailsById(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		request.getSession().setAttribute("editedLeadID", id);
		CustomerDto customerDto = leadService.getNewLeadById(id);
		System.out.println(customerDto);
		sd.getAllList(request);
		model.addAttribute("leadSource", leadService.getLeadSources(companyId));
		model.addAttribute("LeadCategory", leadService.getLeadCategories(companyId));
		model.addAttribute("product", leadService.getSelectedLeadNewProduct(companyId, id));
		model.addAttribute("customerDto", customerDto);
		request.setAttribute("stateList", cs.getStateList(customerDto.getCountry()));
		request.setAttribute("cityList", cs.getCityList(customerDto.getState()));
		model.addAttribute("pageTitle", "BzComposer - Edit Lead");
		model.addAttribute("pageHeading", "Edit Lead");
		model.addAttribute("purpose", "editPage");
		return "leads/editLead";
	}
	
	@PostMapping("/updateLeadDetails")
	public String updateLeadDetails(@ModelAttribute("customerDto") CustomerDto customerDto, 
			@RequestParam(name = "product", required = false) List<String> products, 
			@RequestParam(name = "purpose") String purpose, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer leadId = (Integer) request.getSession().getAttribute("editedLeadID");
		String companyId = (String) session.getAttribute("CID");
		customerDto.setCompanyID(Integer.valueOf(companyId));
		BcaLeadNew bcaLeadUpdate = leadService.addLead(customerDto, companyId, leadId);
		
		//Not required ship and bill address information for lead
		//customerDto.setClientVendorID(String.valueOf(leadId));
		//leadService.addShippingAddress(customerDto);
		//leadService.addBillingAddress(customerDto);
		Loger.log("bcaLeadUpdate --------------"+bcaLeadUpdate.getLeadID());
		request.setAttribute("SaveStatus", new ActionMessage("Lead Information is Successfully Updated!"));
		request.getSession().setAttribute("actionMsg", "Lead Information is Successfully Updated!");
		String page = "editLeadDetails/"+leadId+"";
		//return "redirect:/Leads";
		return "redirect:/"+page+"";
	}
	
	@RequestMapping(value = { "/LeadConvert" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String leadConvert(CustomerDto customerDto, InvoiceDto invoiceDto, ItemDto itemDto,
			UpdateInvoiceDto updateInvoiceDto, EmailSenderDto emailSenderDto, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String vendorAction = request.getParameter("customerAction");
		HttpSession sess = request.getSession();
		String companyID = (String) sess.getAttribute("CID");
		String cvID = null;
		if (vendorAction != null && vendorAction.equalsIgnoreCase("CONVERT")) {
			cvID = request.getParameter("cvID");
			//Name - Customer or Contact
			String cvTypeName = request.getParameter("cvTypeId");
			String successMsg = "";
			if (leadService.convertLeadTo(cvID, companyID, cvTypeName)) {
				Loger.log("\nCustomer Convert succeeded, id=" + cvID);
				if (cvTypeName != null && cvTypeName.equalsIgnoreCase("Contact")) {
					successMsg = "Converted to Contact successfully!";
				} else {
					successMsg = "Converted to Customer successfully!";
				}
				request.setAttribute("SaveStatus", new ActionMessage(successMsg));
				sess.setAttribute("actionMsg", successMsg);
			} else {
				Loger.log("\nContact Convertion to Customer failed, id=" + cvID);
			}
		}
		return getAllLeads(model, request);
	}
	
	@RequestMapping(value = { "/CustomerConvertToLead" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String CustomerConvertToLead(CustomerDto customerDto, InvoiceDto invoiceDto, ItemDto itemDto,
			UpdateInvoiceDto updateInvoiceDto, EmailSenderDto emailSenderDto, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//common for customer and contact convert into lead
		String vendorAction = request.getParameter("customerAction");
		HttpSession sess = request.getSession();
		String companyID = (String) sess.getAttribute("CID");
		String cvID = null;
		if (vendorAction != null && vendorAction.equalsIgnoreCase("CONVERT")) {
			cvID = request.getParameter("cvID");
			//Name - Lead
			String cvTypeName = request.getParameter("cvTypeId");
			String successMsg = "";
			if (leadService.convertToLead(cvID, companyID, cvTypeName)) {
				Loger.log("\nCustomer Convert succeeded, id=" + cvID);
				if (cvTypeName != null && cvTypeName.equalsIgnoreCase("Lead")) {
					successMsg = "Converted to Lead successfully!";
				} else {
					successMsg = "Converted to Lead successfully!";
				}
				request.setAttribute("SaveStatus", new ActionMessage(successMsg));
				sess.setAttribute("actionMsg", successMsg);
			} else {
				Loger.log("\nContact Convertion to Lead failed, id=" + cvID);
			}
		}
		
		return "redirect:/Customer?tabid=Customer";
	}
	
}
