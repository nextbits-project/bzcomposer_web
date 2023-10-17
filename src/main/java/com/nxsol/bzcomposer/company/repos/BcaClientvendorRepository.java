package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaClientvendorRepository extends JpaRepository<BcaClientvendor, Integer> {

//	@Query(nativeQuery = true, value = "SELECT distinct c.ClientVendorID, c.Name, c.CustomerTitle, c.FirstName, c.LastName, c.Address1, c.Address2, c.City, c.State, c.ZipCode, c.Country, "
//			+ " c.Email, c.Phone, c.CellPhone, c.Fax " + " FROM bca_clientvendor AS c "
//			+ " WHERE c.CompanyID = :compId " + " ORDER BY c.Name ")
//	List<BcaClientvendor> findByCompanyId(@Param("compId") Long compId);

	
	@Query("SELECT DISTINCT c.clientVendorId, c.name, c.dbaname, c.customerTitle, c.firstName, c.lastName, c.address1, c.address2, c.city, c.state, c.zipCode, c.country, " + // other fields
			" c.email, c.phone, c.cellPhone, c.fax, date_format(c.dateAdded,'%m-%d-%Y') as DateAdded, c.cvcategoryName FROM BcaClientvendor c " +
			" WHERE c.company = :compId AND " +
			" c.cvtypeId IN (1, 2) AND c.status IN ('U', 'N') AND c.deleted = 0 AND c.active = 1 " +
			" ORDER BY c.name")
	List<Object[]> fetchClientVendorDetails(@Param("compId") BcaCompany compId);

	
//  String jpql = "SELECT distinct c.ClientVendorID,c.Name,c.CustomerTitle,c.FirstName,c.LastName,c.Address1,c.Address2,c.City,c.State,c.ZipCode,c.Country,"
//			+ "c.Email,c.Phone,c.CellPhone,c.Fax,date_format(c.DateAdded,'%m-%d-%Y') as DateAdded,i.IsPaymentCompleted,c.CVCategoryName,"
//			+ "ct.Name AS CityName, st.Name AS StateName, cn.Name AS CountryName, c.DBAName "
//			+ "FROM bca_clientvendor AS c LEFT JOIN bca_countries as cn ON cn.ID=c.Country LEFT JOIN bca_states as st ON st.ID=c.State LEFT JOIN bca_cities as ct ON ct.ID=c.City "
//			+ "LEFT JOIN bca_invoice as i ON i.ClientVendorID=c.ClientVendorID AND NOT (i.invoiceStatus=1) AND i.IsPaymentCompleted = 0 AND i.InvoiceTypeID IN (1,13,17) "
//			+ "WHERE c.CompanyID = :compId "
//			+ " AND CVTypeID IN (1, 2) AND c.Status IN ('U', 'N') AND c.Deleted = 0 AND c.Active=1 ORDER BY c.Name";
	
	
}



