package com.nxsol.bzcomposer.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaLeadSource;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadSourceRepository;

@Service
public class LeadSourceService {
	
	@Autowired
	BcaLeadSourceRepository bcaLeadSourceRepository;
	
	@Autowired
	BcaCompanyRepository bcaCompanyRepository;
	
	public BcaLeadSource insertLeadSource(String sourceName, BcaCompany bcaCompany) {
		BcaLeadSource bcaLeadSource = new BcaLeadSource();
		bcaLeadSource.setName(sourceName);
		bcaLeadSource.setDescription("");
		bcaLeadSource.setCompany(bcaCompany);
		bcaLeadSource.setActive(true);
		bcaLeadSource.setIsDefault(false);
		return bcaLeadSourceRepository.save(bcaLeadSource);
	}
	
}
