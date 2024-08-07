package com.avibha.bizcomposer.opportunity.dao;

import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.opportunity.form.OpportunityDto;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.avibha.common.log.Loger;
import com.avibha.common.utility.CountryState;
import com.nxsol.bzcomposer.company.domain.BcaCities;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaCountries;
import com.nxsol.bzcomposer.company.domain.BcaLeadSource;
import com.nxsol.bzcomposer.company.domain.BcaOpportunity;
import com.nxsol.bzcomposer.company.domain.BcaOpportunityEvent;
import com.nxsol.bzcomposer.company.domain.BcaStates;
import com.nxsol.bzcomposer.company.repos.BcaCitiesRepository;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaCountriesRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadSourceRepository;
import com.nxsol.bzcomposer.company.repos.BcaOpportunityRepository;
import com.nxsol.bzcomposer.company.repos.BcaStatesRepository;
import com.nxsol.bzcomposer.company.service.LeadService;


@Service
public class OpportunityDao
{
	@Autowired
	private BcaClientvendorRepository bcaClientvendorRepository;
	@Autowired
	private BcaCompanyRepository companyRepo;
	@Autowired
	private BcaOpportunityRepository bcaOpportunityRepository;

	@Autowired
	private BcaClientvendorRepository clientVendorRepo;
	@Autowired
	private BcaCountriesRepository bcaCountriesRepository; 
	@Autowired
	private BcaStatesRepository bcaStateRepository; 
	@Autowired
	private BcaCitiesRepository  bcaCitiesRepository; 
	
	@Autowired
	private BcaLeadSourceRepository  bcaLeadSourceRepository; 
	@Autowired
	private BcaLeadSourceRepository leadSourceRepo;
	@Autowired
	private LeadService leadService;

	
	
	public void  getOpportunityDetails(CustomerDto customerDto,HttpServletRequest request)
	{
         
		String opportunityID = request.getParameter("opportunityID");	 
		 OpportunityDto opportunityDto= getOpportunityDto(request,opportunityID);
		 int cvID=Integer.parseInt(opportunityDto.getClientVendorID());
		 
		 BcaClientvendor clientVendor = bcaClientvendorRepository.findById(cvID).orElse(null);
		 customerDto.setFirstName(clientVendor.getFirstName());
		 customerDto.setOpportunityId(Integer.parseInt(opportunityID));
		 customerDto.setOpportunityName(opportunityDto.getOpportunityName());
			customerDto.setMiddleName(clientVendor.getMiddleName());
			customerDto.setLastName(clientVendor.getLastName());
			customerDto.setAddress1(clientVendor.getAddress1());
			customerDto.setAddress2(clientVendor.getAddress2());
			customerDto.setCity(clientVendor.getCity());
			customerDto.setCountry(clientVendor.getCountry());
			customerDto.setState(clientVendor.getState());
			customerDto.setZipCode(clientVendor.getZipCode());
			customerDto.setPhone(clientVendor.getPhone());
			customerDto.setCellPhone(clientVendor.getCellPhone());
			customerDto.setEmail(clientVendor.getEmail());
			customerDto.setCompanyName(clientVendor.getName());
			customerDto.setLeadSource(Integer.parseInt(opportunityDto.getSourceID()));
			 customerDto.setOpportunityOwner(opportunityDto.getOpportunityOwner());
			 customerDto.setOpportunityAmount(opportunityDto.getOpportunityAmount());
			 customerDto.setOpportunityStage(opportunityDto.getStage());
			 customerDto.setDateClosed(opportunityDto.getClosedDate());
			 customerDto.setHomePage(opportunityDto.getStage());
	
		
	}
	
