package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaPeritempricelevel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaPeritempricelevelRepository extends JpaRepository<BcaPeritempricelevel, Integer> {
}
