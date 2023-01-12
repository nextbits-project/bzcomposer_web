package com.avibha.bizcomposer.lead.dao;

import java.util.List;

import com.avibha.bizcomposer.lead.dto.LeadDto;

public interface LeadDAO {

	boolean insert(LeadDto dto, String companyId);

	List<LeadDto> loadLeads(String companyId);

	LeadDto loadLead(long leadId, String companyId);

	boolean update(LeadDto dto, String companyId);

}
