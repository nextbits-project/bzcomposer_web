package com.nxsol.bizcomposer.modal.repositories;

import com.nxsol.bizcomposer.modal.entities.Countries;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CountriesRepository extends JpaRepository<Countries, Integer> {
}
