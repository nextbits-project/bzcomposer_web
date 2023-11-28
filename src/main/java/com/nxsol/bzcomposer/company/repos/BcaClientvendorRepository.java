package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaClientvendorRepository extends JpaRepository<BcaClientvendor, Integer> {

//	@Query("SELECT DISTINCT c.clientVendorId, c.name, c.dbaname, c.customerTitle, c.firstName, c.lastName, c.address1, c.address2, c.city, c.state, c.zipCode, c.country, " + // other fields
//			" c.email, c.phone, c.cellPhone, c.fax, date_format(c.dateAdded,'%m-%d-%Y') as DateAdded, c.cvcategoryName FROM BcaClientvendor c " +
//			" WHERE c.company = :compId AND " +
//			" c.cvtypeId IN (1, 2) AND c.status IN ('U', 'N') AND c.deleted = 0 AND c.active = 1 " +
//			" ORDER BY c.name")
//	List<Object[]> fetchClientVendorDetails(@Param("compId") BcaCompany compId);

	@Query(nativeQuery = true, value = "SELECT distinct c.ClientVendorID,c.Name,ti.Title,c.FirstName,c.LastName,c.Address1,c.Address2,c.City,c.State,c.Country,"
			+ "c.Email,c.Phone,c.CellPhone,c.Fax,date_format(c.DateAdded,'%m-%d-%Y') as DateAdded,i.IsPaymentCompleted,c.CVCategoryName,"
			+ "c.ZipCode,ct.Name AS CityName, st.Name AS StateName, cn.Name AS CountryName, c.DBAName, date_format(i.DateAdded,'%m-%d-%Y') as iDateAdded "
			+ "FROM bca_clientvendor AS c LEFT JOIN bca_title as ti ON ti.TitleID=c.CustomerTitle LEFT JOIN bca_countries as cn ON cn.ID=c.Country LEFT JOIN bca_states as st ON st.ID=c.State LEFT JOIN bca_cities as ct ON ct.ID=c.City "
			+ "LEFT JOIN bca_invoice as i ON i.ClientVendorID=c.ClientVendorID AND NOT (i.invoiceStatus=1) AND i.IsPaymentCompleted = 0 AND i.InvoiceTypeID IN (1,13,17) "
			+ "WHERE c.CompanyID = :compId "
			+ " AND CVTypeID IN (1, 2) AND c.Status IN ('U', 'N') AND c.Deleted = 0 AND c.Active=1 ORDER BY c.Name")
	List<Object[]> fetchClientVendorDetails(@Param("compId") BcaCompany compId);

	@Query("SELECT bcv FROM BcaClientvendor bcv WHERE bcv.company= :compId AND bcv.status IN ('U','N') AND bcv.active =1")
	List<BcaClientvendor> findListOfClientVendorDetails(@Param("compId") BcaCompany compId);

	@Query("SELECT bcv FROM BcaClientvendor bcv WHERE bcv.company= :compId AND bcv.status IN ('U','N') AND bcv.active IN (0,1) ORDER BY bcv.lastName")
	List<BcaClientvendor> findAllClientVendorForCombo(@Param("compId") BcaCompany compId);

	List<BcaClientvendor> findByCompanyAndStatusAndDeletedAndActiveAndCvtypeIdNotInOrderByLastName(BcaCompany company,
			String status, Integer deleted, Integer active, List<Integer> cvTypeIds);

	@Query("SELECT bcv FROM BcaClientvendor bcv WHERE bcv.deleted = 0 AND bcv.company = :company AND"
			+ " bcv.customerOpenDebit > 0 AND bcv.status = 'N' AND bcv.cvtypeId IN (2,1) ORDER BY bcv.dateAdded DESC")
	List<BcaClientvendor> findInvoiceForUnpaidOpeningbal(BcaCompany company);

	@Query("SELECT bcv FROM BcaClientvendor bcv WHERE bcv.company = :company AND bcv.status IN ('U', 'N')"
			+ " AND bcv.active IN (0,1) AND bcv.cvtypeId = 2 ORDER BY bcv.lastName")
	List<BcaClientvendor> findClientVendorForCombo(@Param("company") BcaCompany company);

	List<BcaClientvendor> findByCompanyAndStatusInAndClientVendorId(BcaCompany company, List<String> statusList,
			Integer clientVendorId);

	@Query(nativeQuery = true, value = "select Name, FirstName, LastName, ClientVendorID from bca_clientvendor where companyID = :companyId "
			+ "and Status in ('U', 'N') and (Deleted = 0 or Active = 1) and CVTypeID in ( :param1 , :param2, :param3 ) order by name")
	List<Object[]> findAllClientVendorList(@Param("companyId") Long companyId, @Param("param1") Integer param1,
			@Param("param2") Integer param2, @Param("param3") Integer param3);

	


}
