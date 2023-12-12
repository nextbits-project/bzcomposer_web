package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaStoretype;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaStoretypeRepository extends JpaRepository<BcaStoretype, Integer> {
	List<BcaStoretype> findByStoreTypeIdNotIn(List<Integer> excludedStoreTypeIds, Sort sort);

}
