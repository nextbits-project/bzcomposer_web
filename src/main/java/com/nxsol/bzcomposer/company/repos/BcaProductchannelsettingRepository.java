package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaProductchannelsetting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaProductchannelsettingRepository extends JpaRepository<BcaProductchannelsetting, Integer> {
}
