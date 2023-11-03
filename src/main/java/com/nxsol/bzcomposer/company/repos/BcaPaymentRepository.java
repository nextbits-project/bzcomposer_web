package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaPayment;

@Repository
public interface BcaPaymentRepository extends JpaRepository<BcaPayment, Integer> {

	@Query("SELECT p.paymentId,p.amount,p.paymentType,p.clientVendor,p.invoice,p.dateAdded, p.isToBePrinted, p.isNeedtoDeposit,"
			+ "p.payeeId, p.payerId, p.checkNumber, p.category,p.accountCategoryId,p.transactionType, p.deleted ,p.account,"
			+ "c.firstName, c.lastName, c.name AS CompanyName , cat.name as CategoryName FROM BcaPayment  p "
			+ "LEFT JOIN BcaClientvendor  c ON p.clientVendor= c.clientVendorId "
			+ "LEFT JOIN BcaCategory  cat ON p.category=cat.categoryId WHERE p.company = :companyId "
			+ "AND c.status IN ('U','N') AND p.payerId = :accountId ")
	List<Object[]> findListOfBcaPayment(@Param("accountId")int accountId,@Param("companyId") BcaCompany companyId);

}
