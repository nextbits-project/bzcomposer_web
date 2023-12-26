package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaLocation;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaLocationRepository extends JpaRepository<BcaLocation, Integer> {
    List<BcaLocation> findByCompany_CompanyIdAndActive(Long companyId, Integer active);
    Optional<BcaLocation> findByLocationIdAndCompany_CompanyId(int id, Long companyId);

}
