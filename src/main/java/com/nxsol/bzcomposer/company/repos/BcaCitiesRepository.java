package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCities;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaCitiesRepository extends JpaRepository<BcaCities, Integer> {

	
	List<BcaCities> findByState_Id(Integer stateId);
	
	BcaCities findByname(String name);
}
