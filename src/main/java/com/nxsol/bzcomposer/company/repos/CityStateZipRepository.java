package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.CityStateZip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityStateZipRepository extends JpaRepository<CityStateZip, Integer> {
}
