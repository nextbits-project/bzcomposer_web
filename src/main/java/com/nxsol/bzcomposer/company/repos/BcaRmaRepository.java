package com.nxsol.bzcomposer.company.repos;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.avibha.bizcomposer.rma.forms.RMADto;
import com.nxsol.bzcomposer.company.domain.BcaRma;

import io.lettuce.core.dynamic.annotation.Param;

public interface BcaRmaRepository extends JpaRepository<BcaRma, Integer> {

	@Query(value = "select rma from BcaRma as rma order by rma.dateAdded desc ")
	List<BcaRma> findLastRecordOrderByDateAddedDesc(Pageable pageable);

//	SELECT rma.Rma_No,
//	cv.FirstName,
//	cv.LastName,
//	cv.name,
//	cart.InventoryCode,
//	cart.InventoryName,
//	rma.Reason,
//	rmai.RmaItemQty,
//	cart.UnitPrice,
//	cart.UnitWeight,
//	date_format( rma.DateAdded, '%m/%d/%Y' ) AS DateAdded,
//	invoice.OrderNum
//FROM 
//	bca_rma as rma 
//	LEFT JOIN bca_clientvendor as cv ON cv.ClientVendorID = rma.clientVendorID	
//	LEFT JOIN bca_rmaitem as rmai on rmai.Rma_No = rma.Rma_No
//	LEFT JOIN bca_cart as cart on cart.CartID= rmai.CartID
//	LEFT JOIN bca_invoice as invoice on invoice.InvoiceID= rma.InvoiceID
//WHERE rma.CompanyID=1 and rma.Active =1
//ORDER BY rma.Rma_No
//	@Query(value = "SELECT DISTINCT rma.Rma_No, cv.FirstName, cv.LastName, cv.name"
//			+ "cart.InventoryCode, cart.InventoryName, "
//			+ "rma.Reason, rmai.RmaItemQty, cart.UnitPrice, "
//			+ "cart.UnitWeight, DATE_FORMAT(rma.DateAdded, '%m/%d/%Y') AS dateAdded, "
//			+ "inv.OrderNum " + "bca_rma as rma "
//			+ "LEFT JOIN bca_clientvendor as cv ON cv.ClientVendorID = rma.clientVendorID "
//			+ "LEFT JOIN bca_rmaitem as rmai on rmai.Rma_No = rma.Rma_No " 
//			+ "LEFT JOIN bca_cart as cart on cart.CartID= rmai.CartID "
//			+ "LEFT JOIN bca_invoice as inv on inv.InvoiceID= rma.InvoiceID "
//			+ "WHERE cv.Status IN ('N', 'U') AND cv.Active = 1 " 
//			+ "AND rma.CompanyID = :companyId AND rma.Active =1 "
//			+ "ORDER BY rma.Rma_No ASC " + "LIMIT :startValue, :limit", nativeQuery = true)
//	ArrayList<RMADto> findRmaListByCompanyId(@Param("companyId") Long companyId, @Param("startValue") int startValue,
//			@Param("limit") int limit);
	@Query(value = "SELECT DISTINCT rma.Rma_No, cv.FirstName, cv.LastName, cv.name, "
            + "cart.InventoryCode, cart.InventoryName, "
            + "rma.Reason, rmai.RmaItemQty, cart.UnitPrice, "
            + "cart.UnitWeight, DATE_FORMAT(rma.DateAdded, '%m/%d/%Y') AS dateAdded, "
            + "rma.OrderNo "
            + "FROM bca_rma as rma "
            + "LEFT JOIN bca_clientvendor as cv ON cv.ClientVendorID = rma.ClientVendorID "
            + "LEFT JOIN bca_rmaitem as rmai ON rmai.Rma_No = rma.Rma_No " 
            + "LEFT JOIN bca_cart as cart ON cart.CartID = rmai.CartID "
            + "LEFT JOIN bca_invoice as inv ON inv.InvoiceID = rma.InvoiceID "
            + "WHERE cv.Status IN ('N', 'U') AND cv.Active = 1 " 
            + "AND rma.CompanyID = :companyId AND rma.Active = 1 AND rma.InvoiceTypeID = :invoiceTypeID "
            + "ORDER BY rma.Rma_No ASC "
            + "LIMIT :startValue, :limit", nativeQuery = true)
	List<Object[]> findRmaListByCompanyId(@Param("companyId") Long companyId, @Param("invoiceTypeID") int invoiceTypeID, @Param("startValue") int startValue,
            @Param("limit") int limit);

	List<BcaRma> findByActiveAndInvoiceType_InvoiceTypeIdAndCompany_CompanyId(boolean active, int invoiceTypeID, Long companyId);
}
