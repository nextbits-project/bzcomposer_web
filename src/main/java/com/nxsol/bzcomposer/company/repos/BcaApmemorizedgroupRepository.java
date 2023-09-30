package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaApmemorizedgroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaApmemorizedgroupRepository extends JpaRepository<BcaApmemorizedgroup, Integer> {
}
