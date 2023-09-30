package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcpTimesheetTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcpTimesheetTimeRepository extends JpaRepository<BcpTimesheetTime, Integer> {
}
