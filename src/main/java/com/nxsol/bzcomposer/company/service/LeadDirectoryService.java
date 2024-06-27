package com.nxsol.bzcomposer.company.service;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaLeadDirectory;
import com.nxsol.bzcomposer.company.domain.BcaLeadNew;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.BcaLeadDirectoryRepository;

@Service
public class LeadDirectoryService {
	
	@Autowired
	BcaLeadDirectoryRepository bcaLeadDirectoryRepository;
	
	@Autowired
	BcaCompanyRepository bcaCompanyRepository;
	
	public BcaLeadDirectory insertLeadDirectory(String fileName, String compId) {
		BcaLeadDirectory bcaLeadDirectory = new BcaLeadDirectory();
		Optional<BcaCompany> company = bcaCompanyRepository.findById(Long.parseLong(compId));
		if (company.isPresent())
			bcaLeadDirectory.setCompany(company.get());
		
		bcaLeadDirectory.setFileName(fileName);
		//A - Active and I - Inactive
		bcaLeadDirectory.setStatus("A");
		bcaLeadDirectory.setActive(1);
		return bcaLeadDirectoryRepository.save(bcaLeadDirectory);
	}
	
	public List<BcaLeadDirectory> getAllDirectory(BcaCompany companyId) {
		List<BcaLeadDirectory> bcaDirectoryList = bcaLeadDirectoryRepository.findAllByCompanyID(companyId);
		return bcaDirectoryList;
	}
	
}
