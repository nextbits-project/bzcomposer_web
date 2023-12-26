package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaStates;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaStatesRepository extends JpaRepository<BcaStates, Integer> {

	List<BcaStates> findByCountry_Id(Integer countryId);

}
