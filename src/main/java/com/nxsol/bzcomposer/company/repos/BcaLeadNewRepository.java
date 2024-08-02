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
	
	@Query("FROM BcaLeadNew WHERE CVTypeID = :cvtypeId AND company = :companyId AND Active = 1 ORDER BY LeadID DESC")
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
	
	@Query("From BcaLeadNew Where LeadID IN :leadIds")
	List<BcaLeadNew> findByLeadIds(List<Integer> leadIds);
	
	@Query(nativeQuery = true, value = "select bcv.LeadID, sn.Name AS LeadSource, bcv.FirstName, bcv.MiddleName, bcv.LastName, bcv.Name, bcv.Address1, bcv.Address2, "
			+ "ct.Name AS City, st.Name AS State, cn.Name AS Country, bcv.ZipCode, date_format(bcv.DateAdded,'%d-%m-%Y') as DateAdded, bcv.Phone, bcv.CellPhone, bcv.Fax, bcv.Email "
			+ "from bca_lead AS bcv "
			+ "LEFT JOIN bca_countries as cn ON cn.ID=bcv.Country "
			+ "LEFT JOIN bca_states as st ON st.ID=bcv.State "
			+ "LEFT JOIN bca_cities as ct ON ct.ID=bcv.City "
			+ "LEFT JOIN bca_lead_source as sn ON sn.LeadSourceID=bcv.LeadSourceID "
			+ "where bcv.LeadDirectoryID =:directoryID")
	List<Object[]> findAllLeadByDirectoryId(@Param("directoryID") Integer directoryID);
	
	@Query(nativeQuery = true, value = "select bcv.LeadID, sn.Name AS LeadSource, bcv.FirstName, bcv.MiddleName, bcv.LastName, bcv.Name, bcv.Address1, bcv.Address2, "
			+ "ct.Name AS City, st.Name AS State, cn.Name AS Country, bcv.ZipCode, date_format(bcv.DateAdded,'%d-%m-%Y') as DateAdded, bcv.Phone, bcv.CellPhone, bcv.Fax, bcv.Email "
			+ "from bca_lead AS bcv "
			+ "LEFT JOIN bca_countries as cn ON cn.ID=bcv.Country "
			+ "LEFT JOIN bca_states as st ON st.ID=bcv.State "
			+ "LEFT JOIN bca_cities as ct ON ct.ID=bcv.City "
			+ "LEFT JOIN bca_lead_source as sn ON sn.LeadSourceID=bcv.LeadSourceID "
			+ "where bcv.CompanyID =:companyID and bcv.LeadDirectoryID is not null")
	List<Object[]> getAllLeadDirectoryByCompanyId(@Param("companyID") Long companyID);
}
