package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.avibha.bizcomposer.sales.forms.CustomerDto;
import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaClientvendorRepository extends JpaRepository<BcaClientvendor, Integer> {
	
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

	@Query("SELECT bcv FROM BcaClientvendor bcv left join bcv.company c WHERE c.companyId= :compId AND bcv.status IN ('U','N') AND bcv.active IN (0,1) ORDER BY bcv.lastName")
	List<BcaClientvendor> findAllClientVendorForCombo(@Param("compId") Long compId);

	List<BcaClientvendor> findByCompanyAndStatusAndDeletedAndActiveAndCvtypeIdNotInOrderByLastName(BcaCompany company,
			String status, Integer deleted, Integer active, List<Integer> cvTypeIds);

	@Query("SELECT bcv FROM BcaClientvendor bcv left join bcv.company c WHERE bcv.deleted = 0 AND c.companyId = :companyId AND"
			+ " bcv.customerOpenDebit > 0 AND bcv.status = 'N' AND bcv.cvtypeId IN (2,1) ORDER BY bcv.dateAdded DESC")
	List<BcaClientvendor> findInvoiceForUnpaidOpeningbal(@Param("companyId") Integer companyId);

	@Query("SELECT bcv FROM BcaClientvendor bcv WHERE bcv.company = :company AND bcv.status IN ('U', 'N')"
			+ " AND bcv.active IN (0,1) AND bcv.cvtypeId = 2 ORDER BY bcv.lastName")
	List<BcaClientvendor> findClientVendorForCombo(@Param("company") BcaCompany company);

	List<BcaClientvendor> findByCompanyAndStatusInAndClientVendorId(BcaCompany company, List<String> statusList,
			Integer clientVendorId);

	@Query(nativeQuery = true, value = "select Name, FirstName, LastName, ClientVendorID from bca_clientvendor where companyID = :companyId "
			+ "and Status in ('U', 'N') and (Deleted = 0 or Active = 1) and CVTypeID in ( :param1 , :param2, :param3 ) order by name")
	List<Object[]> findAllClientVendorList(@Param("companyId") Long companyId, @Param("param1") Integer param1,
			@Param("param2") Integer param2, @Param("param3") Integer param3);

	@Query(value = "select a.remainingCredit,a.customerCreditLine, a.name, "
			+ "a.firstName, a.lastName, a.dateAdded, b.dateAdded, "
			+ "a.clientVendorId, ca.categoryId,iv.invoiceId,b.credit,b.totalCredit,t.termId,b.memo "
			+ " from BcaClientvendor a left join a.term t left join a.company c left join a.category ca inner join BcaInvoicecredit  b left join b.invoiceType it left join b.invoice iv on b.cvId = a.clientVendorId "
			+ " where a.deleted = 0 and b.deleted =0 and b.credit > 0 and it.invoiceTypeId not in( "
			+ " :invoiceTypeId ) and c.companyId = :companyId and a.status = 'N' and  a.cvtypeId in ( "
			+ " :cvtypeId ) order by b.dateAdded desc")
	List<Object[]> findUnpaidCreditAmount(@Param("companyId") int companyId, @Param("cvtype") List<Integer> cvTypeId,
			@Param("invoiceTypeId") List<Integer> invoiceTypeId);

	
	@Query("select a.firstName, a.lastName,a.name , a.clientVendorId , b.amountDue , b.dueDate, b.billNum , b.creditUsed ,b.amountPaid ,"
			+ " b.balance , b.payerId , acc.name as accountName from BcaClientvendor a left join BcaBill as b on "
			+ "a.clientVendorId = b.vendorId left join BcaAccount as acc on b.payerId = acc.accountId where a.company.companyId = :companyId "
			+ " and( a.deleted = 0 or a.active = 1 ) and a.status in ('U', 'N') and a.cvtypeId in (1,3) and b.billType = 0 and "
			+ " b.status in (0,2) and b.dueDate <=  :dueDate order by b.dueDate ")	
	List<Object[]> findPayBillsLists(@Param("companyId")Long companyId,@Param("dueDate")String dueDate); 


	
	
	
	
	@Query(value="select distinct new com.avibha.bizcomposer.sales.forms.CustomerDto( c.clientVendorId , c.name ,c.customerTitle, c.firstName , c.lastName , c.address1, c.address2, c.city, c.state , c.zipCode , c.country ,"
			+ " c.email , c.phone , c.cellPhone , c.fax ,date_format(c.dateAdded , '%m-%d-%Y') as dateAdded , i.isPaymentCompleted , c.cvcategoryName, ct.name as cityName , st.name as stateName , cn.name as countryName"
			+ " , c.dbaname)  from BcaClientvendor as c left join BcaCountries as cn on cn.id =c.country left join BcaStates as st on st.id =c.state left join BcaCities as ct on ct.id = c.city "
			+ "  left join BcaInvoice as i on i.clientVendor.clientVendorId = c.clientVendorId and not (i.invoiceStatus =1) and i.isPaymentCompleted = 0 and i.invoiceType.invoiceTypeId in (1,13,17)"
			+ "  where c.company.companyId =  :companyId and c.cvtypeId in (1,2) and c.status in ('U' , 'N' ) and c.deleted = 0 and c.active =1 order by c.name  ")
	List<CustomerDto> findCustomerInfo(@Param("companyId")Long companyId);
		
	
	List<BcaClientvendor> findDistinctByCompany_CompanyIdAndStatusInAndDeletedAndActiveOrderByName(Long companyId,List<String> status , Integer deleted,Integer active);

}
