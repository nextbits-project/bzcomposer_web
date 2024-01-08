package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCart;

@Repository
public interface BcaCartRepository extends JpaRepository<BcaCart, Integer> {

	@Query(value = "select bc from BcaCart bc where bc.invoice.invoiceId = :invoiceId and bc.company.companyId= :companyId")
	List<BcaCart> findByInvoiceIdAndCompanyId(@Param("invoiceId") int invoiceId, @Param("companyId") Long companyId);

	List<BcaCart> findByInvoice_InvoiceId(int invoiceId);

	@Query(value = "select a from BcaCart as a , BcaInvoice as b where a.invoice.invoiceId = b.invoiceId and "
			+ "b.invoiceType.invoiceTypeId =1 and b.company.companyId = :companyId and not (b.invoiceStatus =1 )"
			+ " and a.inventory.inventoryId = :inventoryId")
	List<BcaCart> findByInventoryIdAndCompanyIdAndInvoiceStatus(@Param("inventoryId") int invoiceId,
			@Param("companyId") Long companyId);

	@Query(value = "select cart from BcaCart as cart join BcaInvoice as inv on cart.invoice.invoiceId = inv.invoiceId  where"
			+ "  inv.orderNum like :orderNum and inv.company.companyId like :companyId ")
	List<BcaCart> findItemDetails(@Param("companyId") Long companyId, @Param("orderNum") Integer orderNum);

	void deleteByInvoice_InvoiceIdAndCompany_CompanyId(Integer invoiceId, Long companyId);

	int deleteByInvoice_InvoiceId(int invoiceId);

	List<BcaCart> findByCartIdIn(List<Integer> cartIds);

}
