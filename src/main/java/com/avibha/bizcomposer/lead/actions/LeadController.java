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
import com.avibha.bizcomposer.lead.dto.BcaLeadDirectoryDto;
import com.avibha.bizcomposer.lead.dto.LeadBoardDto;
import com.avibha.bizcomposer.lead.dto.LeadDirectoryDto;
import com.avibha.bizcomposer.lead.dto.LeadDto;
import com.avibha.bizcomposer.opportunity.dao.OpportunityDao;
import com.avibha.bizcomposer.opportunity.form.OpportunityDto;
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
import com.nxsol.bzcomposer.company.domain.BcaLeadDirectory;
import com.nxsol.bzcomposer.company.domain.BcaLeadNew;
import com.nxsol.bzcomposer.company.domain.BcaLeadSource;
import com.nxsol.bzcomposer.company.domain.BcaShippingaddress;
import com.nxsol.bzcomposer.company.domain.BcaTitle;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadNewRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadSourceRepository;

import com.nxsol.bzcomposer.company.repos.BcaTitleRepository;
import com.nxsol.bzcomposer.company.service.LeadDirectoryService;
import com.nxsol.bzcomposer.company.service.LeadService;


import java.util.ArrayList;
import java.util.List;


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
	
	@Autowired
	OpportunityDao opportunityDao;

	private int cvType = 6; // default for Leads

	@Autowired
	private SalesDetailsDao sd;

	@Autowired
	private InvoiceInfoDao invoice;
	
	@Autowired
	private LeadDirectoryService leadDirectoryService;
	
	@GetMapping("/Leads")
	public String getleads(Model model, HttpServletRequest request) {
		//create new api for lead list -- getAllLeads
//		for (BcaClientvendor customer : customers) {
//		    // Perform operations on each customer entity
//		    System.out.println("Customer ID: " + customer.getClientVendorId());
//		    System.out.println("Customer Name: " + customer.getCountry());
//		    // ... Other operations
//		}
		
		 ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
				request.setAttribute("defaultCongurationData", configDto);
		int cvType = 6;// 6 for Lead
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		BcaCompany company = companyRepo.findById(Long.parseLong(companyId)).orElse(null);
		model.addAttribute("customerList", leadService.getAllLead(cvType, company));
		return "leads/leadList";
	}


	

