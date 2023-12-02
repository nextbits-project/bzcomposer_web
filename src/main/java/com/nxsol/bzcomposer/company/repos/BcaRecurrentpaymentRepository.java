package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.BcaRecurrentpayment;

@Repository
public interface BcaRecurrentpaymentRepository extends JpaRepository<BcaRecurrentpayment, Long> {

	@Query("SELECT p.service , p.payee, p.paymentDate, p.payer," + " p.memo, p.checkNumber, p.amount, p.isToBePrinted,"
			+ " p.paymentType, p.paymentId, cv.name AS CompanyName,"
			+ " cv.firstName, cv.lastName, a.name AS AccountName FROM BcaRecurrentpayment AS p"
			+ " INNER JOIN BcaClientvendor AS cv ON p.payee = cv.clientVendorId "
			+ " LEFT JOIN BcaAccount AS a ON p.payer = a.accountId "
			+ " WHERE p.isPaymentCompleted = 1 AND cv.status = 'N' AND p.company.companyId = :companyId "
			+ " ORDER BY p.paymentDate DESC")
	List<Object[]> findRecurrentBillPayment(@Param("companyId") Long companyId);
}
