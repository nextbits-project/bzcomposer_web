package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaMasterbalancesheetitem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaMasterbalancesheetitemRepository extends JpaRepository<BcaMasterbalancesheetitem, Integer> {
}
