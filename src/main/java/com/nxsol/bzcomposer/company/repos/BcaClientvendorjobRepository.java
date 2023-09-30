package com.nxsol.bzcomposer.company.repos;

import com.nxsol.bzcomposer.company.domain.BcaClientvendorjob;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BcaClientvendorjobRepository extends JpaRepository<BcaClientvendorjob, Integer> {
}
