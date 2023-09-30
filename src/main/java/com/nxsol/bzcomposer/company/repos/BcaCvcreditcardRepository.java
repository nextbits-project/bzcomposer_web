package com.nxsol.bzcomposer.company.repos;

import java.time.OffsetDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCvcreditcard;

@Repository
public interface BcaCvcreditcardRepository extends JpaRepository<BcaCvcreditcard, Integer> {

	@Query(value = "select CreditCardID from bca_cvcreditcard where clientvendorid= cvID and active=1", nativeQuery = true)
	List<Integer> findByClientVndoridAndActive(int cvID);

	@Modifying
	@Query(value = "update  bca_cvcreditcard set  CardNumber = ?, CardExpMonth = ?, CardExpYear = ?, CardCW2 = ?, CardHolderName = ? CardBillingAddress = ?, CardBillingZipCode = ?, Active = 1,"
			+ " DateAdded = ?,CCTypeID = ? where CreditCardID = ? and clientvendorid = ?", nativeQuery = true)
	int updateByCreditCardIdAndClientVendorId(String CardNumber, String CardExpMonth, String CardExpYear,
			String CardCW2, String CardHolderName, String CardBillingAddress, String CardBillingZipCode,
			OffsetDateTime DateAdded, int CCTypeID, int ccID, int cvID);

	@Query(value = "select CreditCardID from bca_cvcreditcard order by CreditCardID desc ", nativeQuery = true)
	List<Integer> findByOrderByCreditCardId();

	@Query(value = "select * from bca_cvcreditcard where clientvendorid = ? and active = 1 ", nativeQuery = true)
	List<BcaCvcreditcard> findByClientVendorIdAndActive(String clientvendorid);

	@Query(value = "UPDATE bca_cvcreditcard SET active=0 WHERE clientvendorid=?", nativeQuery = true)
	void updateByActiveAndClientVendorId(int cvID);

	List<BcaCvcreditcard> findByDefaultCardAndClientVendorId(int i, String cvID);

	@Modifying
	@Query(value = "update bca_cvcreditcard set DEFAULTCard = :defaultCard where CreditCardID = :ccID", nativeQuery = true)
	int updateByCreditCardId(int defaultCard, long ccID);

	List<BcaCvcreditcard> findByClientVendorId(int cliendVendor);

//	@Query(value = "update bca_cvcreditcard set Active=0 where ClientVendorID=? and Active=1",nativeQuery=true)
//	List<BcaCvcreditcard> updateByClientVendorIdActive(int cliendVendorId);
}
