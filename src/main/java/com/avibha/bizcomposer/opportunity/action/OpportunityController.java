/*
 * Author : Avibha IT Solutions Copyright 2007 Avibha IT Solutions. All rights
 * reserved. AVIBHA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * www.avibha.com
 */
package com.avibha.bizcomposer.opportunity.action;



import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.avibha.bizcomposer.configuration.dao.ConfigurationInfo;
import com.avibha.bizcomposer.configuration.forms.ConfigurationDto;
import com.avibha.bizcomposer.opportunity.dao.OpportunityDao;
import com.avibha.bizcomposer.opportunity.dao.OpportunityEventDao;
import com.avibha.bizcomposer.opportunity.form.OpportunityDto;
import com.avibha.bizcomposer.sales.dao.InvoiceInfoDao;
import com.avibha.bizcomposer.sales.dao.SalesDetailsDao;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;

import com.nxsol.bzcomposer.company.repos.BcaLeadNewRepository;
import com.nxsol.bzcomposer.company.repos.BcaOpportunityRepository;
import com.nxsol.bzcomposer.company.service.LeadService;


@Controller
class OpportunityController
{

	@Autowired
	private OpportunityDao opportunityDao;

	@Autowired
	private OpportunityEventDao opportunityEventDao;
	
	@Autowired
	private BcaLeadNewRepository bcaLeadNewRepository;
	@Autowired
	private InvoiceInfoDao invoice;
	@Autowired
	private LeadService leadService;
	@Autowired
	private ConfigurationInfo configInfo;
	@Autowired
	private SalesDetailsDao sd;
	
	@Autowired
	private BcaOpportunityRepository bcaOpportunityRepository;
	
	
	
	

	
	@RequestMapping(value = { "/Opportunity"}, method = {
			RequestMethod.GET, RequestMethod.POST })
	public String ExecuteOpportunityController(OpportunityDto opportunityDto ,CustomerDto customerDto,Model model, HttpServletRequest request,
			HttpServletResponse response)
	{
		
		
		String forward="";
		String IN_URI = request.getRequestURI();
		String action = request.getParameter("tabid");
	 
		if(action.equals("ManageOpportunity"))
	 { 
			HttpSession session = request.getSession();
			String companyId = (String) session.getAttribute("CID");
			String opportunityID = request.getParameter("opportunityID");
		
			
			
			
			
			 OpportunityDto opportunityDto1= opportunityDao.getOpportunityDto(request,opportunityID);
		 request.setAttribute("oppoDto",opportunityDto1);
		 opportunityEventDao.getEventListByOpportunityID(opportunityID,request);
		leadService.getAllOpportunityOwner(request);
		 sd.getAllList(request); 
		 opportunityDao.getOpportunityDetails(customerDto, request);
		 request.setAttribute("leadSource", leadService.getLeadSources(companyId));
		
		 
		 ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			request.setAttribute("defaultCongurationData", configDto);
		 model.addAttribute("customerDto", customerDto);
		 
		 forward = "opportunity/opportunityManager";
	 }
		
		if(action.equals("newOpportunity"))
		{
			
			CustomerDto opp_customer = new CustomerDto();
			//String leadId = clientVendorRepo.getMaxId();
			 
			String opportunityId =bcaOpportunityRepository.getMaxId();
			if (opportunityId == null || opportunityId.isEmpty())
				opp_customer.setOpportunityId(1);
			
			else 
				opp_customer.setOpportunityId(Integer.parseInt(opportunityId));
			
			HttpSession session = request.getSession();
			String companyId = (String) session.getAttribute("CID");
			opp_customer.setZipCode("90004");
			opp_customer.setDateAdded(invoice.setCurrentDate());
			opp_customer.setLeadId(0);
			opp_customer.setBillingAddressId(0);
			opp_customer.setShippingAddressId(0);

			sd.getAllList(request);
			ConfigurationDto configDto = configInfo.getDefaultCongurationDataBySession();
			request.setAttribute("defaultCongurationData", configDto);

			model.addAttribute("customerDto", opp_customer);
			model.addAttribute("leadSource", leadService.getLeadSources(companyId));
			model.addAttribute("LeadCategory", leadService.getLeadCategories(companyId));
			model.addAttribute("product", leadService.getAllProducts(companyId));
			model.addAttribute("pageTitle", "BzComposer - Add New Opportunity");
			model.addAttribute("pageHeading", "Add New Opportunity");
			model.addAttribute("purpose", "newPage");
			model.addAttribute("leadId", null);
			model.addAttribute("shippingAddressId", null);
			model.addAttribute("billingAddressId", null);
			
			if(request.getSession().getAttribute("SaveStatus") != null) {
				request.setAttribute("actionMsg",request.getSession().getAttribute("SaveStatus"));
				request.getSession().setAttribute("SaveStatus","");	
			}
			leadService.getAllOpportunityOwner(request);
			
			return "opportunity/newOpportunity";
		
		}
		
		
		if(action.equals("updateOpportunity"))
			{
		  
			
			opportunityDao.updateAllOpportunity(customerDto,request);
			
			return "redirect:/Opportunity?tabid=ManageOpportunity&opportunityID="+customerDto.getOpportunityId();
			
			
		   }
		
		
		
		if(action.equals("delete"))
		{
			
			 opportunityDao.removeOpportunity(request);
				
				request.setAttribute("SaveStatus", new ActionMessage("Opportunity Deletd successfully!"));
				request.getSession().setAttribute("actionMsg", "Opportunity Delete successfully!");
				return "redirect:/Customer?tabid=opportunityBoard";
		
			
		}
	 if(action.equals("calendarEvent"))
	 { 
		 String opportunityID = request.getParameter("opportunityID");
		 request.getSession().setAttribute("opportunityID", opportunityID);
		opportunityEventDao.getEventListByOpportunityID(opportunityID,request);
		forward = "/opportunity/calendar"; 
		
		
	 }
		 if(action.equals("manageEvent"))
		 { 
			 String opportunityID = request.getParameter("opportunityID");
			 request.getSession().setAttribute("opportunityID", opportunityID);
			opportunityEventDao.getEventListByOpportunityID(opportunityID,request);
			
			
			
			forward = "/opportunity/manageCalendarEvent"; 
		
		 }
	 if(action.equals("dailyEventCalendar"))
	 { 
		// String opportunityID = request.getParameter("opportunityID");
				 //request.getSession().setAttribute("opportunityID", opportunityID);
				opportunityEventDao.getEventListByAllOpportunity(request);
				forward = "/opportunity/dailyEventCalendar";
	 }

	 return forward;
	
	}
	

