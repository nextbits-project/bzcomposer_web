package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaMessage;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMessageRepository extends JpaRepository<BcaMessage, Integer> {

	List<BcaMessage> findByCompany_CompanyIdAndActive(Long companyId, Integer active);
	
    List<BcaMessage> findByCompanyAndActive(BcaCompany company, Integer active);

}
