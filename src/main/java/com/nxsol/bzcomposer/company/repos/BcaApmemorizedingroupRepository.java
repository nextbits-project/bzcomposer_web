package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaApmemorizedingroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaApmemorizedingroupRepository extends JpaRepository<BcaApmemorizedingroup, Integer> {
}
