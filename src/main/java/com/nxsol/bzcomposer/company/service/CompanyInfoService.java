package com.nxsol.bzcomposer.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.File.forms.CompanyInfoDto;
import com.nxsol.bzcomposer.company.repositories.CompanyInfoRepository;

@Service
public class CompanyInfoService {

	private CompanyInfoRepository companyInfoRepository;
	
	public CompanyInfoDto add(CompanyInfoDto companyInfoDto)
	{
		companyInfoRepository.save(companyInfoDto);
		
		return companyInfoDto;
		
	}
	
	public List<CompanyInfoDto> get()
	{
		return companyInfoRepository.findAll();
		
	}
	
	public CompanyInfoDto get(int id)
	{
		return companyInfoRepository.findById(id).get();
		
	}
	
	public CompanyInfoDto put(CompanyInfoDto companyInfoDto)
	{
		return companyInfoRepository.save(companyInfoDto);
		
	}
	
	public void delete(int id)
	{
		 companyInfoRepository.deleteById(id);
		
	}
	
	public List<CompanyInfoDto> getDefaultModules()
	{
		return null;
		
	}
	
	public List<CompanyInfoDto> getBusinessTypes()
	{
		return null;
		
	}
	
}
