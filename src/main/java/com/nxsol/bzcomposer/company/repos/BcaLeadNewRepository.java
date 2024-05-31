package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaLeadNew;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadNewRepository extends JpaRepository<BcaLeadNew, Integer> {
	
	@Query("From BcaLeadNew Where LeadID=:leadId")
	Optional<BcaLeadNew> findByLeadId(int leadId);
	
	@Query("FROM BcaLeadNew WHERE CVTypeID = :cvtypeId AND company = :companyId AND Active = 1")
	List<BcaLeadNew> findByCvtypeId(int cvtypeId, BcaCompany companyId);
	
	@Query("SELECT MAX(id)+ 1 FROM BcaLeadNew")
	String getMaxId();
	
	@Query("FROM BcaLeadNew WHERE Email = :emailID AND Phone = :phoneNumber AND CVTypeID = :cvtypeId AND Active = 1")
	BcaLeadNew findByEmailAndPhoneAndCvtypeId(String emailID, String phoneNumber, int cvtypeId);
	
	/*
	 * @Query("FROM BcaLeadNew WHERE company.companyId=:companyId AND bcv.LeadID=:leadId"
	 * ) BcaLeadNew findByCompanyIdAndLeadId(Long companyId, int leadId);
	 */
	
	@Query("select bcv from BcaLeadNew bcv where bcv.company.companyId =:companyId and bcv.leadID = :leadID")
	BcaLeadNew findByCompanyIdAndleadID(@Param("companyId") Long companyId,
			@Param("leadID") Integer leadID);
}