//	@GetMapping("/newLead")
//	public String getNewLead(Model model, HttpServletRequest request) {
//		CustomerDto customerDto = new CustomerDto();
//		String leadId = clientVendorRepo.getMaxId();
//		HttpSession session = request.getSession();
//		String companyId = (String) session.getAttribute("CID");
//		customerDto.setClientVendorID(leadId);
//		customerDto.setZipCode("90004");
//
//		customerDto.setDateAdded(invoice.setCurrentDate());
//		customerDto.setLeadId(0);
//		customerDto.setBillingAddressId(0);
//		customerDto.setShippingAddressId(0);
//		sd.getAllList(request);
//
//		ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
//		request.setAttribute("defaultCongurationData", configDto);
//
//		model.addAttribute("customerDto", customerDto);
//		model.addAttribute("leadSource", leadService.getLeadSources(companyId));
//		model.addAttribute("LeadCategory", leadService.getLeadCategories(companyId));
//		model.addAttribute("product", leadService.getAllProducts(companyId));
//
//		model.addAttribute("pageTitle", "BzComposer - Add New Lead");
//		model.addAttribute("pageHeading", "Add New Lead");
//		model.addAttribute("purpose", "newPage");
//		model.addAttribute("leadId", null);
//		model.addAttribute("shippingAddressId", null);
//		model.addAttribute("billingAddressId", null);
//
//		return "leads/addNewLead";
//	}


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
 
	@GetMapping("/LeadBoard")
	public String getLeadBoard(Model model, @ModelAttribute("customerDto") CustomerDto customerDto,
			HttpServletRequest request) 
	{
   // SalesDetailsDao sd = new SalesDetailsDao();
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

	/*
	@GetMapping("/leadToOpportunity/{id}")
	public String covertToOpportunity(@PathVariable("id") int clientvendorId,Model model, HttpServletRequest request)
	{
	
		
		CustomerDto customerDto=leadService.getLeadById(clientvendorId);
		
		OpportunityDto opportunityDto=new OpportunityDto();
		opportunityDto.setClientVendorID(""+ customerDto.getClientVendorID());
		opportunityDto.setCompanyName(customerDto.getCompanyName());
		opportunityDto.setFullName(customerDto.getFirstName()+" "+customerDto.getLastName());
		
		
		model.addAttribute("opportunityDto", opportunityDto);
		return "opportunity/leadConvertOpportunity";
	}
	*/


	@RequestMapping(value = { "/leadToOpportunity"}, method = {
			RequestMethod.GET, RequestMethod.POST })
	public String OpportunityConverion(OpportunityDto opportunityDto,Model model, HttpServletRequest request,
			HttpServletResponse response)
	{
		//System.out.println("at leadToOpportunity");
		String action = request.getParameter("tabid");
		//System.out.println("At leadToOpportunity"+action);
		if(action.equalsIgnoreCase("newOpportunity"))
		{
						/*
	 		String cvID=request.getParameter("cvID");
	 	    CustomerDto customerDto=leadService.getLeadById(Integer.parseInt(cvID)); 
	 		opportunityDto.setClientVendorID(""+ customerDto.getClientVendorID());
	 		opportunityDto.setCompanyName(customerDto.getCompanyName());
	 	    opportunityDto.setCompanyID(""+customerDto.getCompanyID());
	 		opportunityDto.setFullName(customerDto.getFirstName()+" "+customerDto.getLastName());
	 		model.addAttribute("opportunityDto",opportunityDto);
		*/
			String leadID=request.getParameter("leadID");
					//System.out.println("########leadID"+leadID);
					
					CustomerDto customerDto =leadService.getNewLeadById(Integer.parseInt(leadID));
					
				request.getSession().setAttribute("ConvertLeadID",leadID);
					
					//request.getSession().setAttribute("ConvertLeadID",leadID);
					
					customerDto.setCustomerGroup("0");
					String companyId = (String) request.getSession().getAttribute("CID");
				       leadService.addClientVendor(customerDto, companyId, null);
				         String cvID= clientVendorRepo.getMaxId();
				         int cid=Integer.parseInt(cvID);
				       BcaClientvendor customer= clientVendorRepo.findByCVId(cid-1);
					opportunityDto.setClientVendorID(""+ customer.getClientVendorId());
					opportunityDto.setCompanyName(customer.getCompany().getName());
				    opportunityDto.setCompanyID(""+customer.getCompany().getCompanyId());
				    opportunityDto.setSourceID(""+customerDto.getLeadSource());
					opportunityDto.setFullName(customer.getFirstName()+" "+customer.getLastName());
			 		model.addAttribute("opportunityDto",opportunityDto);
					leadService.getAllOpportunityOwner(request);
	 		return "opportunity/leadConvertOpportunity";
		}
		if(action.equalsIgnoreCase("conversion"))
		{
	       model.addAttribute("opportunityDto",opportunityDto);
	      // CustomerDto customerDto=leadService.getLeadById(Integer.parseInt(opportunityDto.getClientVendorID()));
	       // request.setAttribute("customerDetails",customerDto);
			//opportunityDao.save(opportunityDto,request);
	       
	       BcaClientvendor customerDto= clientVendorRepo.findByCVId(Integer.parseInt(opportunityDto.getClientVendorID()));
	       			       
	       				       request.setAttribute("companyDetails",customerDto.getCompany());
	      			 	        request.setAttribute("customerDetails",customerDto);
	     			        opportunityDto.setStage(null);
	       			        System.out.println(" ------------->conversion leadSorce ....="+ opportunityDto.getSourceID());
	       			 		opportunityDao.save(opportunityDto,request);
	       				String strLeadId=(String)request.getSession().getAttribute("ConvertLeadID");
	      						
	     						BcaLeadNew lead=bcaLeadNewRepository.findByLeadId(Integer.parseInt(strLeadId)).orElse(null);
	     						    if(lead!=null)
	       						lead.setActive(0);
	      					   
	       						  bcaLeadNewRepository.save(lead);
			return "opportunity/showOpportunityConversion";
		}
		return "leadToOpportunity";
	}
	
	@GetMapping("/leadAddressLabel")
	public String getLeadAddressLabel(Model model, HttpServletRequest request)
	{
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
		
		if(request.getSession().getAttribute("SaveStatus") != null) {
			request.setAttribute("actionMsg",request.getSession().getAttribute("SaveStatus"));
			request.getSession().setAttribute("SaveStatus","");	
		}
		
		return "leads/addNewLead";
	}
	
	@RequestMapping(value = {"/AllLeads"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String getAllLeads(LeadBoardDto leadBoardDto, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String action = request.getParameter("tabid");
		String companyId = (String) session.getAttribute("CID");
		BcaCompany company = companyRepo.findById(Long.parseLong(companyId)).orElse(null);
		if (action.equalsIgnoreCase("FilterList")) {
			List<BcaLeadNew> leadList = leadService.getFilterLeadsList(company, leadBoardDto);
			model.addAttribute("customerList", leadList);
		} else {
			model.addAttribute("customerList", leadService.getAllLeadsList(company));
		}
		
		if(request.getSession().getAttribute("actionMsg") != null) {
			request.setAttribute("actionMsg",request.getSession().getAttribute("actionMsg"));
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
		return "redirect:/newLead";
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
		LeadBoardDto leadBoardDto = new LeadBoardDto();
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
		return getAllLeads(leadBoardDto, model, request);
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
	
	@GetMapping("/removeLead/{id}")
	public String removeLead(@PathVariable("id") int id, HttpServletRequest request) {
		leadService.removeLead(id);
		request.setAttribute("SaveStatus", new ActionMessage("Lead Delete successfully!"));
		request.getSession().setAttribute("actionMsg", "Lead Delete successfully!");
		return "redirect:/AllLeads";
	}
	
	@GetMapping("/LeadDirectory")
	public String getLeadDirectory(Model model, @ModelAttribute("customerDto") CustomerDto customerDto,
			HttpServletRequest request) 
	{
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		BcaCompany company = companyRepo.findById(Long.parseLong(companyId)).orElse(null);
		List<LeadDirectoryDto> leadList = leadService.getAllLeadDirectoryByCompanyId(Long.valueOf(companyId));
		List<BcaLeadDirectoryDto> bcaLeadDirectorylist = leadDirectoryService.getAllDirectory(company);
		model.addAttribute("LeadDirectorys", bcaLeadDirectorylist);
		model.addAttribute("LeadDetails", leadList);
		return "leads/leadDirectory";
	}
	
	@GetMapping("/getLeadDirectoryDetailsById/{id}")
	public ResponseEntity<List<LeadDirectoryDto>> getLeadDirectoryDetailsById(Model model, @PathVariable("id") int directoryId) {
		List<LeadDirectoryDto> bcaLeadList = leadService.getAllLeadByDirectoryId(directoryId);
		if (bcaLeadList != null) {
			return ResponseEntity.ok(bcaLeadList);
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	
}
