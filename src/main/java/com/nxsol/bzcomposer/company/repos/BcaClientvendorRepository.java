package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaClientvendor;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaClientvendorRepository extends JpaRepository<BcaClientvendor, Integer> {

	@Query(nativeQuery = true, value = "SELECT distinct c.ClientVendorID, c.Name, c.CustomerTitle, c.FirstName, c.LastName, c.Address1, c.Address2, c.City, c.State, c.ZipCode, c.Country, "
			+ " c.Email, c.Phone, c.CellPhone, c.Fax " + " FROM bca_clientvendor AS c "
			+ " WHERE c.CompanyID = :compId " + " ORDER BY c.Name ")
	List<BcaClientvendor> findByCompanyId(@Param("compId") Long compId);
//
//	@Query(nativeQuery = true, value = "SELECT * from bca_clientvendor ")
	
	
//	List<BcaClientvendor> findByCompanyId(Integer companyID);

}
