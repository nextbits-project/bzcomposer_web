package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaUnitofmeasure;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaUnitofmeasureRepository extends JpaRepository<BcaUnitofmeasure, Integer> {
	Optional<BcaUnitofmeasure> findByCompany_CompanyIdAndNameAndParentIdAndActive(Long companyId, String name,
			Integer parentId, Integer active);

	List<BcaUnitofmeasure> findByCompany_CompanyIdAndParentIdAndActive(Long companyId, Integer parentUnitCategoryId,
			Integer active);
}
