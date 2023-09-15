package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.Country;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CountryRepository extends JpaRepository<Country, Integer> {
}
