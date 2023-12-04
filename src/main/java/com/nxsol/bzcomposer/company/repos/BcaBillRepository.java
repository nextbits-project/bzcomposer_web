package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bizcomposer.common.TblVendorDetail;
import com.nxsol.bzcomposer.company.domain.BcaBill;
import com.nxsol.bzcomposer.company.domain.BcaCompany;

@Repository
public interface BcaBillRepository extends JpaRepository<BcaBill, Integer> {

	@Query("SELECT bill.billNum,bill.dueDate,bill.amountDue,bill.status,bill.billType,bill.amountPaid,bill.creditUsed, "
			+ "bill.balance, bill.memo, bill.isMemorized, bill.vendorId, bill.category.categoryId,bill.payerId, "
			+ "bill.service.serviceId, bill.dateAdded, bill.checkNo, cv.name, CONCAT(cat.name,' ', cat.cateNumber) AS CatName "
			+ " FROM BcaBill as bill INNER JOIN BcaClientvendor as cv ON bill.vendorId = cv.clientVendorId "
			+ " LEFT JOIN BcaCategory AS cat ON cat.categoryId = bill.category.categoryId WHERE bill.company.companyId = :company "
			+ " AND bill.vendorId = :cvID AND bill.status = 0 AND cv.status = 'N' " + " ORDER BY bill.billNum DESC ")
	List<Object[]> findUnpainBillList(@Param("company") Long company, @Param("cvID") Integer vendorId);

	@Query("SELECT bill.billNum,bill.dueDate,bill.amountDue,bill.status,bill.billType,bill.amountPaid,bill.creditUsed, "
			+ "bill.balance, bill.memo, bill.isMemorized, bill.vendorId, bill.category.categoryId,bill.payerId, "
			+ " bill.service.serviceId, bill.dateAdded, bill.checkNo, cv.name, CONCAT(cat.name,' ', cat.cateNumber) AS CatName "
			+ " FROM BcaBill as bill INNER JOIN BcaClientvendor as cv ON bill.vendorId = cv.clientVendorId "
			+ " LEFT JOIN BcaCategory AS cat ON cat.categoryId = bill.category.categoryId WHERE bill.company.companyId = :company "
			+ "  AND bill.status = 0 AND cv.status = 'N' " + " ORDER BY bill.billNum DESC ")
	List<Object[]> findUnpainBillList(@Param("company") Long company);

	
	@Query("select b.billNum,b.transactionName,ba.name as accountName,b.amountDue,b.recurringPeriod,b.remindOption,"
			+ " b.nextDate, b.recurringNumber,b.daysInAdvanceToEnter"
			+ " from BcaBill b left join BcaAccount ba on b.payerId = ba.accountId where b.company.companyId = :companyId and b.isMemorized =1 ")
	List<Object[]> findMemorizeTransactionList(Long companyId);

}