	public void  updateAllOpportunity(CustomerDto customerDto,HttpServletRequest request)
	{
		try
		{
		String companyId = (String) request.getSession().getAttribute("CID");
		
		BcaOpportunity opportunity=bcaOpportunityRepository.findById(customerDto.getOpportunityId()).orElse(null);
		
		BcaClientvendor bcaClientvendor=opportunity.getClientVendor();
		bcaClientvendor.setFirstName(customerDto.getFirstName());
		bcaClientvendor.setMiddleName(customerDto.getMiddleName());
		bcaClientvendor.setLastName(customerDto.getLastName());
		bcaClientvendor.setAddress1(customerDto.getAddress1());
		bcaClientvendor.setAddress2(customerDto.getAddress2());
		bcaClientvendor.setZipCode(customerDto.getZipCode());
		bcaClientvendor.setCity(customerDto.getCity());
		bcaClientvendor.setCountry(customerDto.getCountry());
		bcaClientvendor.setCellPhone(customerDto.getCellPhone());
		bcaClientvendor.setPhone(customerDto.getPhone());
		bcaClientvendor.setEmail(customerDto.getEmail());
		bcaClientvendor.setHomePage(customerDto.getHomePage());
		clientVendorRepo.save(bcaClientvendor);
		opportunity.setOpportunityOwner(customerDto.getOpportunityOwner());
		opportunity.setName(customerDto.getOpportunityName());
		
		Optional<BcaLeadSource> optionalLeadSource = leadSourceRepo.getLeadById(customerDto.getLeadSource());
		BcaLeadSource bcaLeadSource = optionalLeadSource.orElse(null);
		

		opportunity.setSourceID(bcaLeadSource);
		opportunity.setAmount(customerDto.getOpportunityAmount());
		opportunity.setStage(customerDto.getOpportunityStage());
		
		bcaOpportunityRepository.save(opportunity);
		
		

		  		 
		}
		catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
	}
	
	public String  saveOpportunity(CustomerDto customerDto,HttpServletRequest request)
	 {
		try {
			
		
		
		
		 
		 String companyId = (String) request.getSession().getAttribute("CID");
		 leadService.addClientVendor(customerDto, companyId, null);
		 
		 String cvID= clientVendorRepo.getMaxId();
         int cid=Integer.parseInt(cvID);
		 
		 BcaClientvendor clientVendor = bcaClientvendorRepository.findById(cid-1).orElse(null);
	     
	    BcaCompany company = companyRepo.findById(Long.parseLong(""+companyId)).orElse(null);
	  
	    
		BcaOpportunity bcaOpportunity=new BcaOpportunity();
		bcaOpportunity.setClientVendor(clientVendor);
		bcaOpportunity.setCompany(company);
		
		bcaOpportunity.setName(customerDto.getOpportunityName());
		bcaOpportunity.setStartDate(OffsetDateTime.now());
		bcaOpportunity.setCloseDate(null);
		bcaOpportunity.setActive(true);
		bcaOpportunity.setStage(customerDto.getOpportunityStage());
		    

		
		Optional<BcaLeadSource> optionalLeadSource = leadSourceRepo.getLeadById(customerDto.getLeadSource());
		BcaLeadSource bcaLeadSource = optionalLeadSource.orElse(null);
		

		bcaOpportunity.setSourceID(bcaLeadSource);
		bcaOpportunity.setAmount(customerDto.getOpportunityAmount());
	
		bcaOpportunity.setOpportunityOwner(customerDto.getOpportunityOwner());
	
			
	
     	bcaOpportunityRepository.save(bcaOpportunity);
		
		 
		}
		catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		return "true";
	 }
	
  
	