	@PostMapping("/createOpportunity")
	public String createOpportunity(@ModelAttribute("customerDto") CustomerDto customerDto,
			@RequestParam(name = "product", required = false) List<String> products,
			@RequestParam(name = "purpose") String purpose, HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		String companyId = (String) session.getAttribute("CID");
		customerDto.setCompanyID(Integer.parseInt(companyId));		
      opportunityDao.saveOpportunity(customerDto, request);

		request.setAttribute("SaveStatus", new ActionMessage("New Opportunity  is Successfully Added!"));
		request.getSession().setAttribute("actionMsg", "New Opportunity   is Successfully Added!");
		
		
		return "redirect:/Opportunity?tabid=newOpportunity";
	}
	
	
	
	@RequestMapping(value = "/opportunityUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView opportunityUpdate(HttpServletRequest request,
			HttpServletResponse response) throws Exception
{
		String action = request.getParameter("tabid");
		if (action.equals("update")) 
		{
			 opportunityDao.updateOpportunity(request);
			 
			
		}		
	 return null;
	}
	
	@RequestMapping(value = "/opportunityEvent", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView opportunityEvent(HttpServletRequest request,
			HttpServletResponse response) throws Exception
{
		String action = request.getParameter("tabid");
		if (action.equals("save")) 
		{
			//System.out.println(" before Event Inserted in data base Successfully !!!!!!");
			opportunityEventDao.saveEvent(request);
			//System.out.println(" done Event Inserted in data base Successfully !!!!!!");
		}	
		
		if (action.equals("update")) 
		{
			opportunityEventDao.updateEvent(request);
			
		}
		
		if (action.equals("delete")) 
		{
			opportunityEventDao.deleteEvent(request);
			
		}
	 return null;
	}
	
	
	
	
	
	
}