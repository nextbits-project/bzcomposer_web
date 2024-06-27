package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaLeadDirectory;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLeadDirectoryRepository extends JpaRepository<BcaLeadDirectory, Integer> {
	/*
	 * @Query("From BcaLeadDirectory Where leadDirectoryID=:leadId")
	 * Optional<BcaLeadDirectory> findByLeadId(int leadId);
	 * 
	 * @Query("From BcaLeadDirectory Where leadID=:leadID") BcaLeadDirectory
	 * findByLeadId(BcaLeadNew leadID);
	 */
	
	@Query("FROM BcaLeadDirectory WHERE CompanyID = :companyId AND Active = 1")
	List<BcaLeadDirectory> findAllByCompanyID(BcaCompany companyId);
	
}
