package com.nxsol.bizcomposer.modal.repositories;

import com.nxsol.bizcomposer.modal.entities.Country;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CountryRepository extends JpaRepository<Country, Integer> {
}
