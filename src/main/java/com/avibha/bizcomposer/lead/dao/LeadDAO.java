package com.avibha.bizcomposer.lead.dao;

import java.util.List;

import com.avibha.bizcomposer.lead.dto.LeadDto;
import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.nxsol.bzcomposer.company.domain.BcaLeadDirectory;

public interface LeadDAO {

	boolean insert(LeadDto dto, String companyId);

	List<LeadDto> loadLeads(String companyId);

	LeadDto loadLead(long leadId, String companyId);

	boolean update(LeadDto dto, String companyId);

	boolean delete(Long leadId, String companyId);
	
	boolean insertLead(BcaLeadDirectory bcaLeadDirectory, CustomerDto c, String compID);
}
