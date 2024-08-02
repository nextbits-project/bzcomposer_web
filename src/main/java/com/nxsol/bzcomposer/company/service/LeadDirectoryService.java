package com.nxsol.bzcomposer.company.service;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.lead.dto.BcaLeadDirectoryDto;
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
	
	ModelMapper modelMapper = new ModelMapper();
	
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
	
	public List<BcaLeadDirectoryDto> getAllDirectory(BcaCompany companyId) {
		List<BcaLeadDirectory> bcaDirectoryList = bcaLeadDirectoryRepository.findAllByCompanyID(companyId);
		List<BcaLeadDirectoryDto> bcaLeadDirectoryDto = bcaDirectoryList.stream().map(this::convertToDto).collect(Collectors.toList());
		return bcaLeadDirectoryDto;
	}
	
	private BcaLeadDirectoryDto convertToDto(BcaLeadDirectory bcaLeadDirectory) {
		BcaLeadDirectoryDto bcaLeadDirectoryDto = modelMapper.map(bcaLeadDirectory, BcaLeadDirectoryDto.class);
		String str = "";
		int index1 = bcaLeadDirectory.getFileName().indexOf(".");
		if (index1 == -1) {
			str = bcaLeadDirectory.getFileName();
		} else {
			str = bcaLeadDirectory.getFileName().substring(0, index1);
		}
		bcaLeadDirectoryDto.setFileName(str);
	    return bcaLeadDirectoryDto;
	}
}
