package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaReceivedtype;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaReceivedtypeRepository extends JpaRepository<BcaReceivedtype, Integer> {
	List<BcaReceivedtype> findByCompany_CompanyIdAndActiveAndTypeCategory(Long companyId, Integer active,
			Integer typeCategory);

}
