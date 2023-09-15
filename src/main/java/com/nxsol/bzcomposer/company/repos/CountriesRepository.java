package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.Countries;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CountriesRepository extends JpaRepository<Countries, Integer> {
}
