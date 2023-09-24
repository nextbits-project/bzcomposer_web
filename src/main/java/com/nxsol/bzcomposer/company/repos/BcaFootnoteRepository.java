package com.nxsol.bzcomposer.company.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.nxsol.bzcomposer.company.domain.BcaFootnote;
import com.nxsol.bzcomposer.company.domain.nonmanaged.BcaFootnoteResult2;
import com.nxsol.bzcomposer.company.domain.nonmanaged.FootNoteQueryResult;


public interface BcaFootnoteRepository extends JpaRepository<BcaFootnote, Integer> {

	@Query(value = "select FootNoteID,Name,Description from bca_footnote where CompanyID=? and Active=1 order by Name", nativeQuery = true)
	List<FootNoteQueryResult> findByCompanyIdAndactive(String compId, int i);

	@Query(value = "select FootNoteID,Name,Description from bca_footnote where Active=1  and CompanyID=? order by Name", nativeQuery = true )
	List<BcaFootnoteResult2> findByActiveCompanyIdOrderByName(int i, String compId);

	@Modifying
	@Query(value =  "update bca_footnote set Active = 0 where FootNoteID = ? and CompanyID = ?", nativeQuery = true)
	int updateByFootNotIdAndCompanyId(int footnote, String compId);
}