	public void  removeOpportunity(HttpServletRequest request)
	{
		Loger.log("sandip Opportunity  not Found________________");
	 String opportunityId=request.getParameter("opportunityId");
	
	if(opportunityId!=null)
	{
     BcaOpportunity bcaOpportunity=bcaOpportunityRepository.findById(Integer.parseInt(opportunityId)).orElse(null);
	  bcaOpportunity.setActive(false);
	  bcaOpportunityRepository.save(bcaOpportunity);
	  
	}
	else {
		Loger.log("Opportunity  not Found________________");
	}
		
	}
	public String  save(OpportunityDto opportunityDto,HttpServletRequest request)
	 {
		 int companyID=Integer.parseInt(opportunityDto.getCompanyID());
		 BcaClientvendor clientVendor = bcaClientvendorRepository.findById(Integer.parseInt(opportunityDto.getClientVendorID())).orElse(null);
	     opportunityDto.setClientVendor(clientVendor); 
	    BcaCompany company = companyRepo.findById(Long.parseLong(""+companyID)).orElse(null);
	    request.setAttribute("companyDetails", company);
	    opportunityDto.setCompany(company);
		BcaOpportunity bcaOpportunity=new BcaOpportunity();
		bcaOpportunity.setClientVendor(opportunityDto.getClientVendor());
		bcaOpportunity.setCompany(opportunityDto.getCompany());
		
		bcaOpportunity.setName(opportunityDto.getOpprtunityName());
		bcaOpportunity.setCloseDate(null);
		bcaOpportunity.setStartDate(OffsetDateTime.now());
		bcaOpportunity.setActive(true);
		bcaOpportunity.setStage(null);
		    
	
		BcaLeadSource bcaLeadSource=bcaLeadSourceRepository.findById(Integer.parseInt(opportunityDto.getSourceID())).get();
		
		bcaOpportunity.setSourceID(bcaLeadSource);
		bcaOpportunity.setAmount(opportunityDto.getAmount());
		bcaOpportunity.setOpportunityOwner(opportunityDto.getOpportunityOwner());
	bcaOpportunityRepository.save(bcaOpportunity);
		
		 return "true";
	 }
	
	
	public String  updateOpportunity(HttpServletRequest request)
	 {
	       JSONObject newObj = new JSONObject();
			try 
			{
			         newObj = new JSONObject(request.getParameter("data")); 
		         	 String opportunityID=newObj.getString("opportunityID");
		         	         String stage=newObj.getString("stage");
		         	  
		         	 BcaOpportunity opp=bcaOpportunityRepository.findById(Integer.parseInt(opportunityID)).orElse(null);
		         	                opp.setStage(stage);
		         	                if(stage.equalsIgnoreCase("closedwon")||stage.equalsIgnoreCase("closedLoss"))
		         	                	opp.setCloseDate(OffsetDateTime.now());
		         	                bcaOpportunityRepository.save(opp);	                  
			}
			catch(Exception e)
			{
			    e.printStackTrace();  		    
			}
			return "true";		
     }
	
	public OpportunityDto  getOpportunityDto(HttpServletRequest request,String opportunityID)
	{
		
	OpportunityDto opportunityDto=new OpportunityDto();
    BcaOpportunity bcaOpportunity=bcaOpportunityRepository.findById(Integer.parseInt(opportunityID)).orElse(null);
    opportunityDto.setOpportunityID(""+bcaOpportunity.getOpportunityId());
	opportunityDto.setOpportunityName(""+bcaOpportunity.getName());
	opportunityDto.setClientVendor(bcaOpportunity.getClientVendor());
	opportunityDto.setStage(bcaOpportunity.getStage());
	opportunityDto.setClientVendorID(""+bcaOpportunity.getClientVendor().getClientVendorId());
	opportunityDto.setCompanyID(""+bcaOpportunity.getClientVendor().getCompany().getCompanyId());
	if(bcaOpportunity.getSourceID()!=null)
	opportunityDto.setSourceID(""+bcaOpportunity.getSourceID().getLeadSourceId());
	 DateTimeFormatter outputFormat=DateTimeFormatter.ofPattern("MM-dd-yyyy");
	 if(bcaOpportunity.getCloseDate()!=null)
	 opportunityDto.setClosedDate(outputFormat.format(bcaOpportunity.getCloseDate()));
	 
	 if(bcaOpportunity.getStartDate()!=null)
	opportunityDto.setStartDate(outputFormat.format(bcaOpportunity.getStartDate()));
     opportunityDto.setAmount(bcaOpportunity.getAmount());
	 opportunityDto.setOpportunityOwner(bcaOpportunity.getOpportunityOwner());
	 opportunityDto.setOpportunityAmount(bcaOpportunity.getAmount());
	 opportunityDto.setActive(bcaOpportunity.getActive());
	 BcaClientvendor customerDto= clientVendorRepo.findByCVId(Integer.parseInt(opportunityDto.getClientVendorID()));
 
	  request.setAttribute("companyDetails",customerDto.getCompany());
      request.setAttribute("customerDetails",customerDto);
      
     BcaStates states=bcaStateRepository.findById(Integer.parseInt(customerDto.getState())).get();
     BcaCountries countries=bcaCountriesRepository.findById(Integer.parseInt(customerDto.getCountry())).get();
     BcaCities city= bcaCitiesRepository.findById(Integer.parseInt(customerDto.getCity())).get();
    
       // String countryName= countryStateDao.getCountryName(customerDto.getCountry());
     request.setAttribute("city",city.getName());
     request.setAttribute("state",states.getName());
      request.setAttribute("country",countries.getName());
      
      request.setAttribute("sourceName",opportunityDto.getSourceID());
      
      
      return opportunityDto;
      
	}
}
