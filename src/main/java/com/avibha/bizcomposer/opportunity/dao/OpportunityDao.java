package com.avibha.bizcomposer.opportunity.dao;

import java.time.OffsetDateTime;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.opportunity.form.OpportunityDto;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaOpportunity;
import com.nxsol.bzcomposer.company.repos.BcaClientvendorRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaOpportunityRepository;

@Service
public class OpportunityDao
{
	@Autowired
	private BcaClientvendorRepository bcaClientvendorRepository;
	@Autowired
	private BcaCompanyRepository companyRepo;
	@Autowired
	private BcaOpportunityRepository bcaOpportunityRepository;
  
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
		bcaOpportunity.setCloseDate(OffsetDateTime.now());
		bcaOpportunity.setActive(true);
		bcaOpportunity.setStage("prospecting");
		bcaOpportunity.setAmount(opportunityDto.getAmount());
		
		bcaOpportunityRepository.save(bcaOpportunity);
		
		 return "true";
	 }

}
