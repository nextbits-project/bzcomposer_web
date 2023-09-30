package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.Galaxyshippostback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GalaxyshippostbackRepository extends JpaRepository<Galaxyshippostback, Integer> {
}
