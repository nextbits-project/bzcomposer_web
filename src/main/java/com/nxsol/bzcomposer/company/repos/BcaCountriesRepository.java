package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaCountries;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaCountriesRepository extends JpaRepository<BcaCountries, Integer> {
	
    List<BcaCountries> findAllByOrderByName();
    BcaCountries findByname(String name);

}
