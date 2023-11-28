package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.domain.BcaBill;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaBillRepository extends JpaRepository<BcaBill, Integer> {
//	String Sql = " SELECT bill.BillNum,bill.DueDate,bill.AmountDue,bill.Status,bill.BillType,bill.AmountPaid,bill.CreditUsed,"
//			+ " bill.Balance,bill.Memo,bill.IsMemorized,bill.VendorId,bill.CategoryID,bill.PayerID "
//			+ " ,bill.ServiceID,bill.DateAdded,bill.CHECKNO,bill.Status,ci.Name,CONCAT(cat.Name,\" \", cat.CateNumber) AS CatName"
//			+ " FROM bca_bill as bill INNER Join bca_clientvendor as ci ON bill.VENDORID=ci.CLIENTVENDORID"
//			+ " LEFT JOIN bca_category as cat ON cat.CategoryID=bill.CategoryID " + " WHERE bill.CompanyID="
//			+ ConstValue.companyId;
//
//	if (cvID > 0) {
//		Sql += " AND bill.VendorId=" + cvID;
//	}
//
//	Sql += " AND bill.Status = 0 And ci.STATUS='N'";
//	Sql += " ORDER BY bill.BillNum DESC";

	@Query("SELECT bill.billNum,bill.dueDate,bill.amountDue,bill.status,bill.billType,bill.amountPaid,bill.creditUsed, "
			+ "bill.balance, bill.memo, bill.isMemorized, bill.vendorId, bill.category,bill.payerId, "
			+ " bill.service, bill.dateAdded, bill.checkNo, bill.status, cv.name, CONCAT(cat.name,' ', cat.cateNumber) AS CatName "
			+ " FROM BcaBill as bill INNER JOIN BcaClientvendor as cv ON bill.vendorId = cv.clientVendorId "
			+ " LEFT JOIN BcaCategory AS cat ON cat.categoryId = bill.category WHERE bill.company = :company "
			+ " AND bill.vendorId = :cvID AND bill.status = 0 AND cv.status = 'N' "
			+ " ORDER BY bill.billNum DESC ")
	List<Object[]>findUnpainBillList(@Param("company")BcaCompany company,@Param("cvID")Integer vendorId);

	@Query("SELECT bill.billNum,bill.dueDate,bill.amountDue,bill.status,bill.billType,bill.amountPaid,bill.creditUsed, "
			+ "bill.balance, bill.memo, bill.isMemorized, bill.vendorId, bill.category,bill.payerId, "
			+ " bill.service, bill.dateAdded, bill.checkNo, bill.status, cv.name, CONCAT(cat.name,' ', cat.cateNumber) AS CatName "
			+ " FROM BcaBill as bill INNER JOIN BcaClientvendor as cv ON bill.vendorId = cv.clientVendorId "
			+ " LEFT JOIN BcaCategory AS cat ON cat.categoryId = bill.category WHERE bill.company = :company "
			+ "  AND bill.status = 0 AND cv.status = 'N' "
			+ " ORDER BY bill.billNum DESC ")
	List<Object[]>findUnpainBillList(@Param("company")BcaCompany company);
}
