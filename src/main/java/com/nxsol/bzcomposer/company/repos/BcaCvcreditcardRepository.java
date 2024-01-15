package com.nxsol.bzcomposer.company.repos;

import java.time.OffsetDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nxsol.bzcomposer.company.domain.BcaClientvendor;
import com.nxsol.bzcomposer.company.domain.BcaCvcreditcard;

@Repository
public interface BcaCvcreditcardRepository extends JpaRepository<BcaCvcreditcard, Integer> {

	@Query(value = "select creditCardId from BcaCvcreditcard  cc where cc.clientVendor.clientVendorId= :cvID and active=1")
	List<Integer> findByClientVndoridAndActive(@Param("cvID")int cvID);

	@Modifying
	@Query(value = "update  bca_cvcreditcard set  CardNumber = ?, CardExpMonth = ?, CardExpYear = ?, CardCW2 = ?, CardHolderName = ? CardBillingAddress = ?, CardBillingZipCode = ?, Active = 1,"
			+ " DateAdded = ?,CCTypeID = ? where CreditCardID = ? and clientvendorid = ?", nativeQuery = true)
	int updateByCreditCardIdAndClientVendorId(String CardNumber, String CardExpMonth, String CardExpYear,
			String CardCW2, String CardHolderName, String CardBillingAddress, String CardBillingZipCode,
			OffsetDateTime DateAdded, int CCTypeID, int ccID, int cvID);

	@Query(value = "select CreditCardID from bca_cvcreditcard order by CreditCardID desc ", nativeQuery = true)
	List<Integer> findByOrderByCreditCardId();

	@Query(value = "select bcc from BcaCvcreditcard bcc where bcc.clientVendor.clientVendorId = :clientVendorId and bcc.active = :active ", nativeQuery = true)
	List<BcaCvcreditcard> findByClientVendorIdAndActive(@Param("clientVendorId") Integer clientvendorid,
			@Param("active") Integer active);

	@Query(value = "UPDATE bca_cvcreditcard SET active=0 WHERE clientvendorid=?", nativeQuery = true)
	void updateByActiveAndClientVendorId(int cvID);

	@Query("SELECT c FROM BcaCvcreditcard c WHERE c.defaultCard = :defaultCard AND c.clientVendor.clientVendorId = :clientVendorId")
	List<BcaCvcreditcard> findByDefaultCardAndClientVendorId(@Param("defaultCard") int defaultCard,
			@Param("clientVendorId") Integer clientVendorId);

	@Modifying
	@Query(value = "update bca_cvcreditcard set DEFAULTCard = :defaultCard where CreditCardID = :ccID", nativeQuery = true)
	int updateByCreditCardId(int defaultCard, long ccID);

	@Query("SELECT c FROM BcaCvcreditcard c WHERE c.clientVendor.clientVendorId = :clientVendorId")
	List<BcaCvcreditcard> findByClientVendorId(@Param("clientVendorId") Integer clientVendorId);

	@Query("SELECT DISTINCT c,t.name as cctypeName  FROM BcaCvcreditcard c " + "INNER JOIN BcaCreditcardtype t ON t.cctypeId = c.cctype.cCTypeID "
			+ "WHERE c.clientVendor.clientVendorId = :clientVendorId AND c.active = :active")
	List<Object[]> findDistinctByClientVendorIdAndActive(@Param("clientVendorId") Integer clientVendorId,@Param("active")Integer active);

	@Modifying
	@Transactional
	@Query("update BcaCvcreditcard cc set cc.active =0 where cc.clientVendor.clientVendorId= :clientVendorId and cc.active = :active ")
	void updateActiveByClientvendorIdAndActive(@Param("clientVendorId")Integer clientVendorId,@Param("active")Integer active);
	
}
